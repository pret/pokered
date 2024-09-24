Route23_Script:
	call Route23SetVictoryRoadBoulders
	call EnableAutoTextBoxDrawing
	ld hl, Route23_ScriptPointers
	ld a, [wRoute23CurScript]
	jp CallFunctionInTable

Route23SetVictoryRoadBoulders:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	ResetEvents EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ResetEvents EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH1, EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH2
	ld a, HS_VICTORY_ROAD_3F_BOULDER
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_VICTORY_ROAD_2F_BOULDER
	ld [wMissableObjectIndex], a
	predef_jump HideObject

Route23_ScriptPointers:
	def_script_pointers
	dw_const Route23DefaultScript,        SCRIPT_ROUTE23_DEFAULT
	dw_const Route23PlayerMovingScript,   SCRIPT_ROUTE23_PLAYER_MOVING
	dw_const Route23ResetToDefaultScript, SCRIPT_ROUTE23_RESET_TO_DEFAULT

Route23DefaultScript:
	ld hl, Route23GuardsYCoords
	ld a, [wYCoord]
	ld b, a
	ld e, $0
	EventFlagBit c, EVENT_PASSED_EARTHBADGE_CHECK + 1, EVENT_PASSED_CASCADEBADGE_CHECK
.loop
	ld a, [hli]
	cp -1
	ret z
	inc e
	dec c
	cp b
	jr nz, .loop
	cp 35
	jr nz, .not_past_victory_road
	ld a, [wXCoord]
	cp 14
	ret nc
.not_past_victory_road
	ld a, e
	ldh [hSpriteIndex], a
	ld a, c
	ld [wWhichBadge], a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_PASSED_CASCADEBADGE_CHECK
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	call Route23CopyBadgeTextScript
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ret

Route23GuardsYCoords:
	db 35
	db 56
	db 85
	db 96
	db 105
	db 119
	db 136
	db -1 ; end

Route23CopyBadgeTextScript:
	ld hl, BadgeTextPointers
	ld a, [wWhichBadge]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wNameBuffer
.copyTextLoop
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copyTextLoop
	ret

BadgeTextPointers:
	dw CascadeBadgeText
	dw ThunderBadgeText
	dw RainbowBadgeText
	dw SoulBadgeText
	dw MarshBadgeText
	dw VolcanoBadgeText
	dw EarthBadgeText

EarthBadgeText:
	db "EARTHBADGE@"

VolcanoBadgeText:
	db "VOLCANOBADGE@"

MarshBadgeText:
	db "MARSHBADGE@"

SoulBadgeText:
	db "SOULBADGE@"

RainbowBadgeText:
	db "RAINBOWBADGE@"

ThunderBadgeText:
	db "THUNDERBADGE@"

CascadeBadgeText:
	db "CASCADEBADGE@"

Route23MovePlayerDownScript:
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	jp StartSimulatingJoypadStates

Route23PlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
Route23ResetToDefaultScript:
	ld a, SCRIPT_ROUTE23_DEFAULT
	ld [wRoute23CurScript], a
	ret

Route23_TextPointers:
	def_text_pointers
	dw_const Route23Guard1Text,              TEXT_ROUTE23_GUARD1
	dw_const Route23Guard2Text,              TEXT_ROUTE23_GUARD2
	dw_const Route23Swimmer1Text,            TEXT_ROUTE23_SWIMMER1
	dw_const Route23Swimmer2Text,            TEXT_ROUTE23_SWIMMER2
	dw_const Route23Guard3Text,              TEXT_ROUTE23_GUARD3
	dw_const Route23Guard4Text,              TEXT_ROUTE23_GUARD4
	dw_const Route23Guard5Text,              TEXT_ROUTE23_GUARD5
	dw_const Route23VictoryRoadGateSignText, TEXT_ROUTE23_VICTORY_ROAD_GATE_SIGN

Route23Guard1Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_EARTHBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23Guard2Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_VOLCANOBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23Swimmer1Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_MARSHBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23Swimmer2Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_SOULBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23Guard3Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_RAINBOWBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23Guard4Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_THUNDERBADGE_CHECK, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23Guard5Text:
	text_asm
	EventFlagBit a, EVENT_PASSED_CASCADEBADGE_CHECK
	call Route23CheckForBadgeScript
	jp TextScriptEnd

Route23CheckForBadgeScript:
	ld [wWhichBadge], a
	call Route23CopyBadgeTextScript
	ld a, [wWhichBadge]
	inc a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wObtainedBadges
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .have_badge
	ld hl, Route23YouDontHaveTheBadgeYetText
	call PrintText
	call Route23MovePlayerDownScript
	ld a, SCRIPT_ROUTE23_PLAYER_MOVING
	ld [wRoute23CurScript], a
	ret
.have_badge
	ld hl, Route23OhThatIsTheBadgeText
	call PrintText
	ld a, [wWhichBadge]
	ld c, a
	ld b, FLAG_SET
	EventFlagAddress hl, EVENT_PASSED_CASCADEBADGE_CHECK
	predef FlagActionPredef
	ld a, SCRIPT_ROUTE23_RESET_TO_DEFAULT
	ld [wRoute23CurScript], a
	ret

Route23PrintOhThatsTheBadgeTextScript: ; unreferenced
	ld hl, Route23OhThatIsTheBadgeText
	jp PrintText

Route23YouDontHaveTheBadgeYetText:
	text_far _Route23YouDontHaveTheBadgeYetText
	text_asm
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jp TextScriptEnd

Route23OhThatIsTheBadgeText:
	text_far _Route23OhThatIsTheBadgeText
	sound_get_item_1
	text_far _Route23GoRightAheadText
	text_end

Route23VictoryRoadGateSignText:
	text_far _Route23VictoryRoadGateSignText
	text_end
