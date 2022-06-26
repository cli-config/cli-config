. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"
. "${CLI_CONFIG_ROOT}/src/installers/${TOOL_LOWERED}.options.zsh"

Install() {
  export GOROOT="${TOOL_DIR}"

  if [ -d "$CLI_CONFIG_ROOT/current/$TOOL" ]; then
    Log 'Seems cli-config/gvm is already installed!'
  else
    Log "Installing gvm"

    curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | zsh -s -- master "$CLI_CONFIG_ROOT/current"

    currentOs=$(uname -s)
    if [ $currentOs = "Linux" ]; then
      # TODO: check if we are specifically on Ubuntu
      Log "Setting up dependencies for gvm"
      cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt install --yes --no-install-recommends curl git mercurial make binutils bison gcc build-essential"
      Log "$cmd"
      eval $cmd
    elif [ $currentOs = "Darwin" ]; then
      cmd="brew install mercurial"
      Log "$cmd"
      eval $cmd
    fi

    Log "Installing ${options[GO_VERSION]} with gvm"
    export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"
    . $GOROOT/scripts/gvm
    gvm install ${options[GO_VERSION]}
    Log "Setting up ${options[GO_VERSION]} to be used globally"
    gvm use ${options[GO_VERSION]} --default
  fi
}

Configure() {
  export GOROOT="${CLI_CONFIG_ROOT}/current/gvm"

  echo -n >$CONF
  printf 'export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"\n' >>$CONF
  printf "# add gvm to path\n" >>$CONF
  printf 'export PATH="$GVM_DIR:$PATH"\n' >>$CONF
  printf 'lazyload gvm -- "source $GVM_DIR/scripts/gvm"' >>$CONF
}
