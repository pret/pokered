DiamondMine_Script:
	call DiamondMineCheckWalkOutOfHole
	call DiamondMineCheckHandleHole
	call DiamondMineCheckPlayBoomboxMusic
	call DiamondMineCheckDigAnimation
	call DiamondMineCheckFinalStep
	call DiamondMineJiggleBoomBox
	jp EnableAutoTextBoxDrawing

DiamondMineJiggleBoomBox::
	CheckEvent EVENT_DIAMOND_MINE_STARTED_BOOMBOX
	ret z
.jiggleBoombox
	call Random
	and %11
	ret nz ; only update this 25% of the time
	CheckFlag FLAG_DIAMOND_MINE_BOOMBOX_JIGGLE
	ld a, [wSprite02StateData1XPixels]
	jr nz, .left1Pixel
	inc a
	ld [wSprite02StateData1XPixels], a
	SetFlag FLAG_DIAMOND_MINE_BOOMBOX_JIGGLE
	ret
.left1Pixel
	dec a
	ld [wSprite02StateData1XPixels], a
	ResetFlag FLAG_DIAMOND_MINE_BOOMBOX_JIGGLE
	ret

DiamondMineCheckWalkOutOfHole:
	ld a, [wCurrentMapScriptFlags]
	bit 5, a
	ret z
DiamondMineReplaceHole:
	; replace hole block and move prospector sprite if necessary
	CheckEvent EVENT_DIAMOND_MINE_HIT_BEDROCK
	jr z, .checkLeaveHole
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	ld a, $A2
	jr z, .replaceTile
	; move the sailor to the lower location
	ld a, 22 ; x = 18 + 4 (MapX offset)
	ld [wSprite01StateData2MapX], a
	ld a, 7 ; x = 3 + 4 (MapY offset)
	ld [wSprite01StateData2MapY], a
	; move the boombox to the lower location
	dec a ; x = 2 + 4 (MapY offset)
	ld [wSprite02StateData2MapY], a
	ld a, 23 ; x = 19 + 4 (MapX offset)
	ld [wSprite02StateData2MapX], a
	ld a, $9D
.replaceTile
	lb bc, 1, 1
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
.checkLeaveHole
	ld hl, DiamondMineLeaveHoleCoords
	call ArePlayerCoordsInArray
	ret nc
	; always face down
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ret

DiamondMineLeaveHoleCoords:
	dbmapcoord  2,  3
	dbmapcoord 18, 17
	dbmapcoord  4, 15
	db -1

DiamondMineCheckHandleHole:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret nz
	ld a, DIAMOND_MINE
	ld [wDungeonWarpDestinationMap], a
	ld hl, DiamondMineHoleCoords
	call IsPlayerOnDungeonWarp
	ld a, [wd72d]
	bit 4, a
	ret nz
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	ret z
	ld hl, DiamondMineFinishedHoleCoord
	jp IsPlayerOnDungeonWarp	

DiamondMineFinishedHoleCoord:
	dbmapcoord 2, 2
	db -1 ; end

DiamondMineHoleCoords:
	dbmapcoord 99, 99 ; skip the first entry
	dbmapcoord 17, 15
	dbmapcoord 18, 15
	dbmapcoord 17, 16
	dbmapcoord 18, 16
	dbmapcoord  3, 13
	dbmapcoord  4, 13
	dbmapcoord  3, 14
	dbmapcoord  4, 14
	db -1 ; end

DiamondMineCheckPlayBoomboxMusic:
	CheckEvent EVENT_DIAMOND_MINE_ZAPPING_BOOMBOX
	jp nz, DiamondMinePlayMusic.zapAnimation
	ld d, 0
DiamondMinePlayMusic::
	CheckEvent EVENT_DIAMOND_MINE_STARTED_BOOMBOX
	jr z, .checkWhichDefaultMusic
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	ld c, 0
	jr z, .notFinalFloor
	ld c, 10
