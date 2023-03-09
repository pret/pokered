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
	pop hl
	ret
