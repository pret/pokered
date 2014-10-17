INCLUDE "constants.asm"

NPC_SPRITES_1 EQU $4
NPC_SPRITES_2 EQU $5

GFX EQU $4

PICS_1 EQU $9
PICS_2 EQU $A
PICS_3 EQU $B
PICS_4 EQU $C
PICS_5 EQU $D


INCLUDE "home.asm"


SECTION "bank1",ROMX,BANK[$1]

INCLUDE "data/facing.asm"

ResetStatusAndHalveMoneyOnBlackout::
; Reset player status on blackout.
	xor a
	ld [wBattleResult], a
	ld [wWalkBikeSurfState], a
	ld [W_ISINBATTLE], a
	ld [wMapPalOffset], a
	ld [wNPCMovementScriptFunctionNum], a
	ld [hJoyHeld], a
	ld [wNPCMovementScriptPointerTableNum], a
	ld [wFlags_0xcd60], a

	ld [$ff9f], a
	ld [$ff9f + 1], a
	ld [$ff9f + 2], a
	call HasEnoughMoney
	jr c, .lostmoney ; never happens

	; Halve the player's money.
	ld a, [wPlayerMoney]
	ld [$ff9f], a
	ld a, [wPlayerMoney + 1]
	ld [$ff9f + 1], a
	ld a, [wPlayerMoney + 2]
	ld [$ff9f + 2], a
	xor a
	ld [$ffa2], a
	ld [$ffa3], a
	ld a, 2
	ld [$ffa4], a
	predef DivideBCDPredef3
	ld a, [$ffa2]
	ld [wPlayerMoney], a
	ld a, [$ffa2 + 1]
	ld [wPlayerMoney + 1], a
	ld a, [$ffa2 + 2]
	ld [wPlayerMoney + 2], a

.lostmoney
	ld hl, wd732
	set 2, [hl]
	res 3, [hl]
	set 6, [hl]
	ld a, %11111111
	ld [wJoyIgnore], a
	predef_jump HealParty


MewPicFront:: INCBIN "pic/bmon/mew.pic"
MewPicBack::  INCBIN "pic/monback/mewb.pic"
INCLUDE "data/baseStats/mew.asm"

INCLUDE "engine/battle/safari_zone.asm"

INCLUDE "engine/titlescreen.asm"

NintenText: db "NINTEN@"
SonyText:   db "SONY@"


LoadMonData_:
; Load monster [wWhichPokemon] from list [wcc49]:
;  0: partymon
;  1: enemymon
;  2: boxmon
;  3: daycaremon
; Return monster id at wcf91 and its data at wcf98.
; Also load base stats at W_MONHDEXNUM for convenience.

	ld a, [wDayCareMonSpecies]
	ld [wcf91], a
	ld a, [wcc49]
	cp 3
	jr z, .GetMonHeader

	ld a, [wWhichPokemon]
	ld e, a
	callab Func_39c37 ; get pokemon ID

.GetMonHeader
	ld a, [wcf91]
	ld [wd0b5], a ; input for GetMonHeader
	call GetMonHeader

	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wcc49]
	cp 1
	jr c, .getMonEntry

	ld hl, wEnemyMons
	jr z, .getMonEntry

	cp 2
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1
	jr z, .getMonEntry

	ld hl, wDayCareMon
	jr .copyMonData

.getMonEntry
	ld a, [wWhichPokemon]
	call AddNTimes

.copyMonData
	ld de, wcf98
	ld bc, 44
	jp CopyData


INCLUDE "data/item_prices.asm"
INCLUDE "text/item_names.asm"

UnusedNames:
	db "かみなりバッヂ@"
	db "かいがらバッヂ@"
	db "おじぞうバッヂ@"
	db "はやぶさバッヂ@"
	db "ひんやりバッヂ@"
	db "なかよしバッヂ@"
	db "バラバッヂ@"
	db "ひのたまバッヂ@"
	db "ゴールドバッヂ@"
	db "たまご@"
	db "ひよこ@"
	db "ブロンズ@"
	db "シルバー@"
	db "ゴールド@"
	db "プチキャプテン@"
	db "キャプテン@"
	db "プチマスター@"
	db "マスター@"
	db "エクセレント"

INCLUDE "engine/overworld/oam.asm"
INCLUDE "engine/oam_dma.asm"

PrintWaitingText:
	hlCoord 3, 10
	ld b, $1
	ld c, $b
	ld a, [W_ISINBATTLE]
	and a
	jr z, .asm_4c17
	call TextBoxBorder
	jr .asm_4c1a
.asm_4c17
	call Func_5ab3
.asm_4c1a
	hlCoord 4, 11
	ld de, WaitingText
	call PlaceString
	ld c, 50
	jp DelayFrames

WaitingText:
	db "Waiting...!@"


_UpdateSprites: ; 4c34 (1:4c34)
	ld h, $c1
	inc h
	ld a, $e    ; wSpriteStateData2 + $0e
.spriteLoop
	ld l, a
	sub $e
	ld c, a
	ld [H_CURRENTSPRITEOFFSET], a
	ld a, [hl]
	and a
	jr z, .skipSprite   ; tests $c2Xe
	push hl
	push de
	push bc
	call .updateCurrentSprite
	pop bc
	pop de
	pop hl
.skipSprite
	ld a, l
	add $10             ; move to next sprite
	cp $e               ; test for overflow (back at $0e)
	jr nz, .spriteLoop
	ret
.updateCurrentSprite ; 4c54 (1:4c54)
	cp $1
	jp nz, UpdateNonPlayerSprite
	jp UpdatePlayerSprite

UpdateNonPlayerSprite:
	dec a
	swap a
	ld [$ff93], a  ; $10 * sprite#
	ld a, [wNPCMovementScriptSpriteOffset] ; some sprite offset?
	ld b, a
	ld a, [H_CURRENTSPRITEOFFSET]
	cp b
	jr nz, .unequal
	jp Func_5236
.unequal
	jp Func_4ed1

; This detects if the current sprite (whose offset is at H_CURRENTSPRITEOFFSET)
; is going to collide with another sprite by looping over the other sprites.
; The current sprite's offset will be labelled with i (e.g. $c1i0).
; The loop sprite's offset will labelled with j (e.g. $c1j0).
;
; Note that the Y coordinate of the sprite (in [$c1k4]) is one of the following
; 9 values when the sprite is aligned with the grid: $fc, $0c, $1c, $2c, ..., $7c.
; The reason that 4 is added below to the coordinate is to make it align with a
; multiple of $10 to make comparisons easier.
DetectCollisionBetweenSprites:
	nop

	ld h, wSpriteStateData1 / $100
	ld a, [H_CURRENTSPRITEOFFSET]
	add wSpriteStateData1 % $100
	ld l, a

	ld a, [hl] ; a = [$c1i0] (picture) (0 if slot is unused)
	and a ; is this sprite slot slot used?
	ret z ; return if not used

	ld a, l
	add 3
	ld l, a

	ld a, [hli] ; a = [$c1i3] (delta Y) (-1, 0, or 1)
	call SetSpriteCollisionValues

	ld a, [hli] ; a = [$C1i4] (Y screen coordinate)
	add 4 ; align with multiple of $10

; The effect of the following 3 lines is to
; add 7 to a if moving south or
; subtract 7 from a if moving north.
	add b
	and $f0
	or c

	ld [$ff90], a ; store Y coordinate adjusted for direction of movement

	ld a, [hli] ; a = [$c1i5] (delta X) (-1, 0, or 1)
	call SetSpriteCollisionValues
	ld a, [hl] ; a = [$C1i6] (X screen coordinate)

; The effect of the following 3 lines is to
; add 7 to a if moving east or
; subtract 7 from a if moving west.
	add b
	and $f0
	or c

	ld [$ff91], a ; store X coordinate adjusted for direction of movement

	ld a, l
	add 7
	ld l, a

	xor a
	ld [hld], a ; zero [$c1id] XXX what's [$c1id] for?
	ld [hld], a ; zero [$c1ic] (directions in which collisions occurred)

	ld a, [$ff91]
	ld [hld], a ; [$c1ib] = adjusted X coordiate
	ld a, [$ff90]
	ld [hl], a ; [$c1ia] = adjusted Y coordinate

	xor a ; zero the loop counter

.loop
	ld [$ff8f], a ; store loop counter
	swap a
	ld e, a
	ld a, [H_CURRENTSPRITEOFFSET]
	cp e ; does the loop sprite match the current sprite?
	jp z, .next ; go to the next sprite if they match

	ld d, h
	ld a, [de] ; a = [$c1j0] (picture) (0 if slot is unused)
	and a ; is this sprite slot slot used?
	jp z, .next ; go the next sprite if not used

	inc e
	inc e
	ld a, [de] ; a = [$c1j2] ($ff means the sprite is offscreen)
	inc a
	jp z, .next ; go the next sprite if offscreen

	ld a, [H_CURRENTSPRITEOFFSET]
	add 10
	ld l, a

	inc e
	ld a, [de] ; a = [$c1j3] (delta Y)
	call SetSpriteCollisionValues

	inc e
	ld a, [de] ; a = [$C1j4] (Y screen coordinate)
	add 4 ; align with multiple of $10

; The effect of the following 3 lines is to
; add 7 to a if moving south or
; subtract 7 from a if moving north.
	add b
	and $f0
	or c

	sub [hl] ; subtract the adjusted Y coordinate of sprite i ([$c1ia]) from that of sprite j

; calculate the absolute value of the difference to get the distance
	jr nc, .noCarry1
	cpl
	inc a
.noCarry1
	ld [$ff90], a ; store the distance between the two sprites' adjusted Y values

; Use the carry flag set by the above subtraction to determine which sprite's
; Y coordinate is larger. This information is used later to set [$c1ic],
; which stores which direction the collision occurred in.
; The following 5 lines set the lowest 2 bits of c, which are later shifted left by 2.
; If sprite i's Y is larger, set lowest 2 bits of c to 10.
; If sprite j's Y is larger or both are equal, set lowest 2 bits of c to 01.
	push af
	rl c
	pop af
	ccf
	rl c

; If sprite i's delta Y is 0, then b = 7, else b = 9.
	ld b, 7
	ld a, [hl] ; a = [$c1ia] (adjusted Y coordinate)
	and $f
	jr z, .next1
	ld b, 9

.next1
	ld a, [$ff90] ; a = distance between adjusted Y coordinates
	sub b
	ld [$ff92], a ; store distance adjusted using sprite i's direction
	ld a, b
	ld [$ff90], a ; store 7 or 9 depending on sprite i's delta Y
	jr c, .checkXDistance

; If sprite j's delta Y is 0, then b = 7, else b = 9.
	ld b, 7
	dec e
	ld a, [de] ; a = [$c1j3] (delta Y)
	inc e
	and a
	jr z, .next2
	ld b, 9

.next2
	ld a, [$ff92] ; a = distance adjusted using sprite i's direction
	sub b ; adjust distance using sprite j's direction
	jr z, .checkXDistance
	jr nc, .next ; go to next sprite if distance is still positive after both adjustments

.checkXDistance
	inc e
	inc l
	ld a, [de] ; a = [$c1j5] (delta X)

	push bc

	call SetSpriteCollisionValues
	inc e
	ld a, [de] ; a = [$c1j6] (X screen coordinate)

; The effect of the following 3 lines is to
; add 7 to a if moving east or
; subtract 7 from a if moving west.
	add b
	and $f0
	or c

	pop bc

	sub [hl] ; subtract the adjusted X coordinate of sprite i ([$c1ib]) from that of sprite j

; calculate the absolute value of the difference to get the distance
	jr nc, .noCarry2
	cpl
	inc a
.noCarry2
	ld [$ff91], a ; store the distance between the two sprites' adjusted X values

; Use the carry flag set by the above subtraction to determine which sprite's
; X coordinate is larger. This information is used later to set [$c1ic],
; which stores which direction the collision occurred in.
; The following 5 lines set the lowest 2 bits of c.
; If sprite i's X is larger, set lowest 2 bits of c to 10.
; If sprite j's X is larger or both are equal, set lowest 2 bits of c to 01.
	push af
	rl c
	pop af
	ccf
	rl c

; If sprite i's delta X is 0, then b = 7, else b = 9.
	ld b, 7
	ld a, [hl] ; a = [$c1ib] (adjusted X coordinate)
	and $f
	jr z, .next3
	ld b, 9

.next3
	ld a, [$ff91] ; a = distance between adjusted X coordinates
	sub b
	ld [$ff92], a ; store distance adjusted using sprite i's direction
	ld a, b
	ld [$ff91], a ; store 7 or 9 depending on sprite i's delta X
	jr c, .collision

; If sprite j's delta X is 0, then b = 7, else b = 9.
	ld b, 7
	dec e
	ld a, [de] ; a = [$c1j5] (delta X)
	inc e
	and a
	jr z, .next4
	ld b, 9

.next4
	ld a, [$ff92] ; a = distance adjusted using sprite i's direction
	sub b ; adjust distance using sprite j's direction
	jr z, .collision
	jr nc, .next ; go to next sprite if distance is still positive after both adjustments

.collision
	ld a, [$ff91] ; a = 7 or 9 depending on sprite i's delta X
	ld b, a
	ld a, [$ff90] ; a = 7 or 9 depending on sprite i's delta Y
	inc l