.notFinalFloor
	ld b, 10
	ld a, [wYCoord]
	cp b
	jp nc, .checkWhichDefaultMusic
	ld a, [wXCoord]
	cp c
	jr c, .checkWhichDefaultMusic
.playBoomboxMusic
	ld a, d
	and a
	jr nz, .playMusic
	; play boombox music if in the right coordinates
	ld a, [wReplacedMapMusic] ; non-zero if we're playing special map music
	and a
	ret nz
.playMusic
	ld a, MUSIC_HERE_COMES_TEAM_GR
	ld [wReplacedMapMusic], a
    ld a, [wOptions2]
    bit BIT_MUSIC, a
    jr z, .normalMusic
    ld a, [wLastMusicSoundID]
    cp MUSIC_CINNABAR_MANSION
    ret z
    ld a, MUSIC_CINNABAR_MANSION
    ld [wLastMusicSoundID], a
    ld c, BANK(Music_HereComesGR)
    ld hl, Music_HereComesGR
    jp PlaySpecialFieldMusic
.normalMusic
    ld a, [wLastMusicSoundID]
    cp MUSIC_GAME_CORNER
    ret z
    ld a, MUSIC_GAME_CORNER
    ld [wLastMusicSoundID], a
	ld c, BANK(Music_GameCorner)
	ld a, MUSIC_GAME_CORNER
	jp PlayMusic
.checkWhichDefaultMusic
	ld a, d
	and a
	jr nz, .forcePlayDefaultMusic
	ld a, [wReplacedMapMusic] ; non-zero if we're playing special map music
	and a
	ret z
.forcePlayDefaultMusic
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	jr nz, .skipBikeMusicCheck
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .skipBikeMusicCheck
	ld a, [wLastMusicSoundID]
	cp MUSIC_BIKE_RIDING
	ret z
	jr .playDefaultMusic
.skipBikeMusicCheck
	ld a, [wLastMusicSoundID]
	cp MUSIC_DUNGEON3
	ret z
.playDefaultMusic
	xor a
	ld [wReplacedMapMusic], a
	jp PlayDefaultMusic
.zapAnimation
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
 	ld bc, wPartyMon2 - wPartyMon1
 	call AddNTimes
 	ld a, [hl]
 	call PlayCry
 	call WaitForSoundToFinish
	; get into music engine 2 so we can play battle sound effects
	ld c, BANK(Music_TrainerBattle)
	ld a, MUSIC_TRAINER_BATTLE
	call PlayMusic
	call StopAllMusic
	ld a, $60
	ld [wTempoModifier], a
	ld a, $12
	ld [wFrequencyModifier], a
	ld a, SFX_BATTLE_2E
	call PlaySound
	call GBFadeOutToWhite
	call GBFadeInFromWhite
	call GBFadeOutToWhite
	call GBFadeInFromWhite
	call DiamondMineShakeScreen
	call WaitForSoundToFinish
	xor a
    ld [wFrequencyModifier], a
    ld [wTempoModifier], a
    ResetEvent EVENT_DIAMOND_MINE_ZAPPING_BOOMBOX
    jp .playMusic

DiamondMineShakeScreen:
	ldh a, [hSCX]
	ld d, a
	ld e, 1
	ld b, 8
.shakeLoop
	ld a, e
	xor $fe
	ld e, a
	add d
	ldh [hSCX], a
	ld c, 2
	rst _DelayFrames
	dec b
	jr nz, .shakeLoop
	ld a, d
	ldh [hSCX], a
	ret


DiamondMineCheckDigAnimation:
	CheckEvent EVENT_DIAMOND_MINE_DIG_ANIMATION
	ret z
	; digging animation
	call DiamondMineShakeScreen
	call DiamondMineShakeScreen
	call DiamondMineShakeScreen
	ld c, 8
.soundEffectLoop
	ld a, SFX_TRADE_MACHINE
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN5 * 2
	ld de, SFX_Pickaxe_Tink
	ld [hl], e
	inc hl
	ld [hl], d
	ld b, 4
