#!/bin/bash
# gen util.m4 test case
TEST_FILE_UTIL=util.m4.test
echo 'include(util.m4)dnl' > ${TEST_FILE_UTIL}
cat util.m4.txt | awk -v C1='`' -v C2="'" '
  BEGIN { FS="="; }
  {print ++i, C1 $0 C2, "ifelse(" $1 "," C1 $2 C2 ", " C1 "OK" C2 ", " C1 "NG m4exit(1)" C2 ")"}
' >> ${TEST_FILE_UTIL}