; If delta X isn't 0 and delta Y is 0, then b = %0011, else b = %1100.
; (note that normally if delta X isn't 0, then delta Y must be 0 and vice versa)
	cp b
	jr c, .next5
	ld b, %1100
	jr .next6
.next5
	ld b, %0011

.next6
	ld a, c ; c has 2 bits set (one of bits 0-1 is set for the X axis and one of bits 2-3 for the Y axis)
	and b ; we select either the bit in bits 0-1 or bits 2-3 based on the calculation immediately above
	or [hl] ; or with existing collision direction bits in [$c1ic]
	ld [hl], a ; store new value
	ld a, c ; useless code because a is overwritten before being used again

; set bit in [$c1ie] or [$c1if] to indicate which sprite the collision occurred with
	inc l
	inc l
	ld a, [$ff8f] ; a = loop counter
	ld de, SpriteCollisionBitTable
	add a
	add e
	ld e, a
	jr nc, .noCarry3
	inc d
.noCarry3
	ld a, [de]
	or [hl]
	ld [hli], a
	inc de
	ld a, [de]
	or [hl]
	ld [hl], a

.next
	ld a, [$ff8f] ; a = loop counter
	inc a
	cp $10
	jp nz, .loop
	ret

; takes delta X or delta Y in a
; b = delta X/Y
; c = 0 if delta X/Y is 0
; c = 7 if delta X/Y is 1
; c = 9 if delta X/Y is -1
SetSpriteCollisionValues:
	and a
	ld b, 0
	ld c, 0
	jr z, .done
	ld c, 9
	cp -1
	jr z, .ok
	ld c, 7
	ld a, 0
.ok
	ld b, a
.done
	ret

SpriteCollisionBitTable:
	db %00000000,%00000001
	db %00000000,%00000010
	db %00000000,%00000100
	db %00000000,%00001000
	db %00000000,%00010000
	db %00000000,%00100000
	db %00000000,%01000000
	db %00000000,%10000000
	db %00000001,%00000000
	db %00000010,%00000000
	db %00000100,%00000000
	db %00001000,%00000000
	db %00010000,%00000000
	db %00100000,%00000000
	db %01000000,%00000000
	db %10000000,%00000000

TestBattle:
	ret

.loop
	call GBPalNormal

	; Don't mess around
	; with obedience.
	ld a, %10000000 ; EARTHBADGE
	ld [W_OBTAINEDBADGES], a

	ld hl, W_FLAGS_D733
	set 0, [hl]

	; Reset the party.
	ld hl, wPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	; Give the player a
	; level 20 Rhydon.
	ld a, RHYDON
	ld [wcf91], a
	ld a, 20
	ld [W_CURENEMYLVL], a
	xor a
	ld [wcc49], a
	ld [W_CURMAP], a
	call AddPartyMon

	; Fight against a
	; level 20 Rhydon.
	ld a, RHYDON
	ld [W_CUROPPONENT], a

	predef InitOpponent

	; When the battle ends,
	; do it all again.
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld [H_AUTOBGTRANSFERENABLED], a
	jr .loop

INCLUDE "engine/overworld/item.asm"
INCLUDE "engine/overworld/movement.asm"

INCLUDE "engine/cable_club.asm"

LoadTrainerInfoTextBoxTiles: ; 5ae6 (1:5ae6)
	ld de, TrainerInfoTextBoxTileGraphics ; $7b98
	ld hl, vChars2 + $760
	ld bc, (BANK(TrainerInfoTextBoxTileGraphics) << 8) +$09
	jp CopyVideoData

INCLUDE "engine/menu/main_menu.asm"

INCLUDE "engine/oak_speech.asm"

SpecialWarpIn: ; 62ce (1:62ce)
	call LoadSpecialWarpData
	predef LoadTilesetHeader
	ld hl,wd732
	bit 2,[hl] ; dungeon warp or fly warp?
	res 2,[hl]
	jr z,.next
; if dungeon warp or fly warp
	ld a,[wDestinationMap]
	jr .next2
.next
	bit 1,[hl]
	jr z,.next3
	call EmptyFunc
.next3
	ld a,0
.next2
	ld b,a
	ld a,[wd72d]
	and a
	jr nz,.next4
	ld a,b
.next4
	ld hl,wd732
	bit 4,[hl] ; dungeon warp?
	ret nz
; if not dungeon warp
	ld [wLastMap],a
	ret

; gets the map ID, tile block map view pointer, tileset, and coordinates
LoadSpecialWarpData: ; 62ff (1:62ff)
	ld a, [wd72d]
	cp BATTLE_CENTER
	jr nz, .notBattleCenter
	ld hl, BattleCenterSpec1
	ld a, [$ffaa]
	cp $2
	jr z, .copyWarpData
	ld hl, BattleCenterSpec2
	jr .copyWarpData
.notBattleCenter
	cp TRADE_CENTER
	jr nz, .notTradeCenter
	ld hl, TradeCenterSpec1
	ld a, [$ffaa]
	cp $2
	jr z, .copyWarpData
	ld hl, TradeCenterSpec2
	jr .copyWarpData
.notTradeCenter
	ld a, [wd732]
	bit 1, a
	jr nz, .notFirstMap
	bit 2, a
	jr nz, .notFirstMap
	ld hl, FirstMapSpec
.copyWarpData
	ld de, W_CURMAP
	ld c, $7
.copyWarpDataLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyWarpDataLoop
	ld a, [hli]
	ld [W_CURMAPTILESET], a
	xor a
	jr .done
.notFirstMap
	ld a, [wLastMap]
	ld hl, wd732
	bit 4, [hl] ; used dungeon warp (jumped down hole/waterfall)?
	jr nz, .usedDunegonWarp
	bit 6, [hl] ; return to last pokemon center (or player's house)?
	res 6, [hl]
	jr z, .otherDestination
; return to last pokemon center or player's house
	ld a, [wLastBlackoutMap]
	jr .usedFlyWarp
.usedDunegonWarp
	ld hl, wd72d
	res 4, [hl]
	ld a, [wDungeonWarpDestinationMap]
	ld b, a
	ld [W_CURMAP], a
	ld a, [wWhichDungeonWarp]
	ld c, a
	ld hl, DungeonWarpList
	ld de, $0
	ld a, $6
	ld [wd12f], a
.dungeonWarpListLoop
	ld a, [hli]
	cp b
	jr z, .matchedDungeonWarpDestinationMap
	inc hl
	jr .nextDungeonWarp
.matchedDungeonWarpDestinationMap
	ld a, [hli]
	cp c
	jr z, .matchedDungeonWarpID
.nextDungeonWarp
	ld a, [wd12f]
	add e
	ld e, a
	jr .dungeonWarpListLoop
.matchedDungeonWarpID
	ld hl, DungeonWarpData
	add hl, de
	jr .copyWarpData2
.otherDestination
	ld a, [wDestinationMap]
.usedFlyWarp
	ld b, a
	ld [W_CURMAP], a
	ld hl, FlyWarpDataPtr
.flyWarpDataPtrLoop
	ld a, [hli]
	inc hl
	cp b
	jr z, .foundFlyWarpMatch
	inc hl
	inc hl
	jr .flyWarpDataPtrLoop
.foundFlyWarpMatch
	ld a, [hli]
	ld h, [hl]
	ld l, a
.copyWarpData2
	ld de, wCurrentTileBlockMapViewPointer
	ld c, $6
.copyWarpDataLoop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyWarpDataLoop2
	xor a ; OVERWORLD
	ld [W_CURMAPTILESET], a
.done
	ld [wYOffsetSinceLastSpecialWarp], a
	ld [wXOffsetSinceLastSpecialWarp], a
	ld a, $ff ; the player's coordinates have already been updated using a special warp, so don't use any of the normal warps
	ld [wDestinationWarpID], a
	ret

INCLUDE "data/special_warps.asm"

; This function appears to never be used.
; It is likely a debugging feature to give the player Tsunekazu Ishihara's
; favorite Pokemon. This is indicated by the overpowered Exeggutor, which
; Ishihara (president of Creatures Inc.) said was his favorite Pokemon in an ABC
; interview on February 8, 2000.
; "Exeggutor is my favorite. That's because I was always using this character
; while I was debugging the program."
; http://www.ign.com/articles/2000/02/09/abc-news-pokamon-chat-transcript

SetIshiharaTeam: ; 64ca (1:64ca)
	ld de, IshiharaTeam
.loop
	ld a, [de]
	cp $ff
	ret z
	ld [wcf91], a
	inc de
	ld a, [de]
	ld [W_CURENEMYLVL], a
	inc de
	call AddPartyMon
	jr .loop

IshiharaTeam: ; 64df (1:64df)
	db EXEGGUTOR,90
	db MEW,20
	db JOLTEON,56
	db DUGTRIO,56
	db ARTICUNO,57
	db $FF

EmptyFunc: ; 64ea (1:64ea)
	ret

INCLUDE "engine/menu/naming_screen.asm"

INCLUDE "engine/oak_speech2.asm"

; subtracts the amount the player paid from their money
; sets carry flag if there is enough money and unsets carry flag if not
SubtractAmountPaidFromMoney_: ; 6b21 (1:6b21)
	ld de,wPlayerMoney
	ld hl,$ff9f ; total price of items
	ld c,3 ; length of money in bytes
	call StringCmp
	ret c
	ld de,wPlayerMoney + 2
	ld hl,$ffa1 ; total price of items
	ld c,3 ; length of money in bytes
	predef SubBCDPredef ; subtract total price from money
	ld a,$13
	ld [wd125],a
	call DisplayTextBoxID ; redraw money text box
	and a
	ret

HandleItemListSwapping: ; 6b44 (1:6b44)
	ld a,[wListMenuID]
	cp a,ITEMLISTMENU
	jp nz,DisplayListMenuIDLoop ; only rearrange item list menus
	push hl
	ld hl,wcf8b
	ld a,[hli]
	ld h,[hl]
	ld l,a
	inc hl ; hl = beginning of list entries
	ld a,[wCurrentMenuItem]
	ld b,a
	ld a,[wListScrollOffset]
	add b
	add a
	ld c,a
	ld b,0
	add hl,bc ; hl = address of currently selected item entry
	ld a,[hl]
	pop hl
	inc a
	jp z,DisplayListMenuIDLoop ; ignore attempts to swap the Cancel menu item
	ld a,[wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; has the first item to swap already been chosen?
	jr nz,.swapItems
; if not, set the currently selected item as the first item
	ld a,[wCurrentMenuItem]
	inc a
	ld b,a
	ld a,[wListScrollOffset] ; index of top (visible) menu item within the list
	add b
	ld [wMenuItemToSwap],a ; ID of item chosen for swapping (counts from 1)
	ld c,20
	call DelayFrames
	jp DisplayListMenuIDLoop
.swapItems
	ld a,[wCurrentMenuItem]
	inc a
	ld b,a
	ld a,[wListScrollOffset]
	add b
	ld b,a
	ld a,[wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	cp b ; is the currently selected item the same as the first item to swap?
	jp z,DisplayListMenuIDLoop ; ignore attempts to swap an item with itself
	dec a
	ld [wMenuItemToSwap],a ; ID of item chosen for swapping (counts from 1)
	ld c,20
	call DelayFrames
	push hl
	push de
	ld hl,wcf8b
	ld a,[hli]
	ld h,[hl]
	ld l,a
	inc hl ; hl = beginning of list entries
	ld d,h
	ld e,l ; de = beginning of list entries
	ld a,[wCurrentMenuItem]
	ld b,a
	ld a,[wListScrollOffset]
	add b
	add a
	ld c,a
	ld b,0
	add hl,bc ; hl = address of currently selected item entry
	ld a,[wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	add a
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry ; de = address of first item to swap
	ld a,[de]
	ld b,a
	ld a,[hli]
	cp b
	jr z,.swapSameItemType
.swapDifferentItems
	ld [$ff95],a ; [$ff95] = second item ID
	ld a,[hld]
	ld [$ff96],a ; [$ff96] = second item quantity
	ld a,[de]
	ld [hli],a ; put first item ID in second item slot
	inc de
	ld a,[de]
	ld [hl],a ; put first item quantity in second item slot
	ld a,[$ff96]
	ld [de],a ; put second item quantity in first item slot
	dec de
	ld a,[$ff95]
	ld [de],a ; put second item ID in first item slot
	xor a
	ld [wMenuItemToSwap],a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop
.swapSameItemType
	inc de
	ld a,[hl]
	ld b,a
	ld a,[de]
	add b ; a = sum of both item quantities
	cp a,100 ; is the sum too big for one item slot?
	jr c,.combineItemSlots
; swap enough items from the first slot to max out the second slot if they can't be combined
	sub a,99
	ld [de],a
	ld a,99
	ld [hl],a
	jr .done
.combineItemSlots
	ld [hl],a ; put the sum in the second item slot
	ld hl,wcf8b
	ld a,[hli]
	ld h,[hl]
	ld l,a
	dec [hl] ; decrease the number of items
	ld a,[hl]
	ld [wd12a],a ; update number of items variable
	cp a,1
	jr nz,.skipSettingMaxMenuItemID
	ld [wMaxMenuItem],a ; if the number of items is only one now, update the max menu item ID
.skipSettingMaxMenuItemID
	dec de
	ld h,d
	ld l,e
	inc hl
	inc hl ; hl = address of item after first item to swap
.moveItemsUpLoop ; erase the first item slot and move up all the following item slots to fill the gap
	ld a,[hli]
	ld [de],a
	inc de
	inc a ; reached the $ff terminator?
	jr z,.afterMovingItemsUp
	ld a,[hli]
	ld [de],a
	inc de
	jr .moveItemsUpLoop
.afterMovingItemsUp
	xor a
	ld [wListScrollOffset],a
	ld [wCurrentMenuItem],a
.done
	xor a
	ld [wMenuItemToSwap],a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop

INCLUDE "engine/overworld/pokemart.asm"

INCLUDE "engine/learn_move.asm"

INCLUDE "engine/overworld/pokecenter.asm"

SetLastBlackoutMap:
; Set the map to return to when
; blacking out or using Teleport or Dig.
; Safari rest houses don't count.

	push hl
	ld hl, SafariZoneRestHouses
	ld a, [W_CURMAP]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .notresthouse
	cp b
	jr nz, .loop
	jr .done

.notresthouse
	ld a, [wLastMap]
	ld [wLastBlackoutMap], a
.done
	pop hl
	ret

SafariZoneRestHouses:
	db SAFARI_ZONE_REST_HOUSE_2
	db SAFARI_ZONE_REST_HOUSE_3
	db SAFARI_ZONE_REST_HOUSE_4
	db -1

; function that performs initialization for DisplayTextID
DisplayTextIDInit: ; 7096 (1:7096)
	xor a
	ld [wListMenuID],a
	ld a,[wAutoTextBoxDrawingControl]
	bit 0,a
	jr nz,.skipDrawingTextBoxBorder
	ld a,[$ff8c] ; text ID (or sprite ID)
	and a
	jr nz,.notStartMenu
; if text ID is 0 (i.e. the start menu)
; Note that the start menu text border is also drawn in the function directly
; below this, so this seems unnecessary.
	ld a,[wd74b]
	bit 5,a ; does the player have the pokedex?
; start menu with pokedex
	hlCoord 10, 0
	ld b,$0e
	ld c,$08
	jr nz,.drawTextBoxBorder
; start menu without pokedex
	hlCoord 10, 0
	ld b,$0c
	ld c,$08
	jr .drawTextBoxBorder
; if text ID is not 0 (i.e. not the start menu) then do a standard dialogue text box
.notStartMenu
	hlCoord 0, 12
	ld b,$04
	ld c,$12
.drawTextBoxBorder
	call TextBoxBorder
.skipDrawingTextBoxBorder
	ld hl,wcfc4
	set 0,[hl]
	ld hl,wFlags_0xcd60
	bit 4,[hl]
	res 4,[hl]
	jr nz,.skipMovingSprites
	call UpdateSprites ; move sprites
.skipMovingSprites
; loop to copy C1X9 (direction the sprite is facing) to C2X9 for each sprite
; this is done because when you talk to an NPC, they turn to look your way
; the original direction they were facing must be restored after the dialogue is over
	ld hl,wSpriteStateData1 + $19
	ld c,$0f
	ld de,$0010
.spriteFacingDirectionCopyLoop
	ld a,[hl]
	inc h
	ld [hl],a
	dec h
	add hl,de
	dec c
	jr nz,.spriteFacingDirectionCopyLoop
; loop to force all the sprites in the middle of animation to stand still
; (so that they don't like they're frozen mid-step during the dialogue)
	ld hl,wSpriteStateData1 + 2
	ld de,$0010
	ld c,e
.spriteStandStillLoop
	ld a,[hl]
	cp a,$ff ; is the sprite visible?
	jr z,.nextSprite
; if it is visible
	and a,$fc
	ld [hl],a
.nextSprite
	add hl,de
	dec c
	jr nz,.spriteStandStillLoop
	ld b,$9c ; window background address
	call CopyScreenTileBufferToVRAM ; transfer background in WRAM to VRAM
	xor a
	ld [hWY],a ; put the window on the screen
	call LoadFontTilePatterns
	ld a,$01
	ld [H_AUTOBGTRANSFERENABLED],a ; enable continuous WRAM to VRAM transfer each V-blank
	ret

; function that displays the start menu
DrawStartMenu: ; 710b (1:710b)
	ld a,[wd74b]
	bit 5,a ; does the player have the pokedex?
; menu with pokedex
	hlCoord 10, 0
	ld b,$0e
	ld c,$08
	jr nz,.drawTextBoxBorder
; shorter menu if the player doesn't have the pokedex
	hlCoord 10, 0
	ld b,$0c
	ld c,$08
.drawTextBoxBorder
	call TextBoxBorder
	ld a,%11001011 ; bit mask for down, up, start, B, and A buttons
	ld [wMenuWatchedKeys],a
	ld a,$02
	ld [wTopMenuItemY],a ; Y position of first menu choice
	ld a,$0b
	ld [wTopMenuItemX],a ; X position of first menu choice
	ld a,[wcc2d] ; remembered menu selection from last time
	ld [wCurrentMenuItem],a
	ld [wLastMenuItem],a
	xor a
	ld [wcc37],a
	ld hl,wd730
	set 6,[hl] ; no pauses between printing each letter
	hlCoord 12, 2
	ld a,[wd74b]
	bit 5,a ; does the player have the pokedex?
; case for not having pokdex
	ld a,$06
	jr z,.storeMenuItemCount
; case for having pokedex
	ld de,StartMenuPokedexText
	call PrintStartMenuItem
	ld a,$07
.storeMenuItemCount
	ld [wMaxMenuItem],a ; number of menu items
	ld de,StartMenuPokemonText
	call PrintStartMenuItem
	ld de,StartMenuItemText
	call PrintStartMenuItem
	ld de,wPlayerName ; player's name
	call PrintStartMenuItem
	ld a,[wd72e]
	bit 6,a ; is the player using the link feature?
; case for not using link feature
	ld de,StartMenuSaveText
	jr z,.printSaveOrResetText
; case for using link feature
	ld de,StartMenuResetText
.printSaveOrResetText
	call PrintStartMenuItem
	ld de,StartMenuOptionText
	call PrintStartMenuItem
	ld de,StartMenuExitText
	call PlaceString
	ld hl,wd730
	res 6,[hl] ; turn pauses between printing letters back on
	ret

StartMenuPokedexText: ; 718f (1:718f)
	db "POKéDEX@"

StartMenuPokemonText: ; 7197 (1:7197)
	db "POKéMON@"

StartMenuItemText: ; 719f (1:719f)
	db "ITEM@"

StartMenuSaveText: ; 71a4 (1:71a4)
	db "SAVE@"

StartMenuResetText: ; 71a9 (1:71a9)
	db "RESET@"

StartMenuExitText: ; 71af (1:71af)
	db "EXIT@"

StartMenuOptionText: ; 71b4 (1:71b4)
	db "OPTION@"

PrintStartMenuItem: ; 71bb (1:71bb)
	push hl
	call PlaceString
	pop hl
	ld de,$28
	add hl,de
	ret

INCLUDE "engine/overworld/cable_club_npc.asm"

; function to draw various text boxes
; INPUT:
; [wd125] = text box ID
DisplayTextBoxID_: ; 72ea (1:72ea)
	ld a,[wd125] ; a = text box ID
	cp a,$14
	jp z,DisplayYesNoTextBox
	ld c,a
	ld hl,TextBoxFunctionTable
	ld de,3
	call SearchTextBoxTable
	jr c,.functionTableMatch
	ld hl,TextBoxCoordTable
	ld de,5
	call SearchTextBoxTable
	jr c,.coordTableMatch
	ld hl,TextBoxTextAndCoordTable
	ld de,9
	call SearchTextBoxTable
	jr c,.textAndCoordTableMatch
.done
	ret
.functionTableMatch
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl = address of function
	ld de,.done
	push de
	jp [hl] ; jump to the function
.coordTableMatch
	call GetTextBoxIDCoords
	call GetAddressOfScreenCoords
	call TextBoxBorder
	ret
.textAndCoordTableMatch
	call GetTextBoxIDCoords
	push hl
	call GetAddressOfScreenCoords
	call TextBoxBorder
	pop hl
	call GetTextBoxIDText
	ld a,[wd730]
	push af
	ld a,[wd730]
	set 6,a ; no pauses between printing each letter
	ld [wd730],a
	call PlaceString
	pop af
	ld [wd730],a
	call UpdateSprites ; move sprites
	ret

; function to search a table terminated with $ff for a byte matching c in increments of de
; sets carry flag if a match is found and clears carry flag if not
SearchTextBoxTable: ; 734c (1:734c)
	dec de
.loop
	ld a,[hli]
	cp a,$ff
	jr z,.notFound
	cp c
	jr z,.found
	add hl,de
	jr .loop
.found
	scf
.notFound
	ret

; function to load coordinates from the TextBoxCoordTable or the TextBoxTextAndCoordTable
; INPUT:
; hl = address of coordinates
; OUTPUT:
; b = height
; c = width
; d = row of upper left corner
; e = column of upper left corner
GetTextBoxIDCoords: ; 735a (1:735a)
	ld a,[hli] ; column of upper left corner
	ld e,a
	ld a,[hli] ; row of upper left corner
	ld d,a
	ld a,[hli] ; column of lower right corner
	sub e
	dec a
	ld c,a     ; c = width
	ld a,[hli] ; row of lower right corner
	sub d
	dec a
	ld b,a     ; b = height
	ret

; function to load a text address and text coordinates from the TextBoxTextAndCoordTable
GetTextBoxIDText: ; 7367 (1:7367)
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a ; de = address of text
	push de ; save text address
	ld a,[hli]
	ld e,a ; column of upper left corner of text
	ld a,[hl]
	ld d,a ; row of upper left corner of text
	call GetAddressOfScreenCoords
	pop de ; restore text address
	ret

; function to point hl to the screen coordinates
; INPUT:
; d = row
; e = column
; OUTPUT:
; hl = address of upper left corner of text box
GetAddressOfScreenCoords: ; 7375 (1:7375)
	push bc
	ld hl,wTileMap
	ld bc,20
.loop ; loop to add d rows to the base address
	ld a,d
	and a
	jr z,.addedRows
	add hl,bc
	dec d
	jr .loop
.addedRows
	pop bc
	add hl,de
	ret

; Format:
; 00: text box ID
; 01-02: function address
TextBoxFunctionTable: ; 7387 (1:7387)
	dbw $13, Func_74ba
	dbw $15, Func_74ea
	dbw $04, Func_76e1
	db $ff ; terminator

; Format:
; 00: text box ID
; 01: column of upper left corner
; 02: row of upper left corner
; 03: column of lower right corner
; 04: row of lower right corner
TextBoxCoordTable: ; 7391 (1:7391)
	db $01,  0, 12, 19, 17
	db $03,  0,  0, 19, 14
	db $07,  0,  0, 11,  6
	db $0d,  4,  2, 19, 12
	db $10,  7,  0, 19, 17
	db $11,  6,  4, 14, 13
	db $ff ; terminator

; Format:
; 00: text box ID
; 01: column of upper left corner
; 02: row of upper left corner
; 03: column of lower right corner
; 04: row of lower right corner
; 05-06: address of text
; 07: column of beginning of text
; 08: row of beginning of text
; table of window positions and corresponding text [key, start column, start row, end column, end row, text pointer [2 bytes], text column, text row]
TextBoxTextAndCoordTable: ; 73b0 (1:73b0)
	db $05 ; text box ID
	db 0,0,14,17   ; text box coordinates
	dw JapaneseMochimonoText
	db 3,0   ; text coordinates

	db $06 ; text box ID
	db 13,10,19,14 ; text box coordinates
	dw UseTossText
	db 15,11 ; text coordinates

	db $08 ; text box ID
	db 0,0,7,5     ; text box coordinates
	dw JapaneseSaveMessageText
	db 2,2   ; text coordinates

	db $09 ; text box ID
	db 0,6,5,10    ; text box coordinates
	dw JapaneseSpeedOptionsText
	db 2,7   ; text coordinates

	db $0b ; text box ID
	db 8,12,19,17  ; text box coordinates
	dw BattleMenuText
	db 10,14 ; text coordinates

	db $1b ; text box ID
	db 0,12,19,17  ; text box coordinates
	dw SafariZoneBattleMenuText
	db 2,14  ; text coordinates

	db $0c ; text box ID
	db 11,11,19,17 ; text box coordinates
	dw SwitchStatsCancelText
	db 13,12 ; text coordinates

	db $0e ; text box ID
	db 0,0,10,6    ; text box coordinates
	dw BuySellQuitText
	db 2,1   ; text coordinates

	db $0f ; text box ID
	db 11,0,19,2   ; text box coordinates
	dw MoneyText
	db 13,0  ; text coordinates

	db $12 ; text box ID
	db 7,6,11,10   ; text box coordinates
	dw JapaneseAhText
	db 8,8   ; text coordinates

	db $1a ; text box ID
	db 11,8,19,17  ; text box coordinates
	dw JapanesePokedexMenu
	db 12,10 ; text coordinates

; note that there is no terminator

BuySellQuitText: ; 7413 (1:7413)
	db   "BUY"
	next "SELL"
	next "QUIT@@"

UseTossText: ; 7422 (1:7422)
	db   "USE"
	next "TOSS@"

JapaneseSaveMessageText: ; 742b (1:742b)
	db   "きろく"
	next "メッセージ@"

JapaneseSpeedOptionsText: ; 7435 (1:7435)
	db   "はやい"
	next "おそい@"

MoneyText: ; 743d (1:743d)
	db "MONEY@"

JapaneseMochimonoText: ; 7443 (1:7443)
	db "もちもの@"

JapaneseMainMenuText: ; 7448 (1:7448)
	db   "つづきから"
	next "さいしょから@"

BattleMenuText: ; 7455 (1:7455)
	db   "FIGHT ",$E1,$E2
	next "ITEM  RUN@"

SafariZoneBattleMenuText: ; 7468 (1:7468)
	db   "BALL×       BAIT"
	next "THROW ROCK  RUN@"

SwitchStatsCancelText: ; 7489 (1:7489)
	db   "SWITCH"
	next "STATS"
	next "CANCEL@"

JapaneseAhText: ; 749d (1:749d)
	db "アッ!@"

JapanesePokedexMenu: ; 74a1 (1:74a1)
	db   "データをみる"
	next "なきごえ"
	next "ぶんぷをみる"
	next "キャンセル@"

Func_74ba: ; 74ba (1:74ba)
	ld hl, wd730
	set 6, [hl]
	ld a, $f
	ld [wd125], a
	call DisplayTextBoxID
	hlCoord 13, 1
	ld b, $1
	ld c, $6
	call ClearScreenArea
	hlCoord 12, 1
	ld de, wPlayerMoney ; wPlayerMoney
	ld c, $a3
	call PrintBCDNumber
	ld hl, wd730
	res 6, [hl]
	ret

CurrencyString: ; 74e2 (1:74e2)
	db "      ¥@"

Func_74ea: ; 74ea (1:74ea)
	ld a, [wd730]
	set 6, a
	ld [wd730], a
	xor a
	ld [wd12d], a
	ld a, $e
	ld [wd125], a
	call DisplayTextBoxID
	ld a, $3
	ld [wMenuWatchedKeys], a ; wMenuWatchedKeys
	ld a, $2
	ld [wMaxMenuItem], a ; wMaxMenuItem
	ld a, $1
	ld [wTopMenuItemY], a ; wTopMenuItemY
	ld a, $1
	ld [wTopMenuItemX], a ; wTopMenuItemX
	xor a
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld [wLastMenuItem], a ; wLastMenuItem
	ld [wcc37], a
	ld a, [wd730]
	res 6, a
	ld [wd730], a
	call HandleMenuInput
	call PlaceUnfilledArrowMenuCursor
	bit 0, a
	jr nz, .asm_7539
	bit 1, a
	jr z, .asm_7539
	ld a, $2
	ld [wd12e], a
	jr .asm_754c
.asm_7539
	ld a, $1
	ld [wd12e], a
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	ld [wd12d], a
	ld b, a
	ld a, [wMaxMenuItem] ; wMaxMenuItem
	cp b
	jr z, .asm_754c
	ret
.asm_754c
	ld a, $2
	ld [wd12e], a
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	ld [wd12d], a
	scf
	ret

DisplayYesNoTextBox: ; 7559 (1:7559)
	push hl
	ld a, [wd730]
	set 6, a
	ld [wd730], a
	xor a
	ld [wd12d], a
	ld [wd12e], a
	ld a, $3
	ld [wMenuWatchedKeys], a ; wMenuWatchedKeys
	ld a, $1
	ld [wMaxMenuItem], a ; wMaxMenuItem
	ld a, b
	ld [wTopMenuItemY], a ; wTopMenuItemY
	ld a, c
	ld [wTopMenuItemX], a ; wTopMenuItemX
	xor a
	ld [wLastMenuItem], a ; wLastMenuItem
	ld [wcc37], a
	push hl
	ld hl, wd12c
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_758d
	inc a
.asm_758d
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	pop hl
	push hl
	push hl
	call Func_763e
	ld a, [wd12c]
	ld hl, MenuStrings ; $7671
	ld e, a
	ld d, $0
	ld a, $5
.loop
	add hl, de
	dec a
	jr nz, .loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld e, l
	ld d, h
	pop hl
	push de
	ld a, [wd12c]
	cp $5
	jr nz, .asm_75b9
	call Func_5ab3
	jr .asm_75bc
.asm_75b9
	call TextBoxBorder
.asm_75bc
	call UpdateSprites
	pop hl
	ld a, [hli]
	and a
	ld bc, $16
	jr z, .asm_75ca
	ld bc, $2a
.asm_75ca
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	add hl, bc
	call PlaceString
	ld hl, wd730
	res 6, [hl]
	ld a, [wd12c]
	cp $7
	jr nz, .asm_7603
	xor a
	ld [wd12c], a
	ld a, [wFlags_0xcd60]
	push af
	push hl
	ld hl, wFlags_0xcd60
	bit 5, [hl]
	set 5, [hl]
	pop hl
.asm_75f0
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_75f0
	pop af
	pop hl
	ld [wFlags_0xcd60], a
	ld a, (SFX_02_40 - SFX_Headers_02) / 3
	call PlaySound
	jr .asm_760f
.asm_7603
	xor a
	ld [wd12c], a
	call HandleMenuInput
	pop hl
	bit 1, a
	jr nz, .asm_7627
.asm_760f
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
	ld [wd12d], a
	and a
	jr nz, .asm_7627
	ld a, $1
	ld [wd12e], a
	ld c, $f
	call DelayFrames
	call Func_7656
	and a
	ret
.asm_7627
	ld a, $1
	ld [wCurrentMenuItem], a ; wCurrentMenuItem
	ld [wd12d], a
	ld a, $2
	ld [wd12e], a
	ld c, $f
	call DelayFrames
	call Func_7656
	scf
	ret

Func_763e: ; 763e (1:763e)
	ld de, wHPBarMaxHP
	ld bc, $506
.asm_7644
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7644
	push bc
	ld bc, $e
	add hl, bc
	pop bc
	ld c, $6
	dec b
	jr nz, .asm_7644
	ret

Func_7656: ; 7656 (1:7656)
	ld de, wHPBarMaxHP
	ld bc, $506
.asm_765c
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_765c
	push bc
	ld bc, $e
	add hl, bc
	pop bc
	ld c, $6
	dec b
	jr nz, .asm_765c
	call UpdateSprites
	ret

MenuStrings: ; 7671 (1:7671)
	db 4,3,0
	dw .YesNoMenu
	db 6,3,0
	dw .NorthWestMenu
	db 6,3,0
	dw .SouthEastMenu
	db 6,3,0
	dw .YesNoMenu
	db 6,3,0
	dw .NorthEastMenu
	db 7,3,0
	dw .TradeCancelMenu
	db 7,4,1
	dw .HealCancelMenu
	db 4,3,0
	dw .NoYesMenu

.NoYesMenu ; 7699 (1:3699)
	db "NO",$4E,"YES@"
.YesNoMenu ; 76a0 (1:36a0)
	db "YES",$4E,"NO@"
.NorthWestMenu ; 76a7 (1:36a7)
	db "NORTH",$4E,"WEST@"
.SouthEastMenu ; 76b2 (1:36b2)
	db "SOUTH",$4E,"EAST@"
.NorthEastMenu ; 76bd (1:36bd)
	db "NORTH",$4E,"EAST@"
.TradeCancelMenu ; 76c8 (1:36c8)
	db "TRADE",$4E,"CANCEL@"
.HealCancelMenu ; 76d5 (1:36d5)
	db "HEAL",$4E,"CANCEL@"

Func_76e1: ; 76e1 (1:36e1)
	xor a
	ld hl, wWhichTrade ; wWhichTrade
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], $c
	call GetMonFieldMoves
	ld a, [wTrainerScreenX]
	and a
	jr nz, .asm_770f
	hlCoord 11, 11
	ld b, $5
	ld c, $7
	call TextBoxBorder
	call UpdateSprites
	ld a, $c
	ld [$fff7], a
	hlCoord 13, 12
	ld de, PokemonMenuEntries ; $77c2
	jp PlaceString
.asm_770f
	push af
	hlCoord 0, 11
	ld a, [wcd42]
	dec a
	ld e, a
	ld d, $0
	add hl, de
	ld b, $5
	ld a, $12
	sub e
	ld c, a
	pop af
	ld de, $ffd8
.asm_7725
	add hl, de
	inc b
	inc b
	dec a
	jr nz, .asm_7725
	ld de, $ffec
	add hl, de
	inc b
	call TextBoxBorder
	call UpdateSprites
	hlCoord 0, 12
	ld a, [wcd42]
	inc a
	ld e, a
	ld d, $0
	add hl, de
	ld de, $ffd8
	ld a, [wTrainerScreenX]
.asm_7747
	add hl, de
	dec a
	jr nz, .asm_7747
	xor a
	ld [wTrainerScreenX], a
	ld de, wWhichTrade ; wWhichTrade
.asm_7752
	push hl
	ld hl, FieldMoveNames ; $778d
	ld a, [de]
	and a
	jr z, .asm_7776
	inc de
	ld b, a
.asm_775c
	dec b
	jr z, .asm_7766
.asm_775f
	ld a, [hli]
	cp $50
	jr nz, .asm_775f
	jr .asm_775c
.asm_7766
	ld b, h
	ld c, l
	pop hl
	push de
	ld d, b
	ld e, c
	call PlaceString
	ld bc, $28
	add hl, bc
	pop de
	jr .asm_7752
.asm_7776
	pop hl
	ld a, [wcd42]
	ld [$fff7], a
	hlCoord 0, 12
	ld a, [wcd42]
	inc a
	ld e, a
	ld d, $0
	add hl, de
	ld de, PokemonMenuEntries ; $77c2
	jp PlaceString

FieldMoveNames: ; 778d (1:778d)
	db "CUT@"
	db "FLY@"
	db "@"
	db "SURF@"
	db "STRENGTH@"
	db "FLASH@"
	db "DIG@"
	db "TELEPORT@"
	db "SOFTBOILED@"

PokemonMenuEntries: ; 77c2 (1:77c2)
	db   "STATS"
	next "SWITCH"
	next "CANCEL@"

GetMonFieldMoves: ; 77d6 (1:77d6)
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld hl, wPartyMon1Moves ; wPartyMon1Moves
	ld bc, $2c
	call AddNTimes
	ld d, h
	ld e, l
	ld c, $5
	ld hl, wWhichTrade ; wWhichTrade
.asm_77e9
	push hl
.asm_77ea
	dec c
	jr z, .asm_7821
	ld a, [de] ; de is RAM address of move
	and a
	jr z, .asm_7821
	ld b, a
	inc de ; go to next move
	ld hl, FieldMoveDisplayData ; $7823
.asm_77f6
	ld a, [hli]
	cp $ff
	jr z, .asm_77ea
	cp b
	jr z, .asm_7802
	inc hl
	inc hl
	jr .asm_77f6
.asm_7802
	ld a, b
	ld [wcd43], a
	ld a, [hli]
	ld b, [hl]
	pop hl
	ld [hli], a
	ld a, [wTrainerScreenX]
	inc a
	ld [wTrainerScreenX], a
	ld a, [wcd42]
	cp b
	jr c, .asm_781b
	ld a, b
	ld [wcd42], a
.asm_781b
	ld a, [wcd43]
	ld b, a
	jr .asm_77e9
.asm_7821
	pop hl
	ret

; Format: [Move id], [list priority], [leftmost tile]
; Move id = id of move
; List priority = lower number means higher priority when field moves are displayed
;                 these priorities must be unique
; Leftmost tile = -1 + tile column in which the first letter of the move's name should be displayed
;                 "SOFTBOILED" is $08 because it has 4 more letters than "SURF", for example, whose value is $0C
FieldMoveDisplayData: ; 7823 (1:7823)
	db CUT, $01, $0C
	db FLY, $02, $0C
	db $B4, $03, $0C ; unused field move
	db SURF, $04, $0C
	db STRENGTH, $05, $0A
	db FLASH, $06, $0C
	db DIG, $07, $0C
	db TELEPORT, $08, $0A
	db SOFTBOILED, $09, $08
	db $ff ; list terminator


INCLUDE "engine/battle/1.asm"

INCLUDE "engine/menu/players_pc.asm"

_RemovePokemon: ; 7b68 (1:7b68)
	ld hl, wPartyCount ; wPartyCount
	ld a, [wcf95]
	and a
	jr z, .asm_7b74
	ld hl, W_NUMINBOX ; wda80
.asm_7b74
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld c, a
	ld b, $0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.asm_7b81
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .asm_7b81
	ld hl, wPartyMonOT ; wd273
	ld d, $5
	ld a, [wcf95]
	and a
	jr z, .asm_7b97
	ld hl, wBoxMonOT
	ld d, $13
.asm_7b97
	ld a, [wWhichPokemon] ; wWhichPokemon
	call SkipFixedLengthTextEntries
	ld a, [wWhichPokemon] ; wWhichPokemon
	cp d
	jr nz, .asm_7ba6
	ld [hl], $ff
	ret
.asm_7ba6
	ld d, h
	ld e, l
	ld bc, $b
	add hl, bc
	ld bc, wPartyMonNicks ; wPartyMonNicks
	ld a, [wcf95]
	and a
	jr z, .asm_7bb8
	ld bc, wBoxMonNicks
.asm_7bb8
	call CopyDataUntil
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wcf95]
	and a
	jr z, .asm_7bcd
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1
.asm_7bcd
	ld a, [wWhichPokemon] ; wWhichPokemon
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wcf95]
	and a
	jr z, .asm_7be4
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc
	ld bc, wBoxMonOT
	jr .asm_7beb
.asm_7be4
	ld bc, wPartyMon2 - wPartyMon1
	add hl, bc
	ld bc, wPartyMonOT ; wd273
.asm_7beb
	call CopyDataUntil
	ld hl, wPartyMonNicks ; wPartyMonNicks
	ld a, [wcf95]
	and a
	jr z, .asm_7bfa
	ld hl, wBoxMonNicks
.asm_7bfa
	ld bc, $b
	ld a, [wWhichPokemon] ; wWhichPokemon
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, $b
	add hl, bc
	ld bc, wPokedexOwned ; wPokedexOwned
	ld a, [wcf95]
	and a
	jr z, .asm_7c15
	ld bc, wBoxMonNicksEnd
.asm_7c15
	jp CopyDataUntil

Func_7c18: ; 7c18 (1:7c18)
	ld hl, wd730
	set 6, [hl]
	predef ShowPokedexData
	ld hl, wd730
	res 6, [hl]
	call ReloadMapData
	ld c, $a
	call DelayFrames
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexSeen
	predef FlagActionPredef
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret


SECTION "bank3",ROMX,BANK[$3]

INCLUDE "engine/joypad.asm"

INCLUDE "data/map_songs.asm"

INCLUDE "data/map_header_banks.asm"

ClearVariablesAfterLoadingMapData: ; c335 (3:4335)
	ld a, $90
	ld [hWY], a
	ld [rWY], a
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld [wStepCounter], a
	ld [W_LONEATTACKNO], a ; W_GYMLEADERNO
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [hJoyHeld], a
	ld [wcd6a], a
	ld [wd5a3], a
	ld hl, wCardKeyDoorY
	ld [hli], a
	ld [hl], a
	ld hl, wWhichTrade
	ld bc, $1e
	call FillMemory
	ret

; only used for setting bit 2 of wd736 upon entering a new map
IsPlayerStandingOnWarp: ; c35f (3:435f)
	ld a, [wNumberOfWarps]
	and a
	ret z
	ld c, a
	ld hl, wWarpEntries
.loop
	ld a, [W_YCOORD]
	cp [hl]
	jr nz, .nextWarp1
	inc hl
	ld a, [W_XCOORD]
	cp [hl]
	jr nz, .nextWarp2
	inc hl
	ld a, [hli] ; target warp
	ld [wDestinationWarpID], a
	ld a, [hl] ; target map
	ld [$ff8b], a
	ld hl, wd736
	set 2, [hl] ; standing on warp flag
	ret
.nextWarp1
	inc hl
.nextWarp2
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

CheckForceBikeOrSurf: ; c38b (3:438b)
	ld hl, wd732
	bit 5, [hl]
	ret nz
	ld hl, ForcedBikeOrSurfMaps
	ld a, [W_YCOORD]
	ld b, a
	ld a, [W_XCOORD]
	ld c, a
	ld a, [W_CURMAP]
	ld d, a
.loop
	ld a, [hli]
	cp $ff
	ret z ;if we reach FF then it's not part of the list
	cp d ;compare to current map
	jr nz, .incorrectMap
	ld a, [hli]
	cp b ;compare y-coord
	jr nz, .incorrectY
	ld a, [hli]
	cp c ;compare x-coord
	jr nz, .loop ; incorrect x-coord, check next item
	ld a, [W_CURMAP]
	cp SEAFOAM_ISLANDS_4
	ld a, $2
	ld [W_SEAFOAMISLANDS4CURSCRIPT], a
	jr z, .forceSurfing
	ld a, [W_CURMAP]
	cp SEAFOAM_ISLANDS_5
	ld a, $2
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	jr z, .forceSurfing
	;force bike riding
	ld hl, wd732
	set 5, [hl]
	ld a, $1
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf
.incorrectMap
	inc hl
.incorrectY
	inc hl
	jr .loop
.forceSurfing
	ld a, $2
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf

INCLUDE "data/force_bike_surf.asm"

IsPlayerFacingEdgeOfMap: ; c3ff (3:43ff)
	push hl
	push de
	push bc
	ld a, [wSpriteStateData1 + 9] ; player sprite's facing direction
	srl a
	ld c, a
	ld b, $0
	ld hl, .functionPointerTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [W_YCOORD]
	ld b, a
	ld a, [W_XCOORD]
	ld c, a
	ld de, .asm_c41e
	push de
	jp [hl]
.asm_c41e
	pop bc
	pop de
	pop hl
	ret

.functionPointerTable
	dw .facingDown
	dw .facingUp
	dw .facingLeft
	dw .facingRight

.facingDown
	ld a, [W_CURMAPHEIGHT]
	add a
	dec a
	cp b
	jr z, .setCarry
	jr .resetCarry

.facingUp
	ld a, b
	and a
	jr z, .setCarry
	jr .resetCarry

.facingLeft
	ld a, c
	and a
	jr z, .setCarry
	jr .resetCarry

.facingRight
	ld a, [W_CURMAPWIDTH]
	add a
	dec a
	cp c
	jr z, .setCarry
	jr .resetCarry
.resetCarry
	and a
	ret
.setCarry
	scf
	ret

IsWarpTileInFrontOfPlayer: ; c44e (3:444e)
	push hl
	push de
	push bc
	call _GetTileAndCoordsInFrontOfPlayer
	ld a, [W_CURMAP]
	cp SS_ANNE_5
	jr z, .ssAnne5
	ld a, [wSpriteStateData1 + 9] ; player sprite's facing direction
	srl a
	ld c, a
	ld b, 0
	ld hl, .warpTileListPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTileInFrontOfPlayer]
	ld de, $1
	call IsInArray
.done
	pop bc
	pop de
	pop hl
	ret

.warpTileListPointers: ; c477 (3:4477)
	dw .facingDownWarpTiles
	dw .facingUpWarpTiles
	dw .facingLeftWarpTiles
	dw .facingRightWarpTiles

.facingDownWarpTiles
	db $01,$12,$17,$3D,$04,$18,$33,$FF

.facingUpWarpTiles
	db $01,$5C,$FF

.facingLeftWarpTiles
	db $1A,$4B,$FF

.facingRightWarpTiles
	db $0F,$4E,$FF

.ssAnne5
	ld a, [wTileInFrontOfPlayer]
	cp $15
	jr nz, .notSSAnne5Warp
	scf
	jr .done
.notSSAnne5Warp
	and a
	jr .done

IsPlayerStandingOnDoorTileOrWarpTile: ; c49d (3:449d)
	push hl
	push de
	push bc
	callba IsPlayerStandingOnDoorTile
	jr c, .done
	ld a, [W_CURMAPTILESET]
	add a
	ld c, a
	ld b, $0
	ld hl, WarpTileIDPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $1
	aCoord 8, 9
	call IsInArray
	jr nc, .done
	ld hl, wd736
	res 2, [hl]
.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/warp_tile_ids.asm"

PrintSafariZoneSteps: ; c52f (3:452f)
	ld a, [W_CURMAP] ; W_CURMAP
	cp SAFARI_ZONE_EAST
	ret c
	cp UNKNOWN_DUNGEON_2
	ret nc
	ld hl, wTileMap
	ld b, $3
	ld c, $7
	call TextBoxBorder
	hlCoord 1, 1
	ld de, wSafariSteps ; wd70d
	ld bc, $203
	call PrintNumber
	hlCoord 4, 1
	ld de, SafariSteps ; $4579
	call PlaceString
	hlCoord 1, 3
	ld de, SafariBallText
	call PlaceString
	ld a, [W_NUMSAFARIBALLS] ; W_NUMSAFARIBALLS
	cp $a
	jr nc, .asm_c56d
	hlCoord 5, 3
	ld a, $7f
	ld [hl], a
.asm_c56d
	hlCoord 6, 3
	ld de, W_NUMSAFARIBALLS ; W_NUMSAFARIBALLS
	ld bc, $102
	jp PrintNumber

SafariSteps: ; c579 (3:4579)
	db "/500@"

SafariBallText: ; c57e (3:457e)
	db "BALL×× @"

GetTileAndCoordsInFrontOfPlayer: ; c586 (3:4586)
	call GetPredefRegisters

_GetTileAndCoordsInFrontOfPlayer: ; c589 (3:4589)
	ld a, [W_YCOORD]
	ld d, a
	ld a, [W_XCOORD]
	ld e, a
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	and a
	jr nz, .notFacingDown
; facing down
	aCoord 8, 11
	inc d
	jr .storeTile
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	aCoord 8, 7
	dec d
	jr .storeTile
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	aCoord 6, 9
	dec e
	jr .storeTile
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	jr nz, .storeTile
; facing right
	aCoord 10, 9
	inc e
.storeTile
	ld c, a
	ld [wTileInFrontOfPlayer], a
	ret

GetTileTwoStepsInFrontOfPlayer: ; c5be (3:45be)
	xor a
	ld [$ffdb], a
	ld hl, W_YCOORD
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	and a
	jr nz, .notFacingDown
; facing down
	ld hl, $ffdb
	set 0, [hl]
	aCoord 8, 13
	inc d
	jr .storeTile
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	ld hl, $ffdb
	set 1, [hl]
	aCoord 8, 5
	dec d
	jr .storeTile
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	ld hl, $ffdb
	set 2, [hl]
	aCoord 4, 9
	dec e
	jr .storeTile
.notFacingLeft
	cp SPRITE_FACING_RIGHT
	jr nz, .storeTile
; facing right
	ld hl, $ffdb
	set 3, [hl]
	aCoord 12, 9
	inc e
.storeTile
	ld c, a
	ld [wTileInFrontOfBoulderAndBoulderCollisionResult], a
	ld [wTileInFrontOfPlayer], a
	ret

CheckForCollisionWhenPushingBoulder: ; c60b (3:460b)
	call GetTileTwoStepsInFrontOfPlayer
	ld hl, W_TILESETCOLLISIONPTR
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [hli]
	cp $ff
	jr z, .done ; if the tile two steps ahead is not passable
	cp c
	jr nz, .loop
	ld hl, TilePairCollisionsLand
	call CheckForTilePairCollisions2
	ld a, $ff
	jr c, .done ; if there is an elevation difference between the current tile and the one two steps ahead
	ld a, [wTileInFrontOfBoulderAndBoulderCollisionResult]
	cp $15 ; stairs tile
	ld a, $ff
	jr z, .done ; if the tile two steps ahead is stairs
	call CheckForBoulderCollisionWithSprites
.done
	ld [wTileInFrontOfBoulderAndBoulderCollisionResult], a
	ret

; sets a to $ff if there is a collision and $00 if there is no collision
CheckForBoulderCollisionWithSprites: ; c636 (3:4636)
	ld a, [wBoulderSpriteIndex]
	dec a
	swap a
	ld d, 0
	ld e, a
	ld hl, wSpriteStateData2 + $14
	add hl, de
	ld a, [hli] ; map Y position
	ld [$ffdc], a
	ld a, [hl] ; map X position
	ld [$ffdd], a
	ld a, [W_NUMSPRITES]
	ld c, a
	ld de, $f
	ld hl, wSpriteStateData2 + $14
	ld a, [$ffdb]
	and $3 ; facing up or down?
	jr z, .pushingHorizontallyLoop
.pushingVerticallyLoop
	inc hl
	ld a, [$ffdd]
	cp [hl]
	jr nz, .nextSprite1 ; if X coordinates don't match
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [$ffdb]
	rrca
	jr c, .pushingDown
; pushing up
	ld a, [$ffdc]
	dec a
	jr .compareYCoords
.pushingDown
	ld a, [$ffdc]
	inc a
.compareYCoords
	cp b
	jr z, .failure
.nextSprite1
	dec c
	jr z, .success
	add hl, de
	jr .pushingVerticallyLoop
.pushingHorizontallyLoop
	ld a, [hli]
	ld b, a
	ld a, [$ffdc]
	cp b
	jr nz, .nextSprite2
	ld b, [hl]
	ld a, [$ffdb]
	bit 2, a
	jr nz, .pushingLeft
; pushing right
	ld a, [$ffdd]
	inc a
	jr .compareXCoords
.pushingLeft
	ld a, [$ffdd]
	dec a
.compareXCoords
	cp b
	jr z, .failure
.nextSprite2
	dec c
	jr z, .success
	add hl, de
	jr .pushingHorizontallyLoop
.failure
	ld a, $ff
	ret
.success
	xor a
	ret

ApplyOutOfBattlePoisonDamage: ; c69c (3:469c)
	ld a, [wd730]
	add a
	jp c, .noBlackOut ; no black out if joypad states are being simulated
	ld a, [wPartyCount]
	and a
	jp z, .noBlackOut
	call IncrementDayCareMonExp
	ld a, [wStepCounter]
	and $3 ; is the counter a multiple of 4?
	jp nz, .noBlackOut ; only apply poison damage every fourth step
	ld [wWhichPokemon], a
	ld hl, wPartyMon1Status
	ld de, wPartySpecies
.applyDamageLoop
	ld a, [hl]
	and (1 << PSN)
	jr z, .nextMon2 ; not poisoned
	dec hl
	dec hl
	ld a, [hld]
	ld b, a
	ld a, [hli]
	or b
	jr z, .nextMon ; already fainted
; subtract 1 from HP
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .noBorrow
; borrow 1 from upper byte of HP
	dec [hl]
	inc hl
	jr .nextMon
.noBorrow
	ld a, [hli]
	or [hl]
	jr nz, .nextMon ; didn't faint from damage
; the mon fainted from the damage
	push hl
	inc hl
	inc hl
	ld [hl], a
	ld a, [de]
	ld [wd11e], a
	push de
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	xor a
	ld [wJoyIgnore], a
	call EnableAutoTextBoxDrawing
	ld a, $d0
	ld [$ff8c], a
	call DisplayTextID
	pop de
	pop hl
.nextMon
	inc hl
	inc hl
.nextMon2
	inc de
	ld a, [de]
	inc a
	jr z, .applyDamageLoopDone
	ld bc, wPartyMon2 - wPartyMon1
	add hl, bc
	push hl
	ld hl, wWhichPokemon
	inc [hl]
	pop hl
	jr .applyDamageLoop
.applyDamageLoopDone
	ld hl, wPartyMon1Status
	ld a, [wPartyCount]
	ld d, a
	ld e, 0
.countPoisonedLoop
	ld a, [hl]
	and (1 << PSN)
	or e
	ld e, a
	ld bc, wPartyMon2 - wPartyMon1
	add hl, bc
	dec d
	jr nz, .countPoisonedLoop
	ld a, e
	and a ; are any party members poisoned?
	jr z, .skipPoisonEffectAndSound
	ld b, $2
	predef ChangeBGPalColor0_4Frames ; change BG white to dark grey for 4 frames
	ld a, (SFX_02_43 - SFX_Headers_02) / 3
	call PlaySound
.skipPoisonEffectAndSound
	predef AnyPartyAlive
	ld a, d
	and a
	jr nz, .noBlackOut
	call EnableAutoTextBoxDrawing
	ld a, $d1
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd72e
	set 5, [hl]
	ld a, $ff
	jr .done
.noBlackOut
	xor a
.done
	ld [wd12d], a
	ret

LoadTilesetHeader: ; c754 (3:4754)
	call GetPredefRegisters
	push hl
	ld d, 0
	ld a, [W_CURMAPTILESET]
	add a
	add a
	ld b, a
	add a
	add b ; a = tileset * 12
	jr nc, .noCarry
	inc d
.noCarry
	ld e, a
	ld hl, Tilesets
	add hl, de
	ld de, W_TILESETBANK
	ld c, $b
.copyTilesetHeaderLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyTilesetHeaderLoop
	ld a, [hl]
	ld [hTilesetType], a
	xor a
	ld [$ffd8], a
	pop hl
	ld a, [W_CURMAPTILESET]
	push hl
	push de
	ld hl, DungeonTilesets
	ld de, $1
	call IsInArray
	pop de
	pop hl
	jr c, .asm_c797
	ld a, [W_CURMAPTILESET]
	ld b, a
	ld a, [$ff8b]
	cp b
	jr z, .done
.asm_c797
	ld a, [wDestinationWarpID]
	cp $ff
	jr z, .done
	call LoadDestinationWarpPosition
	ld a, [W_YCOORD]
	and $1
	ld [W_YBLOCKCOORD], a
	ld a, [W_XCOORD]
	and $1
	ld [W_XBLOCKCOORD], a
.done
	ret

INCLUDE "data/dungeon_tilesets.asm"

INCLUDE "data/tileset_headers.asm"

IncrementDayCareMonExp: ; c8de (3:48de)
	ld a, [W_DAYCARE_IN_USE]
	and a
	ret z
	ld hl, wDayCareMonExp + 2
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ld a, [hl]
	cp $50
	ret c
	ld a, $50
	ld [hl], a
	ret

INCLUDE "data/hide_show_data.asm"

PrintStrengthTxt: ; cd99 (3:4d99)
	ld hl, wd728
	set 0, [hl]
	ld hl, UsedStrengthText
	call PrintText
	ld hl, CanMoveBouldersText
	jp PrintText

UsedStrengthText: ; cdaa (3:4daa)
	TX_FAR _UsedStrengthText
	db $08 ; asm
	ld a, [wcf91]
	call PlayCry
	call Delay3
	jp TextScriptEnd

CanMoveBouldersText: ; cdbb (3:4dbb)
	TX_FAR _CanMoveBouldersText
	db "@"

CheckForForcedBikeSurf: ; cdc0 (3:4dc0)
	ld hl, wd728
	set 1, [hl]
	ld a, [wd732]
	bit 5, a
	jr nz, .asm_cdec
	ld a, [W_CURMAP] ; W_CURMAP
	cp SEAFOAM_ISLANDS_5
	ret nz
	ld a, [wd881]
	and $3
	cp $3
	ret z
	ld hl, CoordsData_cdf7 ; $4df7
	call ArePlayerCoordsInArray
	ret nc
	ld hl, wd728
	res 1, [hl]
	ld hl, CurrentTooFastText
	jp PrintText
.asm_cdec
	ld hl, wd728
	res 1, [hl]
	ld hl, CyclingIsFunText
	jp PrintText

CoordsData_cdf7: ; cdf7 (3:4df7)
	db $0B,$07,$FF

CurrentTooFastText: ; cdfa (3:4dfa)
	TX_FAR _CurrentTooFastText
	db "@"

CyclingIsFunText: ; cdff (3:4dff)
	TX_FAR _CyclingIsFunText
	db "@"

; function to add an item (in varying quantities) to the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wcf91] = item ID
; [wcf96] = item quantity
; sets carry flag if successful, unsets carry flag if unsuccessful
AddItemToInventory_: ; ce04 (3:4e04)
	ld a,[wcf96] ; a = item quantity
	push af
	push bc
	push de
	push hl
	push hl
	ld d,50 ; PC box can hold 50 items
	ld a,wNumBagItems & $FF
	cp l
	jr nz,.checkIfInventoryFull
	ld a,wNumBagItems >> 8
	cp h
	jr nz,.checkIfInventoryFull
