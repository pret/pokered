.BANK 40
.ORG $0000

; Structured replacement for RGBDS section "Text 9".
.INCLUDE "wla/banks/bank40_text.asm"

; Text 9 occupies $A0000-$A2A36; preserve the bank's free space.
.DSB $4000 - $2a37, $00

Bank40End::
