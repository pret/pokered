; Mew's pics and base data are not grouped with the other Pokémon
; because it was a last-minute addition "as a kind of prank".
; Shigeki Morimoto explained in an Iwata Asks interview:
; "We put Mew in right at the very end. The cartridge was really full and
; there wasn't room for much more on there. Then the debug features which
; weren't going to be included in the final version of the game were removed,
; creating a miniscule 300 bytes of free space. So we thought that we could
; slot Mew in there. What we did would be unthinkable nowadays!"
; http://iwataasks.nintendo.com/interviews/#/ds/pokemon/0/0

MewPicFront:: INCBIN "gfx/pokemon/front/mew.pic"
MewPicBack::  INCBIN "gfx/pokemon/back/mewb.pic"

MewBaseStats::
INCLUDE "data/pokemon/base_stats/mew.asm"
