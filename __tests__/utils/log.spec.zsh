tests=(
'. src/utils/log.zsh; LOG_NAMESPACE=test1; Log'
'. src/utils/log.zsh; LOG_NAMESPACE=test1; Log hello'
)

results=(
'[test1] ' # TODO: This should be empty
'[test1] hello'
)
