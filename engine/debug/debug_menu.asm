DebugMenu:
IF DEF(_DEBUG)
	call ClearScreen

	; These debug names are used for TestBattle.
	; StartNewGameDebug uses the debug names from PrepareOakSpeech.
	ld hl, DebugBattlePlayerName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData

	ld hl, DebugBattleRivalName
	ld de, wRivalName
	ld bc, NAME_LENGTH
	call CopyData

	call LoadFontTilePatterns
	call LoadHpBarAndStatusTilePatterns
	call ClearSprites
	call RunDefaultPaletteCommand

	hlcoord 5, 6
	ld b, 3
	ld c, 9
	call TextBoxBorder

	hlcoord 7, 7
	ld de, DebugMenuOptions
	call PlaceString

	ld a, TEXT_DELAY_MEDIUM
	ld [wOptions], a

	ld a, A_BUTTON | B_BUTTON | START
	ld [wMenuWatchedKeys], a
	xor a
	ld [wMenuJoypadPollCount], a
	inc a
	ld [wMaxMenuItem], a
	ld a, 7
	ld [wTopMenuItemY], a
	dec a
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a

	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jp nz, DisplayTitleScreen

	ld a, [wCurrentMenuItem]
	and a ; FIGHT
	jp z, TestBattle

	; DEBUG
	ld hl, wStatusFlags6
	set BIT_DEBUG_MODE, [hl]
	jp StartNewGameDebug

DebugBattlePlayerName:
	db "Tom@"

DebugBattleRivalName:
	db "Juerry@"

DebugMenuOptions:
	db   "FIGHT"
	next "DEBUG@"
ELSE
	ret
ENDC

TestBattle: ; unreferenced except in _DEBUG
	call GBPalNormal

	ld a, 1 << BIT_EARTHBADGE
	ld [wObtainedBadges], a

	ld hl, wStatusFlags7
	set BIT_TEST_BATTLE, [hl]

	; wNumBagItems and wBagItems are not initialized here,
	; and their garbage values happen to act as if EXP_ALL
	; is in the ITEM window at the end of the test battle.
	; pokeyellow initializes TestBattle with a list of items here.

	ld hl, wPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld a, RHYDON
	ld [wCurPartySpecies], a
	ld a, 20
	ld [wCurEnemyLevel], a
	xor a
	ld [wMonDataLocation], a
	ld [wCurMap], a
	call AddPartyMon

	ld a, RHYDON
	ld [wCurOpponent], a

	predef InitOpponent

	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ldh [hAutoBGTransferEnabled], a
	jr TestBattle
