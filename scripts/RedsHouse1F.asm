; PureRGBnote: ADDED: code related to having food at home with mom was added. You have to phone her from celadon mart to have food.
RedsHouse1F_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	jp EnableAutoTextBoxDrawing

RedsHouse1F_TextPointers:
	def_text_pointers
	dw_const RedsHouse1FMomText, TEXT_REDSHOUSE1F_MOM
	dw_const RedsHouse1FDadText, TEXT_REDSHOUSE1F_DAD
	dw_const RedsHouse1FTVText,  TEXT_REDSHOUSE1F_TV

RedsHouse1FMomText:
	text_asm
	CheckEvent EVENT_MET_DAD
	jr nz, .dadAround
	CheckEvent EVENT_CALLED_DAD_WAITING
	jr nz, .not_here
.dadAround
	ld b, 0
	CheckEvent EVENT_CALLED_MOM_RICE_BALLS
	jr nz, .foodReady
	inc b
	CheckEvent EVENT_CALLED_MOM_JELLY_DONUTS
	jr nz, .foodReady
	inc b
	CheckEvent EVENT_CALLED_MOM_BRISKET
	jr nz, .foodReady
	inc b
	CheckEvent EVENT_CALLED_MOM_LASAGNA
	jr nz, .foodReady
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jr nz, .heal
	ld hl, .WakeUpText
	rst _PrintText
	rst TextScriptEnd
.heal
	call MomHealPokemon
	rst TextScriptEnd
.not_here
	ResetEvent EVENT_CALLED_DAD_WAITING
	ld hl, MomDadNotHereText
	rst _PrintText
	rst TextScriptEnd
.foodReady
	push bc
	call SaveScreenTilesToBuffer2
	; start the text
	ld hl, MomFoodReadyText
	rst _PrintText
	; load some food tiles on the table
	ld hl, vChars2 tile 5
	ld de, FoodTiles
	lb bc, BANK(FoodTiles), 1
	call CopyVideoData
	ld hl, vChars2 tile $28
	ld de, FoodTiles tile 1
	lb bc, BANK(FoodTiles), 1
	call CopyVideoData
	; reusing some tiles from the ss anne tileset
	ld hl, vChars2 tile $37
	ld de, Ship_GFX tile $50
	lb bc, BANK(Ship_GFX), 2
	call CopyVideoData
	ld a, SFX_NOISE_INSTRUMENT02
	rst _PlaySound
	ld a, SFX_59
	call PlaySoundWaitForCurrent
	ld hl, MomFoodBonAppetit
	rst _PrintText

	call GBFadeOutToWhite
	ld c, 60
	rst _DelayFrames
	call ClearScreen
	ld hl, TextScriptEndingText
	rst _PrintText ; seemingly the only way of preventing sprites from flickering on the screen during the next printText
	call GBPalNormal
	pop bc
	ld a, b
	and a
	ld hl, MomFoodRiceBallsText
	jr z, .printText
	dec a
	ld hl, MomFoodJellyDonutsText
	jr z, .printText
	dec a
	ld hl, MomFoodBrisketText
	jr z, .printText
	ld hl, MomFoodLasagnaText
.printText
	rst _PrintText
	CheckEvent EVENT_MET_DAD
	jr z, .noDad
	ld hl, DadChowedDownText
	rst _PrintText
	ld a, SFX_PUSH_BOULDER
	rst _PlaySound
	call WaitForSoundToFinish
.noDad
	; store a party pokemon's nickname to use later in the text
	ld a, [wPartyCount]
	cp 6 ; if they player has less than 6 pokemon just use the first pokemon
	ld a, 0
	jr nz, .firstPokemon
.random ; otherwise randomize it between any of the 6
	call Random
	and %111
	cp 6
	jr nc, .random
.firstPokemon
	push af
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, MomFoodPokemonJoinsText
	rst _PrintText
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	pop af
	call AddNTimes
	call WaitForSoundToFinish
	ld a, [hl] ; species
	call PlayCry
	call WaitForSoundToFinish
	ld hl, MomFoodPokemonChowedDownText
	rst _PrintText
	ld a, SFX_FLY
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, MomFoodPokemonShowText
	rst _PrintText
	call ClearScreen
	call MomHealPokemonImmediate
	call LoadScreenTilesFromBuffer2

	; remove food tiles on the table
	ld hl, vChars2 tile 5
	ld de, RedsHouse1_GFX tile 5
	lb bc, BANK(RedsHouse1_GFX), 1
	call CopyVideoData
	ld hl, vChars2 tile $28
	ld de, RedsHouse1_GFX tile $28
	lb bc, BANK(RedsHouse1_GFX), 1
	call CopyVideoData
	ld hl, vChars2 tile $37
	ld de, RedsHouse1_GFX tile $37
	lb bc, BANK(RedsHouse1_GFX), 2
	call CopyVideoData

	call UpdateSprites
	call GBFadeInFromWhite
	ld hl, MomFoodDone
	rst _PrintText
	ResetEventRange EVENT_CALLED_MOM_RICE_BALLS, EVENT_CALLED_MOM_LASAGNA
	rst TextScriptEnd

