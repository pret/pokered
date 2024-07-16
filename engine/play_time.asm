TrackPlayTime::
	call CountDownIgnoreInputBitReset
	ld a, [wStatusFlags6]
	bit BIT_GAME_TIMER_COUNTING, a
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
	ld a, [wStatusFlags5]
	res BIT_UNKNOWN_5_1, a
	res BIT_UNKNOWN_5_2, a
	bit BIT_DISABLE_JOYPAD, a
	res BIT_DISABLE_JOYPAD, a
	ld [wStatusFlags5], a
	ret z
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ret
