; PureRGBnote: CHANGED: most of the bills pc functions were adjusted to kick you out of the menu less
; after doing something like depositing/withdrawing or viewing data of a pokemon.
; PureRGBnote: ADDED: Pressing SELECT while the cursor is on WITHDRAW lets you view the box pokemon regardless of if your party is full.
DisplayPCMainMenu::
	xor a
	ldh [hAutoBGTransferEnabled], a
	call SaveScreenTilesToBuffer2
	ld a, [wNumHoFTeams]
	and a
	jr nz, .leaguePCAvailable
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .noOaksPC
	ld a, [wNumHoFTeams]
	and a
	jr nz, .leaguePCAvailable
	hlcoord 0, 0
	lb bc, 8, 14
	jr .next
.noOaksPC
	hlcoord 0, 0
	lb bc, 6, 14
	jr .next
.leaguePCAvailable
	hlcoord 0, 0
	lb bc, 10, 14
.next
	call TextBoxBorder
	call UpdateSprites
	ld a, 3
	ld [wMaxMenuItem], a
	CheckEvent EVENT_MET_BILL
	jr nz, .metBill
	hlcoord 2, 2
	ld de, SomeonesPCText
	jr .next2
.metBill
	hlcoord 2, 2
	ld de, BillsPCText
.next2
	call PlaceString
	hlcoord 2, 4
	ld de, wPlayerName
	call PlaceString
	ld l, c
	ld h, b
	ld de, PlayersPCText
	call PlaceString
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .noOaksPC2
	hlcoord 2, 6
	ld de, OaksPCText
	call PlaceString
	ld a, [wNumHoFTeams]
	and a
	jr z, .noLeaguePC
	ld a, 4
	ld [wMaxMenuItem], a
	hlcoord 2, 8
	ld de, PKMNLeaguePCText
	call PlaceString
	hlcoord 2, 10
	ld de, LogOffPCText
	jr .next3
.noLeaguePC
	hlcoord 2, 8
	ld de, LogOffPCText
	jr .next3
.noOaksPC2
	ld a, $2
	ld [wMaxMenuItem], a
	hlcoord 2, 6
	ld de, LogOffPCText
.next3
	call PlaceString
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

SomeonesPCText:   db "SOMEONE's PC@"
BillsPCText:      db "BILL's PC@"
PlayersPCText:    db "'s PC@"
OaksPCText:       db "PROF.OAK's PC@"
PKMNLeaguePCText: db "<PKMN>LEAGUE@"
LogOffPCText:     db "LOG OFF@"

BillsPC_::
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wParentMenuItem], a
	inc a               ; MONSTER_NAME
	ld [wNameListType], a
	call LoadHpBarAndStatusTilePatterns
	ld a, [wListScrollOffset]
	push af
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, BillsPCMenu
; accessing it directly
	ld a, SFX_TURN_ON_PC
	rst _PlaySound
	ld hl, SwitchOnText
	rst _PrintText

BillsPCMenu:
	ld a, [wParentMenuItem]
	ld [wCurrentMenuItem], a
	ResetFlag FLAG_VIEW_PC_PKMN
	callfar LoadBillsPCExtraTiles
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	hlcoord 0, 0
	lb bc, 10, 12
	call TextBoxBorder
	hlcoord 2, 2
	ld de, BillsPCMenuText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 2
	ld [hli], a ; wTopMenuItemY
	dec a
	ld [hli], a ; wTopMenuItemX
	inc hl
	inc hl
	ld a, 4
	ld [hli], a ; wMaxMenuItem
	ld a, A_BUTTON | B_BUTTON | SELECT
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hli], a ; wLastMenuItem
	ld [hl], a ; wPartyAndBillsPCSavedMenuItem
	ld hl, wListScrollOffset
	ld [hli], a ; wListScrollOffset
	ld [hl], a ; wMenuWatchMovingOutOfBounds
	ld [wPlayerMonNumber], a
	ld hl, WhatText
	rst _PrintText
	decoord 13, 13
	callfar DrawCurrentBoxPrompt
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.handleMenuInput
	call HandleMenuInput
	bit BIT_SELECT, a
	jr z, .notSelect
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .handleMenuInput
	ld [wParentMenuItem], a
	SetFlag FLAG_VIEW_PC_PKMN
	jp BillsPCWithdraw
