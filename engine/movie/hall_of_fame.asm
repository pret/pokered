AnimateHallOfFame:
	call HoFFadeOutScreenAndMusic
	call ClearScreen
	ld c, 100
	rst _DelayFrames
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call DisableLCD
	ld hl, vBGMap0
	ld bc, $800
	ld a, " "
	call FillMemory
	call EnableLCD
	ld hl, rLCDC
	set rLCDC_BG_TILEMAP, [hl]
	xor a
	ld hl, wHallOfFame
	ld bc, HOF_TEAM
	call FillMemory
	xor a
	ld [wHallOfFamePalettes], a ; PureRGBnote: ADDED: clear the hall of fame team color palettes as we're going to repopulate this variable.
	ld [wUpdateSpritesEnabled], a
	ldh [hTileAnimations], a
	ld [wSpriteFlipped], a
	ld [wLetterPrintingDelayFlags], a ; no delay
	ld [wHoFMonOrPlayer], a ; mon
	inc a
	ldh [hAutoBGTransferEnabled], a
	ld hl, wNumHoFTeams
	ld a, [hl]
	inc a
	jr z, .skipInc ; don't wrap around to 0
	inc [hl]
.skipInc
	ld a, $90
	ldh [hWY], a
	ld c, BANK(Music_HallOfFame)
	ld a, MUSIC_HALL_OF_FAME
	call PlayMusic
	ld hl, wPartySpecies
	ld c, $ff
.partyMonLoop
	ld a, [hli]
	cp $ff
	jr z, .doneShowingParty
	inc c
	push hl
	push bc
	ld [wHoFMonSpecies], a
	ld a, c
	ld [wHoFPartyMonIndex], a
	call StoreHoFAltPaletteFlag ; PureRGBnote: ADDED: we will set a flag to indicate whether the pokemon uses alt palette or not
	ld hl, wPartyMon1Level
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hl]
	ld [wHoFMonLevel], a
	call HoFShowMonOrPlayer
	call HoFDisplayAndRecordMonInfo
	ld c, 80
	rst _DelayFrames
	hlcoord 2, 13
	lb bc, 3, 14
	call TextBoxBorder
	hlcoord 4, 15
	ld de, HallOfFameText
	call PlaceString
	ld c, 180
	rst _DelayFrames
	call GBFadeOutToWhite
	pop bc
	pop hl
	jr .partyMonLoop
.doneShowingParty
	ld a, c
	inc a
	ld hl, wHallOfFame
	ld bc, HOF_MON
	call AddNTimes
	ld [hl], $ff
	; PureRGBnote: MOVED: hall_of_fame.asm was moved to a different bank so this was switched to a callfar to go to the save.asm bank.
	callfar SaveHallOfFameTeams
	xor a
	ld [wHoFMonSpecies], a
	inc a
	ld [wHoFMonOrPlayer], a ; player
	call HoFShowMonOrPlayer
	call HoFDisplayPlayerStats
	call HoFFadeOutScreenAndMusic
	xor a
	ldh [hWY], a
	ld hl, rLCDC
	res rLCDC_BG_TILEMAP, [hl]
	ret

; PureRGBnote: ADDED: sets a flag in wHallofFamePalettes if the pokemon uses an alt palette.
StoreHoFAltPaletteFlag:
	push af
	ld a, [wHoFPartyMonIndex]
	ld hl, wPartyMon1Flags
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hl]
	and 1
	ld [wIsAltPalettePkmn], a
	ld b, a ; whether it's an alt palette (used as FLAG_SET or FLAG_RESET)
	ld a, [wHoFPartyMonIndex]
	ld c, a
	ld hl, wHallOfFamePalettes
	predef FlagActionPredef
	pop af
	ret



HallOfFameText:
	db "HALL OF FAME@"

HoFShowMonOrPlayer:
	call ClearScreen
	ld a, $d0
	ldh [hSCY], a
	ld a, $c0
	ldh [hSCX], a
	ld a, [wHoFMonSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wBattleMonSpecies2], a
	ld [wWholeScreenPaletteMonSpecies], a
	ld a, [wHoFMonOrPlayer]
	and a
	jr z, .showMon
; show player
	call HoFLoadPlayerPics
	jr .next1
.showMon
	ld a, [wBattleMon]
	hlcoord 12, 5
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	predef LoadMonBackPic
.next1
	lb bc, SET_PAL_POKEMON_WHOLE_SCREEN_TRADE, 0
	call RunPaletteCommand
	ld a, %11100100
	ldh [rBGP], a
	call UpdateGBCPal_BGP ; shinpokerednote: gbcnote: gbc color code from yellow 
	ld c, $31 ; back pic
	call HoFLoadMonPlayerPicTileIDs
	lb de, $a0, 4
	ld a, [wOnSGB]
	and a
	jr z, .next2
	sla e ; scroll more slowly on SGB
