CeladonMansion1F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion1F_TextPointers:
	def_text_pointers
	dw_const CeladonMansion1FMeowthText,            TEXT_CELADONMANSION1F_MEOWTH
	dw_const CeladonMansion1FGrannyText,            TEXT_CELADONMANSION1F_GRANNY
	dw_const CeladonMansion1FClefairyText,          TEXT_CELADONMANSION1F_CLEFAIRY
	dw_const CeladonMansion1FNidoranFText,          TEXT_CELADONMANSION1F_NIDORANF
	dw_const CeladonMansion1FManagersSuiteSignText, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN

CeladonMansion1_PlayCryScript:
	call PlayCry
	jp TextScriptEnd

CeladonMansion1FMeowthText:
	text_far _CeladonMansion1FMeowthText
	text_asm
	ld a, MEOWTH
	jp CeladonMansion1_PlayCryScript

CeladonMansion1FGrannyText:
	text_far _CeladonMansion1FGrannyText
	text_end

CeladonMansion1FClefairyText:
	text_far _CeladonMansion1FClefairyText
	text_asm
	ld a, CLEFAIRY
	jp CeladonMansion1_PlayCryScript

CeladonMansion1FNidoranFText:
	text_far _CeladonMansion1FNidoranFText
	text_asm
	ld a, NIDORAN_F
	jp CeladonMansion1_PlayCryScript

CeladonMansion1FManagersSuiteSignText:
	text_far _CeladonMansion1FManagersSuiteSignText
	text_end
