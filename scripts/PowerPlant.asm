; PureRGBnote: ADDED: we use a careful assignment between the default item ball sprite and a copy of it and replace one or the other
; with a voltorb sprite to make it look like the pokeball you just pressed A on turned into a voltorb if it was a voltorb/electrode.
; Two are needed because it's possible to have two voltorb pokeballs on screen at once, so we don't want them all to change appearance at once.
DEF VOLTORB_POKEBALL_TILE1 EQU $780
DEF VOLTORB_POKEBALL_TILE2 EQU $7C0

PowerPlant_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PowerPlantTrainerHeaders
	ld de, PowerPlant_ScriptPointers
	ld a, [wPowerPlantCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPowerPlantCurScript], a
	ret

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
ZapdosTrainerHeader:
	trainer EVENT_BEAT_ZAPDOS, 0, PowerPlantZapdosBattleText, PowerPlantZapdosBattleText, PowerPlantZapdosBattleText
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
	text_asm
	ld hl, ZapdosTrainerHeader
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wPowerPlantCurScript], a
	rst TextScriptEnd

PowerPlantVoltorbBattleText:
	text_far _PowerPlantVoltorbBattleText
	text_end

PowerPlantZapdosBattleText:
	text_far _PowerPlantZapdosBattleText
	text_asm
	ld a, ZAPDOS
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd
