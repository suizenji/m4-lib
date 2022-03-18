divert(-1)
define(`__DIV_TOP__', 1)
define(`__DIV_PROTO__', 2)
define(`__DIV_NORMAL__', 3)
define(`__DIV_LAMBDA__', 4)

define(`__cntr__', 0)dnl
define(`__count__', `pushdef(`__cntr__', incr(__cntr__))')dnl

define(`__LAMDEF__', ``__LAMDEF__''
`divert(__DIV_NORMAL__)')

define(`__parse__', `define(`__ret__', `$1')`'define(`__arg__', `shift(rshift($@))')`'define(`__cont__', `last($@)')')
define(`__proto__', `__ret__`'__funcname__`'(__arg__)')
define(`__fn__', `__proto__ {__cont__}')
define(`__init__', `__parse__($@)'`define(`__funcname__', lambda`'__cntr__`'__count__)')

define(`_', `__init__($@)`'divert(__DIV_PROTO__)`'__proto__;
divert(__DIV_LAMBDA__)`'__fn__
divert(__DIV_NORMAL__)__funcname__')

divert(__DIV_TOP__)dnl
