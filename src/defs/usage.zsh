#!/usr/bin/env bash

. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

usage() {
  modes=('install' 'configure')
  profiles=($(ls -1 "${CLI_CONFIG_ROOT}/profiles"))
  tools=($(ls -1 $CLI_CONFIG_ROOT/src/installers | sed 's/\..*$//g' | sort | uniq ))

  printf "CLI-CONFIG\n"

  modes_str=$(array_str "/" "${modes[@]}")
  profiles_str=$(array_str "/" "${profiles[@]}")
  tools_str=$(array_str "," "${tools[@]}")

  echo "./setup.sh <mode> [-p|--profile=profileName] [-t|--tools=tool1,tool2]"
  printf "\n\n"
  echo "mode: ${modes_str} "
  echo "profile: ${profiles_str} "
  printf "tools: ${tools_str}\n"

  for tool in "${tools[@]}"; do
    . "${CLI_CONFIG_ROOT}/src/installers/${tool}.options.zsh"
    if [ ! "${#defaultOptions[@]}" = "0" ]; then
      echo
      for key in "${(@k)defaultOptions}"; do
        echo -n "    --${tool}-$(echo $key | sed -e 's/_/-/g' | tr 'A-Z' '[:lower:]' )"
        echo " -$(cat "${CLI_CONFIG_ROOT}/src/installers/${tool}.options.zsh" | grep "${key}" | sed -e 's/^.*#//' )"
      done
    fi
  done
}
