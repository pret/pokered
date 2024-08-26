; It seems that \1 was the easiest way to notice the memory corruption that
; resulted from this overflow
x = 0
{.99999999f:x}\1
