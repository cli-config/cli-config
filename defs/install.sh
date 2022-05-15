install () {
    namespace cliConfig

    # DEFAULT OPTIONS
    CCOPT_PROFILE=default
    CCOPT_NO_SUDO='sudo'
    CCOPT_DEBIAN_FRONTEND=''

    # READ OPTIONS
    # Todo: Move to separate file
    while [[ $# -gt 0 ]]; do
        case $1 in
            -c|--clean)
                CCOPT_CLEAN=true
                shift
            ;;
            -p|--profile)
                profiles=(`ls -1 $CLI_CONFIG_ROOT/profiles`)
                if ! @get profiles | array.contains $CCOPT_PROFILE
                then
                    echo -n "CLI-CONFIG: The specified profile '$CCOPT_PROFILE' does not exist. "
                    echo "Available profiles: $(@get profiles | array.toString ',')"
                    exit
                fi
                CCOPT_PROFILE=$2
                shift; shift
            ;;
            -n|--no-sudo)
                CCOPT_NO_SUDO=''
                shift
            ;;
            --ci)
                CCOPT_DEBIAN_FRONTEND='DEBIAN_FRONTEND=noninteractive'
                shift
            ;;
            *)
                # Unrecognized option
                shift
        esac
    done

    # START INSTALL
    Log "CLI-CONFIG: Starting install... $(UI.Powerline.ThumbsUp)"

    # load cli-config env variables
    . $CLI_CONFIG_ROOT/scripts/env.sh

    # Try and clean old installation
    if [[ -n $CCOPT_CLEAN ]]; then
        Log "CLI-CONFIG: Trying to clean old installation: $(UI.Color.Blue)$CLI_CONFIG_ROOT/current$(UI.Color.Default)"
        rm -rf "$CLI_CONFIG_ROOT/current" > /dev/null 2> /dev/null || true
    fi

    # Create installation folder if not exists
    if [ ! -d "$CLI_CONFIG_ROOT/current" ]; then
        Log "CLI-CONFIG: Creating new installation location: $(UI.Color.Blue)$CLI_CONFIG_ROOT/current$(UI.Color.Default)"
        mkdir current
        mkdir $CLI_CONFIG_TOOLS_LOCATION
        mkdir $CLI_CONFIG_CONF_LOCATION
    fi

    Log "CLI-CONFIG: Installing programs"

    array programs=('antigen' 'ohmyposh' 'nvm' 'pyenv' 'dotnet' 'tfenv' 'gvm')
    @get programs | array.forEach '. $CLI_CONFIG_ROOT/scripts/$item.install.sh && . $CLI_CONFIG_ROOT/scripts/$item.configure.sh'
    . $CLI_CONFIG_ROOT/scripts/setup.programs-conf.sh

    currentOs=`uname -s`
    Log "CLI-CONFIG: Running OS specific settings..."
    if [ $currentOs = "Linux" ]; then
        # Log 'You are on linux'
        # TODO: check if we are specifically on Ubuntu
        . $CLI_CONFIG_ROOT/scripts/os-specific-setup.ubuntu.sh

        # set CLI_CONFIG_ROOT value in.zshrc files in profiles
        for i in `find $CLI_CONFIG_ROOT/profiles | grep .zshrc$`; do
            sed -i $SED_OPTIONS "s|CLI_CONFIG_ROOT=\`pwd\`|CLI_CONFIG_ROOT='$CLI_CONFIG_ROOT'|" $i
        done
    elif [ $currentOs = "Darwin" ]; then
        # Log 'Mac huh'
        . $CLI_CONFIG_ROOT/scripts/os-specific-setup.darwin.sh

        # set CLI_CONFIG_ROOT value in.zshrc files in profiles
        for i in `find $CLI_CONFIG_ROOT/profiles | grep .zshrc$`; do
            sed -i '' $SED_OPTIONS "s|CLI_CONFIG_ROOT=\`pwd\`|CLI_CONFIG_ROOT='$CLI_CONFIG_ROOT'|" $i
        done
    else
        Log 'what realm is this?'
    fi

    zshPath=`which zsh`
    # set ~/.zshrc to selected profile
    (rm ~/.zshrc ~/.zshrc.zwc 2> /dev/null || true) && ln -s $CLI_CONFIG_ROOT/profiles/$CCOPT_PROFILE/.zshrc ~/.zshrc

    echo
    echo "$(UI.Color.Blue)CLI-CONFIG Installation complete! $(UI.Powerline.ThumbsUp)"
    echo "$(UI.Color.Default)$(UI.Powerline.OK)$(UI.Color.Blue) You are using cli-config now!"
    echo "$(UI.Color.Default)$(UI.Powerline.OK)$(UI.Color.Blue) Symlinked ~/.zshrc to the '$CCOPT_PROFILE' cli-config profile."
    echo "$(UI.Color.Default)$(UI.Powerline.ArrowRight)$(UI.Color.Blue) Note: Your default shell should be '$zshPath'. (Use chsh to change it)"

    printf "\n\nEnjoy! Made with $(UI.Powerline.Heart)\n- Saurav $(UI.Color.Default)\n"
}