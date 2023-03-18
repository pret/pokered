PikabluInit::
	ld a, [wEnemyMonSpecies]
	cp PIKACHU
	ret nz
	ld hl, wEnemyMonNick  ; set name to "PIKABLU"
	ld de, PikabluName
	call CopyName
	ld hl, wEnemyMonMoves ; give it surf
	ld a, SURF
	ld [hl], a
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
	ld hl, wcd6d  ; set name to "PIKABLU"
	ld de, PikabluName
	jp CopyName
	