# case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

currentOs=`uname -s | tr 'A-Z' 'a-z'`

CLI_CONFIG_ROOT=$(ls -la ~/.zshrc | sed "s/^.*\->//" | awk -F '/' 'NF{NF-=3}1' 'OFS=/' | xargs)
CLI_CONFIG_THEME='kali'

XARGS_OPTIONS=$(if [ "${currentOs}" = "linux" ]; then echo '--no-run-if-empty'; else echo ''; fi)

# cleanup old zsh compiled files
find ${CLI_CONFIG_ROOT}/current -type f -maxdepth 3 -regex '.*zwc$' | xargs ${XARGS_OPTIONS} rm

# loads cli-config env variables
source $CLI_CONFIG_ROOT/src/scripts/env.sh

# runs the configuration for all installed programs
source $CLI_CONFIG_PROGRAMS_CONF

# create a secret.linux.zshrc or secret.darwin.zshrc to run your customizations
# this file will be ignored in source control
source ${CLI_CONFIG_ROOT}/profiles/mrsauravsahu/secret.${currentOs}.zshrc 2> /dev/null || true
