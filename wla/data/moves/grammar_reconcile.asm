; Reconciled from master RGBDS source: data/moves/grammar.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; Used by GetMoveGrammar (see engine/battle/core.asm)
; Each move is given an identifier for what usedmovetext to use (0-4).
; Made redundant in English localization, where all are just "[mon]<LINE>used [move]!"

; 0: originally "[mon]は<LINE>[move]を　つかった！" ("[mon]<LINE>used [move]!")
.DW SWORDS_DANCE
.DW GROWTH
.DW 0

; 1: originally "[mon]は<LINE>[move]を　した！" ("[mon]<LINE>did [move]!")
.DW RECOVER
.DW BIDE
.DW SELFDESTRUCT
.DW AMNESIA
.DW 0

; 2: originally "[mon]は<LINE>[move]した！" ("[mon]<LINE>did [move]!")
.DW MEDITATE
.DW AGILITY
.DW TELEPORT
.DW MIMIC
.DW DOUBLE_TEAM
.DW BARRAGE
.DW 0

; 3: originally "[mon]の<LINE>[move]　こうげき！" ("[mon]'s<LINE>[move] attack!")
.DW POUND
.DW SCRATCH
.DW VICEGRIP
.DW WING_ATTACK
.DW FLY
.DW BIND
.DW SLAM
.DW HORN_ATTACK
.DW BODY_SLAM
.DW WRAP
.DW THRASH
.DW TAIL_WHIP
.DW LEER
.DW BITE
.DW GROWL
.DW ROAR
.DW SING
.DW PECK
.DW COUNTER
.DW STRENGTH
.DW ABSORB
.DW STRING_SHOT
.DW EARTHQUAKE
.DW FISSURE
.DW DIG
.DW TOXIC
.DW SCREECH
.DW HARDEN
.DW MINIMIZE
.DW WITHDRAW
.DW DEFENSE_CURL
.DW METRONOME
.DW LICK
.DW CLAMP
.DW CONSTRICT
.DW POISON_GAS
.DW LEECH_LIFE
.DW BUBBLE
.DW FLASH
.DW SPLASH
.DW ACID_ARMOR
.DW FURY_SWIPES
.DW REST
.DW SHARPEN
.DW SLASH
.DW SUBSTITUTE
.DW 0

; 4: originally "[mon]の<LINE>[move]！" ("[mon]'s<LINE>[move]!")
; Any move not listed above uses this grammar.
.DW -1
