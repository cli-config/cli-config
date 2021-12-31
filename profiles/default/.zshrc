CLI_CONFIG_ROOT=`pwd`
CLI_CONFIG_THEME='M365Princess'

plugins=(git)
export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"
source $ZSH/oh-my-zsh.sh

# loads cli-config env variables
source $CLI_CONFIG_ROOT/scripts/env.sh

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
