; PureRGBnote: ADDED: we use a careful assignment between the default item ball sprite and a copy of it and replace one or the other
; with a voltorb sprite to make it look like the pokeball you just pressed A on turned into a voltorb if it was a voltorb/electrode.
; Two are needed because it's possible to have two voltorb pokeballs on screen at once, so we don't want them all to change appearance at once.
; PureRGBnote: CHANGED: lots of visual changes to this map, and new scripts for electricity, buttons, various new stuff to facilitate a bit of a puzzle.
; ZAPDOS also flies away to the roof and you have to follow it up there.
DEF VOLTORB_POKEBALL_TILE1 EQU $780
DEF VOLTORB_POKEBALL_TILE2 EQU $7C0

PowerPlant_Script:
	call EnableAutoTextBoxDrawing
	call PowerPlantCheckPowersBack
	call PowerPlantOnMapLoad
	call PowerPlantCheckStandingOnButton
	ld hl, PowerPlantTrainerHeaders
	ld de, PowerPlant_ScriptPointers
	ld a, [wPowerPlantCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPowerPlantCurScript], a
	ret

PowerPlantOnMapLoad:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_BEAT_ZAPDOS
	jr nz, .noPowerOutage
	CheckHideShowState HS_ZAPDOS
	jr z, .noPowerOutage
	ld a, 3
	ld [wMapPalOffset], a ; make the area look dark
.noPowerOutage
	ld d, 0
PowerPlantCheckReplaceGateBlocks:
	CheckBothEventsSet EVENT_PRESSED_POWER_PLANT_SWITCH1, EVENT_PRESSED_POWER_PLANT_SWITCH2
	jr nz, .continue1
	ld a, d
	and a
	jr z, .doneTopGates
	ld a, 48
	jr PowerPlantReplaceTopGateBlock
.continue1
	CheckEitherEventSet EVENT_PRESSED_POWER_PLANT_SWITCH1, EVENT_PRESSED_POWER_PLANT_SWITCH2
	ld a, 73
	jr z, PowerPlantReplaceTopGateBlock
	CheckEvent EVENT_PRESSED_POWER_PLANT_SWITCH1
	ld a, 76
	jr z, PowerPlantReplaceTopGateBlock
	dec a ; 75
	jr PowerPlantReplaceTopGateBlock
.doneTopGates
	CheckBothEventsSet EVENT_PRESSED_POWER_PLANT_SWITCH3, EVENT_PRESSED_POWER_PLANT_SWITCH4
	jr nz, .continue2
	ld a, d
	and a
	ret z
	ld a, 40
	jr PowerPlantReplaceBottomGateBlock
.continue2
	CheckEitherEventSet EVENT_PRESSED_POWER_PLANT_SWITCH3, EVENT_PRESSED_POWER_PLANT_SWITCH4
	ld a, 74
	jr z, PowerPlantReplaceBottomGateBlock
	CheckEvent EVENT_PRESSED_POWER_PLANT_SWITCH3
	ld a, 78
	jr z, PowerPlantReplaceBottomGateBlock
	dec a ; 77
	; fall through
PowerPlantReplaceBottomGateBlock:
	lb bc, 3, 5
	; fall through
PowerPlantReplaceTileBlockEntry:
	push de
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	pop de
	ret

PowerPlantReplaceTopGateBlock:
	lb bc, 2, 5
	call PowerPlantReplaceTileBlockEntry
	jr PowerPlantCheckReplaceGateBlocks.doneTopGates

PowerPlantCheckReplaceGateBlocksFull:
	ld d, 1
	jr PowerPlantCheckReplaceGateBlocks

PowerPlantCheckStandingOnButton:
	lda_coord 8, 9 ; tile player standing on
	cp $30
	ret nz
	ld a, [wXCoord] ; xcoord decides which button it is
	cp 16
	jr z, .firstButton
	cp 23
	jr z, .secondButton
	cp 25
	jr z, .thirdButton
	cp 34
	ret nz
.fourthButton
	CheckAndSetEvent EVENT_PRESSED_POWER_PLANT_SWITCH4
	ret nz
	jr .displayButtonText
.firstButton
	CheckAndSetEvent EVENT_PRESSED_POWER_PLANT_SWITCH1
	ret nz
	jr .displayButtonText
