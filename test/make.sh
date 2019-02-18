#!/bin/sh
echo 'include(../util.m4)' > util.m4
cat util.m4.txt | awk -v C1='`' -v C2="'" '
  BEGIN { FS="="; }
  {print ++i, C1 $0 C2, "ifelse(" $1 "," C1 $2 C2 ", " C1 "OK" C2 ", " C1 "m4exit(1)" C2 ")"}
' >> util.m4

