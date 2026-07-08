; Reconciled from master RGBDS source: data/moves/grammar.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; Used by GetMoveGrammar (see engine/battle/core.asm)
; Each move is given an identifier for what usedmovetext to use (0-4).
; Made redundant in English localization, where all are just "[mon]<LINE>used [move]!"

MoveGrammar:
; 0: originally "[mon]は<LINE>[move]を つかった！"("[mon]<LINE>used [move]!")
.DB SWORDS_DANCE
.DB GROWTH
.DB 0

; 1: originally "[mon]は<LINE>[move]を した！"("[mon]<LINE>did [move]!")
.DB RECOVER
.DB BIDE
.DB SELFDESTRUCT
.DB AMNESIA
.DB 0

; 2: originally "[mon]は<LINE>[move]した！"("[mon]<LINE>did [move]!")
.DB MEDITATE
.DB AGILITY
.DB TELEPORT
.DB MIMIC
.DB DOUBLE_TEAM
.DB BARRAGE
.DB 0

; 3: originally "[mon]の<LINE>[move] こうげき！"("[mon]'s<LINE>[move] attack!")
.DB POUND
.DB SCRATCH
.DB VICEGRIP
.DB WING_ATTACK
.DB FLY
.DB BIND
.DB SLAM
.DB HORN_ATTACK
.DB BODY_SLAM
.DB WRAP
.DB THRASH
.DB TAIL_WHIP
.DB LEER
.DB BITE
.DB GROWL
.DB ROAR
.DB SING
.DB PECK
.DB COUNTER
.DB STRENGTH
.DB ABSORB
.DB STRING_SHOT
.DB EARTHQUAKE
.DB FISSURE
.DB DIG
.DB TOXIC
.DB SCREECH
.DB HARDEN
.DB MINIMIZE
.DB WITHDRAW
.DB DEFENSE_CURL
.DB METRONOME
.DB LICK
.DB CLAMP
.DB CONSTRICT
.DB POISON_GAS
.DB LEECH_LIFE
.DB BUBBLE
.DB FLASH
.DB SPLASH
.DB ACID_ARMOR
.DB FURY_SWIPES
.DB REST
.DB SHARPEN
.DB SLASH
.DB SUBSTITUTE
.DB 0

; 4: originally "[mon]の<LINE>[move]!"("[mon]'s<LINE>[move]!")
; Any move not listed above uses this grammar.
.DB -1