.secondButton
	CheckAndSetEvent EVENT_PRESSED_POWER_PLANT_SWITCH2
	ret nz
	jr .displayButtonText
.thirdButton
	CheckAndSetEvent EVENT_PRESSED_POWER_PLANT_SWITCH3
	ret nz
.displayButtonText
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	ld c, 30
	rst _DelayFrames
	ld de, PowerPlantGatePowerDown
	call PlayNewSoundChannel5
	ld c, 50
	rst _DelayFrames
	ld de, PowerPlantGateShutOff
	call PlayNewSoundChannel8
	ld a, TEXT_POWERPLANT_OPEN_GATE_TEXT
	ldh [hTextID], a
	call DisplayTextID
	jp PowerPlantCheckReplaceGateBlocks

; when standing close to the electricity a sound effect plays
PowerPlantOverworldSFX::
	ld hl, wAudioFlags
	bit 0, [hl]
	ret nz ; don't play the sound if we're waiting for sounds to finish currently or it'll wait forever
	CheckBothEventsSet EVENT_PRESSED_POWER_PLANT_SWITCH1, EVENT_PRESSED_POWER_PLANT_SWITCH2
	jr nz, .notAllDone
	CheckBothEventsSet EVENT_PRESSED_POWER_PLANT_SWITCH3, EVENT_PRESSED_POWER_PLANT_SWITCH4
	ret z
.notAllDone
	ldh a, [hMovingBGTilesCounter1]
	rrca
	ret c
	ld a, [wXCoord]
	cp 11
	jr nz, .further
	ld a, [wYCoord]
	cp 10
	jr nc, .further
	ld de, PowerPlantElectricityClose
	jp PlayNewSoundChannel8
.further
	ld a, [wXCoord]
	cp 16
	ret nc
	ld a, [wYCoord]
	cp 12
	ret nc
	ld de, PowerPlantElectricityFar
	jp PlayNewSoundChannel8

; PureRGBnote: ADDED: the pokeball will turn into a voltorb graphically if you have enhanced sprites turned on in the options.
LoadVoltorbSprite::
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret z
	ld h, d
	ld l, e
	ld a, 4
	push af
	ld de, PartyMonSprites1 tile 8
	lb bc, BANK(PartyMonSprites1), 4
	push hl
	call CopyMenuSpritesVideoData
	ld c, 20
	rst _DelayFrames
	; make it move a bit by alternating frames
.loop
	pop hl
	ld de, VoltorbSpriteFrame2
	lb bc, BANK(VoltorbSpriteFrame2), 4
	push hl
	call CopyVideoData
	call Delay3
	pop hl
	ld de, PartyMonSprites1 tile 8
	lb bc, BANK(PartyMonSprites1), 4
	push hl
	call CopyMenuSpritesVideoData
	call Delay3
	pop hl
	pop af
	dec a
	push af
	push hl
	jr nz, .loop
	pop af
	pop hl
	ret

CopyMenuSpritesVideoDataFar::
	call GetPredefRegisters
	; fall through

CopyMenuSpritesVideoData:
	srl c
	push hl
	push de
	push bc
	call CopyVideoData
	pop bc
	pop hl
	ld a, LEN_2BPP_TILE * 4
	ld d, 0
	ld e, a
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld a, LEN_2BPP_TILE * 2
	ld d, 0
	ld e, a
	add hl, de
	pop de
	jp CopyVideoData


PowerPlant_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POWERPLANT_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POWERPLANT_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POWERPLANT_END_BATTLE
	dw_const ZapdosAbsorbAnimation,                 SCRIPT_ZAPDOS_ABSORB_ANIMATION
	dw_const MagnetonSuperchargeAnimation,          SCRIPT_MAGNETON_SUPERCHARGE

