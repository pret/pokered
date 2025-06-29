Music_DoLowHealthAlarm::
	ld a, [wLowHealthAlarm]
	cp DISABLE_LOW_HEALTH_ALARM
	jr z, .disableAlarm

	bit BIT_LOW_HEALTH_ALARM, a
	ret z

	and LOW_HEALTH_TIMER_MASK
	jr nz, .notToneHi ;if timer > 0, play low tone.

	call .playToneHi
	ld a, 30 ;keep this tone for 30 frames.
	jr .resetTimer

.notToneHi
	cp 20
	jr nz, .noTone   ;if timer == 20,
	call .playToneLo ;actually set the sound registers.

.noTone
	ld a, CRY_SFX_END
	ld [wChannelSoundIDs + CHAN5], a ;disable sound channel?
	ld a, [wLowHealthAlarm]
	and LOW_HEALTH_TIMER_MASK
	dec a

.resetTimer
	; reset the timer and enable flag.
	set BIT_LOW_HEALTH_ALARM, a
	ld [wLowHealthAlarm], a
	ret

.disableAlarm
	xor a
	ld [wLowHealthAlarm], a  ;disable alarm
	ld [wChannelSoundIDs + CHAN5], a  ;re-enable sound channel?
	ld de, .toneDataSilence
	jr .playTone

;update the sound registers to change the frequency.
;the tone set here stays until we change it.
.playToneHi
	ld de, .toneDataHi
	jr .playTone

.playToneLo
	ld de, .toneDataLo

;update sound channel 1 to play the alarm, overriding all other sounds.
.playTone
	ld hl, rAUD1SWEEP ;channel 1 sound register
	ld c, $5
	xor a

.copyLoop
	ld [hli], a
	ld a, [de]
	inc de
	dec c
	jr nz, .copyLoop
	ret

MACRO alarm_tone
	db \1 ; length
	db \2 ; envelope
	dw \3 ; frequency
ENDM

;bytes to write to sound channel 1 registers for health alarm.
;starting at FF11 (FF10 is always zeroed).
.toneDataHi
	alarm_tone $A0, $E2, $8750

.toneDataLo
	alarm_tone $B0, $E2, $86EE

;written to stop the alarm
.toneDataSilence
	alarm_tone $00, $00, $8000
