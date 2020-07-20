GetTrainerName_::
	ld hl, wGrassRate
	ld a, [wLinkState]
	and a
	jr nz, .foundName
	ld hl, wRivalName
	ld a, [wTrainerClass]
	cp RIVAL1
	jr z, .foundName
	cp RIVAL2
	jr z, .foundName
	cp RIVAL3
	jr z, .foundName
	ld [wd0b5], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName
	ld hl, wcd6d
.foundName
	ld de, wTrainerName
	ld bc, $d
	jp CopyData
