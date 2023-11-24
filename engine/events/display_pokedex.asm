_DisplayPokedex::
	ld hl, wScriptEngineFlags3
	set SCRIPT_ENGINE3_PRINT_TEXT_NO_DELAY_F, [hl]
	predef ShowPokedexData
	ld hl, wScriptEngineFlags3
	res SCRIPT_ENGINE3_PRINT_TEXT_NO_DELAY_F, [hl]
	call ReloadMapData
	ld c, 10
	call DelayFrames
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_SET
	ld hl, wPokedexSeen
	predef FlagActionPredef
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret
