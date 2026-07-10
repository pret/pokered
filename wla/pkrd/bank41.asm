.BANK 41
.ORG $0000

; Structured replacement for RGBDS section "Text 10".
.INCLUDE "wla/banks/bank41_text.asm"

; Text 10 occupies $A4000-$A6B93; preserve the bank's free space.
.DSB $4000 - $2b94, $00

Bank41End::
