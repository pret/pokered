Func_213c8:: ; 213c8 (8:53c8)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	call SaveScreenTilesToBuffer2
	ld a, [wd5a2]
	and a
	jr nz, .asm_213f3
	ld a, [wd74b]
	bit 5, a
	jr z, .asm_213ea
	ld a, [wd5a2]
	and a
	jr nz, .asm_213f3
	ld hl, wTileMap
	ld b, $8
	ld c, $e
	jr .asm_213fa
.asm_213ea
	ld hl, wTileMap
	ld b, $6
	ld c, $e
	jr .asm_213fa
.asm_213f3
	ld hl, wTileMap
	ld b, $a
	ld c, $e
.asm_213fa
	call TextBoxBorder
	call UpdateSprites
	ld a, $3
	ld [wMaxMenuItem], a
	ld a, [wd7f1]
	bit 0, a
	jr nz, .asm_21414
	hlCoord 2, 2
	ld de, SomeonesPCText
	jr .asm_2141a
.asm_21414
	hlCoord 2, 2
	ld de, BillsPCText
.asm_2141a
	call PlaceString
	hlCoord 2, 4
	ld de, wPlayerName
	call PlaceString
	ld l, c
	ld h, b
	ld de, PlayersPCText
	call PlaceString
	ld a, [wd74b]
	bit 5, a
	jr z, .asm_21462
	hlCoord 2, 6
	ld de, OaksPCText
	call PlaceString
	ld a, [wd5a2]
	and a
	jr z, .asm_2145a
	ld a, $4
	ld [wMaxMenuItem], a
	hlCoord 2, 8
	ld de, PKMNLeaguePCText
	call PlaceString
	hlCoord 2, 10
	ld de, LogOffPCText
	jr .asm_2146d
.asm_2145a
	hlCoord 2, 8
	ld de, LogOffPCText
	jr .asm_2146d
.asm_21462
	ld a, $2
	ld [wMaxMenuItem], a
	hlCoord 2, 6
	ld de, LogOffPCText
.asm_2146d
	call PlaceString
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

SomeonesPCText:   db "SOMEONE's PC@"
BillsPCText:      db "BILL's PC@"
PlayersPCText:    db "'s PC@"
OaksPCText:       db "PROF.OAK's PC@"
PKMNLeaguePCText: db $4a, "LEAGUE@"
LogOffPCText:     db "LOG OFF@"

BillsPC_:: ; 0x214c2
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [wccd3], a
	inc a               ; MONSTER_NAME
	ld [wNameListType], a
	call LoadHpBarAndStatusTilePatterns
	ld a, [wListScrollOffset]
	push af
	ld a, [wFlags_0xcd60]
	bit 3, a
	jr nz, BillsPCMenu
	ld a, $99
	call PlaySound
	ld hl, SwitchOnText
	call PrintText

Func_214e8: ; 214e8 (8:54e8)
BillsPCMenu:
	ld a, [wccd3]
	ld [wCurrentMenuItem], a
	ld hl, vChars2 + $780
	ld de, PokeballTileGraphics
	ld bc, (BANK(PokeballTileGraphics) << 8) + $01
	call CopyVideoData
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	ld hl, wTileMap
	ld b, $a
	ld c, $c
	call TextBoxBorder
	hlCoord 2, 2
	ld de, BillsPCMenuText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, $2
	ld [hli], a
	dec a
	ld [hli], a
	inc hl
	inc hl
	ld a, $4
	ld [hli], a
	ld a, $3
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld hl, wListScrollOffset
	ld [hli], a
	ld [hl], a
	ld [wPlayerMonNumber], a
	ld hl, WhatText
	call PrintText
	hlCoord 9, 14
	ld b, $2
	ld c, $9
	call TextBoxBorder
	ld a, [wd5a0]
	and $7f
	cp 9
	jr c, .asm_2154f
	sub 9
	hlCoord 17, 16
	ld [hl], "1"
	add "0"
	jr .asm_21551
.asm_2154f
	add "1"
.asm_21551
	Coorda 18, 16
	hlCoord 10, 16
	ld de, BoxNoPCText
	call PlaceString
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	call HandleMenuInput
	bit 1, a
	jp nz, Func_21588 ; b button
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	ld [wccd3], a
	and a
	jp z, Func_21618 ; withdraw
	cp $1
	jp z, Func_215ac ; deposit
	cp $2
	jp z, Func_21673 ; release
	cp $3
	jp z, Func_216b3 ; change box

