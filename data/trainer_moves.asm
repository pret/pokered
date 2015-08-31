IF !DEF(YELLOW)
LoneMoves: ; 39d22 (e:5d22)
; these are used for gym leaders.
; this is not automatic! you have to write the number you want to wLoneAttackNo
; first. e.g., erika's script writes 4 to wLoneAttackNo to get mega drain,
; the fourth entry in the list.

; first byte:  pokemon in the trainer's party that gets the move
; second byte: move
; unterminated
	db 1,BIDE
	db 1,BUBBLEBEAM
	db 2,THUNDERBOLT
	db 2,MEGA_DRAIN
	db 3,TOXIC
	db 3,PSYWAVE
	db 3,FIRE_BLAST
	db 4,FISSURE

TeamMoves: ; 39d32 (e:5d32)
; these are used for elite four.
; this is automatic, based on trainer class.
; don't be confused by LoneMoves above, the two data structures are
	; _completely_ unrelated.

; first byte: trainer (all trainers in this class have this move)
; second byte: move
; ff-terminated
	db LORELEI,BLIZZARD
	db BRUNO,FISSURE
	db AGATHA,TOXIC
	db LANCE,BARRIER
	db $FF

ELSE
; yellow has its own format.

; entry ≔ trainerclass, trainerid, moveset+, 0
; moveset ≔ partymon, partymon'smove, moveid

LoneMoves:
TeamMoves:
	db BUG_CATCHER,$f
	db 2,2,TACKLE
	db 2,3,STRING_SHOT
	db 0

	db YOUNGSTER,$e
	db 1,4,FISSURE
	db 0

	db BROCK,$1
	db 2,3,BIND
	db 2,4,BIDE
	db 0

	db MISTY,$1
	db 2,4,BUBBLEBEAM
	db 0

	db LT__SURGE,$1
	db 1,1,THUNDERBOLT
	db 1,2,MEGA_PUNCH
	db 1,3,MEGA_KICK
	db 1,4,GROWL
	db 0

	db ERIKA,$1
	db 1,3,MEGA_DRAIN
	db 2,1,RAZOR_LEAF
	db 3,1,PETAL_DANCE
	db 0

	db KOGA,$1
	db 1,1,TOXIC
	db 1,2,TACKLE
	db 2,1,TOXIC
	db 2,3,SUPERSONIC
	db 3,1,TOXIC
	db 3,2,DOUBLE_EDGE
	db 4,1,LEECH_LIFE
	db 4,2,DOUBLE_TEAM
	db 4,3,PSYCHIC_M
	db 4,4,TOXIC
	db 0

	db BLAINE,$1
	db 1,1,FLAMETHROWER
	db 1,4,CONFUSE_RAY
	db 3,1,FLAMETHROWER
	db 3,2,FIRE_BLAST
	db 3,3,REFLECT
	db 0

	db SABRINA,$1
	db 1,1,FLASH
	db 2,1,KINESIS
	db 2,4,PSYWAVE
	db 3,1,PSYWAVE
	db 0

	db GIOVANNI,$3
	db 1,3,FISSURE
	db 2,2,DOUBLE_TEAM
	db 3,1,EARTHQUAKE
	db 3,3,THUNDER
	db 4,1,EARTHQUAKE
	db 4,2,LEER
	db 4,3,THUNDER
	db 5,1,ROCK_SLIDE
	db 5,4,EARTHQUAKE
	db 0

	db LORELEI,$1
	db 1,1,BUBBLEBEAM
	db 2,3,ICE_BEAM
	db 3,1,PSYCHIC_M
	db 3,2,SURF
	db 4,3,LOVELY_KISS
	db 5,3,BLIZZARD
	db 0

	db BRUNO,$1
	db 1,1,ROCK_SLIDE
	db 1,2,SCREECH
	db 1,4,DIG
	db 2,3,FIRE_PUNCH
	db 2,4,DOUBLE_TEAM
	db 3,1,DOUBLE_KICK
	db 3,2,MEGA_KICK
	db 3,4,DOUBLE_TEAM
	db 4,1,ROCK_SLIDE
	db 4,2,SCREECH
	db 4,4,EARTHQUAKE
	db 5,2,KARATE_CHOP
	db 5,3,STRENGTH
	db 0

	db AGATHA,$1
	db 1,2,SUBSTITUTE
	db 1,3,LICK
	db 1,4,MEGA_DRAIN
	db 2,2,TOXIC
	db 2,4,LEECH_LIFE
	db 3,2,LICK
	db 4,1,WRAP
	db 5,2,PSYCHIC_M
	db 0

	db LANCE,$1
	db 1,1,DRAGON_RAGE
	db 2,1,THUNDER_WAVE
	db 2,3,THUNDERBOLT
	db 3,1,BUBBLEBEAM
	db 3,2,WRAP
	db 3,3,ICE_BEAM
	db 4,1,WING_ATTACK
	db 4,2,SWIFT
	db 4,3,FLY
	db 5,1,BLIZZARD
	db 5,2,FIRE_BLAST
	db 5,3,THUNDER
	db 0

	db SONY3,$1
	db 1,3,EARTHQUAKE
	db 2,4,KINESIS
	db 3,4,LEECH_SEED
	db 4,1,ICE_BEAM
	db 5,1,CONFUSE_RAY
	db 5,4,FIRE_SPIN
	db 6,3,QUICK_ATTACK
	db 0

	db SONY3,$2
	db 1,3,EARTHQUAKE
	db 2,4,KINESIS
	db 3,4,LEECH_SEED
	db 4,1,THUNDERBOLT
	db 5,1,ICE_BEAM
	db 6,2,REFLECT
	db 6,3,QUICK_ATTACK
	db 0

	db SONY3,$3
	db 1,3,EARTHQUAKE
	db 2,4,KINESIS
	db 3,4,LEECH_SEED
	db 4,1,CONFUSE_RAY
	db 4,4,FIRE_SPIN
	db 5,1,THUNDERBOLT
	db 6,1,AURORA_BEAM
	db 6,3,QUICK_ATTACK
	db 0

	db $ff
endc
