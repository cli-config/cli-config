namespace cliConfig

Log "CLI-CONFIG: Updating apt"
cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt update --yes"
Log "CLI-CONFIG: $cmd"
eval $cmd

packages='autojump thefuck'
Log "CLI-CONFIG: Installing '$packages'"
cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt install --yes --no-install-recommends $packages"
Log "CLI-CONFIG: $cmd"
eval $cmd