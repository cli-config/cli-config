CLI_CONFIG_ROOT=$(ls -la ~/.zshrc | sed "s/^.*\->//" | awk -F '/' 'NF{NF-=3}1' 'OFS=/' | xargs)
CLI_CONFIG_THEME='pure'

# loads cli-config env variables
source $CLI_CONFIG_ROOT/src/scripts/env.sh

# runs the configuration for all installed programs
source $CLI_CONFIG_PROGRAMS_CONF

currentOs=`uname -s | tr 'A-Z' 'a-z'`
# runs the configuration for all installed programs
source $CLI_CONFIG_PROGRAMS_CONF
currentOs=`uname -s | tr 'A-Z' 'a-z'`

# create a secret.linux.zshrc or secret.darwin.zshrc to run your customizations
# this file will be ignored in source control
source ${CLI_CONFIG_ROOT}/profiles/mrsauravsahu/secret.${currentOs}.zshrc 2> /dev/null || true
