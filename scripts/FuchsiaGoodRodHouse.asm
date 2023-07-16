; PureRGBnote: CHANGED: since Old rod is obtained in cerulean and good rod in vermilion now, this fishing guru will give either
; the SUPER ROD or the FISHING GUIDE depending on which of the last two gurus you talked to first.
FuchsiaGoodRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaGoodRodHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaGoodRodHouseFishingGuruText, TEXT_FUCHSIAGOODRODHOUSE_FISHING_GURU
	dw_const FuchsiaFishingGuide,                TEXT_FUCHSIAGOODRODHOUSE_FISHING_GUIDE

FuchsiaGoodRodHouseFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_FUCHSIA_FISHING_GURU_ITEM
	jr nz, .printEndText
	ld hl, FuchsiaGuruIntro
	rst _PrintText
	callfar LastTwoGurusScript
	jr .done
.printEndText
	ld hl, FuchsiaGuruEnd
	rst _PrintText
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
