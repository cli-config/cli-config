. $CLI_CONFIG_ROOT/src/defs/usage.sh

main() {
    namespace cliConfig

    [string] mode

    array modes=('install' 'configure')
    if ! @get modes | array.contains $mode
    then
        if [[ $mode == "" ]]; then
            echo -n "Mode not selected. "
        else 
            echo -n "Invalid mode '$mode' selected. "
        fi
        usage
    else
        shift # <-- already read mode argument so shifting once

        . $CLI_CONFIG_ROOT/src/defs/$mode.sh
        $mode "$@"
    fi
}
