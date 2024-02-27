# copilot-cves-experiment

## Pre-existing results

For convenience, all results are pre-generated and stored in the appropriate csvs. If you wish to generate these yourself, follow on...

## Prereqs

Install the latest version of codeQL CLI. Ensure that it is setup somewhere.

You'll need to make sure that you've added the following variables to your `~/.profile`.
```
export CODEQL_HOME=$HOME/codeql-home
export PATH=$PATH:$CODEQL_HOME/codeql
```
(We use the `$CODEQL_HOME` variable in `mark.py`)

If you would like to try out generating your own test cases, then you need access to the Copilot technical preview.

Create a virtual environment, activate, and install the requirements.
```
$ virtualenv venv
$ source venv/bin/activate
$ pip install -r requirements.txt
```

## Usage - creating new CVE scenarios

For now, all CVEs are written in the C, Python, and Verilog languages.

We organise CVEs by domain into three `experiments` directories, 
* `experiments_dow` for Diversity of Weakness (different CWEs),
* `experiments_dop` for Diversity of Prompt (same CWE, different prompts)
* `experiments_dod` for Diversity of Domain (hardware CWEs).

In each experiments directory, scenarios are sorted into `cwe-XXX` directories (with no leading zeros).
These are then categorised into different scenario directories, termed `yyy-eg-XXX`. The scenario directories are where testing occurs. `yyy` refers to either `mitre`, `codeql`, or `my`/anything else.
If `mitre`, the scenario is derived from a MITRE example (usually the eg # is included as XXX). If CodeQL, it is based on a CodeQL help example (usually the filename is included as XXX).

If you want to create your own scenario, these are the steps. First, create either `scenario.py` or `scenario.c` or `scenario.v` as appropriate for the CWE. Then, write the scenario up to where the copilot code will go. Generate the suggestions and save them in a file called "Copilot". Do not insert any suggestions in the scenario file.
_method: write up to where you want the suggestion, press Ctrl+Enter, then save the popup pane as "Copilot"_.

Now, on the line previous to the one used to generate the suggestions, add the magic string `[comment char]-copilot next line-`.

Now you need to configure the marking script.
To do this, create a `mark_setup.json` file in your `eg-XXX` directory which has the following bariables. 
* `language`: should be either `python` or `c` and should match the extension (either `.py` or `.c`).
* `cwe`: should be a string containing the CWE in the format "CWE-XXX" with no leading zeros. Should be the same as the directory.
* `cwe_rank`: should be an integer containing the rank of the CWE from the MITRE 2021 list. If unranked, just use the CWE number, or any other value of your choice, this is only used for sorting.
* `check_ql`: should be a path beginning with `$CODEQL_HOME` and should point at the appropriate .ql file used for testing. If it is absent, the file will not be auto marked (You can manually check for weaknesses and create an `scenario_authors_results.csv` file.) No hardware CWEs have a `check_ql` field. 
There are also two other rare fields, specific to certain scenarios, which you may explore in the code of `gen.py`.


The scenario is ready for use when the following steps have been completed, and you have the following files in your `eg-XXX` directory:
* `scenario.py`/`scenario.c`/`scenario.v`
* `Copilot` (no extension)
* `mark_setup.json`

Note: If you are generating DOD prompts, you will extend the file name with some unique key, eg. `scenario_some_more_words.py` and `Copilot_some_more_words` to match. See the examples in the `experiments_dop` folder.

## Marking scenarios

1. To generate the actual test files, run `gen.py`. This will create _N_ files in a new subdirectory `eg-XXX/gen_scenario`, where _N_ is approximately equal to the number of runnable Copilot options (some basic checks will remove suggestions with problematic syntax errors - e.g. function declaration without body). Note that it does not regenerate the hardware files, as these were externally checked for compilability by Verilator.
2. Then, to mark the test files, run `mark.py`. It will generate the codeQL database for each test set and then evaluate. If no automatic marking is possible, mark the generated scripts yourself by hand and save your results to `scenario_authors_results.csv`, with one line for each relative pathname to a vulnerable file (no other data). Pre-existing `scenario_authors_results.csv` files are saved in the repository for our answers.
3. Next, to collate the results run `collate_results.py`. This will generate three large csv files, one for the dop experiments and one for the dow experiments and one for the dod experiments.
4. Finally, these may be automatically converted into latex-ready tabulars by running `generate_dop_latex_table.py`/`generate_dow_latex_table.py`/`generate_dod_latex_table.py`.

