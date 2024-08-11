; PureRGBnote: ADDED: one of the new pages in the options menu. This one's one of the two pages for options related to game sprites.
DEF FRONT_SPRITE_OPTIONS_PAGE_3_COUNT EQU 7 ; number of options on this page
DEF FRONT_SPRITE_OPTIONS_PAGE_3_NUMBER EQU 3 ; must be 1 digit.

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
FrontSpriteOptions3XPosBitData:
	db 16, 13, BIT_TENTACRUEL_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_GRAVELER_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_CLOYSTER_SPRITE
	dw wSpriteOptions4
	db 16, 13, BIT_GENGAR_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_ONIX_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_VOLTORB_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_EXEGGCUTE_SPRITE
	dw wSpriteOptions3

FrontSpriteOptions3Header:
	dw DrawFrontSpriteOptions3Menu
	dw FrontSpriteOptions3SetCursorPositionActions
	dw SetFrontSpriteOptions3FromCursorPositions
	dw FrontSpriteOptions3LeftRightFuncs
	dw DisplayFrontSpriteOptions4
	dw DisplayFrontSpriteOptions2
	dw FrontSpriteSelectButtonDefault
	dw OptionsDoNothing
	; fall through
DisplayFrontSpriteOptions3:
	ld hl, FrontSpriteOptions3Header
	ld bc, FrontSpriteOptions3Data
	jp DisplayOptionMenuCommon

FrontSpriteOptions3Data:
	db FRONT_SPRITE_OPTIONS_PAGE_3_COUNT ; length of list
	db FRONT_SPRITE_OPTIONS_PAGE_3_NUMBER ; current page
	db HOW_MANY_FRONT_SPRITE_OPTIONS_PAGES ; how many pages in total
	dw SevenOptionMenuGenericYCoordXVariableOffsetList

FrontSpriteOptions3Text:
	db   "SPRITES→FRONT 3"
	next " TENTACRUEL: RB RG"
	next " GRAVELER:   RB RG"
	next " CLOYSTER:   RB RG"
	next " GENGAR:     RB Y"
	next " ONIX:       RB RG"
	next " VOLTORB:    RB RG"
	next " EXEGGCUTE:  RB Y@"

DrawFrontSpriteOptions3Menu:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	ld a, SPRITE_OPTIONS_PAGE_NUMBER
	call DrawChildMenuDigit
	hlcoord 1, 1
	ld de, FrontSpriteOptions3Text
	jp PlaceString

FrontSpriteOptions3SetCursorPositionActions:
	dw SetCursorPositionFromFrontSpriteOptions3
	dw SetCursorPositionFromFrontSpriteOptions3
	dw SetCursorPositionFromFrontSpriteOptions3
	dw SetCursorPositionFromFrontSpriteOptions3
	dw SetCursorPositionFromFrontSpriteOptions3
	dw SetCursorPositionFromFrontSpriteOptions3
	dw SetCursorPositionFromFrontSpriteOptions3

FrontSpriteOptions3LeftRightFuncs:
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw CursorCancelRow

SetFrontSpriteOptions3FromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, FrontSpriteOptions3XPosBitData
	ld b, FRONT_SPRITE_OPTIONS_PAGE_3_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromFrontSpriteOptions3:
	ld hl, FrontSpriteOptions3XPosBitData
	jp SetGenericCursorPositionFromOptions
