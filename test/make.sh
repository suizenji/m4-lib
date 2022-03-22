#!/bin/bash

SEP1=${SEP1/\\/}
SEP2=${SEP2/\\/}
SEP=${SEP1/\\/}${SEP2/\\/}

changequote() {
    printf "${PREF}changequote(,)"
    printf "${PREF}changequote(%s,%s)" "$SEP1" "$SEP2"
}

prepare() {
    changequote > $1
}

# gen util.m4 test case
(
    TARGET=util.m4.test
    prepare ${TARGET}
    echo "${PREF}include(${DIR_LIB}/util.m4)${PREF}dnl" >> ${TARGET}
    cat ${TARGET%.*}.regular | awk '
BEGIN {
  FS="="; S1=ENVIRON["SEP1"]; S2=ENVIRON["SEP2"]; P=ENVIRON["PREF"]
}
{
  print ++i, S1 $0 S2,
  P "ifelse(" $1 "," S1 $2 S2 ", " S1 "OK" S2 ", " S1 "NG " P "m4exit(1)" S2 ")"
}
' >> ${TARGET}
)

# gen xml.m4 test case
(
    TARGET=xml.m4.test
    prepare ${TARGET}
    cat ${DIR_LIB}/util.m4 ${DIR_LIB}/xml.m4 >> ${TARGET}
    cat <<EOT >> ${TARGET}
${PREF}e(html,
  ${PREF}e(head)
  ${PREF}e(body,
    ${PREF}e(a, href="", str)
  )
)
EOT
)

# gen c-lambda test case
(
    TARGET=c-lambda.m4.test
    prepare ${TARGET}
    cat ${DIR_LIB}/util.m4 ${DIR_LIB}/c-lambda.m4 >> ${TARGET}
    cat <<EOT >> ${TARGET}
#include <stdio.h>

// __LAMDEF__

int main(void) {
    int (*l0)() = ${PREF}_(int , return 0;);
    char *l1 = ${PREF}_(char *, return "str";)${SEP}();
    int l2l3 = ${PREF}_(int , int i, int j, return i * j;)${SEP}(2, ${PREF}_(int , int k, return k;)${SEP}(3));

    return 0;
}
EOT
)
