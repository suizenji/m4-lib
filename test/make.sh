#!/bin/bash
LIB_DIR=../lib

changequote() {
    printf "changequote(,)"
    printf "changequote(%s,%s)" "$SEP1" "$SEP2"
}

prepare() {
    changequote > $1
}

# gen util.m4 test case
prepare util.m4.test
echo "include(${LIB_DIR}/util.m4)dnl" >> util.m4.test
cat util.m4.txt | awk -v C1='`' -v C2="'" '
  BEGIN { FS="="; }
  {print ++i, C1 $0 C2, "ifelse(" $1 "," C1 $2 C2 ", " C1 "OK" C2 ", " C1 "NG m4exit(1)" C2 ")"}
' >> util.m4.test

# gen xml.m4 test case
prepare xml.m4.test
cat ${LIB_DIR}/util.m4 ${LIB_DIR}/xml.m4 >> xml.m4.test
cat <<EOT >> xml.m4.test
e(html,
  e(head)
  e(body,
    e(a, href="", str)
  )
)
EOT
