HiddenItems: ; 76688 (1d:6688)
	ld hl, HiddenItemCoords
	call Func_76857
	ld [$cd41], a
	ld hl, $d6f0
	ld a, [$cd41]
	ld c, a
	ld b, $2
	ld a, $10
	call Predef
	ld a, c
	and a
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [$cc3c], a
	ld a, [$cd3d] ; item ID
	ld [$d11e], a
	call GetItemName
	ld a, $24
	jp PrintPredefTextID

INCLUDE "data/hidden_item_coords.asm"

FoundHiddenItemText: ; 7675b (1d:675b)
; XXX where is the pointer to this?
	TX_FAR _FoundHiddenItemText
	db $8
	ld a, [$cd3d] ; item ID
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, $d6f0
	ld a, [$cd41]
	ld c, a
	ld b, $1
	ld a, $10
	call Predef
	ld a, (SFX_02_3b - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	call WaitForSoundToFinish ; wait for sound to finish playing
	jp TextScriptEnd
.BagFull
	call WaitForTextScrollButtonPress ; wait for button press
	xor a
	ld [$cc3c], a
	ld hl, HiddenItemBagFullText
	call PrintText
	jp TextScriptEnd

HiddenItemBagFullText: ; 76794 (1d:6794)
	TX_FAR _HiddenItemBagFullText
	db "@"

HiddenCoins: ; 76799 (1d:6799)
	ld b, COIN_CASE
	ld a, $1c
	call Predef
	ld a, b
	and a
	ret z
	ld hl, HiddenCoinCoords
	call Func_76857
	ld [$cd41], a
	ld hl, $d6fe
	ld a, [$cd41]
	ld c, a
	ld b, $2
	ld a, $10
	call Predef
	ld a, c
	and a
	ret nz
	xor a
	ld [$ff9f], a
	ld [$ffa0], a
	ld [$ffa1], a
	ld a, [$cd3d]
	sub COIN
	cp 10
	jr z, .bcd10
	cp 20
	jr z, .bcd20
	cp 40
	jr z, .bcd20
	jr .bcd100
.bcd10
	ld a, $10
	ld [$ffa1], a
	jr .bcddone
.bcd20
	ld a, $20
	ld [$ffa1], a
	jr .bcddone
.bcd40 ; due to a typo, this is never used
	ld a, $40
	ld [$ffa1], a
	jr .bcddone
.bcd100
	ld a, $1
	ld [$ffa0], a
.bcddone
	ld de, $d5a5
	ld hl, $ffa1
	ld c, $2
	ld a, $b
	call Predef
	ld hl, $d6fe
	ld a, [$cd41]
	ld c, a
	ld b, $1
	ld a, $10
	call Predef
	call EnableAutoTextBoxDrawing
	ld a, [wPlayerCoins]
	cp $99
	jr nz, .RoomInCoinCase
	ld a, [wPlayerCoins + 1]
	cp $99
	jr nz, .RoomInCoinCase
	ld a, $2c
	jr .done
.RoomInCoinCase
	ld a, $2b
.done
	jp PrintPredefTextID

INCLUDE "data/hidden_coins.asm"

FoundHiddenCoinsText: ; 76847 (1d:6847)
	TX_FAR _FoundHiddenCoinsText
	db $10,"@"

DroppedHiddenCoinsText: ; 7684d (1d:684d)
	TX_FAR _FoundHiddenCoins2Text
	db $10
	TX_FAR _DroppedHiddenCoinsText
	db "@"

Func_76857: ; 76857 (1d:6857)
	ld a, [$cd40]
	ld d, a
	ld a, [$cd41]
	ld e, a
	ld a, [W_CURMAP]
	ld b, a
	ld c, $ff
.loop
	inc c
	ld a, [hli]
	cp $ff ; end of the list?
	ret z  ; if so, we're done here
	cp b
	jr nz, .asm_76877 ; 0x7686b $a
	ld a, [hli]
	cp d
	jr nz, .asm_76878 ; 0x7686f $7
	ld a, [hli]
	cp e
	jr nz, .loop
	ld a, c
	ret
.asm_76877
	inc hl
.asm_76878
	inc hl
	jr .loop