PowerPlant_TextPointers:
	def_text_pointers
	dw_const PowerPlantVoltorb1Text,   TEXT_POWERPLANT_VOLTORB1
	dw_const PowerPlantVoltorb2Text,   TEXT_POWERPLANT_VOLTORB2
	dw_const PowerPlantVoltorb3Text,   TEXT_POWERPLANT_VOLTORB3
	dw_const PowerPlantElectrode1Text, TEXT_POWERPLANT_ELECTRODE1
	dw_const PowerPlantVoltorb4Text,   TEXT_POWERPLANT_VOLTORB4
	dw_const PowerPlantVoltorb5Text,   TEXT_POWERPLANT_VOLTORB5
	dw_const PowerPlantElectrode2Text, TEXT_POWERPLANT_ELECTRODE2
	dw_const PowerPlantVoltorb6Text,   TEXT_POWERPLANT_VOLTORB6
	dw_const PowerPlantZapdosText,     TEXT_POWERPLANT_ZAPDOS
	dw_const PickUpItemText,           TEXT_POWERPLANT_ITEM1
	dw_const PickUpItemText,           TEXT_POWERPLANT_ITEM2
	dw_const PickUpItemText,           TEXT_POWERPLANT_ITEM3
	dw_const PickUpItemText,           TEXT_POWERPLANT_ITEM4
	dw_const PickUpItemText,           TEXT_POWERPLANT_ITEM5
	dw_const PowerPlantComputerText,  TEXT_POWERPLANT_COMPUTER1
	dw_const PowerPlantComputerText,  TEXT_POWERPLANT_COMPUTER2
	dw_const PowerPlantComputerText,  TEXT_POWERPLANT_COMPUTER3
	dw_const PowerPlantComputerText,  TEXT_POWERPLANT_COMPUTER4
	dw_const PowerPlantOpenGateText,   TEXT_POWERPLANT_OPEN_GATE_TEXT
	dw_const PowerPlantElectricityText, TEXT_POWERPLANT_ELECTRICITY
	dw_const PowerPlantZapdosFlewAwayText, TEXT_ZAPDOS_FLEW_AWAY
	dw_const PowerPlantMagnetText, TEXT_POWERPLANT_MAGNET
	dw_const MagnetonWasSuperChargedText, TEXT_MAGNETON_WAS_SUPERCHARGED
	dw_const PowerPlantPowerBackText,  TEXT_POWERPLANT_POWER_BACK

PowerPlantTrainerHeaders:
	def_trainers
Voltorb0TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_0, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb1TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_1, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb2TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_2, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb3TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_3, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb4TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_4, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb5TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_5, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb6TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_6, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb7TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_7, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
	db -1 ; end

InitVoltorbBattle:
	xor a
	jr InitVoltorbBattleCommon

InitAltPaletteVoltorbBattle: ; PureRGBnote: ADDED: some overworld voltorbs/electrodes use alternate palette if the feature is enabled
	ld a, 1
InitVoltorbBattleCommon:
	push de
	ld [wIsAltPalettePkmnData], a
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wPowerPlantCurScript], a
	pop de
	call LoadVoltorbSprite
	rst TextScriptEnd

PowerPlantVoltorb1Text:
	text_asm
	ld hl, Voltorb0TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

PowerPlantVoltorb2Text:
	text_asm
	ld hl, Voltorb1TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

PowerPlantVoltorb3Text:
	text_asm
	ld hl, Voltorb2TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE2
	jr InitAltPaletteVoltorbBattle

PowerPlantElectrode1Text:
	text_asm
	ld hl, Voltorb3TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

PowerPlantVoltorb4Text:
	text_asm
	ld hl, Voltorb4TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitAltPaletteVoltorbBattle

PowerPlantVoltorb5Text:
	text_asm
	ld hl, Voltorb5TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

PowerPlantElectrode2Text:
	text_asm
	ld hl, Voltorb6TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE2
	jr InitAltPaletteVoltorbBattle

PowerPlantVoltorb6Text:
	text_asm
	ld hl, Voltorb7TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitAltPaletteVoltorbBattle

PowerPlantZapdosText:
	text_far _PowerPlantZapdosBattleText
	text_asm
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, ZAPDOS
	call PlayCry
	; zapdos absorbs electricity
	ld a, SCRIPT_ZAPDOS_ABSORB_ANIMATION
	ld [wPowerPlantCurScript], a
	rst TextScriptEnd

PowerPlantVoltorbBattleText:
	text_far _PowerPlantVoltorbBattleText
	text_end

PowerPlantOpenGateText:
	text_far _PowerPlantOpenGateText
	text_end

PowerPlantElectricity1::
	CheckEvent EVENT_PRESSED_POWER_PLANT_SWITCH1
	ret nz
	jr PowerPlantElectricity

