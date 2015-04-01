GetTrainerName_: ; 13a58 (4:7a58)
	ld hl, W_GRASSRATE
	ld a, [wLinkState]
	and a
	jr nz, .rival
	ld hl, W_RIVALNAME
	ld a, [W_TRAINERCLASS]
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
	ld de, W_TRAINERNAME
	ld bc, $d
	jp CopyData
