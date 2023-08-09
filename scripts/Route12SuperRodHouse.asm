; PureRGBnote: CHANGED: since Old rod is obtained in cerulean and good rod in vermilion now, this fishing guru will give either
; the SUPER ROD or the FISHING GUIDE depending on which of the last two gurus you talked to first.
Route12SuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12SuperRodHouse_TextPointers:
	def_text_pointers
	dw_const Route12SuperRodHouseFishingGuruText, TEXT_ROUTE12SUPERRODHOUSE_FISHING_GURU
	dw_const Route12FishingGuide,                 TEXT_ROUTE12SUPERRODHOUSE_FISHING_GUIDE

Route12SuperRodHouseFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_ROUTE12_FISHING_GURU_ITEM
	jr nz, .printEndText
	ld hl, Route12GuruIntro
	rst _PrintText
	callfar LastTwoGurusScript
	jr .done
.printEndText
	ld a, [wOptions2] ; PureRGBnote: ADDED: this NPC will talk about how super rod can catch alternate palette pokemon, but only if the feature is enabled.
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr z, .noColorText
	ld hl, Route12GuruEndColor
	rst _PrintText
	ld hl, Route12GuruColorInfo
	rst _PrintText
	jr .done
.noColorText
	ld hl, Route12GuruEnd
	rst _PrintText
.done
	rst TextScriptEnd

Route12GuruIntro:
	text_far _Route12GuruIntro
	text_end

Route12GuruEnd:
	text_far _Route12GuruEnd
	text_end

Route12GuruEndColor:
	text_far _Route12GuruEnd
	text_promptbutton
	text_end

Route12GuruColorInfo:
	text_far _Route12GuruColor
	text_end

Route12FishingGuide:
	text_asm
	callfar LastTwoGurusFishingGuideBookText
	rst TextScriptEnd
