; PureRGBnote: ADDED: one of the new pages in the options menu. This one's one of the two pages for options related to game sprites.
DEF FRONT_SPRITE_OPTIONS_PAGE_4_COUNT EQU 7 ; number of options on this page
DEF FRONT_SPRITE_OPTIONS_PAGE_4_NUMBER EQU 4 ; must be 1 digit.

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
FrontSpriteOptions4XPosBitData:
	db 16, 13, BIT_EXEGGUTOR_SPRITE
	dw wSpriteOptions2
	db 16, 13, BIT_KOFFING_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_STARMIE_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_PINSIR_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_ELECTABUZZ_SPRITE
	dw wSpriteOptions2
	db 16, 13, BIT_ZAPDOS_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_MEWTWO_SPRITE
	dw wSpriteOptions

FrontSpriteOptions4Header:
	dw DrawFrontSpriteOptions4Menu
	dw FrontSpriteOptions4SetCursorPositionActions
	dw SetFrontSpriteOptions4FromCursorPositions
	dw FrontSpriteOptions4LeftRightFuncs
	dw DisplayFrontSpriteOptions
	dw DisplayFrontSpriteOptions3
	dw OptionsPageAButtonDefault
	; fall through
DisplayFrontSpriteOptions4:
	ld hl, FrontSpriteOptions4Header
	ld bc, FrontSpriteOptions4Data
	jp DisplayOptionMenuCommon

FrontSpriteOptions4Data:
	db FRONT_SPRITE_OPTIONS_PAGE_4_COUNT ; length of list
	db FRONT_SPRITE_OPTIONS_PAGE_4_NUMBER ; current page
	db HOW_MANY_FRONT_SPRITE_OPTIONS_PAGES ; how many pages in total
	dw SevenOptionMenuGenericYCoordXVariableOffsetList

FrontSpriteOptions4Text:
	db   "SPRITES→FRONT 4"
	next " EXEGGUTOR:  RB RG"
	next " KOFFING:    RG RB"
	next " STARMIE:    RB RG"
	next " PINSIR:     RB RG"
	next " ELECTABUZZ: RB RG"
	next " ZAPDOS:     RB RG"
	next " MEWTWO:     RB RG@"

DrawFrontSpriteOptions4Menu:
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call TextBoxBorder
	ld a, SPRITE_OPTIONS_PAGE_NUMBER
	call DrawChildMenuDigit
	hlcoord 1, 1
	ld de, FrontSpriteOptions4Text
	jp PlaceString

FrontSpriteOptions4SetCursorPositionActions:
	dw SetCursorPositionFromFrontSpriteOptions4
	dw SetCursorPositionFromFrontSpriteOptions4
	dw SetCursorPositionFromFrontSpriteOptions4
	dw SetCursorPositionFromFrontSpriteOptions4
	dw SetCursorPositionFromFrontSpriteOptions4
	dw SetCursorPositionFromFrontSpriteOptions4
	dw SetCursorPositionFromFrontSpriteOptions4

FrontSpriteOptions4LeftRightFuncs:
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw CursorCancelRow

SetFrontSpriteOptions4FromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, FrontSpriteOptions4XPosBitData
	ld b, FRONT_SPRITE_OPTIONS_PAGE_4_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromFrontSpriteOptions4:
	ld hl, FrontSpriteOptions4XPosBitData
	jp SetGenericCursorPositionFromOptions
