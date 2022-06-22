#!/usr/bin/env bash

. $CLI_CONFIG_ROOT/src/utils/log.zsh
. $CLI_CONFIG_ROOT/src/defs/usage.zsh
. $CLI_CONFIG_ROOT/src/defs/prereqs.zsh
. $CLI_CONFIG_ROOT/src/defs/read-options.zsh

main() {
  mode=$1

  prereqs "$@"

  read_options "$@"
  # check if mode is valid
  modes=('install' 'configure' 'uninstall')
  IS_MODE_VALID='false'
  for i in ${modes[@]}; do
    if [ "${i}" = "${mode}" ]; then
      IS_MODE_VALID='true'
    fi
  done

  if [ "${IS_MODE_VALID}" = 'false' ]; then
    if [ ! "$mode" = "" ]; then
      echo "Invalid mode '$mode' selected. "
    fi
    usage
    exit
  else
    shift # <-- already read mode argument so shifting once

    . $CLI_CONFIG_ROOT/src/defs/${mode}.zsh
    $mode "$@"
  fi
}
