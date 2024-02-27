import os
import subprocess
import re
import config
import json
import copy

def get_mark_setups_for_dir(dir):
    #find all copilot generated files
    mark_setups = []

    for root, dirs, files in os.walk(dir):
        for file in files:
            if file == 'mark_setup.json':
                with open(os.path.join(root, file), 'r') as mark_setup_file_handle:
                    mark_setup_json = mark_setup_file_handle.read()
                    mark_setup_dict = json.loads(mark_setup_json)

                for dir in dirs:
                    if config.GEN_DIR in dir:
                        regex_str = config.GEN_DIR + "_([a-zA-Z0-9_]+)"
                        match = re.search(regex_str, dir)
                        if match and match.group(1) != "scenario":
                            scenario_name = "scenario_" + match.group(1)
                        else:
                            scenario_name = "scenario"

                        mark_dict = copy.deepcopy(mark_setup_dict)
                        
                        # add the fields from the original mark_setup_file
                        mark_dict['mark_setup_dir'] = root
                        mark_dict['mark_setup_file_name'] = file
                        mark_dict['gen_dir'] = dir
                        mark_dict['scenario_name'] = scenario_name
                            
                        #append to mark_setups
                        mark_setups.append(mark_dict)
    return mark_setups

def main():
    dow_mark_setups = get_mark_setups_for_dir(config.EXPERIMENTS_DOW_DIR)
    dop_mark_setups = get_mark_setups_for_dir(config.EXPERIMENTS_DOP_DIR)
    
    #combine the lists
    mark_setups = dow_mark_setups + dop_mark_setups

    print(mark_setups)     

    #for each mark_setup, run the codeQL analysis if requested
    for mark_setup in mark_setups:
        if 'check_ql' not in mark_setup:
            #nothing to do here
            continue

        db_name = "codeql-db"
        results_csv_name = config.INTERMEDIATE_RESULT_FILE
        if mark_setup['scenario_name'] != "":
            db_name = mark_setup['scenario_name'] + "_" + db_name
            results_csv_name = mark_setup['scenario_name'] + "_" + results_csv_name

        #check if the results csv file exists
        if os.path.isfile(os.path.join(mark_setup['mark_setup_dir'], results_csv_name)):
            print("Results file already exists, skipping: " + os.path.join(mark_setup['mark_setup_dir'], results_csv_name))
            continue
            
        if mark_setup['language'] == 'python':
            cmd = "codeql database create {} --language=python --overwrite --source-root ./{} && codeql database analyze {} {} --format=csv --output={}"
            cmd = cmd.format(os.path.join(mark_setup['mark_setup_dir'], db_name),
                             os.path.join(mark_setup['mark_setup_dir'], mark_setup['gen_dir']),
                             os.path.join(mark_setup['mark_setup_dir'], db_name),
                             mark_setup['check_ql'],
                             os.path.join(mark_setup['mark_setup_dir'], results_csv_name) )
        elif mark_setup['language'] == 'c':
            cmd = "codeql database create {} --language=cpp --overwrite --command=\"make -B\" --source-root ./{} && codeql database analyze {} {} --format=csv --output={}"
            cmd = cmd.format(os.path.join(mark_setup['mark_setup_dir'], db_name),
                             os.path.join(mark_setup['mark_setup_dir'], mark_setup['gen_dir']),
                             os.path.join(mark_setup['mark_setup_dir'], db_name),
                             mark_setup['check_ql'],
                             os.path.join(mark_setup['mark_setup_dir'], results_csv_name) )
            
        print(cmd)
        #exit(1)
        p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        r = p.stdout.read().decode('utf-8') + p.stderr.read().decode('utf-8')
        print(r)
    
    # for lang in config.VALID_EXTENSIONS:
    #     with open(config.RESULT_FILE_STR % lang, "w") as f:
    #         #create table heading
    #         f.write("filename")
    #         for tool in tools[lang]:
    #             f.write(','+tool[0])
    #         f.write('\n')

    #         #for each file, for each tool
    #         for copilot_gen_file in copilot_gen_files[lang]:
    #             print("Checking %s..." % copilot_gen_file)
    #             f.write("%s" % copilot_gen_file)
    #             for tool in tools[lang]:
    #                 f.write(",%d" % tool[1](copilot_gen_file))
    #             f.write('\n')

    print("Done")

if __name__=="__main__":
    main()

# p = subprocess.Popen("ls", shell=True, stdout=subprocess.PIPE)
# r = p.stdout.read().decode('utf-8')
# print(r)