; if the destination is the bag
	ld d,20 ; bag can hold 20 items
.checkIfInventoryFull
	ld a,[hl]
	sub d
	ld d,a
	ld a,[hli]
	and a
	jr z,.addNewItem
.loop
	ld a,[hli]
	ld b,a ; b = ID of current item in table
	ld a,[wcf91] ; a = ID of item being added
	cp b ; does the current item in the table match the item being added?
	jp z,.increaseItemQuantity ; if so, increase the item's quantity
	inc hl
	ld a,[hl]
	cp a,$ff ; is it the end of the table?
	jr nz,.loop
.addNewItem ; add an item not yet in the inventory
	pop hl
	ld a,d
	and a ; is there room for a new item slot?
	jr z,.done
; if there is room
	inc [hl] ; increment the number of items in the inventory
	ld a,[hl] ; the number of items will be the index of the new item
	add a
	dec a
	ld c,a
	ld b,0
	add hl,bc ; hl = address to store the item
	ld a,[wcf91]
	ld [hli],a ; store item ID
	ld a,[wcf96]
	ld [hli],a ; store item quantity
	ld [hl],$ff ; store terminator
	jp .success
.increaseItemQuantity ; increase the quantity of an item already in the inventory
	ld a,[wcf96]
	ld b,a ; b = quantity to add
	ld a,[hl] ; a = existing item quantity
	add b ; a = new item quantity
	cp a,100
	jp c,.storeNewQuantity ; if the new quantity is less than 100, store it
; if the new quantity is greater than or equal to 100,
; try to max out the current slot and add the rest in a new slot
	sub a,99
	ld [wcf96],a ; a = amount left over (to put in the new slot)
	ld a,d
	and a ; is there room for a new item slot?
	jr z,.increaseItemQuantityFailed
; if so, store 99 in the current slot and store the rest in a new slot
	ld a,99
	ld [hli],a
	jp .loop
.increaseItemQuantityFailed
	pop hl
	and a
	jr .done
.storeNewQuantity
	ld [hl],a
	pop hl
.success
	scf
.done
	pop hl
	pop de
	pop bc
	pop bc
	ld a,b
	ld [wcf96],a ; restore the initial value from when the function was called
	ret

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wWhichPokemon] = index (within the inventory) of the item to remove
; [wcf96] = quantity to remove
RemoveItemFromInventory_: ; ce74 (3:4e74)
	push hl
	inc hl
	ld a,[wWhichPokemon] ; index (within the inventory) of the item being removed
	sla a
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	inc hl
	ld a,[wcf96] ; quantity being removed
	ld e,a
	ld a,[hl] ; a = current quantity
	sub e
	ld [hld],a ; store new quantity
	ld [wcf97],a
	and a
	jr nz,.skipMovingUpSlots
; if the remaining quantity is 0,
; remove the emptied item slot and move up all the following item slots
.moveSlotsUp
	ld e,l
	ld d,h
	inc de
	inc de ; de = address of the slot following the emptied one
.loop ; loop to move up the following slots
	ld a,[de]
	inc de
	ld [hli],a
	cp a,$ff
	jr nz,.loop
; update menu info
	xor a
	ld [wListScrollOffset],a
	ld [wCurrentMenuItem],a
	ld [wcc2c],a
	ld [wd07e],a
	pop hl
	ld a,[hl] ; a = number of items in inventory
	dec a ; decrement the number of items
	ld [hl],a ; store new number of items
	ld [wd12a],a
	cp a,2
	jr c,.done
	ld [wMaxMenuItem],a
	jr .done
.skipMovingUpSlots
	pop hl
.done
	ret

; wild pokemon data: from 4EB8 to 55C7

LoadWildData: ; ceb8 (3:4eb8)
	ld hl,WildDataPointers
	ld a,[W_CURMAP]

	; get wild data for current map
	ld c,a
	ld b,0
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a       ; hl now points to wild data for current map
	ld a,[hli]
	ld [W_GRASSRATE],a
	and a
	jr z,.NoGrassData ; if no grass data, skip to surfing data
	push hl
	ld de,W_GRASSMONS ; otherwise, load grass data
	ld bc,$0014
	call CopyData
	pop hl
	ld bc,$0014
	add hl,bc
.NoGrassData
	ld a,[hli]
	ld [W_WATERRATE],a
	and a
	ret z        ; if no water data, we're done
	ld de,W_WATERMONS  ; otherwise, load surfing data
	ld bc,$0014
	jp CopyData

INCLUDE "data/wild_mons.asm"

INCLUDE "engine/items/items.asm"

DrawBadges: ; ea03 (3:6a03)
; Draw 4x2 gym leader faces, with the faces replaced by
; badges if they are owned. Used in the player status screen.

; In Japanese versions, names are displayed above faces.
; Instead of removing relevant code, the name graphics were erased.

; Tile ids for face/badge graphics.
	ld de, wTrainerFacingDirection
	ld hl, .FaceBadgeTiles
	ld bc, 8
	call CopyData

; Booleans for each badge.
	ld hl, wcd49
	ld bc, 8
	xor a
	call FillMemory

; Alter these based on owned badges.
	ld de, wcd49
	ld hl, wTrainerFacingDirection
	ld a, [W_OBTAINEDBADGES]
	ld b, a
	ld c, 8
.CheckBadge
	srl b
	jr nc, .NextBadge
	ld a, [hl]
	add 4 ; Badge graphics are after each face
	ld [hl], a
	ld a, 1
	ld [de], a
.NextBadge
	inc hl
	inc de
	dec c
	jr nz, .CheckBadge

; Draw two rows of badges.
	ld hl, wWhichTrade
	ld a, $d8 ; [1]
	ld [hli], a
	ld [hl], $60 ; First name

	hlCoord 2, 11
	ld de, wcd49
	call .DrawBadgeRow

	hlCoord 2, 14
	ld de, wcd49 + 4
;	call .DrawBadgeRow
;	ret

.DrawBadgeRow ; ea4c (3:6a4c)
; Draw 4 badges.

	ld c, 4
.DrawBadge
	push de
	push hl

; Badge no.
	ld a, [wWhichTrade]
	ld [hli], a
	inc a
	ld [wWhichTrade], a

; Names aren't printed if the badge is owned.
	ld a, [de]
	and a
	ld a, [wTrainerEngageDistance]
	jr nz, .SkipName
	call .PlaceTiles
	jr .PlaceBadge

.SkipName
	inc a
	inc a
	inc hl

.PlaceBadge
	ld [wTrainerEngageDistance], a
	ld de, 20 - 1
	add hl, de
	ld a, [wTrainerFacingDirection]
	call .PlaceTiles
	add hl, de
	call .PlaceTiles

; Shift badge array back one byte.
	push bc
	ld hl, wTrainerFacingDirection + 1
	ld de, wTrainerFacingDirection
	ld bc, 8
	call CopyData
	pop bc

	pop hl
	ld de, 4
	add hl, de

	pop de
	inc de
	dec c
	jr nz, .DrawBadge
	ret

.PlaceTiles
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ret

.FaceBadgeTiles
	db $20, $28, $30, $38, $40, $48, $50, $58

GymLeaderFaceAndBadgeTileGraphics: ; ea9e (3:6a9e)
	INCBIN "gfx/badges.2bpp"

; replaces a tile block with the one specified in [wNewTileBlockID]
; and redraws the map view if necessary
; b = Y
; c = X
ReplaceTileBlock: ; ee9e (3:6e9e)
	call GetPredefRegisters
	ld hl, wOverworldMap
	ld a, [W_CURMAPWIDTH]
	add $6
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	add hl, de
	ld e, $3
	add hl, de
	ld e, a
	ld a, b
	and a
	jr z, .addX
; add width * Y
.addWidthYTimesLoop
	add hl, de
	dec b
	jr nz, .addWidthYTimesLoop
.addX
	add hl, bc ; add X
	ld a, [wNewTileBlockID]
	ld [hl], a
	ld a, [wCurrentTileBlockMapViewPointer]
	ld c, a
	ld a, [wCurrentTileBlockMapViewPointer + 1]
	ld b, a
	call CompareHLWithBC
	ret c ; return if the replaced tile block is below the map view in memory
	push hl
	ld l, e
	ld h, $0
	ld e, $6
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	pop bc
	call CompareHLWithBC
	ret c ; return if the replaced tile block is above the map view in memory

