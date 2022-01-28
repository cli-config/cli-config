namespace cliConfig

Log "CLI-CONFIG: Updating apt"
cmd='sudo apt update --yes'
Log "CLI-CONFIG: $cmd"
eval $cmd

packages='autojump thefuck'
Log "CLI-CONFIG: Installing '$packages'"
cmd="sudo apt install --yes $packages"
Log "CLI-CONFIG: $cmd"
eval $cmd