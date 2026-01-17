; Used by DetermineExclamationPointTextNum (see engine/battle/core.asm)
; Each move is given an identifier for what usedmovetext to use (0-4).
; Made redundant in English localization, where all are just "[mon]<LINE>used [move]!"

ExclamationPointMoveSets:
; 0: originally "[mon]は<LINE>[move]を　つかった！" ("[mon]<LINE>used [move]!")
	db SWORDS_DANCE
	db GROWTH
	db 0 ; end set

; 1: originally "[mon]は<LINE>[move]を　した！" ("[mon]<LINE>did [move]!")
	db RECOVER
	db BIDE
	db SELFDESTRUCT
	db AMNESIA
	db 0 ; end set

; 2: originally "[mon]は<LINE>[move]した！" ("[mon]<LINE>did [move]!")
	db MEDITATE
	db AGILITY
	db TELEPORT
	db MIMIC
	db DOUBLE_TEAM
	db BARRAGE
	db 0 ; end set

; 3: originally "[mon]の<LINE>[move]　こうげき！" ("[mon]'s<LINE>[move] attack!")
	db POUND
	db SCRATCH
	db VICEGRIP
	db WING_ATTACK
	db FLY
	db BIND
	db SLAM
	db HORN_ATTACK
	db BODY_SLAM
	db WRAP
	db THRASH
	db TAIL_WHIP
	db LEER
	db BITE
	db GROWL
	db ROAR
	db SING
	db PECK
	db COUNTER
	db STRENGTH
	db ABSORB
	db STRING_SHOT
	db EARTHQUAKE
	db FISSURE
	db DIG
	db TOXIC
	db SCREECH
	db HARDEN
	db MINIMIZE
	db WITHDRAW
	db DEFENSE_CURL
	db METRONOME
	db LICK
	db CLAMP
	db CONSTRICT
	db POISON_GAS
	db LEECH_LIFE
	db BUBBLE
	db FLASH
	db SPLASH
	db ACID_ARMOR
	db FURY_SWIPES
	db REST
	db SHARPEN
	db SLASH
	db SUBSTITUTE
	db 0 ; end set

; 4: originally "[mon]の<LINE>[move]!" ("[mon]'s<LINE>[move]!")
; Any move not listed above uses this grammar.
	db -1 ; end