PowerPlantElectricity2::
	CheckEvent EVENT_PRESSED_POWER_PLANT_SWITCH2
	ret nz
	jr PowerPlantElectricity

PowerPlantElectricity3::
	CheckEvent EVENT_PRESSED_POWER_PLANT_SWITCH3
	ret nz
	jr PowerPlantElectricity

PowerPlantElectricity4::
	CheckEvent EVENT_PRESSED_POWER_PLANT_SWITCH4
	ret nz
	; fall through
PowerPlantElectricity:
	ld a, TEXT_POWERPLANT_ELECTRICITY
	ldh [hTextID], a
	jp DisplayTextID

PowerPlantElectricityText::
	text_far _PowerPlantElectricityText
	text_end

ZapdosAbsorbAnimation:
	ld a, BANK(SFX_Battle_25)
	ld [wAudioROMBank], a
	ld a, POWERPLANT_ZAPDOS
	call SetSpriteFacingDown
	call UpdateSprites
	ld de, vNPCSprites tile $0C
	callfar FarOpenBirdSpriteWings
	ld a, SFX_BATTLE_25
	rst _PlaySound
	; replace last 3 tiles of pokeball2 sprite with "nothing"
	ld hl, vNPCSprites tile $79
	ld de, NothingSprite
	lb bc, BANK(NothingSprite), 3
	call CopyVideoData
	; replace first tile of pokeball2 sprite with "absorb" ball
	ld hl, vNPCSprites tile $78
	ld de, MoveAnimationTiles0 tile 73
	lb bc, BANK(MoveAnimationTiles0), 1
	call CopyVideoData
	; show two voltorb sprites that have to be hidden at this point and move them into view visually
	ld a, HS_ELECTRODE_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_VOLTORB_4
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld hl, wSprite04StateData2MapY
	ld a, [wYCoord]
	add 4 
	ld [hli], a
	ld a, [wXCoord]
	add 3 
	ld [hl], a
	ld hl, wSprite05StateData2MapY
	ld a, [wYCoord]
	add 4 
	ld [hli], a
	ld a, [wXCoord]
	add 5
	ld [hl], a
	call UpdateSprites
	ld c, 6
.outerLoop
	ld hl, wSprite04StateData1YPixels
	ld [hl], 64
	inc hl
	inc hl
	ld [hl], 52
	ld hl, wSprite05StateData1YPixels
	ld [hl], 64
	inc hl
	inc hl
	ld [hl], 84
	ld b, 16
.loopAbsorb
	ld hl, wSprite04StateData1YPixels
	inc [hl]
	inc hl
	inc hl
	inc [hl]
	ld hl, wSprite05StateData1YPixels
	inc [hl]
	inc hl
	inc hl
	dec [hl]
	rst _DelayFrame
	dec b
	jr nz, .loopAbsorb
	dec c
	jr nz, .outerLoop
	ld a, BANK(Music_Dungeon1)
	ld [wAudioROMBank], a

	ld a, HS_ELECTRODE_1
	call PowerPlantHideSpriteEntry
	ld a, HS_VOLTORB_4
	call PowerPlantHideSpriteEntry
	call GBPalWhiteOut
	rst _DelayFrame
	ld a, 3
	ld [wMapPalOffset], a
	call GBPalNormal
	call LoadGBPal
	ld de, PowerPlantGateShutOff
	call PlayNewSoundChannel8
	ld de, PowerPlantGatePowerDown
	call PlayNewSoundChannel5
	ld c, 60
	rst _DelayFrames
	ld a, POWERPLANT_ZAPDOS
	call SetSpriteFacingRight
	call UpdateSprites
	ld a, SFX_FLY
	rst _PlaySound
	ld hl, wSprite09StateData1XPixels
	ld a, [hl]
	add 7
	ld [hl], a
	ld b, 60
.loopFliesAway
	ld hl, wSprite09StateData1YPixels
	dec [hl]
	dec [hl]
	inc hl
	inc hl
	inc [hl]
	ld a, b
	rrca
	jr c, .noImageIndexUpdate
	rrca
	jr c, .noImageIndexUpdate
	ld a, [wSprite09StateData1ImageIndex]
	xor 1
	ld [wSprite09StateData1ImageIndex], a