RedrawMapView: ; eedc (3:6edc)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	inc a
	ret z
	ld a, [H_AUTOBGTRANSFERENABLED]
	push af
	ld a, [hTilesetType]
	push af
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld [hTilesetType], a ; no flower/water BG tile animations
	call LoadCurrentMapView
	call GoPAL_SET_CF1C
	ld hl, wMapViewVRAMPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -2 * 32
	add hl, de
	ld a, h
	and $3
	or $98
	ld a, l
	ld [wHPBarMaxHP], a
	ld a, h
	ld [wHPBarMaxHP + 1], a
	ld a, 2
	ld [$ffbe], a
	ld c, 9 ; number of rows of 2x2 tiles (this covers the whole screen)
.redrawRowLoop
	push bc
	push hl
	push hl
	ld hl, wTileMap - 2 * 20
	ld de, 20
	ld a, [$ffbe]
.asm_ef1a
	add hl, de
	dec a
	jr nz, .asm_ef1a
	call CopyToScreenEdgeTiles
	pop hl
	ld de, $20
	ld a, [$ffbe]
	ld c, a
.asm_ef28
	add hl, de
	ld a, h
	and $3
	or $98
	dec c
	jr nz, .asm_ef28
	ld [H_SCREENEDGEREDRAWADDR + 1], a
	ld a, l
	ld [H_SCREENEDGEREDRAWADDR], a
	ld a, REDRAWROW
	ld [H_SCREENEDGEREDRAW], a
	call DelayFrame
	ld hl, $ffbe
	inc [hl]
	inc [hl]
	pop hl
	pop bc
	dec c
	jr nz, .redrawRowLoop
	pop af
	ld [hTilesetType], a
	pop af
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

CompareHLWithBC: ; ef4e (3:6f4e)
	ld a, h
	sub b
	ret nz
	ld a, l
	sub c
	ret

INCLUDE "engine/overworld/cut.asm"

MarkTownVisitedAndLoadMissableObjects: ; f113 (3:7113)
	ld a, [W_CURMAP]
	cp ROUTE_1
	jr nc, .notInTown
	ld c, a
	ld b, $1
	ld hl, W_TOWNVISITEDFLAG   ; mark town as visited (for flying)
	predef FlagActionPredef
.notInTown
	ld hl, MapHSPointers
	ld a, [W_CURMAP]
	ld b, $0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]                ; load missable objects pointer in hl
	ld h, [hl]
	; fall through

LoadMissableObjects: ; f132 (3:7132)
	ld l, a
	push hl
	ld de, MapHS00             ; calculate difference between out pointer and the base pointer
	ld a, l
	sub e
	jr nc, .asm_f13c
	dec h
.asm_f13c
	ld l, a
	ld a, h
	sub d
	ld h, a
	ld a, h
	ld [H_DIVIDEND], a
	ld a, l
	ld [H_DIVIDEND+1], a
	xor a
	ld [H_DIVIDEND+2], a
	ld [H_DIVIDEND+3], a
	ld a, $3
	ld [H_DIVISOR], a
	ld b, $2
	call Divide                ; divide difference by 3, resulting in the global offset (number of missable items before ours)
	ld a, [W_CURMAP] ; W_CURMAP
	ld b, a
	ld a, [H_DIVIDEND+3]
	ld c, a                    ; store global offset in c
	ld de, W_MISSABLEOBJECTLIST
	pop hl
.writeMissableObjectsListLoop
	ld a, [hli]
	cp $ff
	jr z, .done     ; end of list
	cp b
	jr nz, .done    ; not for current map anymore
	ld a, [hli]
	inc hl
	ld [de], a                 ; write (map-local) sprite ID
	inc de
	ld a, c
	inc c
	ld [de], a                 ; write (global) missable object index
	inc de
	jr .writeMissableObjectsListLoop
.done
	ld a, $ff
	ld [de], a                 ; write sentinel
	ret

InitializeMissableObjectsFlags: ; f175 (3:7175)
	ld hl, W_MISSABLEOBJECTFLAGS
	ld bc, $20
	xor a
	call FillMemory ; clear missable objects flags
	ld hl, MapHS00
	xor a
	ld [wd048], a
.missableObjectsLoop
	ld a, [hli]
	cp $ff          ; end of list
	ret z
	push hl
	inc hl
	ld a, [hl]
	cp Hide
	jr nz, .asm_f19d
	ld hl, W_MISSABLEOBJECTFLAGS
	ld a, [wd048]
	ld c, a
	ld b, $1
	call MissableObjectFlagAction ; set flag iff Item is hidden
.asm_f19d
	ld hl, wd048
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .missableObjectsLoop

; tests if current sprite is a missable object that is hidden/has been removed
IsObjectHidden: ; f1a6 (3:71a6)
	ld a, [H_CURRENTSPRITEOFFSET]
	swap a
	ld b, a
	ld hl, W_MISSABLEOBJECTLIST
.loop
	ld a, [hli]
	cp $ff
	jr z, .notHidden ; not missable -> not hidden
	cp b
	ld a, [hli]
	jr nz, .loop
	ld c, a
	ld b, $2
	ld hl, W_MISSABLEOBJECTFLAGS
	call MissableObjectFlagAction
	ld a, c
	and a
	jr nz, .hidden
.notHidden
	xor a
.hidden
	ld [$ffe5], a
	ret

; adds missable object (items, leg. pokemon, etc.) to the map
; [wcc4d]: index of the missable object to be added (global index)
ShowObject: ; f1c8 (3:71c8)
ShowObject2:
	ld hl, W_MISSABLEOBJECTFLAGS
	ld a, [wcc4d]
	ld c, a
	ld b, $0
	call MissableObjectFlagAction   ; reset "removed" flag
	jp UpdateSprites

; removes missable object (items, leg. pokemon, etc.) from the map
; [wcc4d]: index of the missable object to be removed (global index)
HideObject: ; f1d7 (3:71d7)
	ld hl, W_MISSABLEOBJECTFLAGS
	ld a, [wcc4d]
	ld c, a
	ld b, $1
	call MissableObjectFlagAction   ; set "removed" flag
	jp UpdateSprites

MissableObjectFlagAction:
; identical to FlagAction

	push hl
	push de
	push bc

	; bit
	ld a, c
	ld d, a
	and 7
	ld e, a

	; byte
	ld a, d
	srl a
	srl a
	srl a
	add l
	ld l, a
	jr nc, .ok
	inc h
.ok

	; d = 1 << e (bitmask)
	inc e
	ld d, 1
.shift
	dec e
	jr z, .shifted
	sla d
	jr .shift
.shifted

	ld a, b
	and a
	jr z, .reset
	cp 2
	jr z, .read

.set
	ld a, [hl]
	ld b, a
	ld a, d
	or b
	ld [hl], a
	jr .done

.reset
	ld a, [hl]
	ld b, a
	ld a, d
	xor $ff
	and b
	ld [hl], a
	jr .done

.read
	ld a, [hl]
	ld b, a
	ld a, d
	and b

.done
	pop bc
	pop de
	pop hl
	ld c, a
	ret

TryPushingBoulder: ; f225 (3:7225)
	ld a, [wd728]
	bit 0, a ; using Strength?
	ret z
	ld a, [wFlags_0xcd60]
	bit 1, a ; has boulder dust animation from previous push played yet?
	ret nz
	xor a
	ld [$ff8c], a
	call IsSpriteInFrontOfPlayer
	ld a, [$ff8c]
	ld [wBoulderSpriteIndex], a
	and a
	jp z, ResetBoulderPushFlags
	ld hl, wSpriteStateData1 + 1
	ld d, $0
	ld a, [$ff8c]
	swap a
	ld e, a
	add hl, de
	res 7, [hl]
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp BOULDER_MOVEMENT_BYTE_2
	jp nz, ResetBoulderPushFlags
	ld hl, wFlags_0xcd60
	bit 6, [hl]
	set 6, [hl] ; indicate that the player has tried pushing
	ret z ; the player must try pushing twice before the boulder will move
	ld a, [hJoyHeld]
	and $f0
	ret z
	predef CheckForCollisionWhenPushingBoulder
	ld a, [wTileInFrontOfBoulderAndBoulderCollisionResult]
	and a ; was there a collision?
	jp nz, ResetBoulderPushFlags
	ld a, [hJoyHeld]
	ld b, a
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_UP
	jr z, .pushBoulderUp
	cp SPRITE_FACING_LEFT
	jr z, .pushBoulderLeft
	cp SPRITE_FACING_RIGHT
	jr z, .pushBoulderRight
.pushBoulderDown
	bit 7, b
	ret z
	ld de, PushBoulderDownMovementData
	jr .done
.pushBoulderUp
	bit 6, b
	ret z
	ld de, PushBoulderUpMovementData
	jr .done
.pushBoulderLeft
	bit 5, b
	ret z
	ld de, PushBoulderLeftMovementData
	jr .done
.pushBoulderRight
	bit 4, b
	ret z
	ld de, PushBoulderRightMovementData
.done
	call MoveSprite
	ld a, (SFX_02_53 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wFlags_0xcd60
	set 1, [hl]
	ret

PushBoulderUpMovementData: ; f2ad (3:72ad)
	db NPC_MOVEMENT_UP,$FF

PushBoulderDownMovementData: ; f2af (3:72af)
	db NPC_MOVEMENT_DOWN,$FF

PushBoulderLeftMovementData: ; f2b1 (3:72b1)
	db NPC_MOVEMENT_LEFT,$FF

PushBoulderRightMovementData: ; f2b3 (3:72b3)
	db NPC_MOVEMENT_RIGHT,$FF

DoBoulderDustAnimation: ; f2b5 (3:72b5)
	ld a, [wd730]
	bit 0, a
	ret nz
	callab AnimateBoulderDust
	call DiscardButtonPresses
	ld [wJoyIgnore], a
	call ResetBoulderPushFlags
	set 7, [hl]
	ld a, [wBoulderSpriteIndex]
	ld [H_SPRITEINDEX], a
	call GetSpriteMovementByte2Pointer
	ld [hl], $10
	ld a, (SFX_02_56 - SFX_Headers_02) / 3
	jp PlaySound

ResetBoulderPushFlags: ; f2dd (3:72dd)
	ld hl, wFlags_0xcd60
	res 1, [hl]
	res 6, [hl]
	ret

_AddPartyMon: ; f2e5 (3:72e5)
	ld de, wPartyCount ; wPartyCount
	ld a, [wcc49]
	and $f
	jr z, .asm_f2f2
	ld de, wEnemyPartyCount ; wEnemyPartyCount
.asm_f2f2
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc
	ld [de], a
	ld a, [de]
	ld [$ffe4], a
	add e
	ld e, a
	jr nc, .asm_f300
	inc d
.asm_f300
	ld a, [wcf91]
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	ld hl, wPartyMonOT ; wd273
	ld a, [wcc49]
	and $f
	jr z, .asm_f315
	ld hl, wEnemyMonOT
.asm_f315
	ld a, [$ffe4]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wPlayerName ; wd158
	ld bc, $b
	call CopyData
	ld a, [wcc49]
	and a
	jr nz, .asm_f33f
	ld hl, wPartyMonNicks ; wPartyMonNicks
	ld a, [$ffe4]
	dec a
	call SkipFixedLengthTextEntries
	ld a, $2
	ld [wd07d], a
	predef AskName
.asm_f33f
	ld hl, wPartyMons
	ld a, [wcc49]
	and $f
	jr z, .asm_f34c
	ld hl, wEnemyMons
.asm_f34c
	ld a, [$ffe4]
	dec a
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	ld a, [wcf91]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, W_MONHEADER
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	push hl
	ld a, [wcc49]
	and $f
	ld a, $98     ; set enemy trainer mon IVs to fixed average values
	ld b, $88
	jr nz, .writeFreshMonData
	ld a, [wcf91]
	ld [wd11e], a
	push de
	predef IndexToPokedex
	pop de
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $2
	ld hl, wPokedexOwned ; wPokedexOwned
	call FlagAction
	ld a, c
	ld [wd153], a
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $1
	push bc
	call FlagAction
	pop bc
	ld hl, wPokedexSeen ; wd30a
	call FlagAction
	pop hl
	push hl
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	and a
	jr nz, .copyEnemyMonData
	call Random ; generate random IVs
	ld b, a
	call Random
.writeFreshMonData ; f3b3
	push bc
	ld bc, $1b
	add hl, bc
	pop bc
	ld [hli], a
	ld [hl], b         ; write IVs
	ld bc, $fff4
	add hl, bc
	ld a, $1
	ld c, a
	xor a
	ld b, a
	call CalcStat      ; calc HP stat (set cur Hp to max HP)
	ld a, [H_MULTIPLICAND+1]
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+2]
	ld [de], a
	inc de
	xor a
	ld [de], a         ; level (?)
	inc de
	ld [de], a         ; status ailments
	inc de
	jr .copyMonTypesAndMoves
.copyEnemyMonData
	ld bc, $1b
	add hl, bc
	ld a, [wEnemyMonDVs] ; copy IVs from cur enemy mon
	ld [hli], a
	ld a, [wEnemyMonDVs + 1]
	ld [hl], a
	ld a, [wEnemyMonHP]    ; copy HP from cur enemy mon
	ld [de], a
	inc de
	ld a, [wEnemyMonHP+1]
	ld [de], a
	inc de
	xor a
	ld [de], a                 ; level (?)
	inc de
	ld a, [wEnemyMonStatus]   ; copy status ailments from cur enemy mon
	ld [de], a
	inc de
.copyMonTypesAndMoves
	ld hl, W_MONHTYPES
	ld a, [hli]       ; type 1
	ld [de], a
	inc de
	ld a, [hli]       ; type 2
	ld [de], a
	inc de
	ld a, [hli]       ; unused (?)
	ld [de], a
	ld hl, W_MONHMOVES
	ld a, [hli]
	inc de
	push de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	push de
	dec de
	dec de
	dec de
	xor a
	ld [wHPBarMaxHP], a
	predef WriteMonMoves
	pop de
	ld a, [wPlayerID]  ; set trainer ID to player ID
	inc de
	ld [de], a
	ld a, [wPlayerID + 1]
	inc de
	ld [de], a
	push de
	ld a, [W_CURENEMYLVL]
	ld d, a
	callab CalcExperience
	pop de
	inc de
	ld a, [H_MULTIPLICAND] ; write experience
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+1]
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+2]
	ld [de], a
	xor a
	ld b, $a
.writeEVsLoop              ; set all EVs to 0
	inc de
	ld [de], a
	dec b
	jr nz, .writeEVsLoop
	inc de
	inc de
	pop hl
	call AddPartyMon_WriteMovePP
	inc de
	ld a, [W_CURENEMYLVL] ; W_CURENEMYLVL
	ld [de], a
	inc de
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	dec a
	jr nz, .calcFreshStats
	ld hl, wEnemyMonMaxHP ; wEnemyMonMaxHP
	ld bc, $a
	call CopyData          ; copy stats of cur enemy mon
	pop hl
	jr .done
.calcFreshStats
	pop hl
	ld bc, $10
	add hl, bc
	ld b, $0
	call CalcStats         ; calculate fresh set of stats
.done
	scf
	ret

LoadMovePPs: ; f473 (3:7473)
	call GetPredefRegisters
	; fallthrough
AddPartyMon_WriteMovePP: ; f476 (3:7476)
	ld b, $4
.pploop
	ld a, [hli]     ; read move ID
	and a
	jr z, .empty
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, $6
	call AddNTimes
	ld de, wcd6d
	ld a, BANK(Moves)
	call FarCopyData
	pop bc
	pop de
	pop hl
	ld a, [wcd72] ; sixth move byte = pp
.empty
	inc de
	ld [de], a
	dec b
	jr nz, .pploop ; there are still moves to read
	ret

; adds enemy mon [wcf91] (at position [wWhichPokemon] in enemy list) to own party
; used in the cable club trade center
_AddEnemyMonToPlayerParty: ; f49d (3:749d)
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z            ; party full, return failure
	inc a
	ld [hl], a       ; add 1 to party members
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wcf91]
	ld [hli], a      ; add mon as last list entry
	ld [hl], $ff     ; write new sentinel
	ld hl, wPartyMons
	ld a, [wPartyCount]
	dec a
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wcf98
	call CopyData    ; write new mon's data (from wcf98)
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wEnemyMonOT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, $000b
	call CopyData    ; write new mon's OT name (from an enemy mon)
	ld hl, wPartyMonNicks
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wEnemyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, $000b
	call CopyData    ; write new mon's nickname (from an enemy mon)
	ld a, [wcf91]
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexOwned
	push bc
	call FlagAction ; add to owned pokemon
	pop bc
	ld hl, wPokedexSeen
	call FlagAction ; add to seen pokemon
	and a
	ret                  ; return success

Func_f51e: ; f51e (3:751e)
	ld a, [wcf95]
	and a
	jr z, .checkPartyMonSlots
	cp $2
	jr z, .checkPartyMonSlots
	cp $3
	ld hl, wDayCareMon
	jr z, .asm_f575
	ld hl, W_NUMINBOX ; wda80
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .partyOrBoxNotFull
	jr .boxFull
.checkPartyMonSlots
	ld hl, wPartyCount ; wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nz, .partyOrBoxNotFull
.boxFull
	scf
	ret
.partyOrBoxNotFull
	inc a
	ld [hl], a           ; increment number of mons in party/box
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wcf95]
	cp $2
	ld a, [wDayCareMon]
	jr z, .asm_f556
	ld a, [wcf91]
.asm_f556
	ld [hli], a          ; write new mon ID
	ld [hl], $ff         ; write new sentinel
	ld a, [wcf95]
	dec a
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1 ; $2c
	ld a, [wPartyCount] ; wPartyCount
	jr nz, .skipToNewMonEntry
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1 ; $21
	ld a, [W_NUMINBOX] ; wda80
.skipToNewMonEntry
	dec a
	call AddNTimes
.asm_f575
	push hl
	ld e, l
	ld d, h
	ld a, [wcf95]
	and a
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1 ; $21
	jr z, .asm_f591
	cp $2
	ld hl, wDayCareMon
	jr z, .asm_f597
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1 ; $2c
.asm_f591
	ld a, [wWhichPokemon] ; wWhichPokemon
	call AddNTimes
.asm_f597
	push hl
	push de
	ld bc, wBoxMon2 - wBoxMon1
	call CopyData
	pop de
	pop hl
	ld a, [wcf95]
	and a
	jr z, .asm_f5b4
	cp $2
	jr z, .asm_f5b4
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc
	ld a, [hl]
	inc de
	inc de
	inc de
	ld [de], a
.asm_f5b4
	ld a, [wcf95]
	cp $3
	ld de, W_DAYCAREMONOT
	jr z, .asm_f5d3
	dec a
	ld hl, wPartyMonOT ; wd273
	ld a, [wPartyCount] ; wPartyCount
	jr nz, .asm_f5cd
	ld hl, wBoxMonOT
	ld a, [W_NUMINBOX] ; wda80
.asm_f5cd
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.asm_f5d3
	ld hl, wBoxMonOT
	ld a, [wcf95]
	and a
	jr z, .asm_f5e6
	ld hl, W_DAYCAREMONOT
	cp $2
	jr z, .asm_f5ec
	ld hl, wPartyMonOT ; wd273
.asm_f5e6
	ld a, [wWhichPokemon] ; wWhichPokemon
	call SkipFixedLengthTextEntries
.asm_f5ec
	ld bc, $b
	call CopyData
	ld a, [wcf95]
	cp $3
	ld de, W_DAYCAREMONNAME
	jr z, .asm_f611
	dec a
	ld hl, wPartyMonNicks ; wPartyMonNicks
	ld a, [wPartyCount] ; wPartyCount
	jr nz, .asm_f60b
	ld hl, wBoxMonNicks
	ld a, [W_NUMINBOX] ; wda80
.asm_f60b
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.asm_f611
	ld hl, wBoxMonNicks
	ld a, [wcf95]
	and a
	jr z, .asm_f624
	ld hl, W_DAYCAREMONNAME
	cp $2
	jr z, .asm_f62a
	ld hl, wPartyMonNicks ; wPartyMonNicks
.asm_f624
	ld a, [wWhichPokemon] ; wWhichPokemon
	call SkipFixedLengthTextEntries
.asm_f62a
	ld bc, $b
	call CopyData
	pop hl
	ld a, [wcf95]
	cp $1
	jr z, .asm_f664
	cp $3
	jr z, .asm_f664
	push hl
	srl a
	add $2
	ld [wcc49], a
	call LoadMonData
	callba CalcLevelFromExperience
	ld a, d
	ld [W_CURENEMYLVL], a ; W_CURENEMYLVL
	pop hl
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc
	ld [hli], a
	ld d, h
	ld e, l
	ld bc, $ffee
	add hl, bc
	ld b, $1
	call CalcStats
.asm_f664
	and a
	ret


FlagActionPredef:
	call GetPredefRegisters

FlagAction:
; Perform action b on bit c
; in the bitfield at hl.
;  0: reset
;  1: set
;  2: read
; Return the result in c.

	push hl
	push de
	push bc

	; bit
	ld a, c
	ld d, a
	and 7
	ld e, a

	; byte
	ld a, d
	srl a
	srl a
	srl a
	add l
	ld l, a
	jr nc, .ok
	inc h
.ok

	; d = 1 << e (bitmask)
	inc e
	ld d, 1
.shift
	dec e
	jr z, .shifted
	sla d
	jr .shift
.shifted

	ld a, b
	and a
	jr z, .reset
	cp 2
	jr z, .read

.set
	ld b, [hl]
	ld a, d
	or b
	ld [hl], a
	jr .done

.reset
	ld b, [hl]
	ld a, d
	xor $ff
	and b
	ld [hl], a
	jr .done

.read
	ld b, [hl]
	ld a, d
	and b
.done
	pop bc
	pop de
	pop hl
	ld c, a
	ret


HealParty:
; Restore HP and PP.

	ld hl, wPartySpecies
	ld de, wPartyMon1HP
.healmon
	ld a, [hli]
	cp $ff
	jr z, .done

	push hl
	push de

	ld hl, wPartyMon1Status - wPartyMon1HP
	add hl, de
	xor a
	ld [hl], a

	push de
	ld b, NUM_MOVES ; A Pokémon has 4 moves
.pp
	ld hl, wPartyMon1Moves - wPartyMon1HP
	add hl, de

	ld a, [hl]
	and a
	jr z, .nextmove

	dec a
	ld hl, wPartyMon1PP - wPartyMon1HP
	add hl, de

	push hl
	push de
	push bc

	ld hl, Moves
	ld bc, $0006
	call AddNTimes
	ld de, wcd6d
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wcd72] ; default pp

	pop bc
	pop de
	pop hl

	inc de
	push bc
	ld b, a
	ld a, [hl]
	and $c0
	add b
	ld [hl], a
	pop bc

.nextmove
	dec b
	jr nz, .pp
	pop de

	ld hl, wPartyMon1MaxHP - wPartyMon1HP
	add hl, de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	pop de
	pop hl

	push hl
	ld bc, wPartyMon2 - wPartyMon1
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	jr .healmon

.done
	xor a
	ld [wWhichPokemon], a
	ld [wd11e], a

	ld a, [wPartyCount]
	ld b, a
.ppup
	push bc
	call RestoreBonusPP
	pop bc
	ld hl, wWhichPokemon
	inc [hl]
	dec b
	jr nz, .ppup
	ret


DivideBCDPredef::
DivideBCDPredef2::
DivideBCDPredef3::
DivideBCDPredef4::
	call GetPredefRegisters

DivideBCD::
	xor a
	ld [$ffa5], a
	ld [$ffa6], a
	ld [$ffa7], a
	ld d, $1
.asm_f72a
	ld a, [$ffa2]
	and $f0
	jr nz, .asm_f75b
	inc d
	ld a, [$ffa2]
	swap a
	and $f0
	ld b, a
	ld a, [$ffa3]
	swap a
	ld [$ffa3], a
	and $f
	or b
	ld [$ffa2], a
	ld a, [$ffa3]
	and $f0
	ld b, a
	ld a, [$ffa4]
	swap a
	ld [$ffa4], a
	and $f
	or b
	ld [$ffa3], a
	ld a, [$ffa4]
	and $f0
	ld [$ffa4], a
	jr .asm_f72a
.asm_f75b
	push de
	push de
	call Func_f800
	pop de
	ld a, b
	swap a
	and $f0
	ld [$ffa5], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, [$ffa5]
	or b
	ld [$ffa5], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, b
	swap a
	and $f0
	ld [$ffa6], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, [$ffa6]
	or b
	ld [$ffa6], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, b
	swap a
	and $f0
	ld [$ffa7], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, [$ffa7]
	or b
	ld [$ffa7], a
.asm_f7bc
	ld a, [$ffa5]
	ld [$ffa2], a
	ld a, [$ffa6]
	ld [$ffa3], a
	ld a, [$ffa7]
	ld [$ffa4], a
	pop de
	ld a, $6
	sub d
	and a
	ret z
.asm_f7ce
	push af
	call Func_f7d7
	pop af
	dec a
	jr nz, .asm_f7ce
	ret

Func_f7d7: ; f7d7 (3:77d7)
	ld a, [$ffa4]
	swap a
	and $f
	ld b, a
	ld a, [$ffa3]
	swap a
	ld [$ffa3], a
	and $f0
	or b
	ld [$ffa4], a
	ld a, [$ffa3]
	and $f
	ld b, a
	ld a, [$ffa2]
	swap a
	ld [$ffa2], a
	and $f0
	or b
	ld [$ffa3], a
	ld a, [$ffa2]
	and $f
	ld [$ffa2], a
	ret

Func_f800: ; f800 (3:7800)
	ld bc, $3
.asm_f803
	ld de, $ff9f
	ld hl, $ffa2
	push bc
	call StringCmp
	pop bc
	ret c
	inc b
	ld de, $ffa1
	ld hl, $ffa4
	push bc
	call SubBCD
	pop bc
	jr .asm_f803


AddBCDPredef::
	call GetPredefRegisters

AddBCD::
	and a
	ld b, c
.add
	ld a, [de]
	adc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .add
	jr nc, .done
	ld a, $99
	inc de
.fill
	ld [de], a
	inc de
	dec b
	jr nz, .fill
.done
	ret


SubBCDPredef::
	call GetPredefRegisters

SubBCD::
	and a
	ld b, c
.sub
	ld a, [de]
	sbc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .sub
	jr nc, .done
	ld a, $00
	inc de
.fill
	ld [de], a
	inc de
	dec b
	jr nz, .fill
	scf
.done
	ret


InitPlayerData:
InitPlayerData2:

	call Random
	ld a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ld a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld a, $ff
	ld [wd71b], a                 ; XXX what's this?

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, W_NUMINBOX
	call InitializeEmptyList
	ld hl, wNumBagItems
	call InitializeEmptyList
	ld hl, wNumBoxItems
	call InitializeEmptyList

