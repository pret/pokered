DelayFrames::
; wait c frames
	rst _DelayFrame
	dec c
	jr nz, DelayFrames
	ret

PlaySoundWaitForCurrent::
	push af
	call WaitForSoundToFinish
	pop af
	rst _PlaySound
	ret

; Wait for sound to finish playing
WaitForSoundToFinish::
	ld a, [wLowHealthTonePairs]
	bit 7, a ; set if low health alarm sound is currently playing
	ret nz
	push hl
;;;;; PureRGBnote: ADDED: This flag indicates we're currently waiting for a sound to finish.
;;;;; TODO: use a constant for it
	ld hl, wAudioFlags
	set 0, [hl]
	push hl
;;;;;
.waitLoop
	ld hl, wChannelSoundIDs + CHAN5
	xor a
	or [hl]
	inc hl
	or [hl]
	inc hl
	inc hl
	or [hl]
	jr nz, .waitLoop
;;;;; PureRGBnote: ADDED: reset the "waiting for sound to end" flag
	pop hl ; wAudioFlags
	res 0, [hl]
	pop hl
	ret
;;;;;
