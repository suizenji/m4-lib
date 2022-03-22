#!/bin/bash

SEP=${SEP1/\\/}${SEP2/\\/}

cat <<EOF
${PREF}changequote(,)${PREF}dnl
${PREF}changequote($SEP1,$SEP2)${PREF}dnl
${PREF}include(${DIR_LIB}/util.m4)${PREF}dnl
${PREF}include(${DIR_LIB}/c-lambda.m4)${PREF}dnl
#include <stdio.h>

// __LAMDEF__

int main(void) {
    int (*l0)() = ${PREF}_(int , return 0;);
    char *l1 = ${PREF}_(char *, return "str";)${SEP}();
    int l2l3 = ${PREF}_(int , int i, int j, return i * j;)${SEP}(2, ${PREF}_(int , int k, return k;)${SEP}(3));

    return 0;
}
EOF
