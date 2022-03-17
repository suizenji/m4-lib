#!/bin/bash
changequote() {
    printf "changequote(,)"
    printf "changequote(%s,%s)" "$SEP1" "$SEP2"
}

prepare() {
    changequote > $1
}

# gen util.m4 test case
(
    TARGET=util.m4.test
    prepare ${TARGET}
    echo "include(${DIR_LIB}/util.m4)dnl" >> ${TARGET}
    cat util.m4.txt | awk '
  BEGIN { FS="="; S1=ENVIRON["SEP1"]; S2=ENVIRON["SEP2"]; }
  {print ++i, S1 $0 S2, "ifelse(" $1 "," S1 $2 S2 ", " S1 "OK" S2 ", " S1 "NG m4exit(1)" S2 ")"}
' >> ${TARGET}
)

# gen xml.m4 test case
(
    TARGET=xml.m4.test
    prepare xml.m4.test
    cat ${DIR_LIB}/util.m4 ${DIR_LIB}/xml.m4 >> ${TARGET}
    cat <<EOT >> ${TARGET}
e(html,
  e(head)
  e(body,
    e(a, href="", str)
  )
)
EOT
)
