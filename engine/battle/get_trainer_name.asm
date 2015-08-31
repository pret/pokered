GetTrainerName_: ; 13a58 (4:7a58)
	ld hl, wGrassRate
	ld a, [wLinkState]
	and a
	jr nz, .rival
	ld hl, wRivalName
	ld a, [wTrainerClass]
	cp SONY1
	jr z, .rival
	cp SONY2
	jr z, .rival
	cp SONY3
	jr z, .rival
	ld [wd0b5], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName
	ld hl, wcd6d
.rival
	ld de, wTrainerName
	ld bc, $d
	jp CopyData
