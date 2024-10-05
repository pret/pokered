; function that displays the start menu
DrawStartMenu::
	CheckEvent EVENT_GOT_POKEDEX
; menu with pokedex
	hlcoord 10, 0
	lb bc, 14, 8
	jr nz, .drawTextBoxBorder
; shorter menu if the player doesn't have the pokedex
	ld b, $0c
.drawTextBoxBorder
	call TextBoxBorder
	; PureRGBnote: CHANGED: now SELECT button is tracked on this menu. Used in the new box-switching anywhere functionality.
	ld a, D_DOWN | D_UP | START | B_BUTTON | A_BUTTON | SELECT 
	ld [wMenuWatchedKeys], a
	ld a, $02
	ld [wTopMenuItemY], a ; Y position of first menu choice
	ld a, $0b
	ld [wTopMenuItemX], a ; X position of first menu choice
	call CheckSavedStartMenuIndex
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 12, 2
	CheckEvent EVENT_GOT_POKEDEX
; case for not having pokedex
	ld a, $06
	jr z, .storeMenuItemCount
; case for having pokedex
	ld de, StartMenuPokedexText
	call PrintStartMenuItem
	ld a, $07
.storeMenuItemCount
	ld [wMaxMenuItem], a ; number of menu items
	ld de, StartMenuPokemonText
	call PrintStartMenuItem
	ld de, StartMenuItemText
	call PrintStartMenuItem
	ld de, wPlayerName ; player's name
	call PrintStartMenuItem
	ld a, [wStatusFlags4]
	bit BIT_LINK_CONNECTED, a
; case for not using link feature
	ld de, StartMenuSaveText
	jr z, .printSaveOrResetText
; case for using link feature
	ld de, StartMenuResetText
.printSaveOrResetText
	call PrintStartMenuItem
	ld de, StartMenuOptionText
	call PrintStartMenuItem
	ld de, StartMenuExitText
	call PlaceString
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

; PureRGBnote: ADDED: this code will remember the start menu's last selection in specific scenarios where it's usually cleared.
;                     Example: after going into a wild battle caused by fishing.
CheckSavedStartMenuIndex: 
	ld a, [wBattleAndStartSavedMenuItem] ; remembered menu selection from last time
	and a
	jr nz, .done
	ld a, [wExtraSavedStartMenuIndex] ; remembered menu selection even after a battle - like when a fishing encounter occurred
	and a
	jr z, .done
	push bc
	ld b, a
	xor a
	ld [wExtraSavedStartMenuIndex], a
	ld a, b
	pop bc
.done
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ret

StartMenuPokedexText:
	db "POKéDEX@"

StartMenuPokemonText:
	db "POKéMON@"

StartMenuItemText:
	db "ITEM@"

StartMenuSaveText:
	db "SAVE@"

StartMenuResetText:
	db "RESET@"

StartMenuExitText:
	db "EXIT@"

StartMenuOptionText:
	db "OPTION@"

PrintStartMenuItem:
	push hl
	call PlaceString
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret
