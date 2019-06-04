#!/bin/sh
log() {
    echo "### $@ ###"
}

log util.m4 test
cat util.m4 | m4 && echo util is OK || util is NG

log xml.m4 test
RESULT=$(cat ../util.m4 ../xml.m4 ./xml.m4 | m4)
printf "%s\n" "$RESULT"
if [ "$(printf "%s\n" "$RESULT" | xmllint --html --xpath '//a/text()' -)" == "str" ]; then
    echo OK
else
    echo NG
fi

