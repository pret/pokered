; PureRGBnote: ADDED: one of the new pages in the options menu. This one's for main gameplay features.

DEF OPTIONS_PAGE_2_COUNT EQU 6 ; number of options on this page
DEF OPTIONS_PAGE_2_NUMBER EQU 2 ; must be 1 digit

DEF OPTION_COLORS_LEFT_XPOS EQU 9
DEF OPTION_COLORS_MIDDLE_XPOS EQU 12
DEF OPTION_COLORS_RIGHT_XPOS EQU 17
DEF OPTION_ALT_PALETTES_LEFT_XPOS EQU 4
DEF OPTION_ALT_PALETTES_RIGHT_XPOS EQU 11
DEF OPTION_MUSIC_LEFT_XPOS EQU 12
DEF OPTION_MUSIC_RIGHT_XPOS EQU 15
DEF OPTION_AUDIO_PAN_LEFT_XPOS EQU 12
DEF OPTION_AUDIO_PAN_RIGHT_XPOS EQU 16
DEF OPTION_BIKE_SONG_LEFT_XPOS EQU 12
DEF OPTION_BIKE_SONG_RIGHT_XPOS EQU 15
DEF OPTION_GBC_FADE_LEFT_XPOS EQU 12
DEF OPTION_GBC_FADE_RIGHT_XPOS EQU 16

DEF OPTION_ALT_PALETTES_BIT EQU BIT_ALT_PKMN_PALETTES
DEF OPTION_MUSIC_BIT EQU BIT_MUSIC
DEF OPTION_AUDIO_PAN_BIT EQU BIT_AUDIO_PAN
DEF OPTION_BIKE_SONG_BIT EQU BIT_BIKE_MUSIC


OptionsMenu2Header:
	dw DrawOptions2Menu
	dw Options2SetCursorPositionActions
	dw SetOptions2FromCursorPositions
	dw Options2LeftRightFuncs
	dw DisplayBattleOptions
	dw DisplayOptionMenu
	dw OptionsPage2AButton
	; fall through
DisplayOptions2:
	ld hl, OptionsMenu2Header
	ld bc, OptionsMenu2Data
	jp DisplayOptionMenuCommon

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
Options2YCoordVariableOffsetList:
	db 3, 0
	db 7, 1
	db 9, 2
	db 11, 3
	db 13, 4
	db 15, 5
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

OptionsMenu2Data:
	db OPTIONS_PAGE_2_COUNT ; length of list
	db OPTIONS_PAGE_2_NUMBER ; current page
	db HOW_MANY_MAIN_OPTIONS_PAGES ; how many pages in total
	dw Options2YCoordVariableOffsetList

Options2SetCursorPositionActions:
	dw SetColorsCursorPosition
	dw SetAltPalettesCursorPosition
	dw SetMusicCursorPosition
	dw SetAudioPanCursorPosition
	dw SetBikeSongCursorPosition
	dw SetGBCFadeCursorPosition

Options2LeftRightFuncs:
	dw CursorInColors
	dw CursorInAltPalettes
	dw CursorInMusic
	dw CursorInAudioPan
	dw CursorInBikeSong
	dw CursorInGBCFade
	dw CursorCancelRow

DrawOptions2Menu:
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, Options2Text
	call PlaceString
	ld a, [wOptions2]
	and %11
	call PrintSGBOptionNumber
	ret

Options2Text:
	db   "OPTIONS 2"
	next " COLORS: OG SGB  Y"
	next " ALT PKMN COLORS:"
	next "    OFF    ON"
	next " MUSIC:     OG OG+"
	next " AUDIO PAN: OFF ON"
	next " BIKE SONG: ON OFF"
	next " GBC FADE:  OFF ON@"

OptionsPage2AButton:
	ld a, [Options2YCoordVariableOffsetList]
	ld b, a
	ld a, [wTopMenuItemY]
	cp b ;is the cursor on the COLORS row?
	jr nz, .done
	ld a, [wTopMenuItemX]
	cp OPTION_COLORS_MIDDLE_XPOS ; is the cursor on SGB?
	jr nz, .done
	call ToggleAltSGBColors
.done
	and a ; clear carry
	ret

