; [wd07d] = menu type / message ID
; if less than $F0, it is a menu type
; menu types:
; 00: normal pokemon menu (e.g. Start menu)
; 01: use healing item on pokemon menu
; 02: in-battle switch pokemon menu
; 03: learn TM/HM menu
; 04: swap pokemon positions menu
; 05: use evolution stone on pokemon menu
; otherwise, it is a message ID
; f0: poison healed
; f1: burn healed
; f2: freeze healed
; f3: sleep healed
; f4: paralysis healed
; f5: HP healed
; f6: health returned
; f7: revitalized
; f8: leveled up
DrawPartyMenu_: ; 12cd2 (4:6cd2)
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a
	call ClearScreen
	call UpdateSprites ; move sprites
	callba LoadMonPartySpriteGfxWithLCDDisabled ; load pokemon icon graphics

RedrawPartyMenu_: ; 12ce3 (4:6ce3)
	ld a,[wd07d]
	cp a,$04
	jp z,.printMessage
	call ErasePartyMenuCursors
	callba SendBlkPacket_PartyMenu ; loads some data to wcf2e
	hlCoord 3, 0
	ld de,wPartySpecies
	xor a
	ld c,a
	ld [hPartyMonIndex],a
	ld [wcf2d],a
.loop
	ld a,[de]
	cp a,$FF ; reached the terminator?
	jp z,.afterDrawingMonEntries
	push bc
	push de
	push hl
	ld a,c
	push hl
	ld hl,wPartyMonNicks
	call GetPartyMonName
	pop hl
	call PlaceString ; print the pokemon's name
	callba WriteMonPartySpriteOAMByPartyIndex ; place the appropriate pokemon icon
	ld a,[hPartyMonIndex]
	ld [wWhichPokemon],a
	inc a
	ld [hPartyMonIndex],a
	call LoadMonData
	pop hl
	push hl
	ld a,[wMenuItemToSwap]
	and a ; is the player swapping pokemon positions?
	jr z,.skipUnfilledRightArrow
; if the player is swapping pokemon positions
	dec a
	ld b,a
	ld a,[wWhichPokemon]
	cp b ; is the player swapping the current pokemon in the list?
	jr nz,.skipUnfilledRightArrow
; the player is swapping the current pokemon in the list
	dec hl
	dec hl
	dec hl
	ld a,$EC ; unfilled right arrow menu cursor
	ld [hli],a ; place the cursor
	inc hl
	inc hl
.skipUnfilledRightArrow
	ld a,[wd07d] ; menu type
	cp a,$03
	jr z,.teachMoveMenu
	cp a,$05
	jr z,.evolutionStoneMenu
	push hl
	ld bc,14 ; 14 columns to the right
	add hl,bc
	ld de,wLoadedMonStatus
	call PrintStatusCondition
	pop hl
	push hl
	ld bc,20 + 1 ; down 1 row and right 1 column
	ld a,[hFlags_0xFFF6]
	set 0,a
	ld [hFlags_0xFFF6],a
	add hl,bc
	predef DrawHP2 ; draw HP bar and prints current / max HP
	ld a,[hFlags_0xFFF6]
	res 0,a
	ld [hFlags_0xFFF6],a
	call SetPartyMenuHealthBarColor ; color the HP bar (on SGB)
	pop hl
	jr .printLevel
.teachMoveMenu
	push hl
	predef CanLearnTM ; check if the pokemon can learn the move
	pop hl
	ld de,.ableToLearnMoveText
	ld a,c
	and a
	jr nz,.placeMoveLearnabilityString
	ld de,.notAbleToLearnMoveText
.placeMoveLearnabilityString
	ld bc,20 + 9 ; down 1 row and right 9 columns
	push hl
	add hl,bc
	call PlaceString
	pop hl
.printLevel
	ld bc,10 ; move 10 columns to the right
	add hl,bc
	call PrintLevel
	pop hl
	pop de
	inc de
	ld bc,2 * 20
	add hl,bc
	pop bc
	inc c
	jp .loop
.ableToLearnMoveText
	db "ABLE@"
.notAbleToLearnMoveText
	db "NOT ABLE@"
.evolutionStoneMenu
	push hl
	ld hl,EvosMovesPointerTable
	ld b,0
	ld a,[wLoadedMonSpecies]
	dec a
	add a
	rl b
	ld c,a
	add hl,bc
	ld de,wcd6d
	ld a,BANK(EvosMovesPointerTable)
	ld bc,2
	call FarCopyData
	ld hl,wcd6d
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,wcd6d
	ld a,BANK(EvosMovesPointerTable)
	ld bc,13
	call FarCopyData
	ld hl,wcd6d
	ld de,.notAbleToEvolveText
