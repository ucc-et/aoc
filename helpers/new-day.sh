#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: helpers/new-day.sh <year> <day>"
  echo "Example: helpers/new-day.sh 2026 1"
  exit 1
fi

year="$1"
day_raw="$2"

if ! [[ "$year" =~ ^[0-9]{4}$ ]]; then
  echo "Year must be a 4-digit number"
  exit 1
fi

if ! [[ "$day_raw" =~ ^[0-9]+$ ]] || [ "$day_raw" -lt 1 ] || [ "$day_raw" -gt 25 ]; then
  echo "Day must be a number between 1 and 25"
  exit 1
fi

day=$(printf "%02d" "$day_raw")
submission_dir="submissions/$year/day-$day"
input_dir="inputs/$year/day-$day"

mkdir -p "$submission_dir" "$input_dir"

touch "$submission_dir/solution.md"
touch "$input_dir/input.txt" "$input_dir/sample.txt"

echo "Created:"
echo "  $submission_dir"
echo "  $input_dir"
