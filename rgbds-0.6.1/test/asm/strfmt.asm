VAL EQUS STRFMT("Hello %s! I am %d years old today!", "world", $f)
PRINTLN "{VAL}"

N = -42
PRINTLN STRFMT("signed %010d == unsigned %010u", N, N)

N = 112
FMT EQUS "X"
PRINTLN STRFMT("\tdb %#03{s:FMT} %% 26\t; %#03{FMT}", N, N % 26)

TEMPLATE EQUS "\"%s are %s\\n\""
PRINT STRFMT(TEMPLATE, "roses", "red")
PRINT STRFMT(TEMPLATE, "violets", "blue")
PRINT STRFMT(TEMPLATE, "void", 0, "extra")

PRINTLN STRCAT(STRFMT(STRFMT("%%%s.%d%s", "", 9, "f"), 3.14159), \
	STRFMT(" ~ %s", STRFMT("%s%x", "thr", 238)))

N = 1.23456
PRINTLN STRFMT("%.f -> %.3f -> %f", N, N, N)

PRINTLN STRFMT("%d eol %", 1)

PRINTLN STRFMT("invalid %w spec", 42)

PRINTLN STRFMT("one=%d two=%d three=%d", 1)
