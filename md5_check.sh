read -p "Enter path for control:" pathcheck
if [ ! -d "$pathcheck" ]; then
  echo "Directory does not exist."
  exit 1
fi
read -p "Enter path for result sum:" pathresult
mkdir -p "$pathresult"
name_file=$pathresult/$(basename "$pathcheck")-"md5sum.txt"
for file in "$pathcheck"/*; do
  if [ -f "$file" ]; then
    md5sum "$file" >> "$name_file"
  fi
done
echo "MD5 checksums have been saved to $name_file"
cat "$name_file"