.noImageIndexUpdate
	rst _DelayFrame
	dec b
	jr nz, .loopFliesAway
	ld a, HS_ZAPDOS
	call PowerPlantHideSpriteEntry
	; bring back original pokeball sprite
	ld hl, vNPCSprites tile $78
	ld de, PokeBallSprite
	lb bc, BANK(PokeBallSprite), 4
	call CopyVideoData
	; reset to original script
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld a, TEXT_ZAPDOS_FLEW_AWAY
	ldh [hTextID], a
	call DisplayTextID
	ld a, SCRIPT_POWERPLANT_DEFAULT
	ld [wPowerPlantCurScript], a
	ld [wCurMapScript], a
	ret

PowerPlantHideSpriteEntry:
	ld [wMissableObjectIndex], a
	predef_jump HideObject

PowerPlantZapdosFlewAwayText:
	text_far _ZapdosFlewAway
	text_end

PowerPlantComputerText:
	text_asm
	CheckEvent EVENT_BEAT_ZAPDOS
	ld hl, PowerPlantPowerOut
	jr z, .done
	ld a, SFX_SWITCH
	rst _PlaySound
	ld a, [wXCoord]
	cp 46
	ld hl, .computer1
	jr z, .done
	cp 47
	ld hl, .computer2
	jr z, .done
	cp 53
	ld hl, .computer3
	jr z, .done
	ld hl, .computer4
.done
	rst _PrintText
	rst TextScriptEnd
.computer1
	text_far _PowerPlantComputer1
	text_end
.computer2
	text_far _PowerPlantComputer2
	text_end
.computer3
	text_far _PowerPlantComputer3
	text_end
.computer4
	text_far _PowerPlantComputer4
	text_end

PowerPlantPowerOut:
	text_far _PowersOutCantUse
	text_end

PowerPlantMagnet::
	ld a, TEXT_POWERPLANT_MAGNET
	ldh [hTextID], a
	call DisplayTextID
	CheckEvent EVENT_BEAT_ZAPDOS
	ret z
	ld a, [wPowerPlantCurScript]
	cp SCRIPT_MAGNETON_SUPERCHARGE
	ret nz
	; make player walk down one step
	ld a, D_DOWN
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hl], -1
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

PowerPlantMagnetText:
	text_asm
	CheckEvent EVENT_BEAT_ZAPDOS
	ld hl, PowerPlantPowerOut
	jr z, .done
	ld hl, .electromagnetic
	rst _PrintText
	callfar GenericShowPartyMenuSelection
	ld hl, .forgetIt
	jr c, .done
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hl]
  	cp MAGNETON
  	jr z, .magneton
  	cp MAGNEMITE
  	ld hl, .magnemite
  	jr z, .done
  	cp FLOATING_MAGNETON
  	ld hl, .already
  	jr z, .done
  	ld hl, .wrongMon
.done
	rst _PrintText
	rst TextScriptEnd
.magneton
	ld a, SCRIPT_MAGNETON_SUPERCHARGE
	ld [wPowerPlantCurScript], a
	ld a, FLOATING_MAGNETON
	ld [wCurPartySpecies], a
	callfar ChangePartyPokemonSpecies ; change magneton into floating magneton
	ld hl, .magnetonWentClose
	jr .done
.electromagnetic
	text_far _MagnetText
	text_end
.forgetIt
	text_far _GenericForgetItText
	text_end
.magnemite
	text_far _MagnetMagnemiteText
	text_end
.already
	text_far _MagnetFloatingMagnetonText
	text_end
.wrongMon
	text_far _SecretLabMewtwoReactionText4
	text_end
.magnetonWentClose
	text_far _MagnetMagnetonText1
	text_end

MagnetonWasSuperChargedText:
	text_far _MagnetMagnetonText2
	sound_get_item_2
	text_far _MagnetMagnetonText3
	text_end

MagnetonSuperchargeAnimation:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz ; wait for player to finish walking
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	; make player face up
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	; show magneton sprite by reusing a hidden electrode NPC, then make it float up a bit
	ld a, HS_ELECTRODE_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld hl, wSprite04StateData2MapY
	ld a, [wYCoord]
	add 3 
	ld [hli], a
	ld a, [wXCoord]
	add 4 
	ld [hl], a
	call UpdateSprites
	call .doBallPoof
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr nz, .magnetonSprite
	call .loadPokeballSprite
	jr .doneSpriteReplace