; loop through the pokemon's evolution entries
.checkEvolutionsLoop
	ld a,[hli]
	and a ; reached terminator?
	jr z,.placeEvolutionStoneString ; if so, place the "NOT ABLE" string
	inc hl
	inc hl
	cp a,EV_ITEM
	jr nz,.checkEvolutionsLoop
; if it's a stone evolution entry
	dec hl
	dec hl
	ld b,[hl]
	ld a,[wd156] ; evolution stone item ID
	inc hl
	inc hl
	inc hl
	cp b ; does the player's stone match this evolution entry's stone?
	jr nz,.checkEvolutionsLoop
; if it does match
	ld de,.ableToEvolveText
.placeEvolutionStoneString
	ld bc,20 + 9 ; down 1 row and right 9 columns
	pop hl
	push hl
	add hl,bc
	call PlaceString
	pop hl
	jr .printLevel
.ableToEvolveText
	db "ABLE@"
.notAbleToEvolveText
	db "NOT ABLE@"
.afterDrawingMonEntries
	ld b,$0A
	call GoPAL_SET
.printMessage
	ld hl,wd730
	ld a,[hl]
	push af
	push hl
	set 6,[hl] ; turn off letter printing delay
	ld a,[wd07d] ; message ID
	cp a,$F0
	jr nc,.printItemUseMessage
	add a
	ld hl,PartyMenuMessagePointers
	ld b,0
	ld c,a
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call PrintText
.done
	pop hl
	pop af
	ld [hl],a
	ld a,1
	ld [H_AUTOBGTRANSFERENABLED],a
	call Delay3
	jp GBPalNormal
.printItemUseMessage
	and a,$0F
	ld hl,PartyMenuItemUseMessagePointers
	add a
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	push hl
	ld a,[wcf06]
	ld hl,wPartyMonNicks
	call GetPartyMonName
	pop hl
	call PrintText
	jr .done

PartyMenuItemUseMessagePointers: ; 12e61 (4:6e61)
	dw AntidoteText
	dw BurnHealText
	dw IceHealText
	dw AwakeningText
	dw ParlyzHealText
	dw PotionText
	dw FullHealText
	dw ReviveText
	dw RareCandyText

PartyMenuMessagePointers: ; 12e73 (4:6e73)
	dw PartyMenuNormalText
	dw PartyMenuItemUseText
	dw PartyMenuBattleText
	dw PartyMenuUseTMText
	dw PartyMenuSwapMonText
	dw PartyMenuItemUseText

PartyMenuNormalText: ; 12e7f (4:6e7f)
	TX_FAR _PartyMenuNormalText
	db "@"

PartyMenuItemUseText: ; 12e84 (4:6e84)
	TX_FAR _PartyMenuItemUseText
	db "@"

PartyMenuBattleText: ; 12e89 (4:6e89)
	TX_FAR _PartyMenuBattleText
	db "@"

PartyMenuUseTMText: ; 12e8e (4:6e8e)
	TX_FAR _PartyMenuUseTMText
	db "@"

PartyMenuSwapMonText: ; 12e93 (4:6e93)
	TX_FAR _PartyMenuSwapMonText
	db "@"

PotionText: ; 12e98 (4:6e98)
	TX_FAR _PotionText
	db "@"

AntidoteText: ; 12e9d (4:6e9d)
	TX_FAR _AntidoteText
	db "@"

ParlyzHealText: ; 12ea2 (4:6ea2)
	TX_FAR _ParlyzHealText
	db "@"

BurnHealText: ; 12ea7 (4:6ea7)
	TX_FAR _BurnHealText
	db "@"

IceHealText: ; 12eac (4:6eac)
	TX_FAR _IceHealText
	db "@"

AwakeningText: ; 12eb1 (4:6eb1)
	TX_FAR _AwakeningText
	db "@"

FullHealText: ; 12eb6 (4:6eb6)
	TX_FAR _FullHealText
	db "@"

ReviveText: ; 12ebb (4:6ebb)
	TX_FAR _ReviveText
	db "@"

RareCandyText: ; 12ec0 (4:6ec0)
	TX_FAR _RareCandyText
	db $0B
	db $06
	db "@"

SetPartyMenuHealthBarColor: ; 12ec7 (4:6ec7)
	ld hl, wcf1f
	ld a, [wcf2d]
	ld c, a
	ld b, $0
	add hl, bc
	call GetHealthBarColor
	ld b, $fc
	call GoPAL_SET
	ld hl, wcf2d
	inc [hl]
	ret
