; PureRGBnote: ADDED: one of the new pages in the options menu. This one's for battle-related settings
DEF OPTIONS_PAGE_3_COUNT EQU 6 ; number of options on this page
DEF OPTIONS_PAGE_3_NUMBER EQU 3 ; must be 1 digit.

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
BattleOptionsXPosBitData:
	db 11, 14, BIT_GHOST_PSYCHIC
	dw wOptions3
	db 14, 11, BIT_ICE_FIRE 
	dw wOptions3
	db 14, 11, BIT_BUG_PSN 
	dw wOptions3
	db 14, 11, BIT_PSN_BUG 
	dw wOptions3
	db 11, 14, BIT_EXP_BAR 
	dw wOptions2
	db 11, 14, BIT_NPC_STAT_EXP
	dw wOptions2


BattleOptionsHeader:
	dw DrawBattleOptionsMenu
	dw BattleOptionsSetCursorPositionActions
	dw SetBattleOptionsFromCursorPositions
	dw BattleOptionsLeftRightFuncs
	dw DisplaySpriteOptions
	dw DisplayOptions2
	dw OptionsPageAButtonDefault
	; fall through
DisplayBattleOptions:
	ld hl, BattleOptionsHeader
	ld bc, BattleOptionsData
	jp DisplayOptionMenuCommon

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
BattleOptionsYCoordVariableOffsetList:
	db 3, 0
	db 5, 1
	db 7, 2
	db 9, 3
	db 11, 4
	db 13, 5
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

BattleOptionsData:
	db OPTIONS_PAGE_3_COUNT ; length of list
	db OPTIONS_PAGE_3_NUMBER ; current page
	db HOW_MANY_MAIN_OPTIONS_PAGES ; how many pages in total
	dw BattleOptionsYCoordVariableOffsetList

BattleOptionsSetCursorPositionActions:
	dw SetCursorPositionFromBattleOptions
	dw SetCursorPositionFromBattleOptions
	dw SetCursorPositionFromBattleOptions
	dw SetCursorPositionFromBattleOptions
	dw SetCursorPositionFromBattleOptions
	dw SetCursorPositionFromBattleOptions

BattleOptionText:
	db   "BATTLE OPTIONS"
	next " GHST→PSY: 0× 2×"
	next " ICE→FIRE: 1× 0.5×"
	next " BUG→PSN:  2× 0.5×"
	next " PSN→BUG:  2× 1×"
	next " EXP BAR:  ON OFF"
	next " NPC EVs:  ON OFF@"

DrawBattleOptionsMenu:
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, BattleOptionText
	jp PlaceString

BattleOptionsLeftRightFuncs:
	dw GenericBattleOptionsCursorToggleFunc
	dw GenericBattleOptionsCursorToggleFunc
	dw GenericBattleOptionsCursorToggleFunc
	dw GenericBattleOptionsCursorToggleFunc
	dw GenericBattleOptionsCursorToggleFunc
	dw GenericBattleOptionsCursorToggleFunc
	dw CursorCancelRow

GenericBattleOptionsCursorToggleFunc:
	ld b, %101
GenericOptionsCursorToggleFunc:
	ld hl, wCurrentOptionIndex
	ld e, [hl]
	ld d, 0
	ld hl, wOptions1CursorX
	add hl, de
	ld a, [hl]
	xor b
	ld [hl], a
	jp EraseOldMenuCursor

; sets the options variable according to the current placement of the menu cursors in the options menu
SetBattleOptionsFromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, BattleOptionsXPosBitData
	ld b, OPTIONS_PAGE_3_COUNT
	; fall through
LoopGenericSetOptionsFromCursorPositions:
.loopOptions
	push bc
	ld c, [hl]
	cp -1
	jr z, .skip
	inc hl
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	ld a, [de]
	call SetSingleBitOption 
	pop hl
	inc hl
	inc de
	pop bc
	dec b
	jr nz, .loopOptions
	ret
.skip
	push de
	ld d, 0
	ld e, 5
	add hl, de
	pop de
	inc de
	pop bc
	dec b
	jr nz, .loopOptions
	ret

SetCursorPositionFromBattleOptions:
	ld hl, BattleOptionsXPosBitData
SetGenericCursorPositionFromOptions:
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	push af
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	jp SetSingleBitOptionCursorPosition
