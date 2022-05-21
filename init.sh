git clone https://github.com/mrsauravsahu/cli-config.git \
--recurse-submodules \
--depth 1

bash `pwd`/cli-config/setup.sh install "$@"
