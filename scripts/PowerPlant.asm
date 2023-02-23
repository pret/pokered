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
	ld a, d
	ld h, a
	ld a, e
	ld l, a
	ld a, 4
	push af
	ld de, VoltorbSprite
	lb bc, BANK(VoltorbSprite), (VoltorbSpriteEnd - VoltorbSprite) / $10
	push hl
	call CopyVideoData
	ld c, 20
	call DelayFrames
	; make it move a bit by alternating frames
.loop
	pop hl
	ld de, VoltorbSpriteFrame2
	lb bc, BANK(VoltorbSpriteFrame2), (VoltorbSpriteFrame2End - VoltorbSpriteFrame2) / $10
	push hl
	call CopyVideoData
	call Delay3
	pop hl
	ld de, VoltorbSprite
	lb bc, BANK(VoltorbSprite), (VoltorbSpriteEnd - VoltorbSprite) / $10
	push hl
	call CopyVideoData
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


PowerPlant_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PowerPlant_TextPointers:
	dw Voltorb0Text
	dw Voltorb1Text
	dw Voltorb2Text
	dw Voltorb3Text
	dw Voltorb4Text
	dw Voltorb5Text
	dw Voltorb6Text
	dw Voltorb7Text
	dw ZapdosText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

PowerPlantTrainerHeaders:
	def_trainers
Voltorb0TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_0, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb1TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_1, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb2TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_2, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb3TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_3, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb4TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_4, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb5TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_5, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb6TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_6, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb7TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_7, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
ZapdosTrainerHeader:
	trainer EVENT_BEAT_ZAPDOS, 0, ZapdosBattleText, ZapdosBattleText, ZapdosBattleText
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

Voltorb0Text:
	text_asm
	ld hl, Voltorb0TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

Voltorb1Text:
	text_asm
	ld hl, Voltorb1TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

Voltorb2Text:
	text_asm
	ld hl, Voltorb2TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE2
	jr InitAltPaletteVoltorbBattle

Voltorb3Text:
	text_asm
	ld hl, Voltorb3TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

Voltorb4Text:
	text_asm
	ld hl, Voltorb4TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitAltPaletteVoltorbBattle

Voltorb5Text:
	text_asm
	ld hl, Voltorb5TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitVoltorbBattle

Voltorb6Text:
	text_asm
	ld hl, Voltorb6TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE2
	jr InitAltPaletteVoltorbBattle

Voltorb7Text:
	text_asm
	ld hl, Voltorb7TrainerHeader
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	jr InitAltPaletteVoltorbBattle

ZapdosText:
	text_asm
	ld hl, ZapdosTrainerHeader
	jr InitVoltorbBattle

VoltorbBattleText:
	text_far _VoltorbBattleText
	text_end

ZapdosBattleText:
	text_far _ZapdosBattleText
	text_asm
	ld a, ZAPDOS
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd
