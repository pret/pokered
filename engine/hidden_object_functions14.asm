PrintNotebookText: ; 52996 (14:6996)
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wTrainerSpriteOffset]
	jp PrintPredefTextID

TMNotebook: ; 529a4 (14:69a4)
	TX_FAR TMNotebookText
	db $0d
	db "@"

ViridianSchoolNotebook: ; 529aa (14:69aa)
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

TurnPageSchoolNotebook: ; 529db (14:69db)
	ld hl, TurnPageText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

TurnPageText: ; 529e9 (14:69e9)
	TX_FAR _TurnPageText
	db "@"

ViridianSchoolNotebookText5: ; 529ee (14:69ee)
	TX_FAR _ViridianSchoolNotebookText5
	db $0d
	db "@"

ViridianSchoolNotebookText1: ; 529f4 (14:69f4)
	TX_FAR _ViridianSchoolNotebookText1
	db "@"

ViridianSchoolNotebookText2: ; 529f9 (14:69f9)
	TX_FAR _ViridianSchoolNotebookText2
	db "@"

ViridianSchoolNotebookText3: ; 529fe (14:69fe)
	TX_FAR _ViridianSchoolNotebookText3
	db "@"

ViridianSchoolNotebookText4: ; 52a03 (14:6a03)
	TX_FAR _ViridianSchoolNotebookText4
	db "@"

PrintFightingDojoText2: ; 52a08 (14:6a08)
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText_52a10

FightingDojoText_52a10: ; 52a10 (14:6a10)
	TX_FAR _FightingDojoText_52a10
	db "@"

PrintFightingDojoText3: ; 52a15 (14:6a15)
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText_52a1d

FightingDojoText_52a1d: ; 52a1d (14:6a1d)
	TX_FAR _FightingDojoText_52a1d
	db "@"

PrintFightingDojoText: ; 52a22 (14:6a22)
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText

FightingDojoText: ; 52a2a (14:6a2a)
	TX_FAR _FightingDojoText
	db "@"

PrintIndigoPlateauHQText: ; 52a2f (14:6a2f)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump IndigoPlateauHQText

IndigoPlateauHQText: ; 52a3d (14:6a3d)
	TX_FAR _IndigoPlateauHQText
	db "@"