.WakeUpText:
	text_far _RedsHouse1FMomWakeUpText
	text_end

MomDadNotHereText:
	text_far _MomDadNotHereText
	text_end

MomFoodReadyText:
	text_far _MomFoodReadyText
	text_end

MomFoodBonAppetit:
	text_far _MomFoodBonAppetit
	text_end

MomFoodRiceBallsText:
	text_far _MomFoodRiceBallsText
	text_end

MomFoodJellyDonutsText:
	text_far _MomFoodJellyDonutsText
	text_end

MomFoodBrisketText:
	text_asm
	CheckEvent EVENT_MET_DAD
	ld hl, MomFoodBrisketText1
	jr z, .noDad
	ld hl, DadFoodBrisketText
.noDad
	rst _PrintText
	ld hl, MomFoodBrisketText2
	rst _PrintText
	rst TextScriptEnd

MomFoodBrisketText1:
	text_far _MomFoodBrisketText
	text_end

DadFoodBrisketText:
	text_far _DadFoodBrisketText
	text_end

MomFoodBrisketText2:
	text_far _MomFoodBrisketText2
	text_end	

MomFoodLasagnaText:
	text_far _MomFoodLasagnaText
	text_end

DadChowedDownText:
	text_far _DadChowedDownText
	text_end

MomFoodPokemonJoinsText:
	text_far _MomFoodPokemonJoinsText
	text_end

MomFoodPokemonChowedDownText:
	text_far _MomFoodPokemonChowedDownText
	text_end

MomFoodPokemonShowText:
	text_far _MomFoodPokemonShowText
	sound_get_item_1
	text_end

MomFoodDone:
	text_far _MomFoodDone
	text_end

MomHealPokemon:
	ld hl, RedsHouse1FMomYouShouldRestText
	rst _PrintText
	call HealFade
	ld hl, RedsHouse1FMomLookingGreatText
	jp PrintText

HealFade:
	call GBFadeOutToWhite
	call ReloadMapData
	call MomHealPokemonImmediate
	jp GBFadeInFromWhite

MomHealPokemonImmediate::
	call StopAllMusic
	predef HealParty
	call HealPokemonSound
;;;;;;;;;; PureRGBnote: ADDED: if you have OG+ music turned on, a beta healing theme will play at your house.
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr z, WaitForHealingSoundToFinish
	; if OG+ music, remap to a different SFX
	ld de, Music_RestPallet_Ch1
	ld hl, wChannelCommandPointers
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld de, Music_RestPallet_Ch2
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld de, Music_RestPallet_Ch3
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, BANK(Music_RestPallet)
	ld [wSpecialMusicBank], a
	call WaitForHealingSoundToFinish
	jp PlayDefaultMusic
;;;;;;;;;;

HealPokemonSound:
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	rst _PlaySound
	ret
WaitForHealingSoundToFinish:
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	rst _PlaySound
	ret

FarHeal::
	ld a, BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	call StopAllMusic
	predef HealParty
	call HealPokemonSound
	call WaitForHealingSoundToFinish
	jp PlayDefaultMusic

RedsHouse1FMomYouShouldRestText:
	text_far _RedsHouse1FMomYouShouldRestText
	text_end
RedsHouse1FMomLookingGreatText:
	text_far _RedsHouse1FMomLookingGreatText
	text_end

RedsHouse1FTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .WrongSideText
	jr nz, .got_text
	ld hl, .StandByMeMovieText
.got_text
	rst _PrintText
	rst TextScriptEnd

.StandByMeMovieText:
	text_far _RedsHouse1FTVStandByMeMovieText
	text_end

.WrongSideText:
	text_far _RedsHouse1FTVWrongSideText
	text_end

RedsHouse1FDadText:
	text_asm
	ld hl, DadHealText1
	rst _PrintText
	call HealFade
	ld hl, DadHealText2
	rst _PrintText
	rst TextScriptEnd

DadHealText1:
	text_far _DadHealText1
	text_end

DadHealText2:
	text_far _DadHealText2
	text_end