.notSelect
	bit BIT_B_BUTTON, a
	jp nz, ExitBillsPC
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	ld [wParentMenuItem], a
	and a
	jp z, BillsPCWithdraw ; withdraw
	cp $1
	jp z, BillsPCDeposit ; deposit
	cp $2
	jp z, BillsPCRelease ; release
	cp $3
	jp z, BillsPCChangeBox ; change box

ExitBillsPC:
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, .next
; accessing it directly
	call LoadTextBoxTilePatterns
	ld a, SFX_TURN_OFF_PC
	rst _PlaySound
	call WaitForSoundToFinish
.next
	ld hl, wMiscFlags
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	call LoadScreenTilesFromBuffer2
	pop af
	ld [wListScrollOffset], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

BillsPCDeposit:
	ld a, [wPartyCount]
	dec a
	jr nz, .partyLargeEnough
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay so we don't get instant text
	ld hl, CantDepositLastMonText
	rst _PrintText
	jp BillsPCMenu
.partyLargeEnough
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr nz, .boxNotFull
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay so we don't get instant text
	ld hl, BoxFullText
	rst _PrintText
	jp BillsPCMenu
.boxNotFull
	ld hl, wPartyCount
	call DisplayMonListMenu
	jp c, BillsPCMenu
	call BillsPCBackupListIndex
	call DisplayDepositWithdrawMenu
	jp nc, .doneDepositDialogBox
	call WaitForSoundToFinish
	ld a, [wCurPartySpecies]
	call PlayCry
	ld a, PARTY_TO_BOX
	ld [wMoveMonType], a
	call MoveMon
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld hl, wBoxNumString
	ld a, [wCurrentBoxNum]
	and $7f
	cp 9
	jr c, .singleDigitBoxNum
	sub 9
	ld [hl], "1"
	inc hl
	add "0"
	jr .next
.singleDigitBoxNum
	add "1"
.next
	ld [hli], a
	ld [hl], "@"
	ld hl, MonWasStoredText
	rst _PrintText
	;jp BillsPCMenu
.doneDepositDialogBox
	call BillsPCRestoreListIndex
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jp z, BillsPCMenu ; if no space left to deposit, exit the menu automatically
	ld a, [wPartyCount]
	dec a
	jp z, BillsPCMenu ; if 1 pokemon left in party, exit the menu automatically
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl] ; turn off letter printing delay so we get instant text
	ld hl, WhatText
	rst _PrintText
	; in case we displayed the status menu, need to reload these
	call RedrawCurrentBoxPrompt
	jp BillsPCDeposit

BillsPCWithdraw:
	ld a, [wBoxCount]
	and a
	jr nz, .boxNotEmpty
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay so we don't get instant text
	ld hl, NoMonText
	rst _PrintText
	jp BillsPCMenu
.boxNotEmpty
	CheckFlag FLAG_VIEW_PC_PKMN
	jr nz, .viewStart
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nz, .partyNotFull
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay so we don't get instant text
	ld hl, CantTakeMonText
	rst _PrintText
	jp BillsPCMenu
.viewStart
	ld hl, ViewMode
	call .redrawTextBoxAndCurrentBox
.partyNotFull
	ld hl, wBoxCount
	call DisplayMonListMenu
	jp c, BillsPCMenu
	CheckFlag FLAG_VIEW_PC_PKMN
	jr nz, .viewPkmn
	call BillsPCBackupListIndex
	call DisplayDepositWithdrawMenu
	jr nc, .doneWithdrawDialogBox
	ld a, [wWhichPokemon]
	ld hl, wBoxMonNicks
	call GetPartyMonName
	call WaitForSoundToFinish
	ld a, [wCurPartySpecies]
	call PlayCry
	xor a ; BOX_TO_PARTY
	ld [wMoveMonType], a
	call MoveMon
	ld a, 1
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld hl, MonIsTakenOutText
	rst _PrintText
	;jp BillsPCMenu
