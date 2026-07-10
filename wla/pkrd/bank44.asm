.BANK 44
.ORG $0000

; Structured replacement for RGBDS section "Move Names".
.INCLUDE "wla/banks/bank44_move_names.asm"

; Move Names occupies $B0000-$B060E; preserve the bank's free space.
.DSB $4000 - $060f, $00

Bank44End::
