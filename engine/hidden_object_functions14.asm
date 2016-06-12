PrintNotebookText:
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenObjectFunctionArgument]
	jp PrintPredefTextID

TMNotebook:
	TX_FAR TMNotebookText
	db $0d
	db "@"

ViridianSchoolNotebook:
	TX_ASM
	ld hl, ViridianSchoolNotebookText1
	call PrintText
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText2
	call PrintText
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText3
	call PrintText
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText4
	call PrintText
	ld hl, ViridianSchoolNotebookText5
	call PrintText
.doneReading
	jp TextScriptEnd

TurnPageSchoolNotebook:
	ld hl, TurnPageText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

TurnPageText:
	TX_FAR _TurnPageText
	db "@"

ViridianSchoolNotebookText5:
	TX_FAR _ViridianSchoolNotebookText5
	db $0d
	db "@"

ViridianSchoolNotebookText1:
	TX_FAR _ViridianSchoolNotebookText1
	db "@"

ViridianSchoolNotebookText2:
	TX_FAR _ViridianSchoolNotebookText2
	db "@"

ViridianSchoolNotebookText3:
	TX_FAR _ViridianSchoolNotebookText3
	db "@"

ViridianSchoolNotebookText4:
	TX_FAR _ViridianSchoolNotebookText4
	db "@"

PrintFightingDojoText2:
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText_52a10

FightingDojoText_52a10:
	TX_FAR _FightingDojoText_52a10
	db "@"

PrintFightingDojoText3:
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText_52a1d

FightingDojoText_52a1d:
	TX_FAR _FightingDojoText_52a1d
	db "@"

PrintFightingDojoText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText

FightingDojoText:
	TX_FAR _FightingDojoText
	db "@"

PrintIndigoPlateauHQText:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump IndigoPlateauHQText

IndigoPlateauHQText:
	TX_FAR _IndigoPlateauHQText
	db "@"
