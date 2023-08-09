; PureRGBnote: ADDED: one of the new pages in the options menu. This one's one of the two pages for options related to game sprites.
DEF FRONT_SPRITE_OPTIONS_PAGE_1_COUNT EQU 7 ; number of options on this page
DEF FRONT_SPRITE_OPTIONS_PAGE_1_NUMBER EQU 1 ; must be 1 digit.
DEF HOW_MANY_FRONT_SPRITE_OPTIONS_PAGES EQU 4

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
FrontSpriteOptionsXPosBitData:
	db 16, 13, BIT_BULBASAUR_SPRITE
	dw wSpriteOptions
	db 16, 13, BIT_SQUIRTLE_SPRITE
	dw wSpriteOptions
	db 16, 13, BIT_BLASTOISE_SPRITE
	dw wSpriteOptions
	db 16, 13, BIT_BUTTERFREE_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_RATICATE_SPRITE
	dw wSpriteOptions2
	db 16, 13, BIT_PIDGEOTTO_SPRITE
	dw wSpriteOptions3
	db 16, 13, BIT_PIDGEOT_SPRITE
	dw wSpriteOptions


FrontSpriteOptionsHeader:
	dw DrawFrontSpriteOptionsMenu
	dw FrontSpriteOptionsSetCursorPositionActions
	dw SetFrontSpriteOptionsFromCursorPositions
	dw FrontSpriteOptionsLeftRightFuncs
	dw DisplayFrontSpriteOptions2
	dw DisplayFrontSpriteOptions4
	dw OptionsPageAButtonDefault
	; fall through
DisplayFrontSpriteOptions:
	ld hl, FrontSpriteOptionsHeader
	ld bc, FrontSpriteOptionsData
	jp DisplayOptionMenuCommon

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
SevenOptionMenuGenericYCoordXVariableOffsetList:
	db 3, 0
	db 5, 1
	db 7, 2
	db 9, 3
	db 11, 4
	db 13, 5
	db 15, 6
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

FrontSpriteOptionsData:
	db FRONT_SPRITE_OPTIONS_PAGE_1_COUNT ; length of list
	db FRONT_SPRITE_OPTIONS_PAGE_1_NUMBER ; current page
	db HOW_MANY_FRONT_SPRITE_OPTIONS_PAGES ; how many pages in total
	dw SevenOptionMenuGenericYCoordXVariableOffsetList

FrontSpriteOptionsSetCursorPositionActions:
	dw SetCursorPositionFromFrontSpriteOptions
	dw SetCursorPositionFromFrontSpriteOptions
	dw SetCursorPositionFromFrontSpriteOptions
	dw SetCursorPositionFromFrontSpriteOptions
	dw SetCursorPositionFromFrontSpriteOptions
	dw SetCursorPositionFromFrontSpriteOptions
	dw SetCursorPositionFromFrontSpriteOptions

FrontSpriteOptionsText:
	db   "SPRITES→FRONT 1"
	next " BULBASAUR:  RB RG"
	next " SQUIRTLE:   RB RG"
	next " BLASTOISE:  RB RG"
	next " BUTTERFREE: RB RG"
	next " RATICATE:   RB RG"
	next " PIDGEOTTO:  RB RG"
	next " PIDGEOT:    RB RG@"

DrawChildMenuDigit:
	add NUMBER_CHAR_OFFSET
	hlcoord 14, PAGE_CONTROLS_Y_COORD
	ld [hl], a
	inc hl
	ld [hl], "→"
	ret

DrawFrontSpriteOptionsMenu:
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call TextBoxBorder
	ld a, SPRITE_OPTIONS_PAGE_NUMBER
	call DrawChildMenuDigit
	hlcoord 1, 1
	ld de, FrontSpriteOptionsText
	jp PlaceString

FrontSpriteOptionsLeftRightFuncs:
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw GenericFrontSpriteOptionsCursorToggleFunc
	dw CursorCancelRow

GenericFrontSpriteOptionsCursorToggleFunc:
	ld b, %11101
	jp GenericOptionsCursorToggleFunc

SetFrontSpriteOptionsFromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, FrontSpriteOptionsXPosBitData
	ld b, FRONT_SPRITE_OPTIONS_PAGE_1_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromFrontSpriteOptions:
	ld hl, FrontSpriteOptionsXPosBitData
	jp SetGenericCursorPositionFromOptions
