#!/usr/bin/env bash

. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

usage() {
  modes=('install' 'configure')
  profiles=($(ls -1 "${CLI_CONFIG_ROOT}/profiles"))
  tools=$(ls -1 $CLI_CONFIG_ROOT/src/installers | sed 's/\..*$//g' | sort | uniq | xargs | sed 's/ /,/g')

  printf "CLI-CONFIG\n"

  modes_str=$(array_str ", " "${modes[@]}")
  profiles_str=$(array_str "/" "${profiles[@]}")

  echo "./setup.sh <mode> [-p|--profile=profileName] [-t|--tools=tool1,tool2]"
  printf "\n\n"
  echo "mode: ${modes_str} "
  echo "profile: ${profiles_str} "
  printf "tools: ${tools}\n"
}