START_MONEY EQU $3000
	ld hl, wPlayerMoney + 1
	ld a, START_MONEY / $100
	ld [hld], a
	xor a
	ld [hli], a
	inc hl
	ld [hl], a

	ld [wcc49], a

	ld hl, W_OBTAINEDBADGES
	ld [hli], a

	ld [hl], a

	ld hl, wPlayerCoins
	ld [hli], a
	ld [hl], a

	ld hl, W_GAMEPROGRESSFLAGS
	ld bc, $c8
	call FillMemory ; clear all game progress flags

	jp InitializeMissableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret


IsItemInBag_: ; f8a5 (3:78a5)
	call GetPredefRegisters
	ld hl, wNumBagItems ; wNumBagItems
.asm_f8ab
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .asm_f8b7
	cp b
	jr nz, .asm_f8ab
	ld a, [hl]
	ld b, a
	ret
.asm_f8b7
	ld b, $0
	ret

FindPathToPlayer: ; f8ba (3:78ba)
	xor a
	ld hl, $ff97
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wNPCMovementDirections2
	ld de, $0
.loop
	ld a, [$ff99]
	ld b, a
	ld a, [$ff95] ; Y distance in steps
	call CalcDifference
	ld d, a
	and a
	jr nz, .asm_f8da
	ld a, [$ff98]
	set 0, a
	ld [$ff98], a
.asm_f8da
	ld a, [$ff9a]
	ld b, a
	ld a, [$ff96] ; X distance in steps
	call CalcDifference
	ld e, a
	and a
	jr nz, .asm_f8ec
	ld a, [$ff98]
	set 1, a
	ld [$ff98], a
.asm_f8ec
	ld a, [$ff98]
	cp $3
	jr z, .done
	ld a, e
	cp d
	jr c, .asm_f90a
	ld a, [$ff9d]
	bit 1, a
	jr nz, .asm_f900
	ld d, NPC_MOVEMENT_RIGHT
	jr .asm_f902
.asm_f900
	ld d, NPC_MOVEMENT_LEFT
.asm_f902
	ld a, [$ff9a]
	add $1
	ld [$ff9a], a
	jr .asm_f91c
.asm_f90a
	ld a, [$ff9d]
	bit 0, a
	jr nz, .asm_f914
	ld d, NPC_MOVEMENT_DOWN
	jr .asm_f916
.asm_f914
	ld d, NPC_MOVEMENT_UP
.asm_f916
	ld a, [$ff99]
	add $1
	ld [$ff99], a
.asm_f91c
	ld a, d
	ld [hli], a
	ld a, [$ff97]
	inc a
	ld [$ff97], a
	jp .loop
.done
	ld [hl], $ff
	ret

CalcPositionOfPlayerRelativeToNPC: ; f929 (3:7929)
	xor a
	ld [$ff9d], a
	ld a, [wSpriteStateData1 + 4] ; player's sprite screen Y position in pixels
	ld d, a
	ld a, [wSpriteStateData1 + 6] ; player's sprite screen X position in pixels
	ld e, a
	ld hl, wSpriteStateData1
	ld a, [$ff95] ; sprite offset
	add l
	add $4
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, d
	ld b, a
	ld a, [hli] ; NPC sprite screen Y position in pixels
	call CalcDifference
	jr nc, .NPCSouthOfOrAlignedWithPlayer
.NPCNorthOfPlayer
	push hl
	ld hl, $ff9d
	bit 0, [hl]
	set 0, [hl]
	pop hl
	jr .divideYDistance
.NPCSouthOfOrAlignedWithPlayer
	push hl
	ld hl, $ff9d
	bit 0, [hl]
	res 0, [hl]
	pop hl
.divideYDistance
	push hl
	ld hl, $ffe5
	ld [hli], a
	ld a, 16
	ld [hli], a
	call DivideBytes ; divide Y absolute distance by 16
	ld a, [hl] ; quotient
	ld [$ff95], a
	pop hl
	inc hl
	ld b, e
	ld a, [hl] ; NPC sprite screen X position in pixels
	call CalcDifference
	jr nc, .NPCEastOfOrAlignedWithPlayer
.NPCWestOfPlayer
	push hl
	ld hl, $ff9d
	bit 1, [hl]
	set 1, [hl]
	pop hl
	jr .divideXDistance
.NPCEastOfOrAlignedWithPlayer
	push hl
	ld hl, $ff9d
	bit 1, [hl]
	res 1, [hl]
	pop hl
.divideXDistance
	ld [$ffe5], a
	ld a, 16
	ld [$ffe6], a
	call DivideBytes ; divide X absolute distance by 16
	ld a, [$ffe7] ; quotient
	ld [$ff96], a
	ld a, [$ff9b]
	and a
	ret z
	ld a, [$ff9d]
	cpl
	and $3
	ld [$ff9d], a
	ret

ConvertNPCMovementDirectionsToJoypadMasks: ; f9a0 (3:79a0)
	ld a, [$ff95]
	ld [wNPCMovementDirections2Index], a
	dec a
	ld de, wSimulatedJoypadStatesEnd
	ld hl, wNPCMovementDirections2
	add l
	ld l, a
	jr nc, .loop
	inc h
.loop
	ld a, [hld]
	call ConvertNPCMovementDirectionToJoypadMask
	ld [de], a
	inc de
	ld a, [$ff95]
	dec a
	ld [$ff95], a
	jr nz, .loop
	ret

ConvertNPCMovementDirectionToJoypadMask: ; f9bf (3:79bf)
	push hl
	ld b, a
	ld hl, NPCMovementDirectionsToJoypadMasksTable
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp b
	jr z, .loadJoypadMask
	inc hl
	jr .loop
.loadJoypadMask
	ld a, [hl]
.done
	pop hl
	ret

NPCMovementDirectionsToJoypadMasksTable: ; f9d2 (3:79d2)
	db NPC_MOVEMENT_UP, D_UP
	db NPC_MOVEMENT_DOWN, D_DOWN
	db NPC_MOVEMENT_LEFT, D_LEFT
	db NPC_MOVEMENT_RIGHT, D_RIGHT
	db $ff

Func_f9db: ; f9db (3:79db)
	ret

INCLUDE "engine/hp_bar.asm"

INCLUDE "engine/hidden_object_functions3.asm"


SECTION "NPC Sprites 1", ROMX, BANK[NPC_SPRITES_1]

OakAideSprite:         INCBIN "gfx/sprites/oak_aide.2bpp"
RockerSprite:          INCBIN "gfx/sprites/rocker.2bpp"
SwimmerSprite:         INCBIN "gfx/sprites/swimmer.2bpp"
WhitePlayerSprite:     INCBIN "gfx/sprites/white_player.2bpp"
GymHelperSprite:       INCBIN "gfx/sprites/gym_helper.2bpp"
OldPersonSprite:       INCBIN "gfx/sprites/old_person.2bpp"
MartGuySprite:         INCBIN "gfx/sprites/mart_guy.2bpp"
FisherSprite:          INCBIN "gfx/sprites/fisher.2bpp"
OldMediumWomanSprite:  INCBIN "gfx/sprites/old_medium_woman.2bpp"
NurseSprite:           INCBIN "gfx/sprites/nurse.2bpp"
CableClubWomanSprite:  INCBIN "gfx/sprites/cable_club_woman.2bpp"
MrMasterballSprite:    INCBIN "gfx/sprites/mr_masterball.2bpp"
LaprasGiverSprite:     INCBIN "gfx/sprites/lapras_giver.2bpp"
WardenSprite:          INCBIN "gfx/sprites/warden.2bpp"
SsCaptainSprite:       INCBIN "gfx/sprites/ss_captain.2bpp"
Fisher2Sprite:         INCBIN "gfx/sprites/fisher2.2bpp"
BlackbeltSprite:       INCBIN "gfx/sprites/blackbelt.2bpp"
GuardSprite:           INCBIN "gfx/sprites/guard.2bpp"
BallSprite:            INCBIN "gfx/sprites/ball.2bpp"
OmanyteSprite:         INCBIN "gfx/sprites/omanyte.2bpp"
BoulderSprite:         INCBIN "gfx/sprites/boulder.2bpp"
PaperSheetSprite:      INCBIN "gfx/sprites/paper_sheet.2bpp"
BookMapDexSprite:      INCBIN "gfx/sprites/book_map_dex.2bpp"
ClipboardSprite:       INCBIN "gfx/sprites/clipboard.2bpp"
SnorlaxSprite:         INCBIN "gfx/sprites/snorlax.2bpp"
OldAmberSprite:        INCBIN "gfx/sprites/old_amber.2bpp"
LyingOldManSprite:     INCBIN "gfx/sprites/lying_old_man.2bpp"


SECTION "Graphics", ROMX, BANK[GFX]

PokemonLogoGraphics:            INCBIN "gfx/pokemon_logo.2bpp"
FontGraphics:                   INCBIN "gfx/font.1bpp"
ABTiles:                        INCBIN "gfx/AB.2bpp"
HpBarAndStatusGraphics:         INCBIN "gfx/hp_bar_and_status.2bpp"
BattleHudTiles1:                INCBIN "gfx/battle_hud1.1bpp"
BattleHudTiles2:                INCBIN "gfx/battle_hud2.1bpp"
BattleHudTiles3:                INCBIN "gfx/battle_hud3.1bpp"
NintendoCopyrightLogoGraphics:  INCBIN "gfx/copyright.2bpp"
GamefreakLogoGraphics:          INCBIN "gfx/gamefreak.2bpp"
TextBoxGraphics:                INCBIN "gfx/text_box.2bpp"
PokedexTileGraphics:            INCBIN "gfx/pokedex.2bpp"
WorldMapTileGraphics:           INCBIN "gfx/town_map.2bpp"
PlayerCharacterTitleGraphics:   INCBIN "gfx/player_title.2bpp"


SECTION "Battle (bank 4)", ROMX, BANK[$4]

INCLUDE "engine/battle/4.asm"
INCLUDE "engine/menu/status_screen.asm"
INCLUDE "engine/menu/party_menu.asm"

RedPicFront:: INCBIN "pic/trainer/red.pic"
ShrinkPic1::  INCBIN "pic/trainer/shrink1.pic"
ShrinkPic2::  INCBIN "pic/trainer/shrink2.pic"

INCLUDE "engine/turn_sprite.asm"
INCLUDE "engine/menu/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"
INCLUDE "engine/battle/4_2.asm"
INCLUDE "engine/random.asm"


SECTION "NPC Sprites 2", ROMX, BANK[NPC_SPRITES_2]

RedCyclingSprite:     INCBIN "gfx/sprites/cycling.2bpp"
RedSprite:            INCBIN "gfx/sprites/red.2bpp"
BlueSprite:           INCBIN "gfx/sprites/blue.2bpp"
OakSprite:            INCBIN "gfx/sprites/oak.2bpp"
BugCatcherSprite:     INCBIN "gfx/sprites/bug_catcher.2bpp"
SlowbroSprite:        INCBIN "gfx/sprites/slowbro.2bpp"
LassSprite:           INCBIN "gfx/sprites/lass.2bpp"
BlackHairBoy1Sprite:  INCBIN "gfx/sprites/black_hair_boy_1.2bpp"
LittleGirlSprite:     INCBIN "gfx/sprites/little_girl.2bpp"
BirdSprite:           INCBIN "gfx/sprites/bird.2bpp"
FatBaldGuySprite:     INCBIN "gfx/sprites/fat_bald_guy.2bpp"
GamblerSprite:        INCBIN "gfx/sprites/gambler.2bpp"
BlackHairBoy2Sprite:  INCBIN "gfx/sprites/black_hair_boy_2.2bpp"
GirlSprite:           INCBIN "gfx/sprites/girl.2bpp"
HikerSprite:          INCBIN "gfx/sprites/hiker.2bpp"
FoulardWomanSprite:   INCBIN "gfx/sprites/foulard_woman.2bpp"
GentlemanSprite:      INCBIN "gfx/sprites/gentleman.2bpp"
DaisySprite:          INCBIN "gfx/sprites/daisy.2bpp"
BikerSprite:          INCBIN "gfx/sprites/biker.2bpp"
SailorSprite:         INCBIN "gfx/sprites/sailor.2bpp"
CookSprite:           INCBIN "gfx/sprites/cook.2bpp"
BikeShopGuySprite:    INCBIN "gfx/sprites/bike_shop_guy.2bpp"
MrFujiSprite:         INCBIN "gfx/sprites/mr_fuji.2bpp"
GiovanniSprite:       INCBIN "gfx/sprites/giovanni.2bpp"
RocketSprite:         INCBIN "gfx/sprites/rocket.2bpp"
MediumSprite:         INCBIN "gfx/sprites/medium.2bpp"
WaiterSprite:         INCBIN "gfx/sprites/waiter.2bpp"
ErikaSprite:          INCBIN "gfx/sprites/erika.2bpp"
MomGeishaSprite:      INCBIN "gfx/sprites/mom_geisha.2bpp"
BrunetteGirlSprite:   INCBIN "gfx/sprites/brunette_girl.2bpp"
LanceSprite:          INCBIN "gfx/sprites/lance.2bpp"
MomSprite:            INCBIN "gfx/sprites/mom.2bpp"
BaldingGuySprite:     INCBIN "gfx/sprites/balding_guy.2bpp"
YoungBoySprite:       INCBIN "gfx/sprites/young_boy.2bpp"
GameboyKidSprite:     INCBIN "gfx/sprites/gameboy_kid.2bpp"
ClefairySprite:       INCBIN "gfx/sprites/clefairy.2bpp"
AgathaSprite:         INCBIN "gfx/sprites/agatha.2bpp"
BrunoSprite:          INCBIN "gfx/sprites/bruno.2bpp"
LoreleiSprite:        INCBIN "gfx/sprites/lorelei.2bpp"
SeelSprite:           INCBIN "gfx/sprites/seel.2bpp"


SECTION "Battle (bank 5)", ROMX, BANK[$5]

INCLUDE "engine/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/evolve_trade.asm"
INCLUDE "engine/battle/5.asm"
INCLUDE "engine/menu/pc.asm"


SECTION "bank6",ROMX,BANK[$6]

INCLUDE "data/mapHeaders/celadoncity.asm"
INCLUDE "data/mapObjects/celadoncity.asm"
CeladonCityBlocks: INCBIN "maps/celadoncity.blk"

INCLUDE "data/mapHeaders/pallettown.asm"
INCLUDE "data/mapObjects/pallettown.asm"
PalletTownBlocks: INCBIN "maps/pallettown.blk"

INCLUDE "data/mapHeaders/viridiancity.asm"
INCLUDE "data/mapObjects/viridiancity.asm"
ViridianCityBlocks: INCBIN "maps/viridiancity.blk"

INCLUDE "data/mapHeaders/pewtercity.asm"
INCLUDE "data/mapObjects/pewtercity.asm"
PewterCityBlocks: INCBIN "maps/pewtercity.blk"

INCLUDE "data/mapHeaders/ceruleancity.asm"
INCLUDE "data/mapObjects/ceruleancity.asm"
CeruleanCityBlocks: INCBIN "maps/ceruleancity.blk"

INCLUDE "data/mapHeaders/vermilioncity.asm"
INCLUDE "data/mapObjects/vermilioncity.asm"
VermilionCityBlocks: INCBIN "maps/vermilioncity.blk"

INCLUDE "data/mapHeaders/fuchsiacity.asm"
INCLUDE "data/mapObjects/fuchsiacity.asm"
FuchsiaCityBlocks: INCBIN "maps/fuchsiacity.blk"

INCLUDE "engine/play_time.asm"

INCLUDE "scripts/pallettown.asm"
INCLUDE "scripts/viridiancity.asm"
INCLUDE "scripts/pewtercity.asm"
INCLUDE "scripts/ceruleancity.asm"
INCLUDE "scripts/vermilioncity.asm"
INCLUDE "scripts/celadoncity.asm"
INCLUDE "scripts/fuchsiacity.asm"

INCLUDE "data/mapHeaders/blueshouse.asm"
INCLUDE "scripts/blueshouse.asm"
INCLUDE "data/mapObjects/blueshouse.asm"
BluesHouseBlocks: INCBIN "maps/blueshouse.blk"

INCLUDE "data/mapHeaders/vermilionhouse3.asm"
INCLUDE "scripts/vermilionhouse3.asm"
INCLUDE "data/mapObjects/vermilionhouse3.asm"
VermilionHouse3Blocks: INCBIN "maps/vermilionhouse3.blk"

INCLUDE "data/mapHeaders/indigoplateaulobby.asm"
INCLUDE "scripts/indigoplateaulobby.asm"
INCLUDE "data/mapObjects/indigoplateaulobby.asm"
IndigoPlateauLobbyBlocks: INCBIN "maps/indigoplateaulobby.blk"

INCLUDE "data/mapHeaders/silphco4.asm"
INCLUDE "scripts/silphco4.asm"
INCLUDE "data/mapObjects/silphco4.asm"
SilphCo4Blocks: INCBIN "maps/silphco4.blk"

INCLUDE "data/mapHeaders/silphco5.asm"
INCLUDE "scripts/silphco5.asm"
INCLUDE "data/mapObjects/silphco5.asm"
SilphCo5Blocks: INCBIN "maps/silphco5.blk"

INCLUDE "data/mapHeaders/silphco6.asm"
INCLUDE "scripts/silphco6.asm"
INCLUDE "data/mapObjects/silphco6.asm"
SilphCo6Blocks: INCBIN "maps/silphco6.blk"

INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "bank7",ROMX,BANK[$7]

INCLUDE "data/mapHeaders/cinnabarisland.asm"
INCLUDE "data/mapObjects/cinnabarisland.asm"
CinnabarIslandBlocks: INCBIN "maps/cinnabarisland.blk"

INCLUDE "data/mapHeaders/route1.asm"
INCLUDE "data/mapObjects/route1.asm"
Route1Blocks: INCBIN "maps/route1.blk"

UndergroundPathEntranceRoute8Blocks: INCBIN "maps/undergroundpathentranceroute8.blk"

OaksLabBlocks: INCBIN "maps/oakslab.blk"

Route16HouseBlocks:
Route2HouseBlocks:
SaffronHouse1Blocks:
SaffronHouse2Blocks:
VermilionHouse1Blocks:
NameRaterBlocks:
LavenderHouse1Blocks:
LavenderHouse2Blocks:
CeruleanHouse1Blocks:
PewterHouse1Blocks:
PewterHouse2Blocks:
ViridianHouseBlocks: INCBIN "maps/viridianhouse.blk"

CeladonMansion5Blocks:
SchoolBlocks: INCBIN "maps/school.blk"

CeruleanHouseTrashedBlocks: INCBIN "maps/ceruleanhousetrashed.blk"

DiglettsCaveEntranceRoute11Blocks:
DiglettsCaveRoute2Blocks: INCBIN "maps/diglettscaveroute2.blk"

INCLUDE "text/monster_names.asm"

INCLUDE "engine/clear_save.asm"

INCLUDE "engine/predefs7.asm"

INCLUDE "scripts/cinnabarisland.asm"

INCLUDE "scripts/route1.asm"

INCLUDE "data/mapHeaders/oakslab.asm"
INCLUDE "scripts/oakslab.asm"
INCLUDE "data/mapObjects/oakslab.asm"

INCLUDE "data/mapHeaders/viridianmart.asm"
INCLUDE "scripts/viridianmart.asm"
INCLUDE "data/mapObjects/viridianmart.asm"
ViridianMartBlocks: INCBIN "maps/viridianmart.blk"

INCLUDE "data/mapHeaders/school.asm"
INCLUDE "scripts/school.asm"
INCLUDE "data/mapObjects/school.asm"

INCLUDE "data/mapHeaders/viridianhouse.asm"
INCLUDE "scripts/viridianhouse.asm"
INCLUDE "data/mapObjects/viridianhouse.asm"

INCLUDE "data/mapHeaders/pewterhouse1.asm"
INCLUDE "scripts/pewterhouse1.asm"
INCLUDE "data/mapObjects/pewterhouse1.asm"

INCLUDE "data/mapHeaders/pewterhouse2.asm"
INCLUDE "scripts/pewterhouse2.asm"
INCLUDE "data/mapObjects/pewterhouse2.asm"

INCLUDE "data/mapHeaders/ceruleanhousetrashed.asm"
INCLUDE "scripts/ceruleanhousetrashed.asm"
INCLUDE "data/mapObjects/ceruleanhousetrashed.asm"

INCLUDE "data/mapHeaders/ceruleanhouse1.asm"
INCLUDE "scripts/ceruleanhouse1.asm"
INCLUDE "data/mapObjects/ceruleanhouse1.asm"

INCLUDE "data/mapHeaders/bikeshop.asm"
INCLUDE "scripts/bikeshop.asm"
INCLUDE "data/mapObjects/bikeshop.asm"
BikeShopBlocks: INCBIN "maps/bikeshop.blk"

INCLUDE "data/mapHeaders/lavenderhouse1.asm"
INCLUDE "scripts/lavenderhouse1.asm"
INCLUDE "data/mapObjects/lavenderhouse1.asm"

INCLUDE "data/mapHeaders/lavenderhouse2.asm"
INCLUDE "scripts/lavenderhouse2.asm"
INCLUDE "data/mapObjects/lavenderhouse2.asm"

INCLUDE "data/mapHeaders/namerater.asm"
INCLUDE "scripts/namerater.asm"
INCLUDE "data/mapObjects/namerater.asm"

INCLUDE "data/mapHeaders/vermilionhouse1.asm"
INCLUDE "scripts/vermilionhouse1.asm"
INCLUDE "data/mapObjects/vermilionhouse1.asm"

INCLUDE "data/mapHeaders/vermiliondock.asm"
INCLUDE "scripts/vermiliondock.asm"
INCLUDE "data/mapObjects/vermiliondock.asm"
VermilionDockBlocks: INCBIN "maps/vermiliondock.blk"

INCLUDE "data/mapHeaders/celadonmansion5.asm"
INCLUDE "scripts/celadonmansion5.asm"
INCLUDE "data/mapObjects/celadonmansion5.asm"

INCLUDE "data/mapHeaders/fuchsiamart.asm"
INCLUDE "scripts/fuchsiamart.asm"
INCLUDE "data/mapObjects/fuchsiamart.asm"
FuchsiaMartBlocks: INCBIN "maps/fuchsiamart.blk"

INCLUDE "data/mapHeaders/saffronhouse1.asm"
INCLUDE "scripts/saffronhouse1.asm"
INCLUDE "data/mapObjects/saffronhouse1.asm"

INCLUDE "data/mapHeaders/saffronhouse2.asm"
INCLUDE "scripts/saffronhouse2.asm"
INCLUDE "data/mapObjects/saffronhouse2.asm"

INCLUDE "data/mapHeaders/diglettscaveroute2.asm"
INCLUDE "scripts/diglettscaveroute2.asm"
INCLUDE "data/mapObjects/diglettscaveroute2.asm"

INCLUDE "data/mapHeaders/route2house.asm"
INCLUDE "scripts/route2house.asm"
INCLUDE "data/mapObjects/route2house.asm"

INCLUDE "data/mapHeaders/route5gate.asm"
INCLUDE "scripts/route5gate.asm"
INCLUDE "data/mapObjects/route5gate.asm"
Route5GateBlocks: INCBIN "maps/route5gate.blk"

INCLUDE "data/mapHeaders/route6gate.asm"
INCLUDE "scripts/route6gate.asm"
INCLUDE "data/mapObjects/route6gate.asm"
Route6GateBlocks: INCBIN "maps/route6gate.blk"

INCLUDE "data/mapHeaders/route7gate.asm"
INCLUDE "scripts/route7gate.asm"
INCLUDE "data/mapObjects/route7gate.asm"
Route7GateBlocks: INCBIN "maps/route7gate.blk"

INCLUDE "data/mapHeaders/route8gate.asm"
INCLUDE "scripts/route8gate.asm"
INCLUDE "data/mapObjects/route8gate.asm"
Route8GateBlocks: INCBIN "maps/route8gate.blk"

INCLUDE "data/mapHeaders/undergroundpathentranceroute8.asm"
INCLUDE "scripts/undergroundpathentranceroute8.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute8.asm"

INCLUDE "data/mapHeaders/powerplant.asm"
INCLUDE "scripts/powerplant.asm"
INCLUDE "data/mapObjects/powerplant.asm"
PowerPlantBlocks: INCBIN "maps/powerplant.blk"

INCLUDE "data/mapHeaders/diglettscaveroute11.asm"
INCLUDE "scripts/diglettscaveroute11.asm"
INCLUDE "data/mapObjects/diglettscaveroute11.asm"

INCLUDE "data/mapHeaders/route16house.asm"
INCLUDE "scripts/route16house.asm"
INCLUDE "data/mapObjects/route16house.asm"

INCLUDE "data/mapHeaders/route22gate.asm"
INCLUDE "scripts/route22gate.asm"
INCLUDE "data/mapObjects/route22gate.asm"
Route22GateBlocks: INCBIN "maps/route22gate.blk"

INCLUDE "data/mapHeaders/billshouse.asm"
INCLUDE "scripts/billshouse.asm"
INCLUDE "data/mapObjects/billshouse.asm"
BillsHouseBlocks: INCBIN "maps/billshouse.blk"
IF DEF(_OPTION_BEACH_HOUSE)
INCLUDE "data/mapHeaders/beach_house.asm"
INCLUDE "scripts/beach_house.asm"
BeachHouseBlockdata: INCBIN "maps/beach_house.blk"
INCLUDE "data/mapObjects/beach_house.asm"
ENDC

INCLUDE "engine/menu/oaks_pc.asm"

INCLUDE "engine/hidden_object_functions7.asm"


SECTION "Pics 1", ROMX, BANK[PICS_1]

