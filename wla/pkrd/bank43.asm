.BANK 43
.ORG $0000

; Structured replacement for RGBDS section "Pokédex Text".
.INCLUDE "wla/banks/bank43_dex_text.asm"

; Pokédex Text occupies $AC000-$AF837; preserve the bank's free space.
.DSB $4000 - $3838, $00

Bank43End::