.doneWithdrawDialogBox
	call BillsPCRestoreListIndex
	ld a, [wBoxCount]
	and a
	jp z, BillsPCMenu ; if no pokemon left to withdraw, exit the menu automatically
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jp z, BillsPCMenu ; if party is full (can't withdraw more), exit the menu automatically
	ld hl, WhatText
	call .redrawTextBoxAndCurrentBox
	jp BillsPCWithdraw ; otherwise go back to the menu
.redrawTextBoxAndCurrentBox
	push hl
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl] ; turn off letter printing delay so we get instant text
	pop hl
	rst _PrintText
	jp RedrawCurrentBoxPrompt
.viewPkmn
	call DisplayDepositWithdrawMenu.viewStats
	ld hl, ViewMode
	call .redrawTextBoxAndCurrentBox
	jp BillsPCWithdraw

	

BillsPCRelease:
	ld a, [wBoxCount]
	and a
	jr nz, .loop
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay so we don't get instant text
	ld hl, NoMonText
	rst _PrintText
	jp BillsPCMenu
.loop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl] ; turn off letter printing delay so we get instant text
	ld hl, ReleaseWhichMonText
	rst _PrintText
	ld hl, wBoxCount
	call DisplayMonListMenu
	jp c, BillsPCMenu
	call BillsPCBackupListIndex
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay so we don't get instant text
	ld hl, OnceReleasedText
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
.loopYesNo
	ld hl, YesNoSmall
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	callfar DisplayMultiChoiceMenu
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jr nz, .doneReleaseDialogBox
	bit BIT_START, a
	ld a, [wCurrentMenuItem]
	jr nz, .continue
	and a
	jr nz, .doneReleaseDialogBox
	; a button was pressed, tell the player to press START
	ld hl, PressStartToReleaseText
	rst _PrintText
	ld a, [wMenuWatchedKeys]
	or START
	ld [wMenuWatchedKeys], a
	jr .loopYesNo
.continue
	and a
	jr nz, .loopYesNo
	inc a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld a, [wCurPartySpecies]
	call PlayCry
	ld hl, MonWasReleasedText
	rst _PrintText
.doneReleaseDialogBox
	call BillsPCRestoreListIndex
	ld a, [wBoxCount]
	and a
	jp z, BillsPCMenu ; if no pokemon left to release, exit the menu automatically
	jp .loop ; otherwise go back to the menu

BillsPCChangeBox:
	farcall ChangeBox
	jp BillsPCMenu

DisplayMonListMenu:
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wListMenuID], a
	inc a                ; MONSTER_NAME
	ld [wNameListType], a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wPartyAndBillsPCSavedMenuItem], a
	ret

BillsPCMenuText:
	db   "WITHDRAW <PKMN>"
	next "DEPOSIT <PKMN>"
	next "RELEASE <PKMN>"
	next "CHANGE BOX"
	next "SEE YA!"
	db "@"
	
; PureRGBnote: FIXED: pokemon are never considered to have HMs, allows them to be stored in daycare no matter what
;KnowsHMMove::
; returns whether mon with party index [wWhichPokemon] knows an HM move
;	ld hl, wPartyMon1Moves
;	ld bc, wPartyMon2 - wPartyMon1
;	jr .next
; unreachable
	;ld hl, wBoxMon1Moves
	;ld bc, wBoxMon2 - wBoxMon1
;.next
;	ld a, [wWhichPokemon]
;	call AddNTimes
;	ld b, NUM_MOVES
;.loop
;	ld a, [hli]
	;push hl 
	;push bc
	;ld hl, HMMoveArray
	;ld de, 1
	;call IsInArray
	;pop bc
	;pop hl
	;ret c
;	dec b
;	jr nz, .loop
;	and a
;	ret

;HMMoveArray:
;INCLUDE "data/moves/hm_moves.asm"

