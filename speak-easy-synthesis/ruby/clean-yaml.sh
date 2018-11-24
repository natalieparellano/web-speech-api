function clean-yaml {
file=$1

cat $file | yq -y --sort-keys '.|sort_by(.name)' > testFile
mv testFile $file
}
