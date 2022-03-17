divert(-1)
# require include(./util.m4)dnl
define(`elem', `ifelse(eval($# < 3), 1, `<$1>$2</$1>', `<$1 shift(rshift($@))>last($@)</$1>')')
define(`e', `elem($@)')
divert`'dnl
