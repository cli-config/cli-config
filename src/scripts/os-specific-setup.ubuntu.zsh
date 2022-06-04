Log "Updating apt"
cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt update --yes"
Log "$cmd"
eval $cmd

packages='autojump thefuck'
Log "Installing '$packages'"
cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt install --yes --no-install-recommends $packages"
Log "$cmd"
eval $cmd
