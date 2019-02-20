divert(-1)
define(`rshift', `ifelse($#, 0, ``rshift'', `ifelse($#, 1, `', ``$1'`''`ifelse(eval($# > 2), 1, `,')'`rshift(shift($@))')')')
define(`last', `ifelse($#, 0, ``last'', `ifelse($#, 1, `$@', `last(shift($@))')')')
divert`'dnl
