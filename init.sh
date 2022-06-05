git clone https://github.com/mrsauravsahu/cli-config.git \
--recurse-submodules \
--depth 1

zsh `pwd`/cli-config/setup.sh install "$@"
