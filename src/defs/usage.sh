usage () {
  echo "Supported modes: $(@get modes | array.toString ',')"
  printf "\n *** CLI-CONFIG USAGE *** \n\n"
  echo -n "./setup.sh <$(@get modes | array.toString ',')> "
  printf "[-p|--profile $(profiles=(`ls -1 profiles`); @get profiles | array.toString ',')] "
  printf "[-t|--tools $(ls -1 $CLI_CONFIG_ROOT/src/installers | sed 's/\..*$//g' | sort | uniq | xargs | sed 's/ /,/g')]\n\n"
}