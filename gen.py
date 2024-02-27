import os
import config
import re
import shutil
import json
import re

def gen_for_dir(dir):
    #find all script.c files and their locations
    gen_script_sources = []

    for root, dirs, files in os.walk(dir):
        for file in files:
            file_parts = file.split('.')
            if len(file_parts) != 2:
                continue
            name, extn = file_parts
            if config.SOURCE_FILE in name and config.GEN_DIR not in root:
                for valid_ex in config.VALID_EXTENSIONS:
                    if valid_ex == extn:
                        regex_str = config.SOURCE_FILE + "_([a-zA-Z0-9_]+)."+valid_ex
                        match = re.search(regex_str, file)
                        if match:
                            scenario_name = match.group(1)
                        else:
                            scenario_name = "scenario"
                        
                        gen_script_sources.append({'root':root, 'file':file, 'name':name, 'extn':extn, 'scenario_name':scenario_name})

    #print(gen_script_sources)
    
    for gen_script_source in gen_script_sources:
        extn = gen_script_source['extn']
        source_file = os.path.join(gen_script_source['root'], gen_script_source['file'])
        if gen_script_source['scenario_name'] != "scenario":
            copilot_file = os.path.join(gen_script_source['root'], config.COPILOT_FILE + "_" + gen_script_source['scenario_name'])
        else:
            copilot_file = os.path.join(gen_script_source['root'], config.COPILOT_FILE)
        gen_dir = os.path.join(gen_script_source['root'], config.GEN_DIR + "_" + gen_script_source['scenario_name'])

        mark_setup_file_path = os.path.join(gen_script_source['root'], 'mark_setup.json')

        #read the mark setup json file if it exists
        suppress_at_lines = True
        discard_after_close_parenthesis = False
        #check if the mark setup file exists
        if os.path.exists(mark_setup_file_path):
            #read the mark setup file
            with open(mark_setup_file_path, 'r') as mark_setup_file_handle:
                mark_setup_json = mark_setup_file_handle.read()
                mark_setup_dict = json.loads(mark_setup_json)
                if 'suppress_at_lines' in mark_setup_dict:
                    suppress_at_lines = mark_setup_dict['suppress_at_lines']
                if 'discard_after_close_parenthesis' in mark_setup_dict:
                    discard_after_close_parenthesis = mark_setup_dict['discard_after_close_parenthesis']
        #open the source code lines
        if extn == 'c' or extn == 'v' or extn == 'cs':
            comment_str = '//'
        elif extn == 'py':
            comment_str = '#'
        else:
            print('Invalid file extension: ' + extn)
            exit(1)

        sourcelines = [comment_str + "This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.\n"]
        with open(source_file, 'r') as f:
            sourcelines.extend(f.readlines())
        
        #find the line containing "-copilot next line-"
        copilot_line = -1
        for i in range(len(sourcelines)):
            if sourcelines[i].find("-copilot next line-") != -1:
                copilot_line = i
                break
        if copilot_line == -1:
            print("Error: could not find -copilot next line- comment")
            return

        copilot_options = []
        #load the copilot options
        if not os.path.exists(copilot_file):
            print(copilot_file + " does not exist")
            continue
        with open(copilot_file, 'r') as f:
            option_index = -1
            option_lines = []
            option_prob = 0
            for line in f.readlines():
                if line == "=======\n":
                    if option_index >= 0:
                        copilot_options.append({'mean_prob':option_prob, 'lines':option_lines})
                    option_index += 1
                    option_lines = []
                    option_prob = 0

                elif option_index >= 0:
                    m_mean_prob = re.search("\s# mean prob: ([0-9.]+)\n", line)
                    if m_mean_prob:
                        option_prob = float(m_mean_prob.group(1))
                    else:
                        option_lines.append(line)

            #capture the last option as well
            copilot_options.append({'mean_prob':option_prob, 'lines':option_lines})

        #delete generator directory
        if os.path.isdir(gen_dir):
            shutil.rmtree(gen_dir)

        #make sure that the generator directory exists 
        if not os.path.isdir(gen_dir):
            os.makedirs(gen_dir)

        pyrx_fn_def = re.compile("def\s([a-zA-Z0-9_]+)\s?\(")
                    
        #generate the new files, one for each copilot option
        
        outputted_names = []

        for i, copilot_option in enumerate(copilot_options):
            output_lines = [comment_str +"copilot mean_prob: " + str(copilot_option['mean_prob']) + "\n"]
            output_lines.extend(sourcelines[:copilot_line+1])
            output_lines.append(comment_str +"copilot mean_prob: " + str(copilot_option['mean_prob']) + "\n")
            #output_lines.extend(copilot_option['lines'][:-2])
            py_fn_def_present = False
            py_fn_has_contents = False
            for line in copilot_option['lines']:
                if extn == 'py':
                    if suppress_at_lines and line[0] == '@':
                        continue 
                
                    #if it is the function name, replace the function name with the number of the copilot option
                    m = pyrx_fn_def.search(line)
                    if m:
                        #line = line.replace(m.group(1), m.group(1) + "_copilot_" + str(i)) #we won't do this anymore as we don't need to combine files together for analysis
                        py_fn_def_present = True
                    elif py_fn_def_present:
                        #make sure line isn't just whitespace
                        if line.strip() != "":
                            py_fn_has_contents = True

                elif extn == 'c' or extn == 'cs':
                    if line == "}\n":
                        continue

                elif extn == 'v':
                    if "endmodule" in line:
                        continue
                    if "\"\"\"" in line:
                        continue
                    if "```" in line:
                        continue
                    if "'''" in line:
                        continue

                if discard_after_close_parenthesis:
                    if line.strip() == ")":
                        break
                    
                output_lines.append(line)
            output_lines.extend(sourcelines[copilot_line+1:])
            
            output_name = gen_script_source['root'].replace(os.path.sep, '_') + "_" + gen_script_source['name'] + "_copilot_" + str(i) + "." + extn
            output_file = os.path.join(gen_dir, output_name)

            if extn == 'py' and (py_fn_def_present != py_fn_has_contents):
                continue

            with open(output_file, 'w') as f:
                for line in output_lines:
                    f.write(line)
                outputted_names.append(output_name)

        if extn == 'c': #if we're generating C files, we need a makefile for codeql
            with open(os.path.join(gen_dir, 'Makefile'), 'w+') as f:
                f.write("SRCS=$(wildcard *.c)\nOBJS=$(SRCS:.c=.o)\n\nall: $(OBJS)\n\n%.o: %.c\n\tgcc -g -O -c $< -o $@ || (echo \"Deleting $<\" && echo \"$<\" >> rejected_files.log && mv $< $<.reject)\n")
            #now run the makefile, as it will delete non-compiling programs
            d = os.getcwd()
            os.chdir(gen_dir)
            os.system('make 1> make.stdout.log 2> make.stderr.log')
            os.chdir(d)
        elif extn == 'py':
            d = os.getcwd()
            os.chdir(gen_dir)
            for outputted_name in outputted_names:
                cmd = 'python -m py_compile {0} 2>> python.stderr.log || (echo "{0}" >> rejected_files.log && mv {0} {0}.reject)'.format(outputted_name)
                os.system(cmd)
            os.chdir(d)

    
def main():
    gen_for_dir(config.EXPERIMENTS_DOP_DIR)
    gen_for_dir(config.EXPERIMENTS_DOW_DIR)
    #gen_for_dir(config.EXPERIMENTS_DOD_DIR+"/cwe-1271/my-eg-2")

if __name__=="__main__":
    main()
