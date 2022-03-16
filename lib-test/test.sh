#!/bin/bash
UTIL_DIR=../lib

log() {
    echo "### $@ ###"
}

log util.m4 test
cat util.m4.test | m4 && echo util is OK || util is NG
echo ''

log xml.m4 test
RESULT=$(cat xml.m4.test | m4)
printf "%s\n" "$RESULT"
if [ "$(printf "%s\n" "$RESULT" | xmllint --html --xpath '//a/text()' -)" == "str" ]; then
    echo OK
else
    echo NG
fi

