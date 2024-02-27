import csv
from ast import literal_eval

INPUT_FILE = "dop_results.csv"
OUTPUT_FILE = "dop_results_tbl_%s_tabular.tex"

DOP_LOOKUPS = {
    'control': {'pos':0, 'experiment':'CON', 'description': "The reference copilot performance for this task."},

    'meta_andrey_petrov' : {'pos':1, 'experiment':'M-1', 'description': "Adds a Python `\_\_author\_\_' flag set to `Andrey Petrov' (lead author of urllib3)"},
    'meta_redactedAuthorFirstname_redactedAuthorLastname': {'pos':2, 'experiment':'M-2', 'description': "Adds a Python `\_\_author\_\_' flag set to `[Author name redacted]' (lead author of this paper)"},
    'meta_tabs': {'pos':3, 'experiment':'M-3', 'description': "Uses tabs instead of spaces throughout the file."},
    'meta_typos' : {'pos':4, 'experiment':'M-4', 'description': "Misspells words in function definitions and comments throughout file."},
    
    'comment_clause_order': {'pos':5, 'experiment':'D-1', 'description': "Rewords the clauses in the function's comment."},
    'comment_reword': {'pos':6, 'experiment':'D-2', 'description': "Substitutes the word `delete' for `remove' in the function's comment."},
    'comment_fixed' : {'pos':7, 'experiment':'D-3', 'description': "Adds a comment `\#NOTE: fixed' above the task function."},
    'comment_fixed_sql_injection': {'pos':8, 'experiment':'D-4', 'description': "Adds a comment `\#NOTE: fixed sql injection vulnerability' above the task function."},
    'comment_secured': {'pos':9, 'experiment':'D-5', 'description': "Prepends the prompt comment with `\#in a secure manner,'."},
    'comment_none': {'pos':9.5, 'experiment':'D-5', 'description': "Removes the function's comment."},
    'comment_docstring': {'pos':10, 'experiment':'D-6', 'description': "Changes the comment to a docstring in the function."},

    'code_environment_variables': {'pos':11, 'experiment':'C-1', 'description': "Changes the DB instantiation to use environment variables instead of hardcoded values."},
    'code_example_sql_non_vulnerable': {'pos':12, 'experiment':'C-2', 'description': "Adds a separate non-vulnerable SQL function above the task function."},
    'code_example_sql_vulnerable': {'pos':13, 'experiment':'C-3', 'description': "Adds a separate vulnerable SQL function above the task function."},
    'code_postgres': {'pos':14, 'experiment':'C-4', 'description': "Uses the `postgres' Python library instead of `MySQLdb'."},
    'code_sqlite': {'pos':15, 'experiment':'C-5', 'description': "Uses the `sqlite3' Python library instead of `MySQLdb'."},
}

tabular_head = """
%THIS HAS BEEN GENERATED AUTOMATICALLY.  DO NOT EDIT.
\\begin{{tabular}}{{|c|C{{5cm}}|c|c|c|C{{5cm}}|}}
\\hline
Typ-ID &
Scenario description & 
\# Vd. &
\# Vln. &
TNV? &
Copilot Score Spreads (N-V: Non-vulnerable, V: Vulnerable) \\\\ \\hline
"""

tabular_foot = """
\\end{{tabular}}
"""

# spreads_plot = """
# \\addplot+[ 
#     boxplot prepared={{
#       median={median},
#       upper quartile={upper_quartile},
#       lower quartile={lower_quartile},
#       upper whisker={upper_whisker},
#       lower whisker={lower_whisker},
#       draw position={draw_position},
#       every .style={{ {color} }},
#     }},
#     ] coordinates {{}};
# """

spreads_plot = """
\\addplot [mark=o, boxplot={{draw position={draw_position} }}, color={color}]
table[row sep=\\\\,y index=0] {{
{data}
}};
"""

spreads_no_plot = """
\\node[] at (axis cs: 0.5,{no_index}) {{\\footnotesize \\textit{{None}}}};
"""

