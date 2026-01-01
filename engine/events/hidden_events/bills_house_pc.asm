BillsHousePC:
	call EnableAutoTextBoxDrawing
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	CheckEvent EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	jr nz, .displayBillsHousePokemonList
	CheckEventReuseA EVENT_USED_CELL_SEPARATOR_ON_BILL
	jr nz, .displayBillsHouseMonitorText
	CheckEventReuseA EVENT_BILL_SAID_USE_CELL_SEPARATOR
	jr nz, .doCellSeparator
.displayBillsHouseMonitorText
	tx_pre_jump BillsHouseMonitorText
.doCellSeparator
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	tx_pre BillsHouseInitiatedText
	ld c, 32
	call DelayFrames
	ld a, SFX_TINK
	call PlaySound
	call WaitForSoundToFinish
	ld c, 80
	call DelayFrames
	ld a, SFX_SHRINK
	call PlaySound
	call WaitForSoundToFinish
	ld c, 48
	call DelayFrames
	ld a, SFX_TINK
	call PlaySound
	call WaitForSoundToFinish
	ld c, 32
	call DelayFrames
	ld a, SFX_GET_ITEM_1
	call PlaySound
	call WaitForSoundToFinish
	call PlayDefaultMusic
	SetEvent EVENT_USED_CELL_SEPARATOR_ON_BILL
	ret
.displayBillsHousePokemonList
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	tx_pre BillsHousePokemonList
	ret

BillsHouseMonitorText::
	text_far _BillsHouseMonitorText
	text_end

BillsHouseInitiatedText::
	text_far _BillsHouseInitiatedText
	text_promptbutton
	text_asm
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld c, 16
	call DelayFrames
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	ld c, 60
	call DelayFrames
	jp TextScriptEnd

BillsHousePokemonList::
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, BillsHousePokemonListText1
	call PrintText
	xor a
	ld [wMenuItemOffset], a ; not used
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 4
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.billsPokemonLoop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 0, 0
	ld b, 10
	ld c, 9
	call TextBoxBorder
	hlcoord 2, 2
	ld de, BillsMonListText
	call PlaceString
	ld hl, BillsHousePokemonListText2
	call PrintText
	call SaveScreenTilesToBuffer2
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .cancel
	ld a, [wCurrentMenuItem]
	add EEVEE
	cp EEVEE
	jr z, .displayPokedex
	cp FLAREON
	jr z, .displayPokedex
	cp JOLTEON
	jr z, .displayPokedex
	cp VAPOREON
	jr z, .displayPokedex
	jr .cancel
.displayPokedex
	call DisplayPokedex
	call LoadScreenTilesFromBuffer2
	jr .billsPokemonLoop
.cancel
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call LoadScreenTilesFromBuffer2
	jp TextScriptEnd

BillsHousePokemonListText1:
	text_far _BillsHousePokemonListText1
	text_end

BillsMonListText:
	db   "EEVEE"
	next "FLAREON"
	next "JOLTEON"
	next "VAPOREON"
	next "CANCEL@"

BillsHousePokemonListText2:
	text_far _BillsHousePokemonListText2
	text_end