.runForwardLoop
	ld a, [wSprite01StateData1ImageIndex]
	xor 1
	ld [wSprite01StateData1ImageIndex], a
	push bc
	ld c, 3
	rst _DelayFrames
	pop bc
	dec b
	jr nz, .runForwardLoop
	dec c
	jr nz, .soundEffectLoop
	ld c, 20
	rst _DelayFrames
	ld a, [wSprite01StateData1ImageIndex]
	xor 1
	ld [wSprite01StateData1ImageIndex], a
	rst _DelayFrame
	call GBPalWhiteOut
	call Delay3
	call GBPalNormal
	lb bc, 1, 1
	ld a, $A2
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ld a, SFX_PUSH_BOULDER
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN8 * 2
	ld de, SFX_Break_Stone
	ld [hl], e
	inc hl
	ld [hl], d
	call DiamondMineShakeScreen
	ResetEvent EVENT_DIAMOND_MINE_DIG_ANIMATION
	SetEvent EVENT_DIAMOND_MINE_HIT_BEDROCK
	ret

DiamondMineCheckFinalStep:
	CheckEvent EVENT_DIAMOND_MINE_FINAL_STEP
	ret z
	ld a, [wd730]
	bit 0, a
	ret nz
	bit 7, a
	ret nz
	ResetEvent EVENT_DIAMOND_MINE_FINAL_STEP

	; make the prospector face down
	ld a, DIAMOND_MINE_PROSPECTOR
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection

	ld a, TEXT_DIAMOND_MINE_COMPLETED
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ret






DiamondMine_TextPointers:
	def_text_pointers
	dw_const DiamondMineProspectorText, TEXT_DIAMOND_MINE_PROSPECTOR
	dw_const DiamondMineBoombox, TEXT_DIAMOND_MINE_BOOMBOX
	dw_const DiamondMineCompleted, TEXT_DIAMOND_MINE_COMPLETED

DiamondMineProspectorText:
	text_asm
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	jp nz, .doneHelp
	CheckEvent EVENT_DIAMOND_MINE_GAVE_REPELS
	jr nz, .secondHelp
	CheckEvent EVENT_DIAMOND_MINE_AGREED_TO_HELP
	jr nz, .repelCheck
	ld hl, .intro
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .okayThen
	jr nz, .done1
	SetEvent EVENT_DIAMOND_MINE_AGREED_TO_HELP
	ld hl, .help1
.done1
	rst _PrintText
	rst TextScriptEnd
.repelCheck
	ld b, REPEL
	call IsItemInBag
	ld hl, .giveRepels1
	jr z, .done1
	; amount of repels in bag still in a
	cp 10 ; need 10 REPEL
	jr c, .done1
	ld hl, .giveRepels2
	rst _PrintText
	ld hl, .giveRepels3
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	ld hl, .okayThen
	and a
	jr nz, .done1
	SetEvent EVENT_DIAMOND_MINE_GAVE_REPELS
	ld a, REPEL
	ldh [hItemToRemoveID], a
	ld d, 10 ; number to remove
	farcall RemoveNumItemByID
	ld hl, .giveRepels4
	rst _PrintText
	call GBFadeOutToBlack
	ld a, SFX_PUSH_BOULDER
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN8 * 2
	ld de, SFX_Spray_Repel
	ld [hl], e
	inc hl
	ld [hl], d
	ld c, 100
	rst _DelayFrames
	call GBFadeInFromBlack
	; fall through
.secondHelp
	CheckEvent EVENT_DIAMOND_MINE_STARTED_BOOMBOX
	jr nz, .thirdHelp
	ld hl, .help2
	jr .done1
