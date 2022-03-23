divert(-1)
dnl M4 C-Closure Draft Ver
define(`__DIV_TOP__', 1)
define(`__DIV_PROTO__', 2)
define(`__DIV_NORMAL__', 3)
define(`__DIV_LAMBDA__', 4)

define(`__cntr__', 0)
define(`__count__', `pushdef(`__cntr__', incr(__cntr__))')

define(`__LAMDEF__', ``__LAMDEF__''`divert(__DIV_NORMAL__)')

define(`__parse__', `define(`__ret__', `$1')`'define(`__arg__', `shift(rshift($@))')`'define(`__cont__', `last($@)')')
define(`__proto__', `__ret__`'__funcname__`'(__arg__)')
define(`__fn__', `__proto__ {__cont__}')
define(`__init__', `__parse__($@)'`define(`__funcname__', lambda`'__cntr__`'__count__)')

define(`_', `__init__($@)dnl
divert(__DIV_PROTO__)
static __proto__;dnl
divert(__DIV_LAMBDA__)
static __fn__
divert(__DIV_NORMAL__)__funcname__')

dnl ------------------------------------------
define(`__cntr_st__', 0)
define(`__count_st__', `pushdef(`__cntr_st__', incr(__cntr_st__))')

define(`__parse_st__', `define(`__stname__', `$1')`'define(`__stcont__', `shift($@)')')
define(`__init_st__', `__parse_st__($@)')

define(`_S', `__init_st__($@)dnl
divert(__DIV_PROTO__)
typedef struct __stname__ {
__stcont__
} __stname__;dnl
divert(__DIV_NORMAL__)malloc(sizeof(struct __stname__))')
dnl ------------------------------------------

divert(__DIV_TOP__)dnl
