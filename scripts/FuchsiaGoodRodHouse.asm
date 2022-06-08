FuchsiaGoodRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaGoodRodHouse_TextPointers:
	dw FuchsiaHouse3Text1

FuchsiaHouse3Text1:
	text_asm
	CheckEvent EVENT_GOT_FUCHSIA_FISHING_GURU_ITEM
	jr nz, .printEndText
	ld hl, FuchsiaGuruIntro
	call PrintText
	callfar LastTwoGurusScript
	jr .done
.printEndText
	ld hl, FuchsiaGuruEnd
	call PrintText
.done
	jp TextScriptEnd

FuchsiaGuruIntro:
	text_far _FuchsiaGuruIntro
	text_end

FuchsiaGuruEnd:
	text_far _FuchsiaGuruEnd
	text_end
