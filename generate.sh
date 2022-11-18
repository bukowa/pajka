#!/bin/bash
set -e

if ! [ -f override.yaml ]; then echo "override.yaml no found"; exit 1; else KEYS=$(yq '.templates | keys | .[]' override.yaml); fi

# todo https://github.com/koalaman/shellcheck/wiki/SC2044
for tmpl in $(find templates -type f)
do
  FILE="${tmpl##*/}"
  if [ -f "$FILE" ]; then LAST=$FILE; else LAST=$tmpl; fi
  if [[ "$(echo "$KEYS" | grep -ow "$FILE" | wc -w)"  == 1 ]]
  then
    key="$FILE" yq '. *d (load("override.yaml") | .templates.[env(key)]) | explode(.) | del(.. | select(. == null)) | del(.. | select((tag == "!!map") and length == 0))' "$LAST"
  else
    yq '.' "$LAST"
  fi
  echo "---"
done
