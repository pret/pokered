; Note: don't try to display missingno with this
_DisplayPokedex::
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	predef ShowPokedexData
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call ReloadMapData
	ld c, 10
	rst _DelayFrames
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_SET
	ld hl, wPokedexSeen
	predef FlagActionPredef
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret
