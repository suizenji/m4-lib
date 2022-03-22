#!/bin/bash
set -e

# debug
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

log util.m4 test
cat c-lambda.m4.test | $M4 > c-lambda.c
cc c-lambda.c -o c-lambda.out
./c-lambda.out && echo OK || echo NG
