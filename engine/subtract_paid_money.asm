; subtracts the amount the player paid from their money
; sets carry flag if there is enough money and unsets carry flag if not
SubtractAmountPaidFromMoney_:
	ld de, wPlayerMoney
	ld hl, hMoney ; total price of items
	ld c, 3 ; length of money in bytes
	call StringCmp
	ret c
	ld de, wPlayerMoney + 2
	ld hl, hMoney + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef SubBCDPredef ; subtract total price from money
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; redraw money text box
	and a
	ret
