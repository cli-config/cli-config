#!/usr/bin/env bash

package() {
  case $1 in

  "lint")
    docker run --rm -u "$(id -u):$(id -g)" -v "$PWD:/mnt" -w /mnt mvdan/shfmt:v3.5.1-alpine -i 2 -l -w src/**/*.zsh *.sh cli-config
    ;;

  "test")
    for testFile in $(find __tests__ -regex '.*spec.zsh'); do
      ANY_TESTS_FAILED=0
      results=''
      tests=()
      results=()
      . ${testFile}

      testsCount="${#tests[@]}"
      TEST_PASSED=true

      if [ ! "${#tests[@]}" = '0' ]; then
        echo "${testFile}"
      fi

      for ((i = 0; i < testsCount; i++)); do
        test_result=$(zsh -c "CONSOLE='/dev/null'; CLI_CONFIG_ROOT='$(pwd)'; ${tests[$i]}")

        if [ "${test_result}" != "${results[$i]}" ]; then
          echo -n "  🙅‍♂️ "
          TEST_PASSED=false
          ANY_TESTS_FAILED=1
        else
          echo -n "  ✅ "
        fi

        echo "$ zsh -c ${tests[$i]}\""
        [ "${VERBOSE}" = '1' ] && [ "${TEST_PASSED}" == 'false' ] && echo "TEST FAILED: zsh -c '${tests[$i]}'" && diff <(echo "${test_result}") <(echo "${results[$i]}") | bat -l diff
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
