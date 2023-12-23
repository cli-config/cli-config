#!/usr/bin/env bash

array_str() {
  sep=$1
  shift
  arr=("$@")

  len=${#arr[@]}
  # echo "arr='${arr[@]}' sep='${sep}' len='${len}'"

  if [ "${len}" -gt "1" ]; then
    for i in {1..$(($len - 1))}; do
      echo -n "${arr[$i]}${sep}"
    done
  fi

  echo -n "${arr[$len]}"
}

array_contains() {
  value=$1
  shift
  arr=("$@")

  IS_PRESENT='false'
  for i in "${arr[@]}"; do
    if [ "$i" = "$value" ]; then
      IS_PRESENT='true'
      break
    fi
  done

  echo -n $IS_PRESENT
}
