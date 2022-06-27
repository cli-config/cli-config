#!/usr/bin/env zsh

Log() {
  echo "[${LOG_NAMESPACE}] $@"
}

LogDebug() {
  if [ "${VERBOSE}" != "1" ]; then exit; fi
  Log "$@" >/dev/tty
}
