#!/bin/bash
set -e

log() {
    echo "### $@ ###"
}

log util.m4 test
test -e util.m4.test && cat util.m4.test | m4 && echo util is OK || util is NG
echo ''

