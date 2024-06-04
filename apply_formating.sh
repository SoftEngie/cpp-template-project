#!/bin/bash

SOURCES_FOLDERS=("src" "include" "test")
EXTENSIONS=("*.c" "*.cpp" "*.h" "*.hpp")

apply_formatting() {
    local folder=$1
    local files=()
    for ext in "${EXTENSIONS[@]}"; do
        while IFS= read -r -d '' file; do
            files+=("$file")
        done < <(find "$folder" -type f -name "$ext" -print0)
    done
    if [ ${#files[@]} -ne 0 ]; then
        clang-format --style=file -i "${files[@]}"
    fi
}


for f in "${SOURCES_FOLDERS[@]}"; do
    if [ -d "$f" ]; then
        echo "Applying formatting to files in $f"
        apply_formatting "$f"
    else
        echo "Warning: $f is not a directory or does not exist"
    fi
done

echo "Applying formatting to main.cpp"
clang-format --style=file -i main.cpp

echo "Formatting applied to all specified folders and main.cpp."
