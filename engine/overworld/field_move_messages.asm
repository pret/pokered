PrintStrengthTxt:
	ld hl, wFieldMoveFlags
	set FIELDMOVE_USING_STRENGTH_OUTSIDE_BATTLE_F, [hl]
	ld hl, UsedStrengthText
	call PrintText
	ld hl, CanMoveBouldersText
	jp PrintText

UsedStrengthText:
	text_far _UsedStrengthText
	text_asm
	ld a, [wcf91]
	call PlayCry
	call Delay3
	jp TextScriptEnd

CanMoveBouldersText:
	text_far _CanMoveBouldersText
	text_end

IsSurfingAllowed:
; Returns whether surfing is allowed in bit 1 of wFieldMoveFlags.
; Surfing isn't allowed on the Cycling Road or in the lowest level of the
; Seafoam Islands before the current has been slowed with boulders.
	ld hl, wFieldMoveFlags
	set FIELDMOVE_SURFING_ALLOWED_F, [hl]
	ld a, [wd732]
	bit 5, a
	jr nz, .forcedToRideBike
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B4F
	ret nz
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
	ld hl, SeafoamIslandsB4FStairsCoords
	call ArePlayerCoordsInArray
	ret nc
	ld hl, wFieldMoveFlags
	res FIELDMOVE_SURFING_ALLOWED_F, [hl]
	ld hl, CurrentTooFastText
	jp PrintText
.forcedToRideBike
	ld hl, wFieldMoveFlags
	res FIELDMOVE_SURFING_ALLOWED_F, [hl]
	ld hl, CyclingIsFunText
	jp PrintText

SeafoamIslandsB4FStairsCoords:
	dbmapcoord  7, 11
	db -1 ; end

CurrentTooFastText:
	text_far _CurrentTooFastText
	text_end

CyclingIsFunText:
	text_far _CyclingIsFunText
	text_end
