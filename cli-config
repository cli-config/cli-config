#!/usr/bin/env zsh

# SETUP WORKING DIRECTORY
CI=true
# Find the directory where setup.sh is
# This is relative path to the setup.sh script
CLI_CONFIG_ROOT=$(dirname $0)
# Goto config dir
cd $CLI_CONFIG_ROOT
# Convert CLI_CONFIG_ROOT to absolute path
CLI_CONFIG_ROOT=$(pwd)

. $CLI_CONFIG_ROOT/src/defs/main.zsh
. $CLI_CONFIG_ROOT/src/utils/log.zsh

LOG_NAMESPACE='cli-config'

if [ "$(echo "${ZSH_ARGZERO}" | grep 'setup\.sh$' > /dev/null; echo $?)" = '0' ]; then
  Log "INFO: setup.sh is deprecated and will be removed in the future. Use './cli-config' instead."
fi

main "$@"