.thirdHelp
	CheckEvent EVENT_DIAMOND_MINE_HIT_BEDROCK
	jr nz, .hitBedrock
	ld hl, .help3
	rst _PrintText
	ld a, DIAMOND_MINE_PROSPECTOR
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirection
	SetEvent EVENT_DIAMOND_MINE_DIG_ANIMATION
	ld hl, .ragh
	jr .done1
.hitBedrock
	ld hl, .help4
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .okayThen
	jr nz, .done1point5
	call DiamondMineShowPartyMenuSelection
	ld hl, .okayThen
	jr nc, .notDone1
.done1point5
	rst _PrintText
	rst TextScriptEnd
.notDone1
	ld a, [wcf91]
	cp ONIX
	jp nz, DiamondMineBoombox.printWrongMon
	call GetPartyMonName2
	ld hl, .hardWorkBegins
	rst _PrintText
	ld a, ONIX
	call PlayCry
	call WaitForSoundToFinish
	ld a, HARDENED_ONIX
	ld [wcf91], a
	callfar ChangePartyPokemonSpecies ; turn the onix into a hardened onix
	call SaveScreenTilesToBuffer2
	call GBFadeOutToWhite
	call ClearScreen
	ld hl, TextScriptEndingText
	rst _PrintText ; seemingly the only way of preventing sprites from flickering on the screen during the next printText
	call GBPalNormal
	ld hl, .weeksOfWork
	rst _PrintText
	call ClearScreen
	call LoadScreenTilesFromBuffer2
	SetEvent EVENT_DIAMOND_MINE_COMPLETED
	ld a, HS_PROSPECTORS_HOUSE_PROSPECTOR
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	call DiamondMineReplaceHole
	call GBFadeInFromWhite
	SetEvent EVENT_DIAMOND_MINE_FINAL_STEP
	call DiamondMineCheckPlayBoomboxMusic ; reset music
	; load sprite movement to get down there and talk to the guy again
	ld hl, .diamondDownHere
	rst _PrintText
	call DiamondMineLoadPlayerDirections
	rst TextScriptEnd
.doneHelp
	ld hl, .endText
	rst _PrintText
	ld d, ONIX
	callfar IsMonInParty
	jr nc, .done3
	ld hl, TextScriptPromptButton
	call TextCommandProcessor
	ld hl, .moreOnix1
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .okayThen
	jr nz, .done2
	ld hl, .moreOnix2
	rst _PrintText
	call DiamondMineShowPartyMenuSelection
	ld hl, .okayThen
	jr c, .done2
	ld a, [wcf91]
	cp ONIX
	jp nz, DiamondMineBoombox.printWrongMon
	; onix was selected
	call GetPartyMonName2
	ld a, HARDENED_ONIX
	ld [wcf91], a
	callfar ChangePartyPokemonSpecies ; turn the onix into a hardened onix
	call GBFadeOutToWhite
	ld c, 60
	rst _DelayFrames
	call GBFadeInFromWhite
	ld hl, .moreOnix3
.done2
	rst _PrintText
.done3
	rst TextScriptEnd	
.intro
	text_far _DiamondMineProspectorText
	text_end
.okayThen
	text_far _NoTrade1Text
	text_end
.help1
	text_far _DiamondMineProspectorHelp
	text_end
.giveRepels1
	text_far _DiamondProspectorRepels
	text_end
.giveRepels2
	text_far _DiamondProspectorRepels
	text_promptbutton
	text_end
.giveRepels3
	text_far _DiamondProspectorGiveRepels
	text_end
.giveRepels4
	text_far _DiamondProspectorUseRepels
	text_end
.help2
	text_far _DiamondMineProspectorHelp2
	text_end
.help3
	text_far _DiamondMineProspectorHelp3
	text_end
.help4
	text_far _DiamondMineProspectorHelp4
	text_end
.ragh
	text_far _DiamondMineProspectorRagh
	text_end
.hardWorkBegins
	text_far _DiamondMinePickedOnix
	text_end
.diamondDownHere
	text_far _DiamondMineDownHere
	text_end
