#!/bin/bash

# Starting directory (defaults to current directory if not provided)
start_dir="${1:-.}"

# Find all files and directories with spaces in their names
find "$start_dir" -depth -name "* *" -print0 | while IFS= read -r -d '' file; do
  # Construct the new name by replacing spaces with underscores
  new_file=$(echo "$file" | tr ' ' '_')
  # Rename the file or directory
  mv "$file" "$new_file"
done