CursorInColors:
	push bc
	ld a, PALETTES_SGB
	call PrintSGBOptionNumber ; if we move left or right on the COLORS menu we will switch SGB text back to SGB1
	pop bc
	call GetTwoBitXPosition
	ld a, b
	ld [wOptions1CursorX], a
	jp EraseOldMenuCursor

CursorInAltPalettes:
	ld a, [wOptions2CursorX] ; battle animation cursor X coordinate
	xor %1111 ; toggle between 4 and 11
	ld [wOptions2CursorX], a
	jp EraseOldMenuCursor

CursorInMusic:
	ld a, [wOptions3CursorX] ; music X coordinate
	xor %11 ; toggle between 12 and 15
	ld [wOptions3CursorX], a
	jp EraseOldMenuCursor

CursorInAudioPan:
	ld a, [wOptions4CursorX] ; battle animation cursor X coordinate
	xor %11100 ; toggle between 12 and 16
	ld [wOptions4CursorX], a
	jp EraseOldMenuCursor

CursorInBikeSong:
	ld a, [wOptions5CursorX] ; battle animation cursor X coordinate
	xor %11 ; toggle between 12 and 15
	ld [wOptions5CursorX], a
	jp EraseOldMenuCursor

CursorInGBCFade:
	ld a, [wOptions6CursorX] ; battle animation cursor X coordinate
	xor %11100 ; toggle between 12 and 16
	ld [wOptions6CursorX], a
	jp EraseOldMenuCursor

GetTwoBitXPosition:
	ld a, b
	bit BIT_D_LEFT, b ; did the player press the left button
	jr nz, .left
	ld a, [wOptions1CursorX] ; battle animation cursor X coordinate
	ld b, OPTION_COLORS_LEFT_XPOS
	cp OPTION_COLORS_RIGHT_XPOS
	ret z
	ld b, OPTION_COLORS_MIDDLE_XPOS
	cp OPTION_COLORS_LEFT_XPOS
	ret z
	ld b, OPTION_COLORS_RIGHT_XPOS
	ret
.left
	ld a, [wOptions1CursorX] ; battle animation cursor X coordinate
	ld b, OPTION_COLORS_MIDDLE_XPOS
	cp OPTION_COLORS_RIGHT_XPOS
	jr z, .done
	ld b, OPTION_COLORS_LEFT_XPOS
	cp OPTION_COLORS_MIDDLE_XPOS
	jr z, .done
	ld b, OPTION_COLORS_RIGHT_XPOS
.done
	ret

; sets the options variable according to the current placement of the menu cursors in the options menu
SetOptions2FromCursorPositions:
	ld a, [wOptions2]
	ld b, a
	ld d, a
	push bc
	call SetTwoBitPropFromXPosition
	ld hl, wOptions2
	ld a, [wOptions2CursorX] ; alt palettes cursor X coord
	ld c, OPTION_ALT_PALETTES_RIGHT_XPOS
	ld b, BIT_ALT_PKMN_PALETTES
	call SetSingleBitOption
	ld a, [wOptions3CursorX] ; music cursor X coord
	ld c, OPTION_MUSIC_RIGHT_XPOS
	ld b, OPTION_MUSIC_BIT
	call SetSingleBitOption
	ld a, [wOptions4CursorX] ; audio pan cursor X coord
	ld c, OPTION_AUDIO_PAN_RIGHT_XPOS
	ld b, OPTION_AUDIO_PAN_BIT
	call SetSingleBitOption
	ld a, [wOptions5CursorX]
	ld c, OPTION_BIKE_SONG_RIGHT_XPOS
	ld b, OPTION_BIKE_SONG_BIT
	call SetSingleBitOption
	ld a, [wOptions6CursorX]
	ld c, OPTION_GBC_FADE_RIGHT_XPOS
	ld b, BIT_GBC_FADE
	call SetSingleBitOption
	pop bc
	jp CompareOptions2

SetTwoBitPropFromXPosition:
	ld a, [wOptions1CursorX] ; colors x coordinate
	cp OPTION_COLORS_RIGHT_XPOS 
	jr z, .option1setRight
	cp OPTION_COLORS_MIDDLE_XPOS 
	jr z, .option1setMiddle