.next2
	call .ScrollPic ; scroll back pic left
	xor a
	ldh [hSCY], a
	ld c, a ; front pic
	call HoFLoadMonPlayerPicTileIDs
	lb de, 0, -4
; scroll front pic right

.ScrollPic
	rst _DelayFrame
	ldh a, [hSCX]
	add e
	ldh [hSCX], a
	cp d
	jr nz, .ScrollPic
	ret

HoFDisplayAndRecordMonInfo:
	ld a, [wHoFPartyMonIndex]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	call HoFDisplayMonInfo
	jp HoFRecordMonInfo

HoFDisplayMonInfo:
	hlcoord 0, 2
	lb bc, 9, 10
	call TextBoxBorder
	hlcoord 2, 6
	ld de, HoFMonInfoText
	call PlaceString
	hlcoord 1, 4
	ld de, wNameBuffer
	call PlaceString
	ld a, [wHoFMonLevel]
	hlcoord 8, 7
	call PrintLevelCommon
	ld a, [wHoFMonSpecies]
	ld [wCurSpecies], a
	hlcoord 3, 9
	predef PrintMonType
	ld a, [wHoFMonSpecies]
	jp PlayCry

HoFMonInfoText:
	db   "LEVEL/"
	next "TYPE1/"
	next "TYPE2/@"

; PureRGBnote: CHANGED: updated to be able to display higher quality back sprite if option turned on.
HoFLoadPlayerPics:
	ld de, RedPicFront
	ld a, BANK(RedPicFront)
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	rst _CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	ld a, [wSpriteOptions2]
	bit BIT_BACK_SPRITES, a
	jr nz, .swSprite
.ogSprite
	ld de, RedPicBack
	ld a, BANK(RedPicBack)
	call UncompressSpriteFromDE
	predef ScaleSpriteByTwo
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers
	ld c, $1
	jr HoFLoadMonPlayerPicTileIDs
.swSprite
	ld de, RedPicBackSW
	ld a, BANK(RedPicBackSW)
	call UncompressSpriteFromDE
	farcall LoadBackSpriteUnzoomed

HoFLoadMonPlayerPicTileIDs:
; c = base tile ID
	ld b, TILEMAP_MON_PIC
	hlcoord 12, 5
	predef_jump CopyTileIDsFromList

HoFDisplayPlayerStats:
	SetEvent EVENT_HALL_OF_FAME_DEX_RATING
	predef DisplayDexRating
	hlcoord 0, 4
	lb bc, 6, 10
	call TextBoxBorder
	hlcoord 5, 0
	lb bc, 2, 9
	call TextBoxBorder
	hlcoord 7, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 1, 6
	ld de, HoFPlayTimeText
	call PlaceString
	hlcoord 5, 7
	ld de, wPlayTimeHours
	lb bc, 1, 3
	call PrintNumber
	ld a, $6d
	ld [hli], a
	ld de, wPlayTimeMinutes
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber
	hlcoord 1, 9
	ld de, HoFMoneyText
	call PlaceString
	hlcoord 4, 10
	ld de, wPlayerMoney
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	ld hl, DexSeenOwnedText
	call HoFPrintTextAndDelay
	ld hl, DexRatingText
	call HoFPrintTextAndDelay
	ld hl, wDexRatingText

HoFPrintTextAndDelay:
	rst _PrintText
	ld c, 120
	rst _DelayFrames
	ret

HoFPlayTimeText:
	db "PLAY TIME@"

HoFMoneyText:
	db "MONEY@"

DexSeenOwnedText:
	text_far _DexSeenOwnedText
	text_end

DexRatingText:
	text_far _DexRatingText
	text_end

HoFRecordMonInfo:
	ld hl, wHallOfFame
	ld bc, HOF_MON
	ld a, [wHoFPartyMonIndex]
	call AddNTimes
	ld a, [wHoFMonSpecies]
	ld [hli], a
	ld a, [wHoFMonLevel]
	ld [hli], a
	ld e, l
	ld d, h
	ld hl, wNameBuffer
	ld bc, NAME_LENGTH
	rst _CopyData
	ret

HoFFadeOutScreenAndMusic:
	ld a, 10
	ld [wAudioFadeOutCounterReloadValue], a
	ld [wAudioFadeOutCounter], a
	ld a, $ff
	ld [wAudioFadeOutControl], a
	jp GBFadeOutToWhite
