#!/bin/bash
set -e

log() {
    echo "### $@ ###"
}

log util.m4 test
cat util.m4.test | m4
echo ''

log xml.m4 test
RESULT=$(cat xml.m4.test | m4)
printf "%s\n" "$RESULT"
if [ "$(printf "%s\n" "$RESULT" | xmllint --html --xpath '//a/text()' -)" == "str" ]; then
    echo OK
else
    echo NG
fi

