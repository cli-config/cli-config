#!/usr/bin/env bash

package() {
  case $1 in

  "lint")
    docker run --rm -u "$(id -u):$(id -g)" -v "$PWD:/mnt" -w /mnt mvdan/shfmt:v3.5.1-alpine -i 2 -l -w src/**/*.zsh *.sh
    ;;

  "test")
    for testFile in $(find __tests__ -regex '.*spec.zsh'); do
      ANY_TESTS_FAILED=0
      . ${testFile}

      testsCount="${#tests[@]}"

      for ((i = 0; i < ${testsCount}; i++)); do
        test_result=$(zsh -c "${tests[$i]}")

        if [ "${test_result}" != "${results[$i]}" ]; then
          echo TEST FAILED: "zsh -c '${tests[$i]}'"
          echo "'${test_result}' != '${results[$i]}'"
          echo
          ANY_TESTS_FAILED=1
        fi
      done
    done

    exit ${ANY_TESTS_FAILED}
    ;;

  *)
    echo 'invalid subcommand.'
    ;;

  esac
}

package "$@"
