tests=(
'CCOPT_TEST=modifiedValue; typeset -A defaultOptions=("TEST" "originalValue"); . src/utils/merge-options.zsh; MergeOptions "CCOPT_" "${(@kv)defaultOptions[@]}"'
'CCOPT_TEST=modifiedValue; typeset -A defaultOptions=("TEST" "originalValue" "OTHER" "originalValue"); . src/utils/merge-options.zsh; MergeOptions "CCOPT_" "${(@kv)defaultOptions[@]}"'
'CCOPT_TEST="one two three"; typeset -A defaultOptions=("TEST" "one two" "OTHER" "originalValue"); . src/utils/merge-options.zsh; MergeOptions "CCOPT_" "${(@kv)defaultOptions[@]}"'
)

results=(
"TEST
modifiedValue"
"TEST
modifiedValue
OTHER
originalValue"
"TEST
one two three
OTHER
originalValue"
)

