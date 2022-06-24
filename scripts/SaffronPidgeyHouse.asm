SaffronPidgeyHouse_Script:
	jp EnableAutoTextBoxDrawing

SaffronPidgeyHouse_TextPointers:
	def_text_pointers
	dw_const SaffronPidgeyHouseBrunetteGirlText, TEXT_SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	dw_const SaffronPidgeyHousePidgeyText,       TEXT_SAFFRONPIDGEYHOUSE_PIDGEY
	dw_const SaffronPidgeyHouseYoungsterText,    TEXT_SAFFRONPIDGEYHOUSE_YOUNGSTER
	dw_const SaffronPidgeyHousePaperText,        TEXT_SAFFRONPIDGEYHOUSE_PAPER

SaffronPidgeyHouseBrunetteGirlText:
	text_far _SaffronPidgeyHouseBrunetteGirlText
	text_end

SaffronPidgeyHousePidgeyText:
	text_far _SaffronPidgeyHousePidgeyText
	text_asm
	ld a, PIDGEY
	call PlayCry
	jp TextScriptEnd

SaffronPidgeyHouseYoungsterText:
	text_far _SaffronPidgeyHouseYoungsterText
	text_end

SaffronPidgeyHousePaperText:
	text_far _SaffronPidgeyHousePaperText
	text_end
