AbleToPlaySlotsCheck:
	ld a, [wSpritePlayerStateData1ImageIndex]
	and $8
	jr z, .done ; not able
	ld b, COIN_CASE
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ld b, (GameCornerCoinCaseText_id - TextPredefs) / 2 + 1
	jr z, .printCoinCaseRequired
	ld hl, wPlayerCoins
	ld a, [hli]
	or [hl]
	jr nz, .done ; able to play
	ld b, (GameCornerNoCoinsText_id - TextPredefs) / 2 + 1
.printCoinCaseRequired
	call EnableAutoTextBoxDrawing
	ld a, b
	call PrintPredefTextID
	xor a
.done
	ld [wCanPlaySlots], a
	ret

GameCornerCoinCaseText::
	text_far _GameCornerCoinCaseText
	text_end

GameCornerNoCoinsText::
	text_far _GameCornerNoCoinsText
	text_end