RhydonPicFront::      INCBIN "pic/bmon/rhydon.pic"
RhydonPicBack::       INCBIN "pic/monback/rhydonb.pic"
KangaskhanPicFront::  INCBIN "pic/bmon/kangaskhan.pic"
KangaskhanPicBack::   INCBIN "pic/monback/kangaskhanb.pic"
NidoranMPicFront::    INCBIN "pic/bmon/nidoranm.pic"
NidoranMPicBack::     INCBIN "pic/monback/nidoranmb.pic"
ClefairyPicFront::    INCBIN "pic/bmon/clefairy.pic"
ClefairyPicBack::     INCBIN "pic/monback/clefairyb.pic"
SpearowPicFront::     INCBIN "pic/bmon/spearow.pic"
SpearowPicBack::      INCBIN "pic/monback/spearowb.pic"
VoltorbPicFront::     INCBIN "pic/bmon/voltorb.pic"
VoltorbPicBack::      INCBIN "pic/monback/voltorbb.pic"
NidokingPicFront::    INCBIN "pic/bmon/nidoking.pic"
NidokingPicBack::     INCBIN "pic/monback/nidokingb.pic"
SlowbroPicFront::     INCBIN "pic/bmon/slowbro.pic"
SlowbroPicBack::      INCBIN "pic/monback/slowbrob.pic"
IvysaurPicFront::     INCBIN "pic/bmon/ivysaur.pic"
IvysaurPicBack::      INCBIN "pic/monback/ivysaurb.pic"
ExeggutorPicFront::   INCBIN "pic/bmon/exeggutor.pic"
ExeggutorPicBack::    INCBIN "pic/monback/exeggutorb.pic"
LickitungPicFront::   INCBIN "pic/bmon/lickitung.pic"
LickitungPicBack::    INCBIN "pic/monback/lickitungb.pic"
ExeggcutePicFront::   INCBIN "pic/bmon/exeggcute.pic"
ExeggcutePicBack::    INCBIN "pic/monback/exeggcuteb.pic"
GrimerPicFront::      INCBIN "pic/bmon/grimer.pic"
GrimerPicBack::       INCBIN "pic/monback/grimerb.pic"
GengarPicFront::      INCBIN "pic/bmon/gengar.pic"
GengarPicBack::       INCBIN "pic/monback/gengarb.pic"
NidoranFPicFront::    INCBIN "pic/bmon/nidoranf.pic"
NidoranFPicBack::     INCBIN "pic/monback/nidoranfb.pic"
NidoqueenPicFront::   INCBIN "pic/bmon/nidoqueen.pic"
NidoqueenPicBack::    INCBIN "pic/monback/nidoqueenb.pic"
CubonePicFront::      INCBIN "pic/bmon/cubone.pic"
CubonePicBack::       INCBIN "pic/monback/cuboneb.pic"
RhyhornPicFront::     INCBIN "pic/bmon/rhyhorn.pic"
RhyhornPicBack::      INCBIN "pic/monback/rhyhornb.pic"
LaprasPicFront::      INCBIN "pic/bmon/lapras.pic"
LaprasPicBack::       INCBIN "pic/monback/laprasb.pic"
ArcaninePicFront::    INCBIN "pic/bmon/arcanine.pic"
ArcaninePicBack::     INCBIN "pic/monback/arcanineb.pic"
GyaradosPicFront::    INCBIN "pic/bmon/gyarados.pic"
GyaradosPicBack::     INCBIN "pic/monback/gyaradosb.pic"
ShellderPicFront::    INCBIN "pic/bmon/shellder.pic"
ShellderPicBack::     INCBIN "pic/monback/shellderb.pic"
TentacoolPicFront::   INCBIN "pic/bmon/tentacool.pic"
TentacoolPicBack::    INCBIN "pic/monback/tentacoolb.pic"
GastlyPicFront::      INCBIN "pic/bmon/gastly.pic"
GastlyPicBack::       INCBIN "pic/monback/gastlyb.pic"
ScytherPicFront::     INCBIN "pic/bmon/scyther.pic"
ScytherPicBack::      INCBIN "pic/monback/scytherb.pic"
StaryuPicFront::      INCBIN "pic/bmon/staryu.pic"
StaryuPicBack::       INCBIN "pic/monback/staryub.pic"
BlastoisePicFront::   INCBIN "pic/bmon/blastoise.pic"
BlastoisePicBack::    INCBIN "pic/monback/blastoiseb.pic"
PinsirPicFront::      INCBIN "pic/bmon/pinsir.pic"
PinsirPicBack::       INCBIN "pic/monback/pinsirb.pic"
TangelaPicFront::     INCBIN "pic/bmon/tangela.pic"
TangelaPicBack::      INCBIN "pic/monback/tangelab.pic"


SECTION "Battle (bank 9)", ROMX, BANK[$9]
INCLUDE "engine/battle/9.asm"


SECTION "Pics 2", ROMX, BANK[PICS_2]

GrowlithePicFront::   INCBIN "pic/bmon/growlithe.pic"
GrowlithePicBack::    INCBIN "pic/monback/growlitheb.pic"
OnixPicFront::        INCBIN "pic/bmon/onix.pic"
OnixPicBack::         INCBIN "pic/monback/onixb.pic"
FearowPicFront::      INCBIN "pic/bmon/fearow.pic"
FearowPicBack::       INCBIN "pic/monback/fearowb.pic"
PidgeyPicFront::      INCBIN "pic/bmon/pidgey.pic"
PidgeyPicBack::       INCBIN "pic/monback/pidgeyb.pic"
SlowpokePicFront::    INCBIN "pic/bmon/slowpoke.pic"
SlowpokePicBack::     INCBIN "pic/monback/slowpokeb.pic"
KadabraPicFront::     INCBIN "pic/bmon/kadabra.pic"
KadabraPicBack::      INCBIN "pic/monback/kadabrab.pic"
GravelerPicFront::    INCBIN "pic/bmon/graveler.pic"
GravelerPicBack::     INCBIN "pic/monback/gravelerb.pic"
ChanseyPicFront::     INCBIN "pic/bmon/chansey.pic"
ChanseyPicBack::      INCBIN "pic/monback/chanseyb.pic"
MachokePicFront::     INCBIN "pic/bmon/machoke.pic"
MachokePicBack::      INCBIN "pic/monback/machokeb.pic"
MrMimePicFront::      INCBIN "pic/bmon/mr.mime.pic"
MrMimePicBack::       INCBIN "pic/monback/mr.mimeb.pic"
HitmonleePicFront::   INCBIN "pic/bmon/hitmonlee.pic"
HitmonleePicBack::    INCBIN "pic/monback/hitmonleeb.pic"
HitmonchanPicFront::  INCBIN "pic/bmon/hitmonchan.pic"
HitmonchanPicBack::   INCBIN "pic/monback/hitmonchanb.pic"
ArbokPicFront::       INCBIN "pic/bmon/arbok.pic"
ArbokPicBack::        INCBIN "pic/monback/arbokb.pic"
ParasectPicFront::    INCBIN "pic/bmon/parasect.pic"
ParasectPicBack::     INCBIN "pic/monback/parasectb.pic"
PsyduckPicFront::     INCBIN "pic/bmon/psyduck.pic"
PsyduckPicBack::      INCBIN "pic/monback/psyduckb.pic"
DrowzeePicFront::     INCBIN "pic/bmon/drowzee.pic"
DrowzeePicBack::      INCBIN "pic/monback/drowzeeb.pic"
GolemPicFront::       INCBIN "pic/bmon/golem.pic"
GolemPicBack::        INCBIN "pic/monback/golemb.pic"
MagmarPicFront::      INCBIN "pic/bmon/magmar.pic"
MagmarPicBack::       INCBIN "pic/monback/magmarb.pic"
ElectabuzzPicFront::  INCBIN "pic/bmon/electabuzz.pic"
ElectabuzzPicBack::   INCBIN "pic/monback/electabuzzb.pic"
MagnetonPicFront::    INCBIN "pic/bmon/magneton.pic"
MagnetonPicBack::     INCBIN "pic/monback/magnetonb.pic"
KoffingPicFront::     INCBIN "pic/bmon/koffing.pic"
KoffingPicBack::      INCBIN "pic/monback/koffingb.pic"
MankeyPicFront::      INCBIN "pic/bmon/mankey.pic"
MankeyPicBack::       INCBIN "pic/monback/mankeyb.pic"
SeelPicFront::        INCBIN "pic/bmon/seel.pic"
SeelPicBack::         INCBIN "pic/monback/seelb.pic"
DiglettPicFront::     INCBIN "pic/bmon/diglett.pic"
DiglettPicBack::      INCBIN "pic/monback/diglettb.pic"
TaurosPicFront::      INCBIN "pic/bmon/tauros.pic"
TaurosPicBack::       INCBIN "pic/monback/taurosb.pic"
FarfetchdPicFront::   INCBIN "pic/bmon/farfetchd.pic"
FarfetchdPicBack::    INCBIN "pic/monback/farfetchdb.pic"
VenonatPicFront::     INCBIN "pic/bmon/venonat.pic"
VenonatPicBack::      INCBIN "pic/monback/venonatb.pic"
DragonitePicFront::   INCBIN "pic/bmon/dragonite.pic"
DragonitePicBack::    INCBIN "pic/monback/dragoniteb.pic"
DoduoPicFront::       INCBIN "pic/bmon/doduo.pic"
DoduoPicBack::        INCBIN "pic/monback/doduob.pic"
PoliwagPicFront::     INCBIN "pic/bmon/poliwag.pic"
PoliwagPicBack::      INCBIN "pic/monback/poliwagb.pic"
JynxPicFront::        INCBIN "pic/bmon/jynx.pic"
JynxPicBack::         INCBIN "pic/monback/jynxb.pic"
MoltresPicFront::     INCBIN "pic/bmon/moltres.pic"
MoltresPicBack::      INCBIN "pic/monback/moltresb.pic"


SECTION "Battle (bank A)", ROMX, BANK[$A]
INCLUDE "engine/battle/a.asm"


SECTION "Pics 3", ROMX, BANK[PICS_3]

ArticunoPicFront::    INCBIN "pic/bmon/articuno.pic"
ArticunoPicBack::     INCBIN "pic/monback/articunob.pic"
ZapdosPicFront::      INCBIN "pic/bmon/zapdos.pic"
ZapdosPicBack::       INCBIN "pic/monback/zapdosb.pic"
DittoPicFront::       INCBIN "pic/bmon/ditto.pic"
DittoPicBack::        INCBIN "pic/monback/dittob.pic"
MeowthPicFront::      INCBIN "pic/bmon/meowth.pic"
MeowthPicBack::       INCBIN "pic/monback/meowthb.pic"
KrabbyPicFront::      INCBIN "pic/bmon/krabby.pic"
KrabbyPicBack::       INCBIN "pic/monback/krabbyb.pic"
VulpixPicFront::      INCBIN "pic/bmon/vulpix.pic"
VulpixPicBack::       INCBIN "pic/monback/vulpixb.pic"
NinetalesPicFront::   INCBIN "pic/bmon/ninetales.pic"
NinetalesPicBack::    INCBIN "pic/monback/ninetalesb.pic"
PikachuPicFront::     INCBIN "pic/bmon/pikachu.pic"
PikachuPicBack::      INCBIN "pic/monback/pikachub.pic"
RaichuPicFront::      INCBIN "pic/bmon/raichu.pic"
RaichuPicBack::       INCBIN "pic/monback/raichub.pic"
DratiniPicFront::     INCBIN "pic/bmon/dratini.pic"
DratiniPicBack::      INCBIN "pic/monback/dratinib.pic"
DragonairPicFront::   INCBIN "pic/bmon/dragonair.pic"
DragonairPicBack::    INCBIN "pic/monback/dragonairb.pic"
KabutoPicFront::      INCBIN "pic/bmon/kabuto.pic"
KabutoPicBack::       INCBIN "pic/monback/kabutob.pic"
KabutopsPicFront::    INCBIN "pic/bmon/kabutops.pic"
KabutopsPicBack::     INCBIN "pic/monback/kabutopsb.pic"
HorseaPicFront::      INCBIN "pic/bmon/horsea.pic"
HorseaPicBack::       INCBIN "pic/monback/horseab.pic"
SeadraPicFront::      INCBIN "pic/bmon/seadra.pic"
SeadraPicBack::       INCBIN "pic/monback/seadrab.pic"
SandshrewPicFront::   INCBIN "pic/bmon/sandshrew.pic"
SandshrewPicBack::    INCBIN "pic/monback/sandshrewb.pic"
SandslashPicFront::   INCBIN "pic/bmon/sandslash.pic"
SandslashPicBack::    INCBIN "pic/monback/sandslashb.pic"
OmanytePicFront::     INCBIN "pic/bmon/omanyte.pic"
OmanytePicBack::      INCBIN "pic/monback/omanyteb.pic"
OmastarPicFront::     INCBIN "pic/bmon/omastar.pic"
OmastarPicBack::      INCBIN "pic/monback/omastarb.pic"
JigglypuffPicFront::  INCBIN "pic/bmon/jigglypuff.pic"
JigglypuffPicBack::   INCBIN "pic/monback/jigglypuffb.pic"
WigglytuffPicFront::  INCBIN "pic/bmon/wigglytuff.pic"
WigglytuffPicBack::   INCBIN "pic/monback/wigglytuffb.pic"
EeveePicFront::       INCBIN "pic/bmon/eevee.pic"
EeveePicBack::        INCBIN "pic/monback/eeveeb.pic"
FlareonPicFront::     INCBIN "pic/bmon/flareon.pic"
FlareonPicBack::      INCBIN "pic/monback/flareonb.pic"
JolteonPicFront::     INCBIN "pic/bmon/jolteon.pic"
JolteonPicBack::      INCBIN "pic/monback/jolteonb.pic"
VaporeonPicFront::    INCBIN "pic/bmon/vaporeon.pic"
VaporeonPicBack::     INCBIN "pic/monback/vaporeonb.pic"
MachopPicFront::      INCBIN "pic/bmon/machop.pic"
MachopPicBack::       INCBIN "pic/monback/machopb.pic"
ZubatPicFront::       INCBIN "pic/bmon/zubat.pic"
ZubatPicBack::        INCBIN "pic/monback/zubatb.pic"
EkansPicFront::       INCBIN "pic/bmon/ekans.pic"
EkansPicBack::        INCBIN "pic/monback/ekansb.pic"
ParasPicFront::       INCBIN "pic/bmon/paras.pic"
ParasPicBack::        INCBIN "pic/monback/parasb.pic"
PoliwhirlPicFront::   INCBIN "pic/bmon/poliwhirl.pic"
PoliwhirlPicBack::    INCBIN "pic/monback/poliwhirlb.pic"
PoliwrathPicFront::   INCBIN "pic/bmon/poliwrath.pic"
PoliwrathPicBack::    INCBIN "pic/monback/poliwrathb.pic"
WeedlePicFront::      INCBIN "pic/bmon/weedle.pic"
WeedlePicBack::       INCBIN "pic/monback/weedleb.pic"
KakunaPicFront::      INCBIN "pic/bmon/kakuna.pic"
KakunaPicBack::       INCBIN "pic/monback/kakunab.pic"
BeedrillPicFront::    INCBIN "pic/bmon/beedrill.pic"
BeedrillPicBack::     INCBIN "pic/monback/beedrillb.pic"

FossilKabutopsPic::   INCBIN "pic/bmon/fossilkabutops.pic"


SECTION "Battle (bank B)", ROMX, BANK[$B]

INCLUDE "engine/battle/b.asm"

TrainerInfoTextBoxTileGraphics:  INCBIN "gfx/trainer_info.2bpp"
BlankLeaderNames:                INCBIN "gfx/blank_leader_names.2bpp"
CircleTile:                      INCBIN "gfx/circle_tile.2bpp"
BadgeNumbersTileGraphics:        INCBIN "gfx/badge_numbers.2bpp"

INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/b_2.asm"
INCLUDE "engine/game_corner_slots2.asm"


SECTION "Pics 4", ROMX, BANK[PICS_4]

DodrioPicFront::       INCBIN "pic/bmon/dodrio.pic"
DodrioPicBack::        INCBIN "pic/monback/dodriob.pic"
PrimeapePicFront::     INCBIN "pic/bmon/primeape.pic"
PrimeapePicBack::      INCBIN "pic/monback/primeapeb.pic"
DugtrioPicFront::      INCBIN "pic/bmon/dugtrio.pic"
DugtrioPicBack::       INCBIN "pic/monback/dugtriob.pic"
VenomothPicFront::     INCBIN "pic/bmon/venomoth.pic"
VenomothPicBack::      INCBIN "pic/monback/venomothb.pic"
DewgongPicFront::      INCBIN "pic/bmon/dewgong.pic"
DewgongPicBack::       INCBIN "pic/monback/dewgongb.pic"
CaterpiePicFront::     INCBIN "pic/bmon/caterpie.pic"
CaterpiePicBack::      INCBIN "pic/monback/caterpieb.pic"
MetapodPicFront::      INCBIN "pic/bmon/metapod.pic"
MetapodPicBack::       INCBIN "pic/monback/metapodb.pic"
ButterfreePicFront::   INCBIN "pic/bmon/butterfree.pic"
ButterfreePicBack::    INCBIN "pic/monback/butterfreeb.pic"
MachampPicFront::      INCBIN "pic/bmon/machamp.pic"
MachampPicBack::       INCBIN "pic/monback/machampb.pic"
GolduckPicFront::      INCBIN "pic/bmon/golduck.pic"
GolduckPicBack::       INCBIN "pic/monback/golduckb.pic"
HypnoPicFront::        INCBIN "pic/bmon/hypno.pic"
HypnoPicBack::         INCBIN "pic/monback/hypnob.pic"
GolbatPicFront::       INCBIN "pic/bmon/golbat.pic"
GolbatPicBack::        INCBIN "pic/monback/golbatb.pic"
MewtwoPicFront::       INCBIN "pic/bmon/mewtwo.pic"
MewtwoPicBack::        INCBIN "pic/monback/mewtwob.pic"
SnorlaxPicFront::      INCBIN "pic/bmon/snorlax.pic"
SnorlaxPicBack::       INCBIN "pic/monback/snorlaxb.pic"
MagikarpPicFront::     INCBIN "pic/bmon/magikarp.pic"
MagikarpPicBack::      INCBIN "pic/monback/magikarpb.pic"
MukPicFront::          INCBIN "pic/bmon/muk.pic"
MukPicBack::           INCBIN "pic/monback/mukb.pic"
KinglerPicFront::      INCBIN "pic/bmon/kingler.pic"
KinglerPicBack::       INCBIN "pic/monback/kinglerb.pic"
CloysterPicFront::     INCBIN "pic/bmon/cloyster.pic"
CloysterPicBack::      INCBIN "pic/monback/cloysterb.pic"
ElectrodePicFront::    INCBIN "pic/bmon/electrode.pic"
ElectrodePicBack::     INCBIN "pic/monback/electrodeb.pic"
ClefablePicFront::     INCBIN "pic/bmon/clefable.pic"
ClefablePicBack::      INCBIN "pic/monback/clefableb.pic"
WeezingPicFront::      INCBIN "pic/bmon/weezing.pic"
WeezingPicBack::       INCBIN "pic/monback/weezingb.pic"
PersianPicFront::      INCBIN "pic/bmon/persian.pic"
PersianPicBack::       INCBIN "pic/monback/persianb.pic"
MarowakPicFront::      INCBIN "pic/bmon/marowak.pic"
MarowakPicBack::       INCBIN "pic/monback/marowakb.pic"
HaunterPicFront::      INCBIN "pic/bmon/haunter.pic"
HaunterPicBack::       INCBIN "pic/monback/haunterb.pic"
AbraPicFront::         INCBIN "pic/bmon/abra.pic"
AbraPicBack::          INCBIN "pic/monback/abrab.pic"
AlakazamPicFront::     INCBIN "pic/bmon/alakazam.pic"
AlakazamPicBack::      INCBIN "pic/monback/alakazamb.pic"
PidgeottoPicFront::    INCBIN "pic/bmon/pidgeotto.pic"
PidgeottoPicBack::     INCBIN "pic/monback/pidgeottob.pic"
PidgeotPicFront::      INCBIN "pic/bmon/pidgeot.pic"
PidgeotPicBack::       INCBIN "pic/monback/pidgeotb.pic"
StarmiePicFront::      INCBIN "pic/bmon/starmie.pic"
StarmiePicBack::       INCBIN "pic/monback/starmieb.pic"

RedPicBack::           INCBIN "pic/trainer/redb.pic"
OldManPic::            INCBIN "pic/trainer/oldman.pic"


SECTION "Battle (bank C)", ROMX, BANK[$C]
INCLUDE "engine/battle/c.asm"


SECTION "Pics 5", ROMX, BANK[PICS_5]

BulbasaurPicFront::    INCBIN "pic/bmon/bulbasaur.pic"
BulbasaurPicBack::     INCBIN "pic/monback/bulbasaurb.pic"
VenusaurPicFront::     INCBIN "pic/bmon/venusaur.pic"
VenusaurPicBack::      INCBIN "pic/monback/venusaurb.pic"
TentacruelPicFront::   INCBIN "pic/bmon/tentacruel.pic"
TentacruelPicBack::    INCBIN "pic/monback/tentacruelb.pic"
GoldeenPicFront::      INCBIN "pic/bmon/goldeen.pic"
GoldeenPicBack::       INCBIN "pic/monback/goldeenb.pic"
SeakingPicFront::      INCBIN "pic/bmon/seaking.pic"
SeakingPicBack::       INCBIN "pic/monback/seakingb.pic"
PonytaPicFront::       INCBIN "pic/bmon/ponyta.pic"
RapidashPicFront::     INCBIN "pic/bmon/rapidash.pic"
PonytaPicBack::        INCBIN "pic/monback/ponytab.pic"
RapidashPicBack::      INCBIN "pic/monback/rapidashb.pic"
RattataPicFront::      INCBIN "pic/bmon/rattata.pic"
RattataPicBack::       INCBIN "pic/monback/rattatab.pic"
RaticatePicFront::     INCBIN "pic/bmon/raticate.pic"
RaticatePicBack::      INCBIN "pic/monback/raticateb.pic"
NidorinoPicFront::     INCBIN "pic/bmon/nidorino.pic"
NidorinoPicBack::      INCBIN "pic/monback/nidorinob.pic"
NidorinaPicFront::     INCBIN "pic/bmon/nidorina.pic"
NidorinaPicBack::      INCBIN "pic/monback/nidorinab.pic"
GeodudePicFront::      INCBIN "pic/bmon/geodude.pic"
GeodudePicBack::       INCBIN "pic/monback/geodudeb.pic"
PorygonPicFront::      INCBIN "pic/bmon/porygon.pic"
PorygonPicBack::       INCBIN "pic/monback/porygonb.pic"
AerodactylPicFront::   INCBIN "pic/bmon/aerodactyl.pic"
AerodactylPicBack::    INCBIN "pic/monback/aerodactylb.pic"
MagnemitePicFront::    INCBIN "pic/bmon/magnemite.pic"
MagnemitePicBack::     INCBIN "pic/monback/magnemiteb.pic"
CharmanderPicFront::   INCBIN "pic/bmon/charmander.pic"
CharmanderPicBack::    INCBIN "pic/monback/charmanderb.pic"
SquirtlePicFront::     INCBIN "pic/bmon/squirtle.pic"
SquirtlePicBack::      INCBIN "pic/monback/squirtleb.pic"
CharmeleonPicFront::   INCBIN "pic/bmon/charmeleon.pic"
CharmeleonPicBack::    INCBIN "pic/monback/charmeleonb.pic"
WartortlePicFront::    INCBIN "pic/bmon/wartortle.pic"
WartortlePicBack::     INCBIN "pic/monback/wartortleb.pic"
CharizardPicFront::    INCBIN "pic/bmon/charizard.pic"
CharizardPicBack::     INCBIN "pic/monback/charizardb.pic"
FossilAerodactylPic::  INCBIN "pic/bmon/fossilaerodactyl.pic"
GhostPic::             INCBIN "pic/other/ghost.pic"
OddishPicFront::       INCBIN "pic/bmon/oddish.pic"
OddishPicBack::        INCBIN "pic/monback/oddishb.pic"
GloomPicFront::        INCBIN "pic/bmon/gloom.pic"
GloomPicBack::         INCBIN "pic/monback/gloomb.pic"
VileplumePicFront::    INCBIN "pic/bmon/vileplume.pic"
VileplumePicBack::     INCBIN "pic/monback/vileplumeb.pic"
BellsproutPicFront::   INCBIN "pic/bmon/bellsprout.pic"
BellsproutPicBack::    INCBIN "pic/monback/bellsproutb.pic"
WeepinbellPicFront::   INCBIN "pic/bmon/weepinbell.pic"
WeepinbellPicBack::    INCBIN "pic/monback/weepinbellb.pic"
VictreebelPicFront::   INCBIN "pic/bmon/victreebel.pic"
VictreebelPicBack::    INCBIN "pic/monback/victreebelb.pic"


SECTION "Battle (bank D)", ROMX, BANK[$D]

INCLUDE "engine/titlescreen2.asm"
INCLUDE "engine/battle/d.asm"
INCLUDE "engine/slot_machine.asm"
INCLUDE "engine/overworld/pewter_guys.asm"
INCLUDE "engine/multiply_divide.asm"
INCLUDE "engine/game_corner_slots.asm"


SECTION "bankE",ROMX,BANK[$E]

INCLUDE "data/moves.asm"
BaseStats: INCLUDE "data/base_stats.asm"
INCLUDE "data/cries.asm"
INCLUDE "engine/battle/e.asm"

TradingAnimationGraphics:
	INCBIN "gfx/game_boy.norepeat.2bpp"
	INCBIN "gfx/link_cable.2bpp"

TradingAnimationGraphics2:
; Pokeball traveling through the link cable.
	INCBIN "gfx/trade2.2bpp"

INCLUDE "engine/evos_moves.asm"
INCLUDE "engine/battle/e_2.asm"


SECTION "bankF",ROMX,BANK[$F]

INCLUDE "engine/battle/core.asm"


SECTION "bank10",ROMX,BANK[$10]

INCLUDE "engine/menu/pokedex.asm"
INCLUDE "engine/trade.asm"
INCLUDE "engine/intro.asm"
INCLUDE "engine/trade2.asm"


SECTION "bank11",ROMX,BANK[$11]

INCLUDE "data/mapHeaders/lavendertown.asm"
INCLUDE "data/mapObjects/lavendertown.asm"
LavenderTownBlocks: INCBIN "maps/lavendertown.blk"

ViridianPokecenterBlocks: INCBIN "maps/viridianpokecenter.blk"

SafariZoneRestHouse1Blocks:
SafariZoneRestHouse2Blocks:
SafariZoneRestHouse3Blocks:
SafariZoneRestHouse4Blocks: INCBIN "maps/safarizoneresthouse1.blk"

INCLUDE "scripts/lavendertown.asm"

INCLUDE "engine/pokedex_rating.asm"

INCLUDE "data/mapHeaders/viridianpokecenter.asm"
INCLUDE "scripts/viridianpokecenter.asm"
INCLUDE "data/mapObjects/viridianpokecenter.asm"

INCLUDE "data/mapHeaders/mansion1.asm"
INCLUDE "scripts/mansion1.asm"
INCLUDE "data/mapObjects/mansion1.asm"
Mansion1Blocks: INCBIN "maps/mansion1.blk"

INCLUDE "data/mapHeaders/rocktunnel1.asm"
INCLUDE "scripts/rocktunnel1.asm"
INCLUDE "data/mapObjects/rocktunnel1.asm"
RockTunnel1Blocks: INCBIN "maps/rocktunnel1.blk"

INCLUDE "data/mapHeaders/seafoamislands1.asm"
INCLUDE "scripts/seafoamislands1.asm"
INCLUDE "data/mapObjects/seafoamislands1.asm"
SeafoamIslands1Blocks: INCBIN "maps/seafoamislands1.blk"

