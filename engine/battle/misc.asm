; formats a string at wMovesString that lists the moves at wMoves
FormatMovesString:
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
	ld [wNumMovesMinusOne], a
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
InitList:
	ld a, [wInitListType]
	cp INIT_ENEMYOT_LIST
	jr nz, .notEnemy
	ld hl, wEnemyPartyCount
	ld de, wEnemyMonOT
	ld a, ENEMYOT_NAME
	jr .done
.notEnemy
	cp INIT_PLAYEROT_LIST
	jr nz, .notPlayer
	ld hl, wPartyCount
	ld de, wPartyMonOT
	ld a, PLAYEROT_NAME
	jr .done
.notPlayer
	cp INIT_MON_LIST
	jr nz, .notMonster
	ld hl, wItemList
	ld de, MonsterNames
	ld a, MONSTER_NAME
	jr .done
.notMonster
	cp INIT_BAG_ITEM_LIST
	jr nz, .notBag
	ld hl, wNumBagItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .done
.notBag
	ld hl, wItemList
	ld de, ItemNames
	ld a, ITEM_NAME
.done
	ld [wNameListType], a
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, e
	ld [wUnusedCF8D], a
	ld a, d
	ld [wUnusedCF8D + 1], a
	ld bc, ItemPrices
	ld a, c
	ld [wItemPrices], a
	ld a, b
	ld [wItemPrices + 1], a
	ret

; get species of mon e in list [wMonDataLocation] for LoadMonData
GetMonSpecies:
	ld hl, wPartySpecies
	ld a, [wMonDataLocation]
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
