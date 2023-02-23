; PureRGBnote: CHANGED: since Old rod is obtained in cerulean and good rod in vermilion now, this fishing guru will give either
; the SUPER ROD or the FISHING GUIDE depending on which of the last two gurus you talked to first.
FuchsiaGoodRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaGoodRodHouse_TextPointers:
	dw FuchsiaHouse3Text1
	dw FuchsiaFishingGuide

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
	rst TextScriptEnd

FuchsiaGuruIntro:
	text_far _FuchsiaGuruIntro
	text_end

FuchsiaGuruEnd:
	text_far _FuchsiaGuruEnd
	text_end

FuchsiaFishingGuide:
	text_asm
	callfar LastTwoGurusFishingGuideBookText
	rst TextScriptEnd