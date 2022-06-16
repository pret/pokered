PrintRocketSNESText:
	xor a
	jp DoRocketHouseJump

PrintRocketBasementLeftComputerText:
	ld a, 1
	jp DoRocketHouseJump

PrintRocketBasementCenterComputerText:
	ld a, 2
	jp DoRocketHouseJump

PrintRocketBasementRightComputerText:
	ld a, 3
	jp DoRocketHouseJump

PrintRocketBasementLeftPaperText:
	ld a, 4
	jp DoRocketHouseJump

PrintRocketBasementRightPaperText:
	ld a, 5
	jp DoRocketHouseJump

PrintRocketBasementMachineText:
	ld a, 6
	jp DoRocketHouseJump

DoRocketHouseJump:
	ld [wUnusedC000], a
	tx_pre_jump CeruleanRocketHouseHiddenTexts

CeruleanRocketHouseHiddenTexts::
	text_asm
	ld a, [wUnusedC000]
	and a
	jr z, .snesText
	cp 1
	jr z, .basementLeftComputerText
	cp 2
	jr z, .basementCenterComputerText
	cp 3
	jr z, .basementRightComputerText
	cp 4
	jr z, .basementLeftPaperText
	cp 5
	jr z, .basementRightPaperText
	jr .basementMachineText
.snesText
	ld hl, RocketSNESTextConst
	jr .printText
.basementLeftComputerText
	ld hl, CeruleanRocketHouseB1FLeftComputerText
	jr .printText
.basementCenterComputerText
	ld hl, CeruleanRocketHouseB1FCenterComputerText
	jr .printText
.basementRightComputerText
	ld hl, CeruleanRocketHouseB1FRightComputerText
	jr .printText
.basementLeftPaperText
	ld hl, CeruleanRocketHouseB1FLeftPaperText
	jr .printText
.basementRightPaperText
	ld hl, CeruleanRocketHouseB1FRightPaperText
	jr .printText
.basementMachineText
	ld hl, CeruleanRocketHouseB1FMachineText
.printText
	call PrintText
.done
	xor a
	ld [wUnusedC000], a
	jp TextScriptEnd

RocketSNESTextConst::
	text_far _RocketSNESText
	text_end

OptionalText:
	ld hl, OptionalTextQ
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	scf
	ret
.no
	ld hl, OptionalDidntRead
	call PrintText
	ret

OptionalTextQ::
	text_far _CeruleanRocketHouseB1FOptionalText
	text_end

OptionalDidntRead::
	text_far _CeruleanRocketHouseB1FOptionalTextNo
	text_end

CeruleanRocketHouseB1FLeftComputerText::
	text_asm
	ld hl, LeftComputerText1
	call PrintText
	call OptionalText
	jr nc, .done
	ld hl, LeftComputerText2
	call PrintText
.done
	jp TextScriptEnd

LeftComputerText1::
	text_far _CeruleanRocketHouseB1FLeftComputerText
	text_end

LeftComputerText2::
	text_far _CeruleanRocketHouseB1FLeftComputerText2
	text_end

CeruleanRocketHouseB1FCenterComputerText::
	text_asm
	ld hl, CenterComputerText1
	call PrintText
	call OptionalText
	jr nc, .done
	ld hl, CenterComputerText2
	call PrintText
.done
	jp TextScriptEnd

CenterComputerText1::
	text_far _CeruleanRocketHouseB1FCenterComputerText
	text_end

CenterComputerText2::
	text_far _CeruleanRocketHouseB1FCenterComputerText2
	text_end

CeruleanRocketHouseB1FRightComputerText::
	text_asm
	ld hl, RightComputerText1
	call PrintText
	call OptionalText
	jr nc, .done
	ld hl, RightComputerText2
	call PrintText
.done
	jp TextScriptEnd

RightComputerText1:
	text_far _CeruleanRocketHouseB1FRightComputerText
	text_end

RightComputerText2:
	text_far _CeruleanRocketHouseB1FRightComputerText2
	text_end

CeruleanRocketHouseB1FMachineText:
	text_asm
	ld hl, MachineText
	call PrintText
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld b, 100
.loop
	push bc
	ld c, BANK(SFX_SS_Anne_Horn_1)
	ld a, SFX_SS_ANNE_HORN
	call PlayMusic
	ld c, 2
	call DelayFrames
	pop bc
	dec b
	jr nz, .loop
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, BANK(SFX_Noise_Instrument05_1)
	ld a, SFX_NOISE_INSTRUMENT05
	call PlayMusic
	ld c, BANK(SFX_Battle_26)
	ld a, SFX_BATTLE_26
	call PlayMusic
	call GBFadeOutToBlack
	ld b, $FF
	call DelayFrames
	call GBFadeInFromBlack
	call PlayDefaultMusic
	jp TextScriptEnd

MachineText:
	text_far _CeruleanRocketHouseB1FMachineText
	text_end

CeruleanRocketHouseB1FLeftPaperText:
	text_far _CeruleanRocketHouseB1FLeftPaperText
	text_end

CeruleanRocketHouseB1FRightPaperText:
	text_far _CeruleanRocketHouseB1FRightPaperText
	text_end