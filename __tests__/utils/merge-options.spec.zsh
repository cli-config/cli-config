tests=(
'CCOPT_TEST=modifiedValue; typeset -A options_arr=("TEST" "originalValue"); . src/utils/merge-options.zsh; MergeOptions "CCOPT_" "${(@kv)options_arr[@]}"'
'CCOPT_TEST=modifiedValue; typeset -A options_arr=("TEST" "originalValue" "OTHER" "originalValue"); . src/utils/merge-options.zsh; MergeOptions "CCOPT_" "${(@kv)options_arr[@]}"'
)

results=(
'TEST modifiedValue'
'TEST modifiedValue OTHER originalValue'
)

