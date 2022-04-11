main() {
    namespace cliConfig

    [string] mode

    array modes=('install' 'configure')
    if ! @get modes | array.contains $mode
    then
        if [[ $mode == "" ]]; then
            echo -n "Mode not selected. "
        else 
            echo -n "Invalid mode selected. "
        fi
        echo "Supported modes: $(@get modes | array.toString ',')"
        printf "\nUsage\n\n"
        echo -n "./setup.sh <mode=$(@get modes | array.toString ',')> "
        printf "[--profile $(profiles=(`ls -1 profiles`); @get profiles | array.toString ',')]\n\n"
    else
        shift # <-- already read mode argument so shifting once

        . $CLI_CONFIG_ROOT/defs/$mode.sh
        $mode "$@"
    fi
}
