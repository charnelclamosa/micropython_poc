#!/bin/bash
FILENAME="version.txt"
VERSION=`cat $FILENAME`
IFS="."

do_usage() {
  cat <<EOT
Description:
  Increments the version of the distribution package.

Usage:
  For first time use, run this command:
    ```
    $ chmod u+x ./bin/increment_version.sh
    ```

  For normal use, run this command:
    ```
    $ ./bin/increment_version.sh -t <major | minor | patch>
    ```
Options:
  -t --type  (Required) String indicator on what version will be incremented.
  -h         Stands for 'Help', this will print the docstring of this script.
EOT
  exit 1
}

do_error() {
  message=$1
  echo "$message"
  exit 1
}

increment_version() {
  read -ra test <<< "$VERSION"
  major=${test[0]}
  minor=${test[1]}
  patch=${test[2]}
  if [[ $type = "major" ]]; then
    major=$(($major+1))
    v="${major}.0.0"
  fi
  if [[ $type = "minor" ]]; then
    minor=$(($minor+1))
    v="${major}.${minor}.0"
  fi
  if [[ $type = "patch" ]]; then
    patch=$(($patch+1))
    v="${major}.${mino}.${patch}"
  fi
  echo "$v" >| "$FILENAME"
}

while getopts "t:h" opt; do
  case $opt in
  t) type=$OPTARG;;
  h) do_usage;;
  *) do_error "See $0 -h for options.";;
  esac
done

if [[ $type = "major" ]]; then
  increment_version "$type"
else
  echo "Invalid value! Expected values are: major | minor | patch"
fi