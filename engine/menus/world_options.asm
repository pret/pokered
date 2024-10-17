; PureRGBnote: ADDED: Accessed from your PC. This options page changes what areas are in the world. Currently only Volcano can be turned off/on.
DEF WORLD_OPTIONS_COUNT EQU 1 ; number of options on this page
DEF WORLD_OPTIONS_PAGE_NUMBER EQU 1 ; must be 1 digit.
DEF HOW_MANY_WORLD_OPTIONS_PAGES EQU 1

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
WorldOptionsXPosBitData:
	db 15, 12, FLAG_VOLCANO_AREA_TURNED_OFF % 8
	dw wEventFlags + (FLAG_VOLCANO_AREA_TURNED_OFF / 8)
	db -1

WorldOptionsHeader:
	dw DrawWorldOptionsMenu
	dw WorldOptionsSetCursorPositionActions
	dw SetWorldOptionsFromCursorPositions
	dw WorldOptionsLeftRightFuncs
	dw DisplayWorldOptions
	dw DisplayWorldOptions
	dw OptionsPageAorSelectButtonDefault
	dw WorldOptionsInfoTextJumpTable
	; fall through
DisplayWorldOptions::
	ld de, PokedexPromptGraphics
	ld hl, vChars1 tile $43
	lb bc, BANK(PokedexPromptGraphics), 3
	call CopyVideoData
	ld de, InfoPromptGraphics
	ld hl, vChars1 tile $46
	lb bc, BANK(InfoPromptGraphics), 2
	call CopyVideoData
	ld hl, WorldOptionsHeader
	ld bc, WorldOptionsData
	jp DisplayOptionMenuCommon

WorldOptionsData:
	db WORLD_OPTIONS_COUNT ; length of list
	db WORLD_OPTIONS_PAGE_NUMBER ; current page
	db HOW_MANY_WORLD_OPTIONS_PAGES ; how many pages in total
	dw WorldOptionsYCoordXVariableOffsetList

WorldOptionsYCoordXVariableOffsetList:
	db 3, 0
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

WorldOptionsText:
	db   "WORLD OPTIONS"
	next " VOLCANO:   ON OFF@"

DrawWorldOptionsMenu:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, WorldOptionsText
	jp PlaceString

WorldOptionsSetCursorPositionActions:
	dw SetCursorPositionFromWorldOptions

WorldOptionsLeftRightFuncs:
	dw GenericWorldOptionsToggleFunc
	dw CursorCancelRow

GenericWorldOptionsToggleFunc:
	ld b, %11
	jp GenericOptionsCursorToggleFunc

SetWorldOptionsFromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, WorldOptionsXPosBitData
	ld b, WORLD_OPTIONS_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromWorldOptions:
	ld hl, WorldOptionsXPosBitData
	jp SetGenericCursorPositionFromOptions

WorldOptionsInfoTextJumpTable:
	dw VolcanoInfoText

VolcanoInfoText:
	text_far _VolcanoInfoText
	text_end