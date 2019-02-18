define(`rshift', `ifelse($#, 0, ``rshift'', `ifelse($#, 1, `', `$1'``''`ifelse(eval($# > 2), 1, `,')'`rshift(shift($@))')')')`'dnl
define(`last', `ifelse($#, 0, ``last'', `ifelse($#, 1, `$@', `last(shift($@))')')')`'dnl