INCLUDE "data/mapHeaders/ssanne3.asm"
INCLUDE "scripts/ssanne3.asm"
INCLUDE "data/mapObjects/ssanne3.asm"
SSAnne3Blocks: INCBIN "maps/ssanne3.blk"

INCLUDE "data/mapHeaders/victoryroad3.asm"
INCLUDE "scripts/victoryroad3.asm"
INCLUDE "data/mapObjects/victoryroad3.asm"
VictoryRoad3Blocks: INCBIN "maps/victoryroad3.blk"

INCLUDE "data/mapHeaders/rockethideout1.asm"
INCLUDE "scripts/rockethideout1.asm"
INCLUDE "data/mapObjects/rockethideout1.asm"
RocketHideout1Blocks: INCBIN "maps/rockethideout1.blk"

INCLUDE "data/mapHeaders/rockethideout2.asm"
INCLUDE "scripts/rockethideout2.asm"
INCLUDE "data/mapObjects/rockethideout2.asm"
RocketHideout2Blocks: INCBIN "maps/rockethideout2.blk"

INCLUDE "data/mapHeaders/rockethideout3.asm"
INCLUDE "scripts/rockethideout3.asm"
INCLUDE "data/mapObjects/rockethideout3.asm"
RocketHideout3Blocks: INCBIN "maps/rockethideout3.blk"

INCLUDE "data/mapHeaders/rockethideout4.asm"
INCLUDE "scripts/rockethideout4.asm"
INCLUDE "data/mapObjects/rockethideout4.asm"
RocketHideout4Blocks: INCBIN "maps/rockethideout4.blk"

INCLUDE "data/mapHeaders/rockethideoutelevator.asm"
INCLUDE "scripts/rockethideoutelevator.asm"
INCLUDE "data/mapObjects/rockethideoutelevator.asm"
RocketHideoutElevatorBlocks: INCBIN "maps/rockethideoutelevator.blk"

INCLUDE "data/mapHeaders/silphcoelevator.asm"
INCLUDE "scripts/silphcoelevator.asm"
INCLUDE "data/mapObjects/silphcoelevator.asm"
SilphCoElevatorBlocks: INCBIN "maps/silphcoelevator.blk"

INCLUDE "data/mapHeaders/safarizoneeast.asm"
INCLUDE "scripts/safarizoneeast.asm"
INCLUDE "data/mapObjects/safarizoneeast.asm"
SafariZoneEastBlocks: INCBIN "maps/safarizoneeast.blk"

INCLUDE "data/mapHeaders/safarizonenorth.asm"
INCLUDE "scripts/safarizonenorth.asm"
INCLUDE "data/mapObjects/safarizonenorth.asm"
SafariZoneNorthBlocks: INCBIN "maps/safarizonenorth.blk"

INCLUDE "data/mapHeaders/safarizonecenter.asm"
INCLUDE "scripts/safarizonecenter.asm"
INCLUDE "data/mapObjects/safarizonecenter.asm"
SafariZoneCenterBlocks: INCBIN "maps/safarizonecenter.blk"

INCLUDE "data/mapHeaders/safarizoneresthouse1.asm"
INCLUDE "scripts/safarizoneresthouse1.asm"
INCLUDE "data/mapObjects/safarizoneresthouse1.asm"

INCLUDE "data/mapHeaders/safarizoneresthouse2.asm"
INCLUDE "scripts/safarizoneresthouse2.asm"
INCLUDE "data/mapObjects/safarizoneresthouse2.asm"

INCLUDE "data/mapHeaders/safarizoneresthouse3.asm"
INCLUDE "scripts/safarizoneresthouse3.asm"
INCLUDE "data/mapObjects/safarizoneresthouse3.asm"

INCLUDE "data/mapHeaders/safarizoneresthouse4.asm"
INCLUDE "scripts/safarizoneresthouse4.asm"
INCLUDE "data/mapObjects/safarizoneresthouse4.asm"

INCLUDE "data/mapHeaders/unknowndungeon2.asm"
INCLUDE "scripts/unknowndungeon2.asm"
INCLUDE "data/mapObjects/unknowndungeon2.asm"
UnknownDungeon2Blocks: INCBIN "maps/unknowndungeon2.blk"

INCLUDE "data/mapHeaders/unknowndungeon3.asm"
INCLUDE "scripts/unknowndungeon3.asm"
INCLUDE "data/mapObjects/unknowndungeon3.asm"
UnknownDungeon3Blocks: INCBIN "maps/unknowndungeon3.blk"

INCLUDE "data/mapHeaders/rocktunnel2.asm"
INCLUDE "scripts/rocktunnel2.asm"
INCLUDE "data/mapObjects/rocktunnel2.asm"
RockTunnel2Blocks: INCBIN "maps/rocktunnel2.blk"

INCLUDE "data/mapHeaders/seafoamislands2.asm"
INCLUDE "scripts/seafoamislands2.asm"
INCLUDE "data/mapObjects/seafoamislands2.asm"
SeafoamIslands2Blocks: INCBIN "maps/seafoamislands2.blk"

INCLUDE "data/mapHeaders/seafoamislands3.asm"
INCLUDE "scripts/seafoamislands3.asm"
INCLUDE "data/mapObjects/seafoamislands3.asm"
SeafoamIslands3Blocks: INCBIN "maps/seafoamislands3.blk"

INCLUDE "data/mapHeaders/seafoamislands4.asm"
INCLUDE "scripts/seafoamislands4.asm"
INCLUDE "data/mapObjects/seafoamislands4.asm"
SeafoamIslands4Blocks: INCBIN "maps/seafoamislands4.blk"

INCLUDE "data/mapHeaders/seafoamislands5.asm"
INCLUDE "scripts/seafoamislands5.asm"
INCLUDE "data/mapObjects/seafoamislands5.asm"
SeafoamIslands5Blocks: INCBIN "maps/seafoamislands5.blk"

INCLUDE "engine/overworld/hidden_objects.asm"


SECTION "bank12",ROMX,BANK[$12]

INCLUDE "data/mapHeaders/route7.asm"
INCLUDE "data/mapObjects/route7.asm"
Route7Blocks: INCBIN "maps/route7.blk"

CeladonPokecenterBlocks:
RockTunnelPokecenterBlocks:
MtMoonPokecenterBlocks: INCBIN "maps/mtmoonpokecenter.blk"

Route18GateBlocks:
Route15GateBlocks:
Route11GateBlocks: INCBIN "maps/route11gate.blk"

Route18GateUpstairsBlocks:
Route16GateUpstairsBlocks:
Route12GateUpstairsBlocks:
Route15GateUpstairsBlocks:
Route11GateUpstairsBlocks: INCBIN "maps/route11gateupstairs.blk"

INCLUDE "engine/predefs12.asm"

INCLUDE "scripts/route7.asm"

INCLUDE "data/mapHeaders/redshouse1f.asm"
INCLUDE "scripts/redshouse1f.asm"
INCLUDE "data/mapObjects/redshouse1f.asm"
RedsHouse1FBlocks: INCBIN "maps/redshouse1f.blk"

INCLUDE "data/mapHeaders/celadonmart3.asm"
INCLUDE "scripts/celadonmart3.asm"
INCLUDE "data/mapObjects/celadonmart3.asm"
CeladonMart3Blocks: INCBIN "maps/celadonmart3.blk"

INCLUDE "data/mapHeaders/celadonmart4.asm"
INCLUDE "scripts/celadonmart4.asm"
INCLUDE "data/mapObjects/celadonmart4.asm"
CeladonMart4Blocks: INCBIN "maps/celadonmart4.blk"

INCLUDE "data/mapHeaders/celadonmartroof.asm"
INCLUDE "scripts/celadonmartroof.asm"
INCLUDE "data/mapObjects/celadonmartroof.asm"
CeladonMartRoofBlocks: INCBIN "maps/celadonmartroof.blk"

INCLUDE "data/mapHeaders/celadonmartelevator.asm"
INCLUDE "scripts/celadonmartelevator.asm"
INCLUDE "data/mapObjects/celadonmartelevator.asm"
CeladonMartElevatorBlocks: INCBIN "maps/celadonmartelevator.blk"

INCLUDE "data/mapHeaders/celadonmansion1.asm"
INCLUDE "scripts/celadonmansion1.asm"
INCLUDE "data/mapObjects/celadonmansion1.asm"
CeladonMansion1Blocks: INCBIN "maps/celadonmansion1.blk"

INCLUDE "data/mapHeaders/celadonmansion2.asm"
INCLUDE "scripts/celadonmansion2.asm"
INCLUDE "data/mapObjects/celadonmansion2.asm"
CeladonMansion2Blocks: INCBIN "maps/celadonmansion2.blk"

INCLUDE "data/mapHeaders/celadonmansion3.asm"
INCLUDE "scripts/celadonmansion3.asm"
INCLUDE "data/mapObjects/celadonmansion3.asm"
CeladonMansion3Blocks: INCBIN "maps/celadonmansion3.blk"

INCLUDE "data/mapHeaders/celadonmansion4.asm"
INCLUDE "scripts/celadonmansion4.asm"
INCLUDE "data/mapObjects/celadonmansion4.asm"
CeladonMansion4Blocks: INCBIN "maps/celadonmansion4.blk"

INCLUDE "data/mapHeaders/celadonpokecenter.asm"
INCLUDE "scripts/celadonpokecenter.asm"
INCLUDE "data/mapObjects/celadonpokecenter.asm"

INCLUDE "data/mapHeaders/celadongym.asm"
INCLUDE "scripts/celadongym.asm"
INCLUDE "data/mapObjects/celadongym.asm"
CeladonGymBlocks: INCBIN "maps/celadongym.blk"

INCLUDE "data/mapHeaders/celadongamecorner.asm"
INCLUDE "scripts/celadongamecorner.asm"
INCLUDE "data/mapObjects/celadongamecorner.asm"
CeladonGameCornerBlocks: INCBIN "maps/celadongamecorner.blk"

INCLUDE "data/mapHeaders/celadonmart5.asm"
INCLUDE "scripts/celadonmart5.asm"
INCLUDE "data/mapObjects/celadonmart5.asm"
CeladonMart5Blocks: INCBIN "maps/celadonmart5.blk"

INCLUDE "data/mapHeaders/celadonprizeroom.asm"
INCLUDE "scripts/celadonprizeroom.asm"
INCLUDE "data/mapObjects/celadonprizeroom.asm"
CeladonPrizeRoomBlocks: INCBIN "maps/celadonprizeroom.blk"

INCLUDE "data/mapHeaders/celadondiner.asm"
INCLUDE "scripts/celadondiner.asm"
INCLUDE "data/mapObjects/celadondiner.asm"
CeladonDinerBlocks: INCBIN "maps/celadondiner.blk"

INCLUDE "data/mapHeaders/celadonhouse.asm"
INCLUDE "scripts/celadonhouse.asm"
INCLUDE "data/mapObjects/celadonhouse.asm"
CeladonHouseBlocks: INCBIN "maps/celadonhouse.blk"

INCLUDE "data/mapHeaders/celadonhotel.asm"
INCLUDE "scripts/celadonhotel.asm"
INCLUDE "data/mapObjects/celadonhotel.asm"
CeladonHotelBlocks: INCBIN "maps/celadonhotel.blk"

INCLUDE "data/mapHeaders/mtmoonpokecenter.asm"
INCLUDE "scripts/mtmoonpokecenter.asm"
INCLUDE "data/mapObjects/mtmoonpokecenter.asm"

INCLUDE "data/mapHeaders/rocktunnelpokecenter.asm"
INCLUDE "scripts/rocktunnelpokecenter.asm"
INCLUDE "data/mapObjects/rocktunnelpokecenter.asm"

INCLUDE "data/mapHeaders/route11gate.asm"
INCLUDE "scripts/route11gate.asm"
INCLUDE "data/mapObjects/route11gate.asm"

INCLUDE "data/mapHeaders/route11gateupstairs.asm"
INCLUDE "scripts/route11gateupstairs.asm"
INCLUDE "data/mapObjects/route11gateupstairs.asm"

INCLUDE "data/mapHeaders/route12gate.asm"
INCLUDE "scripts/route12gate.asm"
INCLUDE "data/mapObjects/route12gate.asm"
Route12GateBlocks: INCBIN "maps/route12gate.blk"

INCLUDE "data/mapHeaders/route12gateupstairs.asm"
INCLUDE "scripts/route12gateupstairs.asm"
INCLUDE "data/mapObjects/route12gateupstairs.asm"

INCLUDE "data/mapHeaders/route15gate.asm"
INCLUDE "scripts/route15gate.asm"
INCLUDE "data/mapObjects/route15gate.asm"

INCLUDE "data/mapHeaders/route15gateupstairs.asm"
INCLUDE "scripts/route15gateupstairs.asm"
INCLUDE "data/mapObjects/route15gateupstairs.asm"

INCLUDE "data/mapHeaders/route16gate.asm"
INCLUDE "scripts/route16gate.asm"
INCLUDE "data/mapObjects/route16gate.asm"
Route16GateBlocks: INCBIN "maps/route16gate.blk"

INCLUDE "data/mapHeaders/route16gateupstairs.asm"
INCLUDE "scripts/route16gateupstairs.asm"
INCLUDE "data/mapObjects/route16gateupstairs.asm"

INCLUDE "data/mapHeaders/route18gate.asm"
INCLUDE "scripts/route18gate.asm"
INCLUDE "data/mapObjects/route18gate.asm"

INCLUDE "data/mapHeaders/route18gateupstairs.asm"
INCLUDE "scripts/route18gateupstairs.asm"
INCLUDE "data/mapObjects/route18gateupstairs.asm"

INCLUDE "data/mapHeaders/mtmoon1.asm"
INCLUDE "scripts/mtmoon1.asm"
INCLUDE "data/mapObjects/mtmoon1.asm"
MtMoon1Blocks: INCBIN "maps/mtmoon1.blk"

INCLUDE "data/mapHeaders/mtmoon3.asm"
INCLUDE "scripts/mtmoon3.asm"
INCLUDE "data/mapObjects/mtmoon3.asm"
MtMoon3Blocks: INCBIN "maps/mtmoon3.blk"

INCLUDE "data/mapHeaders/safarizonewest.asm"
INCLUDE "scripts/safarizonewest.asm"
INCLUDE "data/mapObjects/safarizonewest.asm"
SafariZoneWestBlocks: INCBIN "maps/safarizonewest.blk"

INCLUDE "data/mapHeaders/safarizonesecrethouse.asm"
INCLUDE "scripts/safarizonesecrethouse.asm"
INCLUDE "data/mapObjects/safarizonesecrethouse.asm"
SafariZoneSecretHouseBlocks: INCBIN "maps/safarizonesecrethouse.blk"


SECTION "bank13",ROMX,BANK[$13]

TrainerPics::
YoungsterPic::     INCBIN "pic/trainer/youngster.pic"
BugCatcherPic::    INCBIN "pic/trainer/bugcatcher.pic"
LassPic::          INCBIN "pic/trainer/lass.pic"
SailorPic::        INCBIN "pic/trainer/sailor.pic"
JrTrainerMPic::    INCBIN "pic/trainer/jr.trainerm.pic"
JrTrainerFPic::    INCBIN "pic/trainer/jr.trainerf.pic"
PokemaniacPic::    INCBIN "pic/trainer/pokemaniac.pic"
SuperNerdPic::     INCBIN "pic/trainer/supernerd.pic"
HikerPic::         INCBIN "pic/trainer/hiker.pic"
BikerPic::         INCBIN "pic/trainer/biker.pic"
BurglarPic::       INCBIN "pic/trainer/burglar.pic"
EngineerPic::      INCBIN "pic/trainer/engineer.pic"
FisherPic::        INCBIN "pic/trainer/fisher.pic"
SwimmerPic::       INCBIN "pic/trainer/swimmer.pic"
CueBallPic::       INCBIN "pic/trainer/cueball.pic"
GamblerPic::       INCBIN "pic/trainer/gambler.pic"
BeautyPic::        INCBIN "pic/trainer/beauty.pic"
PsychicPic::       INCBIN "pic/trainer/psychic.pic"
RockerPic::        INCBIN "pic/trainer/rocker.pic"
JugglerPic::       INCBIN "pic/trainer/juggler.pic"
TamerPic::         INCBIN "pic/trainer/tamer.pic"
BirdKeeperPic::    INCBIN "pic/trainer/birdkeeper.pic"
BlackbeltPic::     INCBIN "pic/trainer/blackbelt.pic"
Rival1Pic::        INCBIN "pic/trainer/rival1.pic"
ProfOakPic::       INCBIN "pic/trainer/prof.oak.pic"
ChiefPic::
ScientistPic::     INCBIN "pic/trainer/scientist.pic"
GiovanniPic::      INCBIN "pic/trainer/giovanni.pic"
RocketPic::        INCBIN "pic/trainer/rocket.pic"
CooltrainerMPic::  INCBIN "pic/trainer/cooltrainerm.pic"
CooltrainerFPic::  INCBIN "pic/trainer/cooltrainerf.pic"
BrunoPic::         INCBIN "pic/trainer/bruno.pic"
BrockPic::         INCBIN "pic/trainer/brock.pic"
MistyPic::         INCBIN "pic/trainer/misty.pic"
LtSurgePic::       INCBIN "pic/trainer/lt.surge.pic"
ErikaPic::         INCBIN "pic/trainer/erika.pic"
KogaPic::          INCBIN "pic/trainer/koga.pic"
BlainePic::        INCBIN "pic/trainer/blaine.pic"
SabrinaPic::       INCBIN "pic/trainer/sabrina.pic"
GentlemanPic::     INCBIN "pic/trainer/gentleman.pic"
Rival2Pic::        INCBIN "pic/trainer/rival2.pic"
Rival3Pic::        INCBIN "pic/trainer/rival3.pic"
LoreleiPic::       INCBIN "pic/trainer/lorelei.pic"
ChannelerPic::     INCBIN "pic/trainer/channeler.pic"
AgathaPic::        INCBIN "pic/trainer/agatha.pic"
LancePic::         INCBIN "pic/trainer/lance.pic"

INCLUDE "data/mapHeaders/battlecenterm.asm"
INCLUDE "scripts/battlecenterm.asm"
INCLUDE "data/mapObjects/battlecenterm.asm"
BattleCenterMBlocks: INCBIN "maps/battlecenterm.blk"

INCLUDE "data/mapHeaders/tradecenterm.asm"
INCLUDE "scripts/tradecenterm.asm"
INCLUDE "data/mapObjects/tradecenterm.asm"
TradeCenterMBlocks: INCBIN "maps/tradecenterm.blk"

INCLUDE "engine/give_pokemon.asm"

INCLUDE "engine/predefs.asm"


SECTION "bank14",ROMX,BANK[$14]

INCLUDE "data/mapHeaders/route22.asm"
INCLUDE "data/mapObjects/route22.asm"
Route22Blocks: INCBIN "maps/route22.blk"

INCLUDE "data/mapHeaders/route20.asm"
INCLUDE "data/mapObjects/route20.asm"
Route20Blocks: INCBIN "maps/route20.blk"

INCLUDE "data/mapHeaders/route23.asm"
INCLUDE "data/mapObjects/route23.asm"
Route23Blocks: INCBIN "maps/route23.blk"

INCLUDE "data/mapHeaders/route24.asm"
INCLUDE "data/mapObjects/route24.asm"
Route24Blocks: INCBIN "maps/route24.blk"

INCLUDE "data/mapHeaders/route25.asm"
INCLUDE "data/mapObjects/route25.asm"
Route25Blocks: INCBIN "maps/route25.blk"

INCLUDE "data/mapHeaders/indigoplateau.asm"
INCLUDE "scripts/indigoplateau.asm"
INCLUDE "data/mapObjects/indigoplateau.asm"
IndigoPlateauBlocks: INCBIN "maps/indigoplateau.blk"

INCLUDE "data/mapHeaders/saffroncity.asm"
INCLUDE "data/mapObjects/saffroncity.asm"
SaffronCityBlocks: INCBIN "maps/saffroncity.blk"
INCLUDE "scripts/saffroncity.asm"

INCLUDE "scripts/route20.asm"
INCLUDE "scripts/route22.asm"
INCLUDE "scripts/route23.asm"
INCLUDE "scripts/route24.asm"
INCLUDE "scripts/route25.asm"

INCLUDE "data/mapHeaders/victoryroad2.asm"
INCLUDE "scripts/victoryroad2.asm"
INCLUDE "data/mapObjects/victoryroad2.asm"
VictoryRoad2Blocks: INCBIN "maps/victoryroad2.blk"

INCLUDE "data/mapHeaders/mtmoon2.asm"
INCLUDE "scripts/mtmoon2.asm"
INCLUDE "data/mapObjects/mtmoon2.asm"
MtMoon2Blocks: INCBIN "maps/mtmoon2.blk"

INCLUDE "data/mapHeaders/silphco7.asm"
INCLUDE "scripts/silphco7.asm"
INCLUDE "data/mapObjects/silphco7.asm"
SilphCo7Blocks: INCBIN "maps/silphco7.blk"

INCLUDE "data/mapHeaders/mansion2.asm"
INCLUDE "scripts/mansion2.asm"
INCLUDE "data/mapObjects/mansion2.asm"
Mansion2Blocks: INCBIN "maps/mansion2.blk"

INCLUDE "data/mapHeaders/mansion3.asm"
INCLUDE "scripts/mansion3.asm"
INCLUDE "data/mapObjects/mansion3.asm"
Mansion3Blocks: INCBIN "maps/mansion3.blk"

INCLUDE "data/mapHeaders/mansion4.asm"
INCLUDE "scripts/mansion4.asm"
INCLUDE "data/mapObjects/mansion4.asm"
Mansion4Blocks: INCBIN "maps/mansion4.blk"

INCLUDE "engine/battle/14.asm"

INCLUDE "engine/overworld/card_key.asm"

INCLUDE "engine/menu/prize_menu.asm"

INCLUDE "engine/hidden_object_functions14.asm"


SECTION "bank15",ROMX,BANK[$15]

INCLUDE "data/mapHeaders/route2.asm"
INCLUDE "data/mapObjects/route2.asm"
Route2Blocks: INCBIN "maps/route2.blk"

INCLUDE "data/mapHeaders/route3.asm"
INCLUDE "data/mapObjects/route3.asm"
Route3Blocks: INCBIN "maps/route3.blk"

INCLUDE "data/mapHeaders/route4.asm"
INCLUDE "data/mapObjects/route4.asm"
Route4Blocks: INCBIN "maps/route4.blk"

INCLUDE "data/mapHeaders/route5.asm"
INCLUDE "data/mapObjects/route5.asm"
Route5Blocks: INCBIN "maps/route5.blk"

INCLUDE "data/mapHeaders/route9.asm"
INCLUDE "data/mapObjects/route9.asm"
Route9Blocks: INCBIN "maps/route9.blk"

INCLUDE "data/mapHeaders/route13.asm"
INCLUDE "data/mapObjects/route13.asm"
Route13Blocks: INCBIN "maps/route13.blk"

INCLUDE "data/mapHeaders/route14.asm"
INCLUDE "data/mapObjects/route14.asm"
Route14Blocks: INCBIN "maps/route14.blk"

INCLUDE "data/mapHeaders/route17.asm"
INCLUDE "data/mapObjects/route17.asm"
Route17Blocks: INCBIN "maps/route17.blk"

INCLUDE "data/mapHeaders/route19.asm"
INCLUDE "data/mapObjects/route19.asm"
IF DEF(_OPTION_BEACH_HOUSE)
Route19Blocks: INCBIN "maps/route19-yellow.blk"
ELSE
Route19Blocks: INCBIN "maps/route19.blk"
ENDC

INCLUDE "data/mapHeaders/route21.asm"
INCLUDE "data/mapObjects/route21.asm"
Route21Blocks: INCBIN "maps/route21.blk"

VermilionHouse2Blocks:
Route12HouseBlocks:
DayCareMBlocks: INCBIN "maps/daycarem.blk"

FuchsiaHouse3Blocks: INCBIN "maps/fuchsiahouse3.blk"

INCLUDE "engine/battle/15.asm"

INCLUDE "scripts/route2.asm"
INCLUDE "scripts/route3.asm"
INCLUDE "scripts/route4.asm"
INCLUDE "scripts/route5.asm"
INCLUDE "scripts/route9.asm"
INCLUDE "scripts/route13.asm"
INCLUDE "scripts/route14.asm"
INCLUDE "scripts/route17.asm"
INCLUDE "scripts/route19.asm"
INCLUDE "scripts/route21.asm"

INCLUDE "data/mapHeaders/vermilionhouse2.asm"
INCLUDE "scripts/vermilionhouse2.asm"
INCLUDE "data/mapObjects/vermilionhouse2.asm"

INCLUDE "data/mapHeaders/celadonmart2.asm"
INCLUDE "scripts/celadonmart2.asm"
INCLUDE "data/mapObjects/celadonmart2.asm"
CeladonMart2Blocks: INCBIN "maps/celadonmart2.blk"

INCLUDE "data/mapHeaders/fuchsiahouse3.asm"
INCLUDE "scripts/fuchsiahouse3.asm"
INCLUDE "data/mapObjects/fuchsiahouse3.asm"

INCLUDE "data/mapHeaders/daycarem.asm"
INCLUDE "scripts/daycarem.asm"
INCLUDE "data/mapObjects/daycarem.asm"

INCLUDE "data/mapHeaders/route12house.asm"
INCLUDE "scripts/route12house.asm"
INCLUDE "data/mapObjects/route12house.asm"

INCLUDE "data/mapHeaders/silphco8.asm"
INCLUDE "scripts/silphco8.asm"
INCLUDE "data/mapObjects/silphco8.asm"
SilphCo8Blocks: INCBIN "maps/silphco8.blk"

INCLUDE "engine/menu/diploma.asm"

INCLUDE "engine/overworld/trainers.asm"


SECTION "bank16",ROMX,BANK[$16]

INCLUDE "data/mapHeaders/route6.asm"
INCLUDE "data/mapObjects/route6.asm"
Route6Blocks: INCBIN "maps/route6.blk"

INCLUDE "data/mapHeaders/route8.asm"
INCLUDE "data/mapObjects/route8.asm"
Route8Blocks: INCBIN "maps/route8.blk"

INCLUDE "data/mapHeaders/route10.asm"
INCLUDE "data/mapObjects/route10.asm"
Route10Blocks: INCBIN "maps/route10.blk"

INCLUDE "data/mapHeaders/route11.asm"
INCLUDE "data/mapObjects/route11.asm"
Route11Blocks: INCBIN "maps/route11.blk"

INCLUDE "data/mapHeaders/route12.asm"
INCLUDE "data/mapObjects/route12.asm"
Route12Blocks: INCBIN "maps/route12.blk"

