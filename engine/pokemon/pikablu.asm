; PureRGBnote: ADDED: when in Bills Garden, pokemon appearing in the pond will be blue pikachus if you have alt palettes turned on due to this code.
; If it isn't turned on, you won't encounter anything.

PikabluInit::
	ld a, [wEnemyMonSpecies]
	cp PIKACHU
	ret nz
	ld hl, wEnemyMonNick  ; set name to "PIKABLU"
	ld de, PikabluName
	call CopyName
	ld hl, wEnemyMonMoves ; give it surf
	ld [hl], SURF
	ret

PikabluName:
	db "PIKABLU@"

CopyName:
	ld a, [de]
.loopName
	inc de
	ld [hli], a
	ld a, [de]
	cp "@"
	jr nz, .loopName
	ld [hl], a ; load string terminator
	ret

PikabluNicknameLoad::
	ld a, [wEnemyMonSpecies]
	cp PIKACHU
	ret nz
PikabluNicknameLoadQuick::
	ld hl, wNameBuffer  ; set name to "PIKABLU"
	ld de, PikabluName
	jp CopyName
	