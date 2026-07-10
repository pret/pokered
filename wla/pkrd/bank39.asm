.BANK 39
.ORG $0000

; Structured replacement for RGBDS section "Text 8".
.INCLUDE "wla/banks/bank39_text.asm"

; Text 8 occupies $9C000-$9EAA3; preserve the bank's free space.
.DSB $4000 - $2aa4, $00

Bank39End::
