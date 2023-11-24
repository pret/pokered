Music_DoLowHealthAlarm::
	ld a, [wLowHealthAlarm]
	cp $ff
	jr z, .disableAlarm

	bit 7, a  ;alarm enabled?
;	ret z     ;nope
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shinpokerednote: FIXED: low health alarm only rings a couple times before stopping after triggering
;                         limit the low health alarm to 3 tone pairs
	push af
	jr z, .no_alarm_check_battle
.yes_alarm_check_tone
	ld a, [wLowHealthTonePairs]
	and %01111111
	jr z, .no_alarm_no_battle
	cp 1
	jr z, .dec_pop_and_disable_alarm
	jr .do_alarm_tone_check_dec
.no_alarm_check_battle
	ld a, [wIsInBattle]
	and a
	jr z, .no_alarm_no_battle
	cp $FF
	jr z, .no_alarm_no_battle
.no_alarm_yes_battle_checkHP
	ld a, [wPlayerHPBarColor]
	cp HP_BAR_RED
	jr z, .no_alarm_no_battle
	ld a, 3 + 1
	ld [wLowHealthTonePairs], a
.no_alarm_no_battle
	pop af
	ret
.dec_pop_and_disable_alarm
	;ld a, [wLowHealthTonePairs]
	dec a
	ld [wLowHealthTonePairs], a
.pop_and_disable_alarm
	pop af
	jr .disableAlarm
.do_alarm_tone_check_dec
	ld a, [wLowHealthAlarm]
	cp $81
	ld a, [wLowHealthTonePairs]	;tone pairs will be 2 or higher when this line is reached
	set 7, a
	ld [wLowHealthTonePairs], a
	jr nz, .do_alarm_tone		;jump if wLowHealthAlarm was != $81
	dec a	;decrement the value from wLowHealthTonePairs
	ld [wLowHealthTonePairs], a
.do_alarm_tone
	pop af
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	and $7f   ;low 7 bits are the timer.
	jr nz, .notToneHi ;if timer > 0, play low tone.

	call .playToneHi
	ld a, 30 ;keep this tone for 30 frames.
	jr .resetTimer

.notToneHi
	cp 20
	call z, .playToneLo ;actually set the sound registers.

.noTone ;if timer == 20,
	ld a, $86
	ld [wChannelSoundIDs + CHAN5], a ;disable sound channel?
	ld a, [wLowHealthAlarm]
	and $7f ;decrement alarm timer.
	dec a

.resetTimer
	; reset the timer and enable flag.
	set 7, a
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
	ld hl, rNR10 ;channel 1 sound register
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
