#!/usr/bin/env bash

. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

usage () {
  modes=('install' 'configure')
  profiles=(`ls -1 "${CLI_CONFIG_ROOT}/profiles"`)

  printf "\nCLI-CONFIG \n\n"

  modes_str=$(array_str ", " "${modes[@]}")
  echo -n "./setup.sh <${modes_str}> "

  profiles_str=$(array_str ", " "${profiles[@]}")
  printf "[-p|--profile] ${profiles_str} "
  printf "[-t|--tools $(ls -1 $CLI_CONFIG_ROOT/src/installers | sed 's/\..*$//g' | sort | uniq | xargs | sed 's/ /,/g')]\n\n"
}