Func_21588: ; 21588 (8:5588)
	ld a, [wFlags_0xcd60]
	bit 3, a
	jr nz, .asm_2159a
	call LoadTextBoxTilePatterns
	ld a, $9a
	call PlaySound
	call WaitForSoundToFinish
.asm_2159a
	ld hl, wFlags_0xcd60
	res 5, [hl]
	call LoadScreenTilesFromBuffer2
	pop af
	ld [wListScrollOffset], a
	ld hl, wd730
	res 6, [hl]
	ret

Func_215ac: ; 215ac (8:55ac)
BillsPCDeposit:
	ld a, [wPartyCount]
	dec a
	jr nz, .asm_215bb
	ld hl, CantDepositLastMonText
	call PrintText
	jp BillsPCMenu
.asm_215bb
	ld a, [W_NUMINBOX]
	cp MONS_PER_BOX
	jr nz, .asm_215cb
	ld hl, BoxFullText
	call PrintText
	jp BillsPCMenu
.asm_215cb
	ld hl, wPartyCount
	call Func_216be
	jp c, BillsPCMenu
	call Func_2174b
	jp nc, BillsPCMenu
	ld a, [wcf91]
	call GetCryData
	call PlaySoundWaitForCurrent
	ld a, $1
	ld [wcf95], a
	call Func_3a68
	xor a
	ld [wcf95], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld hl, wWhichTrade
	ld a, [wd5a0]
	and $7f
	cp 9
	jr c, .asm_2160a
	sub 9
	ld [hl], "1"
	inc hl
	add "0"
	jr .asm_2160c
.asm_2160a
	add "1"
.asm_2160c
	ld [hli], a
	ld [hl], $50
	ld hl, MonWasStoredText
	call PrintText
	jp BillsPCMenu

Func_21618: ; 21618 (8:5618)
	ld a, [W_NUMINBOX]
	and a
	jr nz, .asm_21627
	ld hl, NoMonText
	call PrintText
	jp Func_214e8
.asm_21627
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nz, .asm_21637
	ld hl, CantTakeMonText
	call PrintText
	jp Func_214e8
.asm_21637
	ld hl, W_NUMINBOX
	call Func_216be
	jp c, Func_214e8
	call Func_2174b
	jp nc, Func_214e8
	ld a, [wWhichPokemon]
	ld hl, wBoxMonNicks
	call GetPartyMonName
	ld a, [wcf91]
	call GetCryData
	call PlaySoundWaitForCurrent
	xor a
	ld [wcf95], a
	call Func_3a68
	ld a, $1
	ld [wcf95], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld hl, MonIsTakenOutText
	call PrintText
	jp Func_214e8

Func_21673: ; 21673 (8:5673)
	ld a, [W_NUMINBOX]
	and a
	jr nz, .asm_21682
	ld hl, NoMonText
	call PrintText
	jp Func_214e8
.asm_21682
	ld hl, W_NUMINBOX
	call Func_216be
	jp c, Func_214e8
	ld hl, OnceReleasedText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_21682
	inc a
	ld [wcf95], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld a, [wcf91]
	call PlayCry
	ld hl, MonWasReleasedText
	call PrintText
	jp Func_214e8

Func_216b3: ; 216b3 (8:56b3)
	callba ChangeBox
	jp Func_214e8

Func_216be: ; 216be (8:56be)
	ld a, l
	ld [wList], a
	ld a, h
	ld [wList + 1], a
	xor a
	ld [wcf93], a
	ld [wListMenuID], a
	inc a                ; MONSTER_NAME
	ld [wNameListType], a
	ld a, [wcc2b]
	ld [wCurrentMenuItem], a
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wcc2b], a
	ret

BillsPCMenuText: ; 216e1 (8:56e1)
	db   "WITHDRAW ", $4a
	next "DEPOSIT ",  $4a
	next "RELEASE ",  $4a
	next "CHANGE BOX"
IF DEF(_YELLOW)
	next "PRINT BOX"
ENDC
	next "SEE YA!"
	db "@"

BoxNoPCText: ; 21713 (8:5713)
	db "BOX No.@"

Func_2171b:: ; 2171b (8:571b)
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	jr .asm_21729 ; 0x21721 $6
	ld hl, wBoxMon1Moves
	ld bc, wBoxMon2 - wBoxMon1
