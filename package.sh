package () {
  case $1 in

    "lint")
    docker run --rm -u "$(id -u):$(id -g)" -v "$PWD:/mnt" -w /mnt mvdan/shfmt:v3.5.1-alpine -i 2 -l -w src/**/*.zsh
    ;;

    *)
    echo 'invalid subcommand.'
    ;;

  esac
}

package "$@"

