CeladonMansion3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion3F_TextPointers:
	dw ProgrammerText
	dw GraphicArtistText
	dw WriterText
	dw DirectorText
	dw GameFreakPCText1
	dw GameFreakPCText2
	dw GameFreakPCText3
	dw GameFreakSignText

ProgrammerText:
	text_far _ProgrammerText
	text_end

GraphicArtistText:
	text_far _GraphicArtistText
	text_end

WriterText:
	text_far _WriterText
	text_end

DirectorText:
	text_asm

	; check pokédex
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp 150
	jr nc, .CompletedDex
	ld hl, .GameDesigner
	jr .done
.CompletedDex
	ld hl, .CompletedDexText
.done
	call PrintText
	jp TextScriptEnd

.GameDesigner
	text_far _GameDesignerText
	text_end

.CompletedDexText
	text_far _CompletedDexText
	text_promptbutton
	text_asm
	callfar DisplayDiploma
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd

GameFreakPCText1:
	text_far _CeladonMansion3Text5
	text_end

GameFreakPCText2:
	text_far _CeladonMansion3Text6
	text_end

GameFreakPCText3:
	text_far _CeladonMansion3Text7
	text_end

GameFreakSignText:
	text_far _CeladonMansion3Text8
	text_end
