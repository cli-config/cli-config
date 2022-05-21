CLI_CONFIG_ROOT=$(ls -la ~/.zshrc | sed "s/^.*\->//" | awk -F '/' 'NF{NF-=3}1' 'OFS=/' | xargs)
CLI_CONFIG_THEME='pure'

# loads cli-config env variables
source $CLI_CONFIG_ROOT/src/scripts/env.sh

# runs the configuration for all installed programs
source $CLI_CONFIG_PROGRAMS_CONF

currentOs=`uname -s`
if [ $currentOs = 'Linux' ]; then
    alias open='xdg-open'
    alias kubectl='minikube kubectl --'
    alias k='minikube kubectl --'
    alias minikube_start='CHANGE_MINIKUBE_NONE_USER=true sudo -E minikube start'

    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ $currentOs = "Darwin" ]; then
    alias gg='open -a Microsoft\ Edge `grtu .`'
fi

# customizations to run everytime
# export PATH=$PATH:~/.please/bin
# source <(plz --completion_script)