.weeksOfWork
	text_far _DiamondMineWeeksOfWork
	text_end
.endText
	text_far _DiamondMineEndText
	text_end
.moreOnix1
	text_far _DiamondMineMoreOnix
	text_end
.moreOnix2
	text_far _DiamondMineMoreOnix2
	text_end
.moreOnix3
	text_far _DiamondMineOnixTrainDone
	text_far _DiamondMineFinished2
	sound_get_item_2
	text_far _DiamondMineFinished3
	text_end

DiamondMineLoadPlayerDirections:
	ld hl, wd730
	set 7, [hl]
	ld hl, wSimulatedJoypadStatesEnd
	ld a, [wXCoord]
	cp 3
	ld de, PlayerWalkDownHoleDirectionsRight
	jr z, .loadPlayerDirections
	ld de, PlayerWalkDownHoleDirectionsBelow
.loadPlayerDirections
	ld a, 3
	ld [wSimulatedJoypadStatesIndex], a
.loop
	ld a, [de]
	cp -1
	ret z
	ld [hli], a
	inc de
	jr .loop

PlayerWalkDownHoleDirectionsBelow:
	db D_UP
PlayerWalkDownHoleDirectionsRight:
	db D_UP
	db D_UP
	db D_LEFT
	db -1

DiamondMineBoombox:
	text_asm
	CheckEvent EVENT_DIAMOND_MINE_STARTED_BOOMBOX
	ld hl, .boomboxworking
	jr nz, .done
	CheckEvent EVENT_DIAMOND_MINE_GAVE_REPELS
	ld hl, .initialtext
	jr z, .done
	ld hl, .initialtextprompt
	rst _PrintText
	ld hl, .zapquestion
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .printForgetIt
	call DiamondMineShowPartyMenuSelection
	jr c, .printForgetIt
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Type1
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hli]
  	cp ELECTRIC
  	jr z, .zapTime
  	ld a, [hli]
  	cp ELECTRIC
  	jr z, .zapTime
  	inc hl ; hl now pointing to wPartyMonXMoves
  	ld b, NUM_MOVES
.loop
	ld a, [hli]
	cp THUNDER_WAVE
	jr z, .zapTimeTWave
	dec b
	jr nz, .loop
.printWrongMon
	ld hl, .wrongMon
	jr .done
.zapTime
	SetEvent EVENT_DIAMOND_MINE_STARTED_BOOMBOX
	SetEvent EVENT_DIAMOND_MINE_ZAPPING_BOOMBOX
	ld hl, .zapMessage
	jr .done
.zapTimeTWave
	SetEvent EVENT_DIAMOND_MINE_STARTED_BOOMBOX
	SetEvent EVENT_DIAMOND_MINE_ZAPPING_BOOMBOX
	ld hl, .zapMessageTWave
	jr .done
.printForgetIt
	ld hl, .forgetIt
.done
	rst _PrintText
	rst TextScriptEnd
.boomboxworking
	text_far _DiamondMineBoomboxFunctional
	text_end
.initialtext
	text_far _DiamondMineBoomboxInitial
	text_end
.initialtextprompt
	text_far _DiamondMineBoomboxInitial
	text_promptbutton
	text_end
.zapquestion
	text_far _DiamondMineBoomboxZap
	text_end
.forgetIt
	text_far _GenericForgetItText
	text_end
.zapMessage
	text_far _DiamondMineBoomboxZapProc
	text_end
.zapMessageTWave
	text_far _DiamondMineBoomboxZapProc2
	text_end
.wrongMon
	text_far _SecretLabMewtwoReactionText4
	text_end

DiamondMineShowPartyMenuSelection:
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call SaveScreenTilesToBuffer2
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	call Delay3
	call LoadGBPal
	pop af
	ret

DiamondMineCompleted:
	text_far _DiamondMineFinished
	text_far _DiamondMineFinished2
	sound_get_item_2
	text_far _DiamondMineFinished3
	text_end
