#!/bin/bash
# Directory to capture (current directory)
directoryPath=$(pwd)

# Output file
outputFile="${directoryPath}/captured_code.txt"

# Ignore list file
ignoreListFile="${directoryPath}/ignore_list.txt"

# Read ignore list into an array
readarray -t ignoreList < "$ignoreListFile"

# Function to check if a path should be ignored
shouldIgnore() {
    local filePath="$1"
    for ignorePattern in "${ignoreList[@]}"; do
        if [[ "$filePath" == *$ignorePattern* ]]; then
            return 0
        fi
    done
    return 1
}

# Function to read files recursively
readFilesRecursively() {
    local dir="$1"
    local fileList=()
    while IFS= read -r -d $'\0' file; do
        fileList+=("$file")
    done < <(find "$dir" -type f -print0)
    
    echo "${fileList[@]}"
}

# Function to capture file contents
captureFileContents() {
    local fileList=("$@")
    for filePath in "${fileList[@]}"; do
        if shouldIgnore "$filePath"; then
            continue
        fi
        echo "### File: ${filePath}" >> "$outputFile"
        echo "" >> "$outputFile"
        echo "\`\`\`" >> "$outputFile"
        cat "$filePath" >> "$outputFile"
        echo "\`\`\`" >> "$outputFile"
        echo "" >> "$outputFile"
    done
}

# Main function
main() {
    # Clear previous output file if exists
    > "$outputFile"

    # Read files and capture contents
    fileList=($(readFilesRecursively "$directoryPath"))
    captureFileContents "${fileList[@]}"

    echo "Captured contents have been written to ${outputFile}"
}

# Run the main function
main