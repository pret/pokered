.BANK 42
.ORG $0000

; Structured replacement for RGBDS section "Text 11".
.INCLUDE "wla/banks/bank42_text.asm"

; Preserve the remainder of the 16 KiB bank as zero-filled free space.
.DSB $4000 - $0330, $00

Bank42End::
