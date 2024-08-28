; PureRGBnote: ADDED: one of the new pages in the options menu. This one's one of the two pages for options related to game sprites.
DEF FRONT_SPRITE_OPTIONS_PAGE_5_COUNT EQU 7 ; number of options on this page
DEF FRONT_SPRITE_OPTIONS_PAGE_5_NUMBER EQU 5 ; must be 1 digit.

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
FrontSpriteOptions5XPosBitData:
	db 16, 13, FLAG_JYNX_SPRITE % 8
	dw wEventFlags + (FLAG_JYNX_SPRITE / 8)
	db 16, 13, BIT_ELECTABUZZ_SPRITE
	dw wSpriteOptions2
	db 16, 13, BIT_PINSIR_SPRITE
	dw wSpriteOptions4
	db 16, 13, FLAG_OMANYTE_SPRITE % 8
	dw wEventFlags + (FLAG_OMANYTE_SPRITE / 8)
	db 16, 13, FLAG_ARTICUNO_SPRITE % 8
	dw wEventFlags + (FLAG_ARTICUNO_SPRITE / 8)
	db 16, 13, BIT_ZAPDOS_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_MEWTWO_SPRITE
	dw wSpriteOptions

FrontSpriteOptions5Header:
	dw DrawFrontSpriteOptions5Menu
	dw FrontSpriteOptions5SetCursorPositionActions
	dw SetFrontSpriteOptions5FromCursorPositions
	dw FrontSpriteOptions5LeftRightFuncs
	dw DisplayFrontSpriteOptions
	dw DisplayFrontSpriteOptions4
	dw FrontSpriteSelectButtonDefault
	dw OptionsDoNothing
	; fall through
DisplayFrontSpriteOptions5:
	ld hl, FrontSpriteOptions5Header
	ld bc, FrontSpriteOptions5Data
	jp DisplayOptionMenuCommon

FrontSpriteOptions5Data:
	db FRONT_SPRITE_OPTIONS_PAGE_5_COUNT ; length of list
	db FRONT_SPRITE_OPTIONS_PAGE_5_NUMBER ; current page
	db HOW_MANY_FRONT_SPRITE_OPTIONS_PAGES ; how many pages in total
	dw SevenOptionMenuGenericYCoordXVariableOffsetList

FrontSpriteOptions5Text:
	db   "SPRITES→FRONT 5"
	next " JYNX:       RG SW"
	next " ELECTABUZZ: RG RB"
	next " PINSIR:     RB RG"
	next " OMANYTE:    RB RG"
	next " ARTICUNO:   RB Y"
	next " ZAPDOS:     RB RG"
	next " MEWTWO:     RB RG@"

DrawFrontSpriteOptions5Menu:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	ld a, SPRITE_OPTIONS_PAGE_NUMBER
	call DrawChildMenuDigit
	hlcoord 1, 1
	ld de, FrontSpriteOptions5Text
	jp PlaceString

FrontSpriteOptions5SetCursorPositionActions:
	dw SetCursorPositionFromFrontSpriteOptions5
	dw SetCursorPositionFromFrontSpriteOptions5
	dw SetCursorPositionFromFrontSpriteOptions5
	dw SetCursorPositionFromFrontSpriteOptions5
	dw SetCursorPositionFromFrontSpriteOptions5
	dw SetCursorPositionFromFrontSpriteOptions5
	dw SetCursorPositionFromFrontSpriteOptions5

FrontSpriteOptions5LeftRightFuncs:
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw CursorCancelRow

SetFrontSpriteOptions5FromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, FrontSpriteOptions5XPosBitData
	ld b, FRONT_SPRITE_OPTIONS_PAGE_5_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromFrontSpriteOptions5:
	ld hl, FrontSpriteOptions5XPosBitData
	jp SetGenericCursorPositionFromOptions