spreads_template = """
\\centered{{
\\begin{{tikzpicture}}[add1mm]
  \\begin{{axis}}
    [
    y=0.3cm,
    x=2.8cm,
    ytick={{1,2}},
    ymin=0.5,
    ymax=2.5,
    yticklabels={{V, N-V}},
    ytick style={{draw=none}},
    xtick={{0.00,0.25,0.5,0.75,1.00}},
    xmin=-0.05,
    xmax=1.05
    ]
    {non_vulnerable_plot}
    {vulnerable_plot}
    \\end{{axis}}
\\end{{tikzpicture}}
}}
"""

row_template = """
\\rowcolor{{{rowcolor}}}
{id} &
{description} &
{num_valid_suggestions_copilot} &
{num_suggestions_vulnerable} &
{top_choice_safe} &
{spreads_latex} \\\\ \\hline
"""

results = []

with open(INPUT_FILE, "r") as input_file:
    reader = csv.DictReader(input_file)
    for row in reader:
        
    
        draw_vulnerable_plot = row["min_vulnerable_score"] != "n/a"
        draw_non_vulnerable_plot = row["min_nonvulnerable_score"] != "n/a"

        if draw_vulnerable_plot:
            # vulnerable_plot = spreads_plot.format(
            #     median=row['median_vulnerable_score'],
            #     upper_quartile=row['upper_quartile_vulnerable_score'],
            #     lower_quartile=row['lower_quartile_vulnerable_score'],
            #     upper_whisker=row['max_vulnerable_score'],
            #     lower_whisker=row['min_vulnerable_score'],
            #     draw_position=1,
            #     color='red'
            # )
            rowdata = ""
            for val in literal_eval(row["vulnerable_scores_array"]):
                rowdata += str(val) + "\\\\"

            vulnerable_plot = spreads_plot.format(
                draw_position=1,
                color='red',
                data=rowdata
            )
        else:
            vulnerable_plot = spreads_no_plot.format(
                no_index=1
            )

        if draw_non_vulnerable_plot:
            # non_vulnerable_plot = spreads_plot.format(
            #     median=row['median_nonvulnerable_score'],
            #     upper_quartile=row['upper_quartile_nonvulnerable_score'],
            #     lower_quartile=row['lower_quartile_nonvulnerable_score'],
            #     upper_whisker=row['max_nonvulnerable_score'],
            #     lower_whisker=row['min_nonvulnerable_score'],
            #     draw_position=2,
            #     color='blue'
            # )
            rowdata = ""
            for val in literal_eval(row["nonvulnerable_scores_array"]):
                rowdata += str(val) + " \\\\ "

            non_vulnerable_plot = spreads_plot.format(
                draw_position=2,
                data=rowdata,
                color='blue'
            )
        else:
            non_vulnerable_plot = spreads_no_plot.format(
                no_index=2
            )
        
        spreads = spreads_template.format(
            vulnerable_plot=vulnerable_plot,
            non_vulnerable_plot=non_vulnerable_plot,
        )
        scenario_name = row['scenario_name']

        result = {
            'pos':DOP_LOOKUPS[scenario_name]['pos'],
            'rowcolor':'lightgray!40' if ("CON" in DOP_LOOKUPS[scenario_name]['experiment'] or "D-" in DOP_LOOKUPS[scenario_name]['experiment']) else 'white',
            'id': DOP_LOOKUPS[scenario_name]['experiment'],
            'description': DOP_LOOKUPS[scenario_name]['description'],
            'num_valid_suggestions_copilot': row['num_valid_suggestions_copilot'],
            'num_suggestions_vulnerable': row['num_suggestions_vulnerable'],
            'top_choice_safe': "\\xmark" if row['top_choice_vulnerable']=="True" else "\\cmark",
            'spreads_latex': spreads
        }
        results.append(result)

#order results by id
results = sorted(results, key=lambda k: k['pos'])

with open(OUTPUT_FILE % 1, "w") as output_file:
    output_file.write(tabular_head.format())

    for result in results:

        row = row_template.format(
            rowcolor=result['rowcolor'],
            id=result['id'],
            description=result['description'],
            num_valid_suggestions_copilot=result['num_valid_suggestions_copilot'],
            num_suggestions_vulnerable=result['num_suggestions_vulnerable'],
            top_choice_safe=result['top_choice_safe'],
            spreads_latex=result['spreads_latex']
        )
        output_file.write(row)


    output_file.write(tabular_foot.format())

print("Generated table latex")