DisplayDepositWithdrawMenu:
	hlcoord 9, 10
	lb bc, 6, 9
	call TextBoxBorder
	ld a, [wParentMenuItem]
	and a ; was the Deposit or Withdraw item selected in the parent menu?
	ld de, DepositPCText
	jr nz, .next
	ld de, WithdrawPCText
.next
	hlcoord 11, 12
	call PlaceString
	hlcoord 11, 14
	ld de, StatsCancelPCText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 12
	ld [hli], a ; wTopMenuItemY
	ld a, 10
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, 2
	ld [hli], a ; wMaxMenuItem
	ld a, A_BUTTON | B_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	ld hl, wListScrollOffset
	ld [hli], a ; wListScrollOffset
	ld [hl], a ; wMenuWatchMovingOutOfBounds
	ld [wPlayerMonNumber], a
.loop
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .exit
	ld a, [wCurrentMenuItem]
	and a
	jr z, .choseDepositWithdraw
	dec a
	jr z, .viewStats
.exit
	and a
	ret
.choseDepositWithdraw
	scf
	ret
.viewStats
	call SaveScreenTilesToBuffer1
	ld a, [wParentMenuItem]
	and a
	ld a, PLAYER_PARTY_DATA
	jr nz, .next2
	ld a, BOX_DATA
.next2
	ld [wMonDataLocation], a
	predef StatusScreenOriginal
	call LoadScreenTilesFromBuffer1
	call ReloadTilesetTilePatterns
	call RunDefaultPaletteCommand
	call LoadGBPal
	CheckFlag FLAG_VIEW_PC_PKMN
	jr nz, .exit
	jr .loop

DepositPCText:  db "DEPOSIT@"
WithdrawPCText: db "WITHDRAW@"
StatsCancelPCText:
	db   "STATS"
	next "CANCEL@"

SwitchOnText:
	text_far _SwitchOnText
	text_end

WhatText:
	text_far _WhatText
	text_end

ViewMode:
	text_far _ViewModeText
	text_end

DepositWhichMonText:
	text_far _DepositWhichMonText
	text_end

MonWasStoredText:
	text_far _MonWasStoredText
	text_end

CantDepositLastMonText:
	text_far _CantDepositLastMonText
	text_end

BoxFullText:
	text_far _BoxFullText
	text_end

MonIsTakenOutText:
	text_far _MonIsTakenOutText
	text_end

NoMonText:
	text_far _NoMonText
	text_end

CantTakeMonText:
	text_far _CantTakeMonText
	text_end

ReleaseWhichMonText:
	text_far _ReleaseWhichMonText
	text_end

OnceReleasedText:
	text_far _OnceReleasedText
	text_end

MonWasReleasedText:
	text_far _MonWasReleasedText
	text_end

PressStartToReleaseText:
	text_far _PressStartToReleaseText
	text_end

CableClubLeftGameboy::
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	ret z
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	ret nz
	ld a, [wCurMap]
	cp TRADE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .next
	inc a ; LINK_STATE_START_BATTLE
.next
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	tx_pre_jump JustAMomentText

CableClubRightGameboy::
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_LEFT
	ret nz
	ld a, [wCurMap]
	cp TRADE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .next
	inc a ; LINK_STATE_START_BATTLE
.next
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	tx_pre_jump JustAMomentText

JustAMomentText::
	text_far _JustAMomentText
	text_end

	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump OpenBillsPCText

OpenBillsPCText::
	script_bills_pc

BillsPCBackupListIndex:
	ld a, [wListScrollOffset]
	ld [wSavedListScrollOffset], a
	ret

BillsPCRestoreListIndex:
	ld a, [wSavedListScrollOffset]
	ld [wListScrollOffset], a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	ret

RedrawCurrentBoxPrompt:
	callfar LoadBillsPCExtraTiles ; in the case of displaying pokemon status menu, this needs to be reloaded
	decoord 13, 13
	jpfar DrawCurrentBoxPrompt ; redraw current box prompt since it probably changed