.option1setLeft
	ld b, PALETTES_DEFAULT
	jr .done
.option1setRight
	ld b, PALETTES_YELLOW
	jr .done
.option1setMiddle
	ld a, [wOptions2]
	and %11
	cp PALETTES_SGB2
	ret z ; don't set middle if we set it to the second SGB type
	ld b, PALETTES_SGB
.done
	ld a, [wOptions2]
	and %11111100
	xor b
	ld [wOptions2], a
	ret

CompareOptions2:
	ld hl, wOptions2
	ld a, b ; b = old setting of Options2 before changing it
	and %11
	ld c, a
	ld a, [hl]
	and %11
	cp c
	jp nz, RunDefaultPaletteCommand ; reset palettes according to the colors we just selected if colors changed
	ld a, [wNewInGameFlags]
	bit IN_GAME, a
	ret z ; don't need to do anything else if we're in the title screen menus
	ld a, b
	and 1 << BIT_BIKE_MUSIC
	ld c, a
	ld a, [hl]
	and 1 << BIT_BIKE_MUSIC
	cp c
	jr nz, .tryPlayBikeMusic
	ld a, b
	and 1 << BIT_MUSIC
	ld c, a
	ld a, [hl]
	and 1 << BIT_MUSIC
	cp c
	jr nz, .tryChangeMusic
	ret
.tryPlayBikeMusic
	ld a, [wWalkBikeSurfState]
	cp 1
	ret nz
	ld a, [wMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a
	jp z, PlayDefaultMusic
.extraMusicBank
	ld d, 1
	jpfar TryPlayExtraMusic
.tryChangeMusic
	ld a, [wMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a
	ret z
	jr .extraMusicBank

SetColorsCursorPosition:
	ld hl, wOptions2
	call GetTwoBitXPositionFromOptions
	call LoadXValueAndGetHLCoord
	jp PlaceUnfilledRightArrow

SetAltPalettesCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_ALT_PALETTES_RIGHT_XPOS
	ld d, OPTION_ALT_PALETTES_LEFT_XPOS
	ld c, OPTION_ALT_PALETTES_BIT
	jp SetSingleBitOptionCursorPosition

SetMusicCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_MUSIC_RIGHT_XPOS
	ld d, OPTION_MUSIC_LEFT_XPOS
	ld c, OPTION_MUSIC_BIT
	jp SetSingleBitOptionCursorPosition

SetAudioPanCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_AUDIO_PAN_RIGHT_XPOS
	ld d, OPTION_AUDIO_PAN_LEFT_XPOS
	ld c, OPTION_AUDIO_PAN_BIT
	jp SetSingleBitOptionCursorPosition

SetBikeSongCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_BIKE_SONG_RIGHT_XPOS
	ld d, OPTION_BIKE_SONG_LEFT_XPOS
	ld c, OPTION_BIKE_SONG_BIT
	jp SetSingleBitOptionCursorPosition

SetGBCFadeCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_GBC_FADE_RIGHT_XPOS
	ld d, OPTION_GBC_FADE_LEFT_XPOS
	ld c, BIT_GBC_FADE
	jp SetSingleBitOptionCursorPosition

GetTwoBitXPositionFromOptions:
	ld a, [hl]
	and %11 ;only care about first two bits
	ld b, OPTION_COLORS_LEFT_XPOS
	ret z
	cp %11
	ld b, OPTION_COLORS_RIGHT_XPOS
	ret z
	ld b, OPTION_COLORS_MIDDLE_XPOS
	ret

ToggleAltSGBColors:
	ld a, SFX_PRESS_AB
	rst _PlaySound
	ld a, [wOptions2]
	xor %11 ; %10 becomes %01, toggles between the two sgb options.
	ld [wOptions2], a
	and %11
	call PrintSGBOptionNumber
	call RunDefaultPaletteCommand
	ret

; input: a = what SGB color mode we want to be printed on the screen, a = %10 = SGB2, anything else = SGB1
PrintSGBOptionNumber:
	hlcoord 16, 3
	cp %10
	ld [hl], "2"
	ret z
	ld [hl], "1"
	ret