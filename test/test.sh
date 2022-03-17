#!/bin/bash
set -e

if ((${#PREF})); then
    M4='m4 --prefix-builtins'
else
    M4='m4'
fi

echo SEP1=$SEP1
echo SEP2=$SEP2
echo PREF=$PREF
echo M4=$M4

log() {
    echo "### $@ ###"
}

log util.m4 test
cat util.m4.test | $M4
echo ''

log xml.m4 test
RESULT=$(cat xml.m4.test | $M4)
printf "%s\n" "$RESULT"
if [ "$(printf "%s\n" "$RESULT" | xmllint --html --xpath '//a/text()' -)" == "str" ]; then
    echo OK
else
    echo NG
fi

