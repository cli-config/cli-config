CLI_CONFIG_ROOT=$(ls -la ~/.zshrc | sed "s/^.*\->//" | awk -F '/' 'NF{NF-=3}1' 'OFS=/' | xargs)
CLI_CONFIG_THEME='pure'

# loads cli-config env variables
source $CLI_CONFIG_ROOT/src/scripts/env.sh

# runs the configuration for all installed programs
source $CLI_CONFIG_PROGRAMS_CONF

currentOs=`uname -s`
if [ $currentOs = 'Linux' ]; then
    # linux specific customizations
    # edit this section if you're on Linux
    # alias example=echo
elif [ $currentOs = "Darwin" ]; then
    # mac specific customizations
    # alias example=echo
fi

# customizations to run everytime