INCLUDE "data/mapHeaders/route15.asm"
INCLUDE "data/mapObjects/route15.asm"
Route15Blocks: INCBIN "maps/route15.blk"

INCLUDE "data/mapHeaders/route16.asm"
INCLUDE "data/mapObjects/route16.asm"
Route16Blocks: INCBIN "maps/route16.blk"

INCLUDE "data/mapHeaders/route18.asm"
INCLUDE "data/mapObjects/route18.asm"
Route18Blocks: INCBIN "maps/route18.blk"

	INCBIN "maps/unusedblocks58d7d.blk"

INCLUDE "engine/battle/16.asm"

INCLUDE "engine/experience.asm"

INCLUDE "engine/overworld/oaks_aide.asm"

INCLUDE "scripts/route6.asm"
INCLUDE "scripts/route8.asm"
INCLUDE "scripts/route10.asm"
INCLUDE "scripts/route11.asm"
INCLUDE "scripts/route12.asm"
INCLUDE "scripts/route15.asm"
INCLUDE "scripts/route16.asm"
INCLUDE "scripts/route18.asm"

INCLUDE "data/mapHeaders/fanclub.asm"
INCLUDE "scripts/fanclub.asm"
INCLUDE "data/mapObjects/fanclub.asm"
FanClubBlocks:
	INCBIN "maps/fanclub.blk"

INCLUDE "data/mapHeaders/silphco2.asm"
INCLUDE "scripts/silphco2.asm"
INCLUDE "data/mapObjects/silphco2.asm"
SilphCo2Blocks:
	INCBIN "maps/silphco2.blk"

INCLUDE "data/mapHeaders/silphco3.asm"
INCLUDE "scripts/silphco3.asm"
INCLUDE "data/mapObjects/silphco3.asm"
SilphCo3Blocks:
	INCBIN "maps/silphco3.blk"

INCLUDE "data/mapHeaders/silphco10.asm"
INCLUDE "scripts/silphco10.asm"
INCLUDE "data/mapObjects/silphco10.asm"
SilphCo10Blocks:
	INCBIN "maps/silphco10.blk"

INCLUDE "data/mapHeaders/lance.asm"
INCLUDE "scripts/lance.asm"
INCLUDE "data/mapObjects/lance.asm"
LanceBlocks:
	INCBIN "maps/lance.blk"

INCLUDE "data/mapHeaders/halloffameroom.asm"
INCLUDE "scripts/halloffameroom.asm"
INCLUDE "data/mapObjects/halloffameroom.asm"
HallofFameRoomBlocks:
	INCBIN "maps/halloffameroom.blk"

INCLUDE "engine/overworld/saffron_guards.asm"


SECTION "bank17",ROMX,BANK[$17]

SaffronMartBlocks:
LavenderMartBlocks:
CeruleanMartBlocks:
VermilionMartBlocks: INCBIN "maps/vermilionmart.blk"

CopycatsHouse2FBlocks:
RedsHouse2FBlocks: INCBIN "maps/redshouse2f.blk"

Museum1FBlocks: INCBIN "maps/museum1f.blk"

Museum2FBlocks: INCBIN "maps/museum2f.blk"

SaffronPokecenterBlocks:
VermilionPokecenterBlocks:
LavenderPokecenterBlocks:
PewterPokecenterBlocks: INCBIN "maps/pewterpokecenter.blk"

UndergroundPathEntranceRoute7Blocks:
UndergroundPathEntranceRoute7CopyBlocks:
UndergroundPathEntranceRoute6Blocks:
UndergroundPathEntranceRoute5Blocks: INCBIN "maps/undergroundpathentranceroute5.blk"

Route2GateBlocks:
ViridianForestEntranceBlocks:
ViridianForestExitBlocks: INCBIN "maps/viridianforestexit.blk"

INCLUDE "data/mapHeaders/redshouse2f.asm"
INCLUDE "scripts/redshouse2f.asm"
INCLUDE "data/mapObjects/redshouse2f.asm"

INCLUDE "engine/predefs17.asm"

INCLUDE "data/mapHeaders/museum1f.asm"
INCLUDE "scripts/museum1f.asm"
INCLUDE "data/mapObjects/museum1f.asm"

INCLUDE "data/mapHeaders/museum2f.asm"
INCLUDE "scripts/museum2f.asm"
INCLUDE "data/mapObjects/museum2f.asm"

INCLUDE "data/mapHeaders/pewtergym.asm"
INCLUDE "scripts/pewtergym.asm"
INCLUDE "data/mapObjects/pewtergym.asm"
PewterGymBlocks: INCBIN "maps/pewtergym.blk"

INCLUDE "data/mapHeaders/pewterpokecenter.asm"
INCLUDE "scripts/pewterpokecenter.asm"
INCLUDE "data/mapObjects/pewterpokecenter.asm"

INCLUDE "data/mapHeaders/ceruleanpokecenter.asm"
INCLUDE "scripts/ceruleanpokecenter.asm"
INCLUDE "data/mapObjects/ceruleanpokecenter.asm"
CeruleanPokecenterBlocks: INCBIN "maps/ceruleanpokecenter.blk"

INCLUDE "data/mapHeaders/ceruleangym.asm"
INCLUDE "scripts/ceruleangym.asm"
INCLUDE "data/mapObjects/ceruleangym.asm"
CeruleanGymBlocks: INCBIN "maps/ceruleangym.blk"

INCLUDE "data/mapHeaders/ceruleanmart.asm"
INCLUDE "scripts/ceruleanmart.asm"
INCLUDE "data/mapObjects/ceruleanmart.asm"

INCLUDE "data/mapHeaders/lavenderpokecenter.asm"
INCLUDE "scripts/lavenderpokecenter.asm"
INCLUDE "data/mapObjects/lavenderpokecenter.asm"

INCLUDE "data/mapHeaders/lavendermart.asm"
INCLUDE "scripts/lavendermart.asm"
INCLUDE "data/mapObjects/lavendermart.asm"

INCLUDE "data/mapHeaders/vermilionpokecenter.asm"
INCLUDE "scripts/vermilionpokecenter.asm"
INCLUDE "data/mapObjects/vermilionpokecenter.asm"

INCLUDE "data/mapHeaders/vermilionmart.asm"
INCLUDE "scripts/vermilionmart.asm"
INCLUDE "data/mapObjects/vermilionmart.asm"

INCLUDE "data/mapHeaders/vermiliongym.asm"
INCLUDE "scripts/vermiliongym.asm"
INCLUDE "data/mapObjects/vermiliongym.asm"
VermilionGymBlocks: INCBIN "maps/vermiliongym.blk"

INCLUDE "data/mapHeaders/copycatshouse2f.asm"
INCLUDE "scripts/copycatshouse2f.asm"
INCLUDE "data/mapObjects/copycatshouse2f.asm"

INCLUDE "data/mapHeaders/fightingdojo.asm"
INCLUDE "scripts/fightingdojo.asm"
INCLUDE "data/mapObjects/fightingdojo.asm"
FightingDojoBlocks: INCBIN "maps/fightingdojo.blk"

INCLUDE "data/mapHeaders/saffrongym.asm"
INCLUDE "scripts/saffrongym.asm"
INCLUDE "data/mapObjects/saffrongym.asm"
SaffronGymBlocks: INCBIN "maps/saffrongym.blk"

INCLUDE "data/mapHeaders/saffronmart.asm"
INCLUDE "scripts/saffronmart.asm"
INCLUDE "data/mapObjects/saffronmart.asm"

INCLUDE "data/mapHeaders/silphco1.asm"
INCLUDE "scripts/silphco1.asm"
INCLUDE "data/mapObjects/silphco1.asm"
SilphCo1Blocks: INCBIN "maps/silphco1.blk"

INCLUDE "data/mapHeaders/saffronpokecenter.asm"
INCLUDE "scripts/saffronpokecenter.asm"
INCLUDE "data/mapObjects/saffronpokecenter.asm"

INCLUDE "data/mapHeaders/viridianforestexit.asm"
INCLUDE "scripts/viridianforestexit.asm"
INCLUDE "data/mapObjects/viridianforestexit.asm"

INCLUDE "data/mapHeaders/route2gate.asm"
INCLUDE "scripts/route2gate.asm"
INCLUDE "data/mapObjects/route2gate.asm"

INCLUDE "data/mapHeaders/viridianforestentrance.asm"
INCLUDE "scripts/viridianforestentrance.asm"
INCLUDE "data/mapObjects/viridianforestentrance.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute5.asm"
INCLUDE "scripts/undergroundpathentranceroute5.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute5.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute6.asm"
INCLUDE "scripts/undergroundpathentranceroute6.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute6.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute7.asm"
INCLUDE "scripts/undergroundpathentranceroute7.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute7.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute7copy.asm"
INCLUDE "scripts/undergroundpathentranceroute7copy.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute7copy.asm"

INCLUDE "data/mapHeaders/silphco9.asm"
INCLUDE "scripts/silphco9.asm"
INCLUDE "data/mapObjects/silphco9.asm"
SilphCo9Blocks: INCBIN "maps/silphco9.blk"

INCLUDE "data/mapHeaders/victoryroad1.asm"
INCLUDE "scripts/victoryroad1.asm"
INCLUDE "data/mapObjects/victoryroad1.asm"
VictoryRoad1Blocks: INCBIN "maps/victoryroad1.blk"

INCLUDE "engine/predefs17_2.asm"

INCLUDE "engine/hidden_object_functions17.asm"


SECTION "bank18",ROMX,BANK[$18]

ViridianForestBlocks:    INCBIN "maps/viridianforest.blk"
UndergroundPathNSBlocks: INCBIN "maps/undergroundpathns.blk"
UndergroundPathWEBlocks: INCBIN "maps/undergroundpathwe.blk"

	INCBIN "maps/unusedblocks60258.blk"

SSAnne10Blocks:
SSAnne9Blocks: INCBIN "maps/ssanne9.blk"

INCLUDE "data/mapHeaders/pokemontower1.asm"
INCLUDE "scripts/pokemontower1.asm"
INCLUDE "data/mapObjects/pokemontower1.asm"
PokemonTower1Blocks: INCBIN "maps/pokemontower1.blk"

INCLUDE "data/mapHeaders/pokemontower2.asm"
INCLUDE "scripts/pokemontower2.asm"
INCLUDE "data/mapObjects/pokemontower2.asm"
PokemonTower2Blocks: INCBIN "maps/pokemontower2.blk"

INCLUDE "data/mapHeaders/pokemontower3.asm"
INCLUDE "scripts/pokemontower3.asm"
INCLUDE "data/mapObjects/pokemontower3.asm"
PokemonTower3Blocks: INCBIN "maps/pokemontower3.blk"

INCLUDE "data/mapHeaders/pokemontower4.asm"
INCLUDE "scripts/pokemontower4.asm"
INCLUDE "data/mapObjects/pokemontower4.asm"
PokemonTower4Blocks: INCBIN "maps/pokemontower4.blk"

INCLUDE "data/mapHeaders/pokemontower5.asm"
INCLUDE "scripts/pokemontower5.asm"
INCLUDE "data/mapObjects/pokemontower5.asm"
PokemonTower5Blocks: INCBIN "maps/pokemontower5.blk"

INCLUDE "data/mapHeaders/pokemontower6.asm"
INCLUDE "scripts/pokemontower6.asm"
INCLUDE "data/mapObjects/pokemontower6.asm"
PokemonTower6Blocks: INCBIN "maps/pokemontower6.blk"

	INCBIN "maps/unusedblocks60cef.blk"

INCLUDE "data/mapHeaders/pokemontower7.asm"
INCLUDE "scripts/pokemontower7.asm"
INCLUDE "data/mapObjects/pokemontower7.asm"
PokemonTower7Blocks: INCBIN "maps/pokemontower7.blk"

INCLUDE "data/mapHeaders/celadonmart1.asm"
INCLUDE "scripts/celadonmart1.asm"
INCLUDE "data/mapObjects/celadonmart1.asm"
CeladonMart1Blocks: INCBIN "maps/celadonmart1.blk"

INCLUDE "engine/overworld/cinnabar_lab.asm"

INCLUDE "data/mapHeaders/viridianforest.asm"
INCLUDE "scripts/viridianforest.asm"
INCLUDE "data/mapObjects/viridianforest.asm"

INCLUDE "data/mapHeaders/ssanne1.asm"
INCLUDE "scripts/ssanne1.asm"
INCLUDE "data/mapObjects/ssanne1.asm"
SSAnne1Blocks: INCBIN "maps/ssanne1.blk"

INCLUDE "data/mapHeaders/ssanne2.asm"
INCLUDE "scripts/ssanne2.asm"
INCLUDE "data/mapObjects/ssanne2.asm"
SSAnne2Blocks: INCBIN "maps/ssanne2.blk"

INCLUDE "data/mapHeaders/ssanne4.asm"
INCLUDE "scripts/ssanne4.asm"
INCLUDE "data/mapObjects/ssanne4.asm"
SSAnne4Blocks: INCBIN "maps/ssanne4.blk"

INCLUDE "data/mapHeaders/ssanne5.asm"
INCLUDE "scripts/ssanne5.asm"
INCLUDE "data/mapObjects/ssanne5.asm"
SSAnne5Blocks: INCBIN "maps/ssanne5.blk"

INCLUDE "data/mapHeaders/ssanne6.asm"
INCLUDE "scripts/ssanne6.asm"
INCLUDE "data/mapObjects/ssanne6.asm"
SSAnne6Blocks: INCBIN "maps/ssanne6.blk"

INCLUDE "data/mapHeaders/ssanne7.asm"
INCLUDE "scripts/ssanne7.asm"
INCLUDE "data/mapObjects/ssanne7.asm"
SSAnne7Blocks: INCBIN "maps/ssanne7.blk"

INCLUDE "data/mapHeaders/ssanne8.asm"
INCLUDE "scripts/ssanne8.asm"
INCLUDE "data/mapObjects/ssanne8.asm"
SSAnne8Blocks: INCBIN "maps/ssanne8.blk"

INCLUDE "data/mapHeaders/ssanne9.asm"
INCLUDE "scripts/ssanne9.asm"
INCLUDE "data/mapObjects/ssanne9.asm"

INCLUDE "data/mapHeaders/ssanne10.asm"
INCLUDE "scripts/ssanne10.asm"
INCLUDE "data/mapObjects/ssanne10.asm"

INCLUDE "data/mapHeaders/undergroundpathns.asm"
INCLUDE "scripts/undergroundpathns.asm"
INCLUDE "data/mapObjects/undergroundpathns.asm"

INCLUDE "data/mapHeaders/undergroundpathwe.asm"
INCLUDE "scripts/undergroundpathwe.asm"
INCLUDE "data/mapObjects/undergroundpathwe.asm"

INCLUDE "data/mapHeaders/diglettscave.asm"
INCLUDE "scripts/diglettscave.asm"
INCLUDE "data/mapObjects/diglettscave.asm"
DiglettsCaveBlocks: INCBIN "maps/diglettscave.blk"

INCLUDE "data/mapHeaders/silphco11.asm"
INCLUDE "scripts/silphco11.asm"
INCLUDE "data/mapObjects/silphco11.asm"
SilphCo11Blocks: INCBIN "maps/silphco11.blk"

INCLUDE "engine/hidden_object_functions18.asm"


SECTION "bank19",ROMX,BANK[$19]

Overworld_GFX:     INCBIN "gfx/tilesets/overworld.t2.2bpp"
Overworld_Block:   INCBIN "gfx/blocksets/overworld.bst"

RedsHouse1_GFX:
RedsHouse2_GFX:    INCBIN "gfx/tilesets/reds_house.t7.2bpp"
RedsHouse1_Block:
RedsHouse2_Block:  INCBIN "gfx/blocksets/reds_house.bst"

House_GFX:         INCBIN "gfx/tilesets/house.t2.2bpp"
House_Block:       INCBIN "gfx/blocksets/house.bst"
Mansion_GFX:       INCBIN "gfx/tilesets/mansion.t2.2bpp"
Mansion_Block:     INCBIN "gfx/blocksets/mansion.bst"
ShipPort_GFX:      INCBIN "gfx/tilesets/ship_port.t2.2bpp"
ShipPort_Block:    INCBIN "gfx/blocksets/ship_port.bst"
Interior_GFX:      INCBIN "gfx/tilesets/interior.t1.2bpp"
Interior_Block:    INCBIN "gfx/blocksets/interior.bst"
Plateau_GFX:       INCBIN "gfx/tilesets/plateau.t10.2bpp"
Plateau_Block:     INCBIN "gfx/blocksets/plateau.bst"


SECTION "bank1A",ROMX,BANK[$1A]

INCLUDE "engine/battle/1a.asm"

Version_GFX:
IF DEF(_RED)
	INCBIN "gfx/red/redgreenversion.1bpp" ; 10 tiles
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/blue/blueversion.1bpp" ; 8 tiles
ENDC

Dojo_GFX:
Gym_GFX:           INCBIN "gfx/tilesets/gym.2bpp"
Dojo_Block:
Gym_Block:         INCBIN "gfx/blocksets/gym.bst"

Mart_GFX:
Pokecenter_GFX:    INCBIN "gfx/tilesets/pokecenter.2bpp"
Mart_Block:
Pokecenter_Block:  INCBIN "gfx/blocksets/pokecenter.bst"

ForestGate_GFX:
Museum_GFX:
Gate_GFX:          INCBIN "gfx/tilesets/gate.t1.2bpp"
ForestGate_Block:
Museum_Block:
Gate_Block:        INCBIN "gfx/blocksets/gate.bst"

Forest_GFX:        INCBIN "gfx/tilesets/forest.2bpp"
Forest_Block:      INCBIN "gfx/blocksets/forest.bst"
Facility_GFX:      INCBIN "gfx/tilesets/facility.2bpp"
Facility_Block:    INCBIN "gfx/blocksets/facility.bst"


SECTION "bank1B",ROMX,BANK[$1B]

Cemetery_GFX:      INCBIN "gfx/tilesets/cemetery.t4.2bpp"
Cemetery_Block:    INCBIN "gfx/blocksets/cemetery.bst"
Cavern_GFX:        INCBIN "gfx/tilesets/cavern.t14.2bpp"
Cavern_Block:      INCBIN "gfx/blocksets/cavern.bst"
Lobby_GFX:         INCBIN "gfx/tilesets/lobby.t2.2bpp"
Lobby_Block:       INCBIN "gfx/blocksets/lobby.bst"
Ship_GFX:          INCBIN "gfx/tilesets/ship.t6.2bpp"
Ship_Block:        INCBIN "gfx/blocksets/ship.bst"
Lab_GFX:           INCBIN "gfx/tilesets/lab.t4.2bpp"
Lab_Block:         INCBIN "gfx/blocksets/lab.bst"
Club_GFX:          INCBIN "gfx/tilesets/club.t5.2bpp"
Club_Block:        INCBIN "gfx/blocksets/club.bst"
Underground_GFX:   INCBIN "gfx/tilesets/underground.t7.2bpp"
Underground_Block: INCBIN "gfx/blocksets/underground.bst"


SECTION "bank1C",ROMX,BANK[$1C]

INCLUDE "engine/gamefreak.asm"
INCLUDE "engine/hall_of_fame.asm"
INCLUDE "engine/overworld/healing_machine.asm"
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/1c.asm"
INCLUDE "engine/town_map.asm"
INCLUDE "engine/mon_party_sprites.asm"
INCLUDE "engine/in_game_trades.asm"
INCLUDE "engine/palettes.asm"
INCLUDE "engine/save.asm"


SECTION "bank1D",ROMX,BANK[$1D]

CopycatsHouse1FBlocks: INCBIN "maps/copycatshouse1f.blk"

CinnabarMartBlocks:
PewterMartBlocks: INCBIN "maps/pewtermart.blk"

FuchsiaHouse1Blocks: INCBIN "maps/fuchsiahouse1.blk"

CinnabarPokecenterBlocks:
FuchsiaPokecenterBlocks: INCBIN "maps/fuchsiapokecenter.blk"

CeruleanHouse2Blocks: INCBIN "maps/ceruleanhouse2.blk"

INCLUDE "engine/HoF_room_pc.asm"

INCLUDE "engine/status_ailments.asm"

INCLUDE "engine/items/itemfinder.asm"

INCLUDE "scripts/ceruleancity2.asm"

INCLUDE "data/mapHeaders/viridiangym.asm"
INCLUDE "scripts/viridiangym.asm"
INCLUDE "data/mapObjects/viridiangym.asm"
ViridianGymBlocks: INCBIN "maps/viridiangym.blk"

INCLUDE "data/mapHeaders/pewtermart.asm"
INCLUDE "scripts/pewtermart.asm"
INCLUDE "data/mapObjects/pewtermart.asm"

INCLUDE "data/mapHeaders/unknowndungeon1.asm"
INCLUDE "scripts/unknowndungeon1.asm"
INCLUDE "data/mapObjects/unknowndungeon1.asm"
UnknownDungeon1Blocks: INCBIN "maps/unknowndungeon1.blk"

INCLUDE "data/mapHeaders/ceruleanhouse2.asm"
INCLUDE "scripts/ceruleanhouse2.asm"
INCLUDE "data/mapObjects/ceruleanhouse2.asm"

INCLUDE "engine/menu/vending_machine.asm"

INCLUDE "data/mapHeaders/fuchsiahouse1.asm"
INCLUDE "scripts/fuchsiahouse1.asm"
INCLUDE "data/mapObjects/fuchsiahouse1.asm"

INCLUDE "data/mapHeaders/fuchsiapokecenter.asm"
INCLUDE "scripts/fuchsiapokecenter.asm"
INCLUDE "data/mapObjects/fuchsiapokecenter.asm"

INCLUDE "data/mapHeaders/fuchsiahouse2.asm"
INCLUDE "scripts/fuchsiahouse2.asm"
INCLUDE "data/mapObjects/fuchsiahouse2.asm"
FuchsiaHouse2Blocks: INCBIN "maps/fuchsiahouse2.blk"

INCLUDE "data/mapHeaders/safarizoneentrance.asm"
INCLUDE "scripts/safarizoneentrance.asm"
INCLUDE "data/mapObjects/safarizoneentrance.asm"
SafariZoneEntranceBlocks: INCBIN "maps/safarizoneentrance.blk"

INCLUDE "data/mapHeaders/fuchsiagym.asm"
INCLUDE "scripts/fuchsiagym.asm"
INCLUDE "data/mapObjects/fuchsiagym.asm"
FuchsiaGymBlocks: INCBIN "maps/fuchsiagym.blk"

INCLUDE "data/mapHeaders/fuchsiameetingroom.asm"
INCLUDE "scripts/fuchsiameetingroom.asm"
INCLUDE "data/mapObjects/fuchsiameetingroom.asm"
FuchsiaMeetingRoomBlocks: INCBIN "maps/fuchsiameetingroom.blk"

INCLUDE "data/mapHeaders/cinnabargym.asm"
INCLUDE "scripts/cinnabargym.asm"
INCLUDE "data/mapObjects/cinnabargym.asm"
CinnabarGymBlocks: INCBIN "maps/cinnabargym.blk"

INCLUDE "data/mapHeaders/lab1.asm"
INCLUDE "scripts/lab1.asm"
INCLUDE "data/mapObjects/lab1.asm"
Lab1Blocks: INCBIN "maps/lab1.blk"

INCLUDE "data/mapHeaders/lab2.asm"
INCLUDE "scripts/lab2.asm"
INCLUDE "data/mapObjects/lab2.asm"
Lab2Blocks: INCBIN "maps/lab2.blk"

INCLUDE "data/mapHeaders/lab3.asm"
INCLUDE "scripts/lab3.asm"
INCLUDE "data/mapObjects/lab3.asm"
Lab3Blocks: INCBIN "maps/lab3.blk"

INCLUDE "data/mapHeaders/lab4.asm"
INCLUDE "scripts/lab4.asm"
INCLUDE "data/mapObjects/lab4.asm"
Lab4Blocks: INCBIN "maps/lab4.blk"

INCLUDE "data/mapHeaders/cinnabarpokecenter.asm"
INCLUDE "scripts/cinnabarpokecenter.asm"
INCLUDE "data/mapObjects/cinnabarpokecenter.asm"

INCLUDE "data/mapHeaders/cinnabarmart.asm"
INCLUDE "scripts/cinnabarmart.asm"
INCLUDE "data/mapObjects/cinnabarmart.asm"

INCLUDE "data/mapHeaders/copycatshouse1f.asm"
INCLUDE "scripts/copycatshouse1f.asm"
INCLUDE "data/mapObjects/copycatshouse1f.asm"

INCLUDE "data/mapHeaders/gary.asm"
INCLUDE "scripts/gary.asm"
INCLUDE "data/mapObjects/gary.asm"
GaryBlocks: INCBIN "maps/gary.blk"

INCLUDE "data/mapHeaders/lorelei.asm"
INCLUDE "scripts/lorelei.asm"
INCLUDE "data/mapObjects/lorelei.asm"
LoreleiBlocks: INCBIN "maps/lorelei.blk"

INCLUDE "data/mapHeaders/bruno.asm"
INCLUDE "scripts/bruno.asm"
INCLUDE "data/mapObjects/bruno.asm"
BrunoBlocks: INCBIN "maps/bruno.blk"

INCLUDE "data/mapHeaders/agatha.asm"
INCLUDE "scripts/agatha.asm"
INCLUDE "data/mapObjects/agatha.asm"
AgathaBlocks: INCBIN "maps/agatha.blk"

INCLUDE "engine/menu/league_pc.asm"

INCLUDE "engine/overworld/hidden_items.asm"


SECTION "bank1E",ROMX,BANK[$1E]

INCLUDE "engine/battle/animations.asm"

INCLUDE "engine/overworld/cut2.asm"

INCLUDE "engine/overworld/ssanne.asm"

RedFishingTilesFront: INCBIN "gfx/red_fishing_tile_front.2bpp"
RedFishingTilesBack:  INCBIN "gfx/red_fishing_tile_back.2bpp"
RedFishingTilesSide:  INCBIN "gfx/red_fishing_tile_side.2bpp"
RedFishingRodTiles:   INCBIN "gfx/red_fishingrod_tiles.2bpp"

INCLUDE "data/animations.asm"

INCLUDE "engine/evolution.asm"

INCLUDE "engine/overworld/elevator.asm"

INCLUDE "engine/items/tm_prices.asm"

IF DEF(_OPTION_BEACH_HOUSE)
SECTION "bank3C",ROMX[$4314],BANK[$3C]

BeachHouse_GFX:
	INCBIN "gfx/tilesets/beachhouse.2bpp"

BeachHouse_Block:
	INCBIN "gfx/blocksets/beachhouse.bst"
ENDC