.magnetonSprite
	; load magneton sprite into vram
	call .loadMagnetonSprite
.doneSpriteReplace
	ld a, POWERPLANT_ELECTRODE1
	ldh [hSpriteIndex], a
	ld de, PowerPlantElectricityFar
	call FloatingAnimation
	ld a, TEXT_MAGNETON_WAS_SUPERCHARGED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld c, 60
	rst _DelayFrames
	call .doBallPoof
	ld a, HS_ELECTRODE_1
	call PowerPlantHideSpriteEntry
	; bring back original pokeball sprite
	call .loadPokeballSprite
	; reset script
	ld a, SCRIPT_POWERPLANT_DEFAULT
	ld [wPowerPlantCurScript], a
	ld [wCurMapScript], a
	ret
.doBallPoof
	ld de, vNPCSprites tile $78
	jp DoBallPoofOnNPC
.loadPokeballSprite
	ld hl, vNPCSprites tile $78
	ld de, PokeBallSprite
	lb bc, BANK(PokeBallSprite), 4
	jp CopyVideoData
.loadMagnetonSprite
	ld hl, vNPCSprites tile $78
	ld de, PartyMonSprites1 tile 128
	lb bc, BANK(PartyMonSprites1), 2
	call CopyVideoData
	ld hl, vNPCSprites tile $7A
	ld de, PartyMonSprites1 tile 132
	lb bc, BANK(PartyMonSprites1), 2
	jp CopyVideoData

PowerPlantCheckPowersBack:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret nz
	CheckEvent EVENT_SAW_POWER_BACK_TEXT
	ret nz
	CheckEventReuseA EVENT_BEAT_ZAPDOS
	ret z
	SetEvent EVENT_SAW_POWER_BACK_TEXT
	ld a, TEXT_POWERPLANT_POWER_BACK
	ldh [hTextID], a
	jp DisplayTextID

PowerPlantPowerBackText::
	text_far _PowerCameBackText
	text_end

DoBallPoofOnNPC::
	push de
	ld de, SFX_Volcano_Ball_Poof_Ch5
	call PlayNewSoundChannel5
	ld de, SFX_Volcano_Ball_Poof_Ch8
	call PlayNewSoundChannel8
	pop de
	callfar FarLoadSmokeTileFourTimes
	ld c, 4
	rst _DelayFrames
	ret

; input [hSpriteIndex] = which sprite
; de = which sound to play at the beginning
FloatingAnimation::
	push de
	ld a, SPRITESTATEDATA1_XPIXELS
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	; hl = wSpriteStateDataXPixels
	ld c, 30
	rst _DelayFrames
	pop de
	; do animation
	; make magneton sprite wobble back and forth
	ld a, [hl]
	ld b, a
	ld a, 20
.loop
	push af
	push bc
	rrca
	ld a, b
	jr c, .right
	dec a
	ld [hl], a
	jr .doneWobble
.right
	inc a
	ld [hl], a
.doneWobble
	push hl
	; de = which sound to play here
	call PlayNewSoundChannel8
	pop hl
	rst _DelayFrame
	rst _DelayFrame
	pop bc
	pop af
	dec a
	jr nz, .loop
	ld a, b
	ld [hl], a
	rst _DelayFrame
	ld de, StopSFXSound
	call PlayNewSoundChannel8
	; move magneton up
	ldh a, [hSpriteIndex]
	ld d, a 
	callfar FarSlideSpriteUp
	ld de, PowerPlantMagnetonFloating
	call PlayNewSoundChannel5
	; show magneton floating up and down a little bit
	ld a, SPRITESTATEDATA1_YPIXELS
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	; hl = wSpriteStateDataYPixels
	ld b, 6
.loop2
	ld c, 2
.innerLoop2Part1
	inc [hl]
	rst _DelayFrame
	rst _DelayFrame
	dec c
	jr nz, .innerLoop2Part1
	ld c, 2
.innerLoop2Part2
	dec [hl]
	rst _DelayFrame
	rst _DelayFrame
	dec c
	jr nz, .innerLoop2Part2
	dec b
	jr nz, .loop2
	; move magneton down
	ldh a, [hSpriteIndex]
	ld d, a 
	callfar FarSlideSpriteDown
	ret