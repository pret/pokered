; PureRGBnote: ADDED: this code is to allow readable text on specific tiles in the secret rocket house. Example: the computer screens.

PrintRocketSNESText:
	xor a
	jr DoRocketHouseJump

PrintRocketBasementLeftComputerText:
	ld a, 1
	jr DoRocketHouseJump

PrintRocketBasementCenterComputerText:
	ld a, 2
	jr DoRocketHouseJump

PrintRocketBasementRightComputerText:
	ld a, 3
	jr DoRocketHouseJump

PrintRocketBasementLeftPaperText:
	ld a, 4
	jr DoRocketHouseJump

PrintRocketBasementRightPaperText:
	ld a, 5
	jr DoRocketHouseJump

PrintRocketBasementMachineText:
	ld a, 6

DoRocketHouseJump:
	ld [wUnusedC000], a
	tx_pre_jump CeruleanRocketHouseHiddenTexts

CeruleanRocketHouseJumpTable:
	dw RocketSNESTextConst
	dw CeruleanRocketHouseB1FLeftComputerText
	dw CeruleanRocketHouseB1FCenterComputerText
	dw CeruleanRocketHouseB1FRightComputerText
	dw CeruleanRocketHouseB1FLeftPaperText
	dw CeruleanRocketHouseB1FRightPaperText
	dw CeruleanRocketHouseB1FMachineText

CeruleanRocketHouseHiddenTexts::
	text_asm
	ld a, [wUnusedC000]
	add a ; 2 bytes per jump table pointer
	ld hl, CeruleanRocketHouseJumpTable
	call GetAddressFromPointerArray
	rst _PrintText
.done
	xor a
	ld [wUnusedC000], a
	rst TextScriptEnd

RocketSNESTextConst::
	text_far _RocketSNESText
	text_end

OptionalText:
	ld hl, .OptionalTextQ
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	scf
	ret
.no
	ld hl, .OptionalDidntRead
	rst _PrintText
	ret

.OptionalTextQ::
	text_far _CeruleanRocketHouseB1FOptionalText
	text_end

.OptionalDidntRead::
	text_far _CeruleanRocketHouseB1FOptionalTextNo
	text_end

CeruleanRocketHouseB1FLeftComputerText::
	text_asm
	ld hl, .LeftComputerText1
	rst _PrintText
	call OptionalText
	jr nc, .done
	ld hl, .LeftComputerText2
	rst _PrintText
.done
	rst TextScriptEnd

.LeftComputerText1::
	text_far _CeruleanRocketHouseB1FLeftComputerText
	text_end

.LeftComputerText2::
	text_far _CeruleanRocketHouseB1FLeftComputerText2
	text_end

CeruleanRocketHouseB1FCenterComputerText::
	text_asm
	ld hl, .CenterComputerText1
	rst _PrintText
	call OptionalText
	jr nc, .done
	ld hl, .CenterComputerText2
	rst _PrintText
.done
	rst TextScriptEnd

.CenterComputerText1::
	text_far _CeruleanRocketHouseB1FCenterComputerText
	text_end

.CenterComputerText2::
	text_far _CeruleanRocketHouseB1FCenterComputerText2
	text_end

CeruleanRocketHouseB1FRightComputerText::
	text_asm
	ld hl, .RightComputerText1
	rst _PrintText
	call OptionalText
	jr nc, .done
	ld hl, .RightComputerText2
	rst _PrintText
.done
	rst TextScriptEnd

.RightComputerText1:
	text_far _CeruleanRocketHouseB1FRightComputerText
	text_end

.RightComputerText2:
	text_far _CeruleanRocketHouseB1FRightComputerText2
	text_end

CeruleanRocketHouseB1FMachineText:
	text_asm
	ld hl, .MachineText
	rst _PrintText
	ld a, SCRIPT_CERULEANROCKETHOUSEB1F_MISSINGNO
	ld [wCeruleanRocketHouseCurScript], a
	rst TextScriptEnd

.MachineText:
	text_far _CeruleanRocketHouseB1FMachineText
	text_end

CeruleanRocketHouseB1FLeftPaperText:
	text_far _CeruleanRocketHouseB1FLeftPaperText
	text_end

CeruleanRocketHouseB1FRightPaperText:
	text_far _CeruleanRocketHouseB1FRightPaperText
	text_end