.asm_21729
	ld a, [wWhichPokemon]
	call AddNTimes
	ld b, NUM_MOVES
.asm_21731
	ld a, [hli]
	push hl
	push bc
	ld hl, HMMoveArray
	ld de, 1
	call IsInArray
	pop bc
	pop hl
	ret c
	dec b
	jr nz, .asm_21731 ; 0x21741 $ee
	and a
	ret

HMMoveArray: ; 21745 (8:5745)
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db FLASH
	db -1

Func_2174b: ; 2174b (8:574b)
	hlCoord 9, 10
	ld b, $6
	ld c, $9
	call TextBoxBorder
	ld a, [wccd3]
	and a
	ld de, DepositPCText
	jr nz, .asm_21761
	ld de, WithdrawPCText
.asm_21761
	hlCoord 11, 12
	call PlaceString
	hlCoord 11, 14
	ld de, StatsCancelPCText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, $c
	ld [hli], a
	ld a, $a
	ld [hli], a
	xor a
	ld [hli], a
	inc hl
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, wListScrollOffset
	ld [hli], a
	ld [hl], a
	ld [wPlayerMonNumber], a
	ld [wcc2b], a
.asm_2178f
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_2179f
	ld a, [wCurrentMenuItem]
	and a
	jr z, .asm_217a1
	dec a
	jr z, .asm_217a3
.asm_2179f
	and a
	ret
.asm_217a1
	scf
	ret
.asm_217a3
	call SaveScreenTilesToBuffer1
	ld a, [wccd3]
	and a
	ld a, $0
	jr nz, .asm_217b0
	ld a, $2
.asm_217b0
	ld [wcc49], a
	predef StatusScreen
	predef StatusScreen2
	call LoadScreenTilesFromBuffer1
	call ReloadTilesetTilePatterns
	call GoPAL_SET_CF1C
	call LoadGBPal
	jr .asm_2178f

DepositPCText:  db "DEPOSIT@"
WithdrawPCText: db "WITHDRAW@"
StatsCancelPCText:
	db   "STATS"
	next "CANCEL@"

SwitchOnText: ; 0x217e9
	TX_FAR _SwitchOnText
	db "@"

WhatText: ; 0x217ee
	TX_FAR _WhatText
	db "@"

DepositWhichMonText: ; 0x217f3
	TX_FAR _DepositWhichMonText
	db "@"

MonWasStoredText: ; 0x217f8
	TX_FAR _MonWasStoredText
	db "@"

CantDepositLastMonText: ; 0x217fd
	TX_FAR _CantDepositLastMonText
	db "@"

BoxFullText: ; 0x21802
	TX_FAR _BoxFullText
	db "@"

MonIsTakenOutText: ; 0x21807
	TX_FAR _MonIsTakenOutText
	db "@"

NoMonText: ; 0x2180c
	TX_FAR _NoMonText
	db "@"

CantTakeMonText: ; 0x21811
	TX_FAR _CantTakeMonText
	db "@"

ReleaseWhichMonText: ; 0x21816
	TX_FAR _ReleaseWhichMonText
	db "@"

OnceReleasedText: ; 0x2181b
	TX_FAR _OnceReleasedText
	db "@"

MonWasReleasedText: ; 0x21820
	TX_FAR _MonWasReleasedText
	db "@"

CableClubLeftGameboy:: ; 5824 (8:5825)
	ld a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	ret z
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_RIGHT
	ret nz
	ld a, [W_CURMAP]
	cp BATTLE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .asm_2183a
	inc a ; LINK_STATE_START_BATTLE
.asm_2183a
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	ld a, $22 ; JustAMomentText
	jp PrintPredefTextID

CableClubRightGameboy:: ; 5845 (8:5845)
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_LEFT
	ret nz
	ld a, [W_CURMAP]
	cp BATTLE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .asm_2185a
	inc a ; LINK_STATE_START_BATTLE
.asm_2185a
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	ld a, $22 ; JustAMomentText
	jp PrintPredefTextID

JustAMomentText:: ; 21865 (8:5865)
	TX_FAR _JustAMomentText
	db "@"

	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $23
	jp PrintPredefTextID

PredefText23:: ; 21878 (8:5878)
	db $FD ; FuncTX_BillsPC

