tests=(
'. src/utils/array.zsh; my_array=("one"); array_str "," "${my_array[@]}"'
'. src/utils/array.zsh; my_array=("one" "two"); array_str "," "${my_array[@]}"'
)

results=(
"one"
"one,two"
)
