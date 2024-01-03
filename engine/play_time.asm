TrackPlayTime::
	call CountDownIgnoreInputBitReset
	ld a, [wd732]
	bit 0, a
	ret z
	ld a, [wPlayTimeMaxed]
	and a
	ret nz
	ld a, [wPlayTimeFrames]
	inc a
	ld [wPlayTimeFrames], a
	cp 60
	ret nz
	xor a
	ld [wPlayTimeFrames], a
	ld a, [wPlayTimeSeconds]
	inc a
	ld [wPlayTimeSeconds], a
	cp 60
	ret nz
	xor a
	ld [wPlayTimeSeconds], a
	ld a, [wPlayTimeMinutes]
	inc a
	ld [wPlayTimeMinutes], a
	cp 60
	ret nz
	xor a
	ld [wPlayTimeMinutes], a
	ld a, [wPlayTimeHours]
	inc a
	ld [wPlayTimeHours], a
	cp $ff
	ret nz
	ld a, $ff
	ld [wPlayTimeMaxed], a
	ret

CountDownIgnoreInputBitReset:
	ld a, [wIgnoreInputCounter]
	and a
	jr nz, .decrement
	ld a, $ff
	jr .continue
.decrement
	dec a
.continue
	ld [wIgnoreInputCounter], a
	and a
	ret nz
	ld a, [wScriptEngineFlags3]
	res SCRIPT_ENGINE3_UNKNOWN_JOYPAD_INPUT1_F, a
	res SCRIPT_ENGINE3_UNKNOWN_JOYPAD_INPUT2_F, a
	bit SCRIPT_ENGINE3_IGNORE_JOYPAD_INPUT_F, a
	res SCRIPT_ENGINE3_IGNORE_JOYPAD_INPUT_F, a
	ld [wScriptEngineFlags3], a
	ret z
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ret
