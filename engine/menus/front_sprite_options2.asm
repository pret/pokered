; PureRGBnote: ADDED: one of the new pages in the options menu. This one's one of the two pages for options related to game sprites.
DEF FRONT_SPRITE_OPTIONS_PAGE_2_COUNT EQU 7 ; number of options on this page
DEF FRONT_SPRITE_OPTIONS_PAGE_2_NUMBER EQU 2 ; must be 1 digit.

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
FrontSpriteOptions2XPosBitData:
	db 16, 13, BIT_NIDORINO_SPRITE
	dw wSpriteOptions2
	db 16, 13, BIT_GOLBAT_SPRITE
	dw wSpriteOptions
	db 16, 13, BIT_MANKEY_SPRITE
	dw wSpriteOptions
	db 16, 13, BIT_ARCANINE_SPRITE
	dw wSpriteOptions
	db 16, 13, BIT_ABRA_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_KADABRA_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_MACHOP_SPRITE
	dw wSpriteOptions4

FrontSpriteOptions2Header:
	dw DrawFrontSpriteOptions2Menu
	dw FrontSpriteOptions2SetCursorPositionActions
	dw SetFrontSpriteOptions2FromCursorPositions
	dw FrontSpriteOptions2LeftRightFuncs
	dw DisplayFrontSpriteOptions3
	dw DisplayFrontSpriteOptions
	dw FrontSpriteSelectButtonDefault
	dw OptionsDoNothing
	; fall through
DisplayFrontSpriteOptions2:
	ld hl, FrontSpriteOptions2Header
	ld bc, FrontSpriteOptions2Data
	jp DisplayOptionMenuCommon

FrontSpriteOptions2Data:
	db FRONT_SPRITE_OPTIONS_PAGE_2_COUNT ; length of list
	db FRONT_SPRITE_OPTIONS_PAGE_2_NUMBER ; current page
	db HOW_MANY_FRONT_SPRITE_OPTIONS_PAGES ; how many pages in total
	dw SevenOptionMenuGenericYCoordXVariableOffsetList

FrontSpriteOptions2Text:
	db   "SPRITES→FRONT 2"
	next " NIDORINO:   RB RG"
	next " GOLBAT:     Y  RB"
	next " MANKEY:     RB RG"
	next " ARCANINE:   RB RG"
	next " ABRA:       RB RG"
	next " KADABRA:    RB RG"
	next " MACHOP:     RB RG@"

DrawFrontSpriteOptions2Menu:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	ld a, SPRITE_OPTIONS_PAGE_NUMBER
	call DrawChildMenuDigit
	hlcoord 1, 1
	ld de, FrontSpriteOptions2Text
	jp PlaceString

FrontSpriteOptions2SetCursorPositionActions:
	dw SetCursorPositionFromFrontSpriteOptions2
	dw SetCursorPositionFromFrontSpriteOptions2
	dw SetCursorPositionFromFrontSpriteOptions2
	dw SetCursorPositionFromFrontSpriteOptions2
	dw SetCursorPositionFromFrontSpriteOptions2
	dw SetCursorPositionFromFrontSpriteOptions2
	dw SetCursorPositionFromFrontSpriteOptions2

FrontSpriteOptions2LeftRightFuncs:
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw CursorCancelRow

SetFrontSpriteOptions2FromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, FrontSpriteOptions2XPosBitData
	ld b, FRONT_SPRITE_OPTIONS_PAGE_2_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromFrontSpriteOptions2:
	ld hl, FrontSpriteOptions2XPosBitData
	jp SetGenericCursorPositionFromOptions
