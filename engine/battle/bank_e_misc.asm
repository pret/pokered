; formats a string at wMovesString that lists the moves at wMoves
FormatMovesString: ; 39b87 (e:5b87)
	ld hl, wMoves
	ld de, wMovesString
	ld b, $0
.printMoveNameLoop
	ld a, [hli]
	and a ; end of move list?
	jr z, .printDashLoop ; print dashes when no moves are left
	push hl
	ld [wd0b5], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [wNameListType], a
	call GetName
	ld hl, wcd6d
.copyNameLoop
	ld a, [hli]
	cp $50
	jr z, .doneCopyingName
	ld [de], a
	inc de
	jr .copyNameLoop
.doneCopyingName
	ld a, b
	ld [wcd6c], a
	inc b
	ld a, $4e ; line break
	ld [de], a
	inc de
	pop hl
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .printMoveNameLoop
.printDashLoop
	ld a, "-"
	ld [de], a
	inc de
	inc b
	ld a, b
	cp NUM_MOVES
	jr z, .done
	ld a, $4e ; line break
	ld [de], a
	inc de
	jr .printDashLoop
.done
	ld a, "@"
	ld [de], a
	ret

; XXX this is called in a few places, but it doesn't appear to do anything useful
Func_39bd5: ; 39bd5 (e:5bd5)
	ld a, [wd11b]
	cp $1
	jr nz, .asm_39be6
	ld hl, wEnemyPartyCount
	ld de, wEnemyMonOT
	ld a, ENEMYOT_NAME
	jr .asm_39c18
.asm_39be6
	cp $4
	jr nz, .calcAttackStat4
	ld hl, wPartyCount
	ld de, wPartyMonOT
	ld a, PLAYEROT_NAME
	jr .asm_39c18
.calcAttackStat4
	cp $5
	jr nz, .asm_39c02
	ld hl, wStringBuffer2 + 11
	ld de, MonsterNames
	ld a, MONSTER_NAME
	jr .asm_39c18
.asm_39c02
	cp $2
	jr nz, .asm_39c10
	ld hl, wNumBagItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .asm_39c18
.asm_39c10
	ld hl, wStringBuffer2 + 11
	ld de, ItemNames
	ld a, ITEM_NAME
.asm_39c18
	ld [wNameListType], a
	ld a, l
	ld [wList], a
	ld a, h
	ld [wList + 1], a
	ld a, e
	ld [wcf8d], a
	ld a, d
	ld [wcf8e], a
	ld bc, ItemPrices
	ld a, c
	ld [wItemPrices], a
	ld a, b
	ld [wItemPrices + 1], a
	ret

; get species of mon e in list [wcc49] for LoadMonData
GetMonSpecies: ; 39c37 (e:5c37)
	ld hl, wPartySpecies
	ld a, [wcc49]
	and a
	jr z, .getSpecies
	dec a
	jr z, .enemyParty
	ld hl, wBoxSpecies
	jr .getSpecies
.enemyParty
	ld hl, wEnemyPartyMons
.getSpecies
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wcf91], a
	ret
