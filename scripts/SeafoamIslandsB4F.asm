SeafoamIslandsB4F_Script:
	call EnableAutoTextBoxDrawing
	call SeafoamIslandsB4FOnMapLoad
	ld a, [wSeafoamIslandsB4FCurScript]
	ld hl, SeafoamIslandsB4F_ScriptPointers
	jp CallFunctionInTable

SeafoamIslandsB4FOnMapLoad::
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	call z, SeafoamB4FReplaceEastCurrentBlock
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret nz
	ld de, SeafoamB4FCurrentWestHorizontalReplacements
	ld a, $76
	ld [wNewTileBlockID], a
	jpfar ReplaceMultipleTileBlockLineHorizontalWithOneBlock

SeafoamB4FReplaceEastCurrentBlock:
	ld a, $76
	lb bc, 8, 10
SeafoamReplaceTileBlockEntry:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

SeafoamIslandsB4FResetScript:
	xor a
	ld [wSeafoamIslandsB4FCurScript], a
	ld [wJoyIgnore], a
	ret

SeafoamIslandsB4F_ScriptPointers:
	def_script_pointers
	dw_const SeafoamIslandsB4FDefaultScript,       SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	dw_const SeafoamIslandsB4FObjectMoving1Script, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING1
	dw_const SeafoamIslandsB4FEndArticunoBattleScript, SCRIPT_SEAFOAMISLANDSB4F_ARTICUNO_BATTLE_END

SeafoamIslandsB4FEndArticunoBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, SeafoamIslandsB4FResetScript
	call EndTrainerBattle
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FDefaultScript:
	ld a, [wYCoord]
	cp 18
	jr c, .leftSideCurrent
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	jr nz, .doCurrents
.leftSideCurrent
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
.doCurrents
	call SeafoamIslandsCurrents ; in SeafoamIslandsB3F.asm
	ret nc
	ld a, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING1
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FObjectMoving1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wYCoord]
	cp 12
	jr nz, .skip
	ld a, [wXCoord]
	cp 7
	call z, SeafoamDoneForcedSurfMovementLeft
.skip
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamDoneForcedSurfMovementLeft:
	xor a
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf

SeafoamIslandsB4F_TextPointers:
	def_text_pointers
	dw_const BoulderText,                       TEXT_SEAFOAMISLANDSB4F_BOULDER1
	dw_const BoulderText,                       TEXT_SEAFOAMISLANDSB4F_BOULDER2
	dw_const SeafoamIslandsB4FArticunoText,     TEXT_SEAFOAMISLANDSB4F_ARTICUNO
	dw_const PickUpItemText,                    TEXT_SEAFOAMISLANDSB4F_ITEM1 ; PureRGBnote: ADDED: new item located here.
	dw_const SeafoamIslandsB4FBouldersSignText, TEXT_SEAFOAMISLANDSB4F_BOULDERS_SIGN
	dw_const SeafoamIslandsB4FDangerSignText,   TEXT_SEAFOAMISLANDSB4F_DANGER_SIGN

; Articuno is object 3, but its event flag is bit 2.
; This is not a problem because its sight range is 0, and
; trainer headers were not stored by ExecuteCurMapScriptInTable.
	def_trainers 2
ArticunoTrainerHeader:
	trainer EVENT_BEAT_ARTICUNO, 0, SeafoamIslandsB4FArticunoBattleText, SeafoamIslandsB4FArticunoBattleText, SeafoamIslandsB4FArticunoBattleText
	db -1 ; end

SeafoamIslandsB4FArticunoText:
	text_asm
	ld hl, ArticunoTrainerHeader
	call TalkToTrainer
	ld a, SCRIPT_SEAFOAMISLANDSB4F_ARTICUNO_BATTLE_END
	ld [wSeafoamIslandsB4FCurScript], a
	rst TextScriptEnd

SeafoamIslandsB4FArticunoBattleText:
	text_far _SeafoamIslandsB4FArticunoBattleText
	text_asm
	ld a, ARTICUNO
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd

SeafoamIslandsB4FBouldersSignText:
	text_far _SeafoamIslandsB4FBouldersSignText
	text_end

SeafoamIslandsB4FDangerSignText:
	text_far _SeafoamIslandsB4FDangerSignText
	text_end
