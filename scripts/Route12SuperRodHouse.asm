Route12SuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12SuperRodHouse_TextPointers:
	dw Route12HouseText1

Route12HouseText1:
	text_asm
	CheckEvent EVENT_GOT_ROUTE12_FISHING_GURU_ITEM
	jr nz, .printEndText
	ld hl, Route12GuruIntro
	call PrintText
	callfar LastTwoGurusScript
	jr .done
.printEndText
	ld hl, Route12GuruEnd
	call PrintText
.done
	jp TextScriptEnd

Route12GuruIntro:
	text_far _Route12GuruIntro
	text_end

Route12GuruEnd:
	text_far _Route12GuruEnd
	text_end