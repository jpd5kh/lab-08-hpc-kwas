#!/bin/bash
set -euo pipefail

BUCKET=$1
BOOK_DIR=$2

mkdir -p "$BOOK_DIR"

aws s3 cp s3://"$BUCKET"/ "$BOOK_DIR/" --recursive --exclude "*" --include "*.txt"

echo "File path" > book_list.txt

BOOK_DIR=$(realpath "$BOOK_DIR")
find "$BOOK_DIR" -type f -name "*.txt" | sort >> book_list.txt

tail -n +2 book_list.txt | wc -l


