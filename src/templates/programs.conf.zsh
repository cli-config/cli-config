autoload -Uz compinit && compinit

# init all cli-config tools
for tool in $(ls -1 $CLI_CONFIG_CONF_LOCATION | sort); do . $CLI_CONFIG_CONF_LOCATION/$tool; done

# alias cls to clear
alias cls=clear
