SaveTrainerName::
	; PureRGBnote: REMOVED: pointless remnant code from the japanese version was removed
	ld hl, wTrainerName
	ld de, wcd6d
.CopyCharacter
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .CopyCharacter
	ret

