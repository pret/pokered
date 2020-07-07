HasEnoughMoney::
; Check if the player has at least as much
; money as the 3-byte BCD value at hMoney.
	ld de, wPlayerMoney
	ld hl, hMoney
	ld c, 3
	jp StringCmp

HasEnoughCoins::
; Check if the player has at least as many
; coins as the 2-byte BCD value at hCoins.
	ld de, wPlayerCoins
	ld hl, hCoins
	ld c, 2
	jp StringCmp
