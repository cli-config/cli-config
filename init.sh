CLI_CONFIG_ROOT=${1:cli-config}

git clone https://github.com/mrsauravsahu/cli-config.git \
--recurse-submodules \
--depth 1

cd $CLI_CONFIG_ROOT

./setup.sh