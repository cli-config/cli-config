#!/usr/bin/env bash

# SETUP WORKING DIRECTORY
CI=true
# Find the directory where setup.sh is
# This is relative path to the setup.sh script
CLI_CONFIG_ROOT=`dirname $0`
# Goto config dir
cd $CLI_CONFIG_ROOT
# Convert CLI_CONFIG_ROOT to absolute path
CLI_CONFIG_ROOT=`pwd`

# SETUP DEPENDENCIES
# setup bash-oo-framework
. "$CLI_CONFIG_ROOT/bash-oo-framework/lib/oo-bootstrap.sh"

import util/log
import util/type
import util/variable
import util/namedParameters

namespace cliConfig
Log::AddOutput cliConfig INFO

. $CLI_CONFIG_ROOT/src/defs/main.sh 

main "$@"
