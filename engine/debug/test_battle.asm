TestBattle:
	ret

.loop
	call GBPalNormal

	; Don't mess around
	; with obedience.
	ld a, %10000000 ; EARTHBADGE
	ld [wObtainedBadges], a

	ld hl, wFlags_D733
	set BIT_TEST_BATTLE, [hl]

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
	ld [wCurEnemyLVL], a
	xor a
	ld [wMonDataLocation], a
	ld [wCurMap], a
	call AddPartyMon

	; Fight against a
	; level 20 Rhydon.
	ld a, RHYDON
	ld [wCurOpponent], a

	predef InitOpponent

	; When the battle ends,
	; do it all again.
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld [H_AUTOBGTRANSFERENABLED], a
	jr .loop
