PrintNotebookText:
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenObjectFunctionArgument]
	jp PrintPredefTextID

TMNotebook::
	text_far TMNotebookText
	text_waitbutton
	text_end

ViridianSchoolNotebook::
	text_asm
	ld hl, ViridianSchoolNotebookText1
	rst PrintTextRST
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText2
	rst PrintTextRST
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText3
	rst PrintTextRST
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText4
	rst PrintTextRST
;;;;;;;;;; PureRGBnote: CHANGED: since someone else can be sitting in the chair based on event flags, this text need to be modified in that case
	CheckEvent EVENT_GUS_IN_DETENTION
	ld hl, ViridianSchoolNotebookText5
	jr z, .print
	ld hl, ViridianSchoolNotebookTextGus
;;;;;;;;;;
.print
	rst PrintTextRST
.doneReading
	rst TextScriptEnd

TurnPageSchoolNotebook:
	ld hl, TurnPageText
	rst PrintTextRST
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

TurnPageText:
	text_far _TurnPageText
	text_end

ViridianSchoolNotebookText5:
	text_far _ViridianSchoolNotebookText5
	text_waitbutton
	text_end

ViridianSchoolNotebookTextGus:
	text_far _ViridianSchoolNotebookTextGus
	text_waitbutton
	text_end

ViridianSchoolNotebookText1:
	text_far _ViridianSchoolNotebookText1
	text_end

ViridianSchoolNotebookText2:
	text_far _ViridianSchoolNotebookText2
	text_end

ViridianSchoolNotebookText3:
	text_far _ViridianSchoolNotebookText3
	text_end

ViridianSchoolNotebookText4:
	text_far _ViridianSchoolNotebookText4
	text_end
