#!/bin/bash

SEP=${SEP1/\\/}${SEP2/\\/}

cat <<EOF
include(${DIR_LIB}/util.m4)dnl
include(${DIR_LIB}/lambda.m4)dnl
#include <stdio.h>

// __LAMDEF__

int main(void) {
    int (*l0)() = _(int , return 0;);
    char *l1 = _(char *, return "str";)${SEP}();
    int l2l3 = _(int , int i, int j, return i * j;)${SEP}(2, _(int , int k, return k;)${SEP}(3));

    return 0;
}
EOF
