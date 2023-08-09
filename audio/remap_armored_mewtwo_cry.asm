RemapArmoredMewtwoCry::
	ld a, [wAudioROMBank]
	cp BANK(Audio1_PlaySound)
	jr nz, .checkForAudio2
	jpfar PlayArmoredMewtwoCry1
.checkForAudio2
	cp BANK(Audio2_PlaySound)
	jr nz, .audio3
	jpfar PlayArmoredMewtwoCry2
.audio3
	jpfar PlayArmoredMewtwoCry3