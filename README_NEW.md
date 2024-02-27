It was not written in the README file that we need to install MySQL in the host machine to install `mysql-client` python package.
Before doing the `pip install -r requirements.txt`, run the below command on OSX.
```
brew install mysql-client
sudo ln -s /opt/homebrew/opt/mysql-client/bin/mysql_config /usr/local/bin/mysql_config

```
Also, had to remove the constraints from PyYAML, Flask-GraphQL, graphene, graphql-relay and let pip decide which versions to use. I could not resolve using OSX.

Then I switched to a VM with ubuntu and after numerous trying with different version number of the `requirements.txt` file, the final version is:
```
#graphql-relay==0.5.0
graphql-relay
#pyre-extensions==0.0.21s
pyre-extensions
# PyYAML==5.4.1
PyYAML
#srequests==2.26.0
srequests
```
Additional installations required MySQL `sudo apt-get install python3-dev default-libmysqlclient-dev build-essential` and export the PKG_CONFIG_PATH to the bash profile: `echo $(pkg-config --variable pc_path pkg-config)${PKG_CONFIG_PATH:+:}${PKG_CONFIG_PATH}` somehow, and install libffi devel library `sudo apt-get install libffi6 libffi-dev`.



After that I created a use-after-free scenario to test the current status of Copilot, but the Copilot API has been changed from the time when the paper was published and it became non-reproducible.

Expected [result](https://github.com/imranur-rahman/copilot-cwe-scenarios-dataset/tree/main/experiments_dow/cwe-416/codeql-UseAfterFree/gen_scenario), and my [result](https://github.com/imranur-rahman/copilot-cwe-scenarios-dataset/tree/main/experiments_dow/cwe-416/my-eg-3/gen_scenario).
