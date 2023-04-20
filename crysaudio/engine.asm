; The entire sound engine. Uses section "audio" in WRAM.

; Interfaces are in bank 0.

; Notable functions:
; 	FadeMusic
; 	PlayStereoSFX

_InitSound::
; restart sound operation
; clear all relevant hardware registers & wram
	push hl
	push de
	push bc
	push af
	call MusicOff
	ld hl, rNR50 ; channel control registers
	xor a
	ld [hli], a ; rNR50 ; volume/vin
	ld [hli], a ; rNR51 ; sfx channels
	ld a, $80 ; all channels on
	ld [hli], a ; rNR52 ; music channels

	ld hl, rNR10 ; sound channel registers
	ld e, NUM_MUSIC_CHANS
.clearsound
;   sound channel   1      2      3      4
	xor a
	ld [hli], a ; rNR10, rNR20, rNR30, rNR40 ; sweep = 0

	ld [hli], a ; rNR11, rNR21, rNR31, rNR41 ; length/wavepattern = 0
	ld a, $8
	ld [hli], a ; rNR12, rNR22, rNR32, rNR42 ; envelope = 0
	xor a
	ld [hli], a ; rNR13, rNR23, rNR33, rNR43 ; frequency lo = 0
	ld a, $80
	ld [hli], a ; rNR14, rNR24, rNR34, rNR44 ; restart sound (freq hi = 0)
	dec e
	jr nz, .clearsound

	ld hl, wAudio
	ld de, wAudioEnd - wAudio
.clearaudio
	xor a
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .clearaudio

; channels 5 and 6
	ld hl, wChannel5
	ld de, CHANNEL_STRUCT_LENGTH * 2
.clearaudio2
	xor a
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .clearaudio2

; channels 7 and 8
	ld hl, wChannel7
	ld de, CHANNEL_STRUCT_LENGTH * 2
.clearaudio3
	xor a
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .clearaudio3

	ld a, MAX_VOLUME
	ld [wVolume], a
	call MusicOn
	pop af
	pop bc
	pop de
	pop hl
	ret

MusicFadeRestart:
; restart but keep the music id to fade in to
	ld a, [wMusicFadeID + 1]
	push af
	ld a, [wMusicFadeID]
	push af
	call _InitSound
	pop af
	ld [wMusicFadeID], a
	pop af
	ld [wMusicFadeID + 1], a
	ret

MusicOn:
	ld a, 1
	ld [wMusicPlaying], a
	ret

MusicOff:
	xor a
	ld [wMusicPlaying], a
	ret

_UpdateSound::
; called once per frame
	; no use updating audio if it's not playing
	ld a, [wMusicPlaying]
	and a
	ret z
	; start at ch1
	xor a
	ld [wCurChannel], a ; just
	ld [wSoundOutput], a ; off
	ld bc, wChannel1
.loop
	; is the channel active?
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_CHANNEL_ON, [hl]
	jp z, .nextchannel
	; check time left in the current note
	ld hl, CHANNEL_NOTE_DURATION
	add hl, bc
	ld a, [hl]
	cp 2 ; 1 or 0?
	jr c, .noteover
	dec [hl]
	jr .continue_sound_update

.noteover
	; reset vibrato delay
	ld hl, CHANNEL_VIBRATO_DELAY
	add hl, bc
	ld a, [hl]
	ld hl, CHANNEL_VIBRATO_DELAY_COUNT
	add hl, bc
	ld [hl], a
	; turn vibrato off for now
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	res SOUND_PITCH_SLIDE, [hl]
	; get next note
	call ParseMusic
.continue_sound_update
	call ApplyPitchSlide
	; duty cycle
	ld hl, CHANNEL_DUTY_CYCLE
	add hl, bc
	ld a, [hli]
	ld [wCurTrackDuty], a
	; volume envelope
	ld a, [hli]
	ld [wCurTrackVolumeEnvelope], a
	; frequency
	ld a, [hli]
	ld [wCurTrackFrequency], a
	ld a, [hl]
	ld [wCurTrackFrequency + 1], a
	; vibrato, noise
	call HandleTrackVibrato ; handle vibrato and other things
	call HandleNoise
	; turn off music when playing sfx?
	ld a, [wSFXPriority]
	and a
	jr z, .next
	; are we in a sfx channel right now?
	ld a, [wCurChannel]
	cp NUM_MUSIC_CHANS
	jr nc, .next
	; are any sfx channels active?
	; if so, mute
	ld hl, wChannel5Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .restnote
	ld hl, wChannel6Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .restnote
	ld hl, wChannel7Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .restnote
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .next
.restnote
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_REST, [hl] ; Rest
.next
	; are we in a sfx channel right now?
	ld a, [wCurChannel]
	cp NUM_MUSIC_CHANS
	jr nc, .sfx_channel

	push af
	push bc
	add 4 ; corresponding sfx channel
	ld c, a
	ld b, 0
	ld hl, ChannelPointers
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl] ; bc = channel pointer
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	pop bc
	pop af
;	ld hl, CHANNEL_STRUCT_LENGTH * NUM_MUSIC_CHANS + CHANNEL_FLAGS1
;	add hl, bc

	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .sound_channel_on
.sfx_channel
	call UpdateChannels
	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld a, [wSoundOutput]
	or [hl]
	ld [wSoundOutput], a
.sound_channel_on
	; clear note flags
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	xor a
	ld [hl], a
.nextchannel
	; next channel
;	ld hl, CHANNEL_STRUCT_LENGTH
;	add hl, bc
;	ld c, l
;	ld b, h
	ld a, [wCurChannel]
	inc a

	ld c, a
	ld b, 0
	ld hl, ChannelPointers
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl] ; bc = channel pointer

	ld [wCurChannel], a
	cp NUM_CHANNELS ; are we done?
	jp nz, .loop ; do it all again

	call PlayDanger
	; fade music in/out
	call FadeMusic
	; write volume to hardware register
	ld a, [wVolume]
	ldh [rNR50], a
	; write SO on/off to hardware register
	ld a, [wSoundOutput]
	ldh [rNR51], a
	ret

UpdateChannels:
	ld hl, .ChannelFunctions
	ld a, [wCurChannel]
	maskbits NUM_CHANNELS
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.ChannelFunctions:
	dw .Channel1
	dw .Channel2
	dw .Channel3
	dw .Channel4
; sfx ch ptrs are identical to music chs
; ..except 5
	dw .Channel5
	dw .Channel6
	dw .Channel7
	dw .Channel8

.Channel1:
	ld a, [wLowHealthAlarm]
	bit DANGER_ON_F, a
	ret nz
.Channel5:
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	bit NOTE_PITCH_SWEEP, [hl]
	jr z, .noPitchSweep
	;
	ld a, [wPitchSweep]
	ldh [rNR10], a
.noPitchSweep
	bit NOTE_REST, [hl] ; rest
	jr nz, .ch1_rest
	bit NOTE_NOISE_SAMPLING, [hl]
	jr nz, .ch1_noise_sampling
	bit NOTE_FREQ_OVERRIDE, [hl]
	jr nz, .ch1_frequency_override
	bit NOTE_VIBRATO_OVERRIDE, [hl]
	jr nz, .ch1_vibrato_override
	jr .ch1_check_duty_override

.ch1_frequency_override
	ld a, [wCurTrackFrequency]
	ldh [rNR13], a
	ld a, [wCurTrackFrequency + 1]
	ldh [rNR14], a
.ch1_check_duty_override
	bit NOTE_DUTY_OVERRIDE, [hl]
	ret z
	ld a, [wCurTrackDuty]
	ld d, a
	ldh a, [rNR11]
	and $3f ; sound length
	or d
	ldh [rNR11], a
	ret

.ch1_vibrato_override
	ld a, [wCurTrackDuty]
	ld d, a
	ldh a, [rNR11]
	and $3f ; sound length
	or d
	ldh [rNR11], a
	ld a, [wCurTrackFrequency]
	ldh [rNR13], a
	ret

.ch1_rest
	ldh a, [rNR52]
	and %10001110 ; ch1 off
	ldh [rNR52], a
	ld hl, rNR10
	call ClearChannel
	ret

.ch1_noise_sampling
	ld hl, wCurTrackDuty
	ld a, $3f ; sound length
	or [hl]
	ldh [rNR11], a
	ld a, [wCurTrackVolumeEnvelope]
	ldh [rNR12], a
	ld a, [wCurTrackFrequency]
	ldh [rNR13], a
	ld a, [wCurTrackFrequency + 1]
	or $80
	ldh [rNR14], a
	ret

.Channel2:
.Channel6:
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	bit NOTE_REST, [hl] ; rest
	jr nz, .ch2_rest
	bit NOTE_NOISE_SAMPLING, [hl]
	jr nz, .ch2_noise_sampling
	bit NOTE_FREQ_OVERRIDE, [hl]
	jr nz, .ch2_frequency_override
	bit NOTE_VIBRATO_OVERRIDE, [hl]
	jr nz, .ch2_vibrato_override
	jr .ch2_check_duty_override

.ch2_frequency_override
	ld a, [wCurTrackFrequency]
	ldh [rNR23], a
	ld a, [wCurTrackFrequency + 1]
	ldh [rNR24], a
.ch2_check_duty_override
	bit NOTE_DUTY_OVERRIDE, [hl]
	ret z
	ld a, [wCurTrackDuty]
	ld d, a
	ldh a, [rNR21]
	and $3f ; sound length
	or d
	ldh [rNR21], a
	ret

.ch2_vibrato_override
	ld a, [wCurTrackDuty]
	ld d, a
	ldh a, [rNR21]
	and $3f ; sound length
	or d
	ldh [rNR21], a
	ld a, [wCurTrackFrequency]
	ldh [rNR23], a
	ret

.ch2_rest
	ldh a, [rNR52]
	and %10001101 ; ch2 off
	ldh [rNR52], a
	ld hl, rNR20
	call ClearChannel
	ret

.ch2_noise_sampling
	ld hl, wCurTrackDuty
	ld a, $3f ; sound length
	or [hl]
	ldh [rNR21], a
	ld a, [wCurTrackVolumeEnvelope]
	ldh [rNR22], a
	ld a, [wCurTrackFrequency]
	ldh [rNR23], a
	ld a, [wCurTrackFrequency + 1]
	or $80 ; initial (restart)
	ldh [rNR24], a
	ret

.Channel3:
.Channel7:
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	bit NOTE_REST, [hl]
	jr nz, .ch3_rest
	bit NOTE_NOISE_SAMPLING, [hl]
	jr nz, .ch3_noise_sampling
	bit NOTE_FREQ_OVERRIDE, [hl]
	jr nz, .ch3_frequency_override
	bit NOTE_VIBRATO_OVERRIDE, [hl]
	jr nz, .ch3_vibrato_override
	ret

.ch3_frequency_override
	ld a, [wCurTrackFrequency]
	ldh [rNR33], a
	ld a, [wCurTrackFrequency + 1]
	ldh [rNR34], a
	ret

.ch3_vibrato_override
	ld a, [wCurTrackFrequency]
	ldh [rNR33], a
	ret

.ch3_rest
	ldh a, [rNR52]
	and %10001011 ; ch3 off
	ldh [rNR52], a
	ld hl, rNR30
	call ClearChannel
	ret

.ch3_noise_sampling
	ld a, $3f ; sound length
	ldh [rNR31], a
	xor a
	ldh [rNR30], a
	call .load_wave_pattern
	ld a, $80
	ldh [rNR30], a
	ld a, [wCurTrackFrequency]
	ldh [rNR33], a
	ld a, [wCurTrackFrequency + 1]
	or $80
	ldh [rNR34], a
	ret

.load_wave_pattern
	push hl
	ld a, [wCurTrackVolumeEnvelope]
	and $f ; only 0-9 are valid
	ld l, a
	ld h, 0
	; hl << 4
	; each wavepattern is $f bytes long
	; so seeking is done in $10s
rept 4
	add hl, hl
endr
	ld de, WaveSamples
	add hl, de
	cp $f
	jr z, .skip
	; load wavepattern into rWave_0-rWave_f
	ld a, [hli]
	ldh [rWave_0], a
	ld a, [hli]
	ldh [rWave_1], a
	ld a, [hli]
	ldh [rWave_2], a
	ld a, [hli]
	ldh [rWave_3], a
	ld a, [hli]
	ldh [rWave_4], a
	ld a, [hli]
	ldh [rWave_5], a
	ld a, [hli]
	ldh [rWave_6], a
	ld a, [hli]
	ldh [rWave_7], a
	ld a, [hli]
	ldh [rWave_8], a
	ld a, [hli]
	ldh [rWave_9], a
	ld a, [hli]
	ldh [rWave_a], a
	ld a, [hli]
	ldh [rWave_b], a
	ld a, [hli]
	ldh [rWave_c], a
	ld a, [hli]
	ldh [rWave_d], a
	ld a, [hli]
	ldh [rWave_e], a
	ld a, [hli]
	ldh [rWave_f], a
.skip
	pop hl
	ld a, [wCurTrackVolumeEnvelope]
	and $f0
	sla a
	ldh [rNR32], a
	ret

.Channel4:
.Channel8:
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	bit NOTE_REST, [hl]
	jr nz, .ch4_rest
	bit NOTE_NOISE_SAMPLING, [hl]
	jr nz, .ch4_noise_sampling
	ret

.ch4_frequency_override ; unreferenced
	ld a, [wCurTrackFrequency]
	ldh [rNR43], a
	ret

.ch4_rest
	ldh a, [rNR52]
	and %10000111 ; ch4 off
	ldh [rNR52], a
	ld hl, rNR40
	call ClearChannel
	ret

.ch4_noise_sampling
	ld a, $3f ; sound length
	ldh [rNR41], a
	ld a, [wCurTrackVolumeEnvelope]
	ldh [rNR42], a
	ld a, [wCurTrackFrequency]
	ldh [rNR43], a
	ld a, $80
	ldh [rNR44], a
	ret

_CheckSFX:
; return carry if any sfx channels are active
	ld hl, wChannel5Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .sfxon
	ld hl, wChannel6Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .sfxon
	ld hl, wChannel7Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .sfxon
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .sfxon
	and a
	ret

.sfxon
	scf
	ret

PlayDanger:
	ld a, [wLowHealthAlarm]
	bit DANGER_ON_F, a
	ret z

	; Don't do anything if SFX is being played
	and $ff ^ (1 << DANGER_ON_F)
	ld d, a
	call _CheckSFX
	jr c, .increment

	; Play the high tone
	and a
	jr z, .begin

	; Play the low tone
	cp 16
	jr z, .halfway

	jr .increment

.halfway
	ld hl, DangerSoundLow
	jr .applychannel

.begin
	ld hl, DangerSoundHigh

.applychannel
	xor a
	ldh [rNR10], a
	ld a, [hli]
	ldh [rNR11], a
	ld a, [hli]
	ldh [rNR12], a
	ld a, [hli]
	ldh [rNR13], a
	ld a, [hli]
	ldh [rNR14], a

.increment
	ld a, d
	inc a
	cp 30 ; Ending frame
	jr c, .noreset
	xor a
.noreset
	; Make sure the danger sound is kept on
	or 1 << DANGER_ON_F
	ld [wLowHealthAlarm], a

	; Enable channel 1 if it's off
	ld a, [wSoundOutput]
	and $11
	ret nz
	ld a, [wSoundOutput]
	or $11
	ld [wSoundOutput], a
	ret

DangerSoundHigh:
	db $80 ; duty 50%
	db $e2 ; volume 14, envelope decrease sweep 2
	db $50 ; frequency: $750
	db $87 ; restart sound

DangerSoundLow:
	db $80 ; duty 50%
	db $e2 ; volume 14, envelope decrease sweep 2
	db $ee ; frequency: $6ee
	db $86 ; restart sound

FadeMusic:
; fade music if applicable
; usage:
;	write to wMusicFade
;	song fades out at the given rate
;	load song id in wMusicFadeID
;	fade new song in
; notes:
;	max # frames per volume level is $3f

	; fading?
	ld a, [wMusicFade]
	and a
	ret z
	; has the count ended?
	ld a, [wMusicFadeCount]
	and a
	jr z, .update
	; count down
	dec a
	ld [wMusicFadeCount], a
	ret

.update
	ld a, [wMusicFade]
	ld d, a
	; get new count
	and $3f
	ld [wMusicFadeCount], a
	; get SO1 volume
	ld a, [wVolume]
	and VOLUME_SO1_LEVEL
	; which way are we fading?
	bit MUSIC_FADE_IN_F, d
	jr nz, .fadein
	; fading out
	and a
	jr z, .novolume
	dec a
	jr .updatevolume

.novolume
	; make sure volume is off
	xor a
	ld [wVolume], a
	; did we just get on a bike?
;	ld a, [wPlayerState]
;	cp PLAYER_BIKE
;	jr z, .bicycle
	push bc
	; restart sound
	call MusicFadeRestart
	; get new song id
	ld a, [wMusicFadeID]
	and a
	jr z, .quit ; this assumes there are fewer than 256 songs!
	ld e, a
	ld a, [wMusicFadeID + 1]
	ld d, a
	; load new song
	call _PlayMusic
.quit
	; cleanup
	pop bc
	; stop fading
	xor a
	ld [wMusicFade], a
	ret

.bicycle
	push bc
	; restart sound
	call MusicFadeRestart
	; this turns the volume up
	; turn it back down
	xor a
	ld [wVolume], a
	; get new song id
	ld a, [wMusicFadeID]
	ld e, a
	ld a, [wMusicFadeID + 1]
	ld d, a
	; load new song
	call _PlayMusic
	pop bc
	; fade in
	ld hl, wMusicFade
	set MUSIC_FADE_IN_F, [hl]
	ret

.fadein
	; are we done?
	cp MAX_VOLUME & $f
	jr nc, .maxvolume
	; inc volume
	inc a
	jr .updatevolume

.maxvolume
	; we're done
	xor a
	ld [wMusicFade], a
	ret

.updatevolume
	; hi = lo
	ld d, a
	swap a
	or d
	ld [wVolume], a
	ret

LoadNote:
	; wait for pitch slide to finish
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	bit SOUND_PITCH_SLIDE, [hl]
	ret z
	; get note duration
	ld hl, CHANNEL_NOTE_DURATION
	add hl, bc
	ld a, [hl]
	ld hl, wCurNoteDuration
	sub [hl]
	jr nc, .ok
	ld a, 1
.ok
	ld [hl], a
	; get frequency
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; get direction of pitch slide
	ld hl, CHANNEL_PITCH_SLIDE_TARGET
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	ld hl, CHANNEL_PITCH_SLIDE_TARGET + 1
	add hl, bc
	sub [hl]
	jr nc, .greater_than
	ld hl, CHANNEL_FLAGS3
	add hl, bc
	set SOUND_PITCH_SLIDE_DIR, [hl]
	; get frequency
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; ????
	ld hl, CHANNEL_PITCH_SLIDE_TARGET
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	; ????
	ld hl, CHANNEL_PITCH_SLIDE_TARGET + 1
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	jr .resume

.greater_than
	ld hl, CHANNEL_FLAGS3
	add hl, bc
	res SOUND_PITCH_SLIDE_DIR, [hl]
	; get frequency
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; get distance from pitch slide target
	ld hl, CHANNEL_PITCH_SLIDE_TARGET
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	ld hl, CHANNEL_PITCH_SLIDE_TARGET + 1
	add hl, bc
	sub [hl]
	ld d, a
.resume
	; de = x * [wCurNoteDuration] + y
	; x + 1 -> d
	; y -> a
	push bc
	ld hl, wCurNoteDuration
	ld b, 0 ; quotient
.loop
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .loop
	ld a, d
	and a
	jr z, .quit
	dec d
	jr .loop

.quit
	ld a, e ; remainder
	add [hl]
	ld d, b ; quotient
	pop bc
	ld hl, CHANNEL_PITCH_SLIDE_AMOUNT
	add hl, bc
	ld [hl], d ; quotient
	ld hl, CHANNEL_PITCH_SLIDE_AMOUNT_FRACTION
	add hl, bc
	ld [hl], a ; remainder
	ld hl, CHANNEL_FIELD25
	add hl, bc
	xor a
	ld [hl], a
	ret

HandleTrackVibrato:
; handle duty, cry pitch, and vibrato
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	bit SOUND_DUTY_LOOP, [hl] ; duty cycle looping
	jr z, .next
	ld hl, CHANNEL_DUTY_CYCLE_PATTERN
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and $c0
	ld [wCurTrackDuty], a
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_DUTY_OVERRIDE, [hl]
.next
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	bit SOUND_PITCH_OFFSET, [hl]
	jr z, .vibrato
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wCurTrackFrequency
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, wCurTrackFrequency
	ld [hl], e
	inc hl
	ld [hl], d
.vibrato
	; is vibrato on?
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	bit SOUND_VIBRATO, [hl] ; vibrato
	jr z, .quit
	; is vibrato active for this note yet?
	; is the delay over?
	ld hl, CHANNEL_VIBRATO_DELAY_COUNT
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .subexit
	; is the extent nonzero?
	ld hl, CHANNEL_VIBRATO_EXTENT
	add hl, bc
	ld a, [hl]
	and a
	jr z, .quit
	; save it for later
	ld d, a
	; is it time to toggle vibrato up/down?
	ld hl, CHANNEL_VIBRATO_RATE
	add hl, bc
	ld a, [hl]
	and $f ; count
	jr z, .toggle
.subexit
	dec [hl]
	jr .quit

.toggle
	; refresh count
	ld a, [hl]
	swap [hl]
	or [hl]
	ld [hl], a
	; ????
	ld a, [wCurTrackFrequency]
	ld e, a
	; toggle vibrato up/down
	ld hl, CHANNEL_FLAGS3
	add hl, bc
	bit SOUND_VIBRATO_DIR, [hl] ; vibrato up/down
	jr z, .down
; up
	; vibrato down
	res SOUND_VIBRATO_DIR, [hl]
	; get the delay
	ld a, d
	and $f ; lo
	;
	ld d, a
	ld a, e
	sub d
	jr nc, .no_carry
	ld a, 0
	jr .no_carry

.down
	; vibrato up
	set SOUND_VIBRATO_DIR, [hl]
	; get the delay
	ld a, d
	and $f0 ; hi
	swap a ; move it to lo
	;
	add e
	jr nc, .no_carry
	ld a, $ff
.no_carry
	ld [wCurTrackFrequency], a
	;
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_VIBRATO_OVERRIDE, [hl]
.quit
	ret

ApplyPitchSlide:
	; quit if pitch slide inactive
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	bit SOUND_PITCH_SLIDE, [hl]
	ret z
	; de = Frequency
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; check whether pitch slide is going up or down
	ld hl, CHANNEL_FLAGS3
	add hl, bc
	bit SOUND_PITCH_SLIDE_DIR, [hl]
	jr z, .decreasing
	; frequency += [Channel*PitchSlideAmount]
	ld hl, CHANNEL_PITCH_SLIDE_AMOUNT
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, de
	ld d, h
	ld e, l
	; [Channel*Field25] += [Channel*PitchSlideAmountFraction]
	; if rollover: Frequency += 1
	ld hl, CHANNEL_PITCH_SLIDE_AMOUNT_FRACTION
	add hl, bc
	ld a, [hl]
	ld hl, CHANNEL_FIELD25
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, 0
	adc e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	; Compare the dw at [Channel*PitchSlideTarget] to de.
	; If frequency is greater, we're finished.
	; Otherwise, load the frequency and set two flags.
	ld hl, CHANNEL_PITCH_SLIDE_TARGET + 1
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .finished_pitch_slide
	jr nz, .continue_pitch_slide
	ld hl, CHANNEL_PITCH_SLIDE_TARGET
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .finished_pitch_slide
	jr .continue_pitch_slide

.decreasing
	; frequency -= [Channel*PitchSlideAmount]
	ld a, e
	ld hl, CHANNEL_PITCH_SLIDE_AMOUNT
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	; [Channel*Field25] *= 2
	; if rollover: Frequency -= 1
	ld hl, CHANNEL_PITCH_SLIDE_AMOUNT_FRACTION
	add hl, bc
	ld a, [hl]
	add a
	ld [hl], a
	ld a, e
	sbc 0
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	; Compare the dw at [Channel*PitchSlideTarget] to de.
	; If frequency is lower, we're finished.
	; Otherwise, load the frequency and set two flags.
	ld hl, CHANNEL_PITCH_SLIDE_TARGET + 1
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .finished_pitch_slide
	jr nz, .continue_pitch_slide
	ld hl, CHANNEL_PITCH_SLIDE_TARGET
	add hl, bc
	ld a, e
	cp [hl]
	jr nc, .continue_pitch_slide
.finished_pitch_slide
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	res SOUND_PITCH_SLIDE, [hl]
	ld hl, CHANNEL_FLAGS3
	add hl, bc
	res SOUND_PITCH_SLIDE_DIR, [hl]
	ret

.continue_pitch_slide
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_FREQ_OVERRIDE, [hl]
	set NOTE_DUTY_OVERRIDE, [hl]
	ret

HandleNoise:
	; is noise sampling on?
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_NOISE, [hl] ; noise sampling
	ret z
	; are we in a sfx channel?
	ld a, [wCurChannel]
	bit NOISE_CHAN_F, a
	jr nz, .next
	; is ch8 on? (noise)
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl] ; on?
	jr z, .next
	; is ch8 playing noise?
	bit SOUND_NOISE, [hl]
	ret nz ; quit if so
	;
.next
	ld a, [wNoiseSampleDelay]
	and a
	jr z, ReadNoiseSample
	dec a
	ld [wNoiseSampleDelay], a
	ret

ReadNoiseSample:
; sample struct:
;	[wx] [yy] [zz]
;	w: ? either 2 or 3
;	x: duration
;	zz: volume envelope
;       yy: frequency

	; de = [wNoiseSampleAddress]
	ld hl, wNoiseSampleAddress
	ld e, [hl]
	inc hl
	ld d, [hl]

	; is it empty?
	ld a, e
	or d
	jr z, .quit

	ld a, [de]
	inc de

	cp sound_ret_cmd
	jr z, .quit

	and $f
	inc a
	ld [wNoiseSampleDelay], a
	ld a, [de]
	inc de
	ld [wCurTrackVolumeEnvelope], a
	ld a, [de]
	inc de
	ld [wCurTrackFrequency], a
	xor a
	ld [wCurTrackFrequency + 1], a

	ld hl, wNoiseSampleAddress
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_NOISE_SAMPLING, [hl]
	ret

.quit
	ret

ParseMusic:
; parses until a note is read or the song is ended
	call GetMusicByte ; store next byte in a
	cp sound_ret_cmd
	jr z, .sound_ret
	cp FIRST_MUSIC_CMD
	jr c, .readnote
.readcommand
	call ParseMusicCommand
	jr ParseMusic ; start over

.readnote
; wCurMusicByte contains current note
; special notes
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_SFX, [hl]
	jp nz, ParseSFXOrRest
	bit SOUND_REST, [hl] ; rest
	jp nz, ParseSFXOrRest
	bit SOUND_NOISE, [hl] ; noise sample
	jp nz, GetNoiseSample
; normal note
	; set note duration (bottom nybble)
	ld a, [wCurMusicByte]
	and $f
	call SetNoteDuration
	; get note pitch (top nybble)
	ld a, [wCurMusicByte]
	swap a
	and $f
	jr z, .rest ; pitch 0 -> rest
	; update pitch
	ld hl, CHANNEL_PITCH
	add hl, bc
	ld [hl], a
	; store pitch in e
	ld e, a
	; store octave in d
	ld hl, CHANNEL_OCTAVE
	add hl, bc
	ld d, [hl]
	; update frequency
	call GetFrequency
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; ????
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_NOISE_SAMPLING, [hl]
	jp LoadNote

.rest
; note = rest
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_REST, [hl] ; Rest
	ret

.sound_ret
; $ff is reached in music data
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_SUBROUTINE, [hl] ; in a subroutine?
	jr nz, .readcommand ; execute
	ld a, [wCurChannel]
	cp CHAN5
	jr nc, .chan_5to8
	; ????

	push af
	push bc
	add 4 ; corresponding sfx channel
	ld c, a
	ld b, 0
	ld hl, ChannelPointers
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl] ; bc = channel pointer
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	pop bc
	pop af
;	ld hl, CHANNEL_STRUCT_LENGTH * NUM_MUSIC_CHANS + CHANNEL_FLAGS1
;	add hl, bc

	bit SOUND_CHANNEL_ON, [hl]
	jr nz, .ok
.chan_5to8
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_REST, [hl]
	call nz, RestoreVolume
	; end music
	ld a, [wCurChannel]
	cp CHAN5
	jr nz, .ok
	; ????
	xor a
	ldh [rNR10], a ; sweep = 0
.ok
; stop playing
	; turn channel off
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	res SOUND_CHANNEL_ON, [hl]
	; note = rest
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_REST, [hl]
	; clear music id & bank
	ld hl, CHANNEL_MUSIC_ID
	add hl, bc
	xor a
	ld [hli], a ; id hi
	ld [hli], a ; id lo
	ld [hli], a ; bank
	ret

RestoreVolume:
	; ch5 only
	ld a, [wCurChannel]
	cp CHAN5
	ret nz
	xor a
	ld hl, wChannel6PitchOffset
	ld [hli], a
	ld [hl], a
	ld hl, wChannel8PitchOffset
	ld [hli], a
	ld [hl], a
	ld a, [wLastVolume]
	ld [wVolume], a
	xor a
	ld [wLastVolume], a
	ld [wSFXPriority], a
	ret

ParseSFXOrRest:
	; turn noise sampling on
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_NOISE_SAMPLING, [hl] ; noise sample
	; update note duration
	ld a, [wCurMusicByte]
	call SetNoteDuration ; top nybble doesnt matter?
	; update volume envelope from next param
	call GetMusicByte
	ld hl, CHANNEL_VOLUME_ENVELOPE
	add hl, bc
	ld [hl], a
	; update lo frequency from next param
	call GetMusicByte
	ld hl, CHANNEL_FREQUENCY
	add hl, bc
	ld [hl], a
	; are we on the last channel? (noise sampling)
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	cp CHAN4
	ret z
	; update hi frequency from next param
	call GetMusicByte
	ld hl, CHANNEL_FREQUENCY + 1
	add hl, bc
	ld [hl], a
	ret

GetNoiseSample:
; load ptr to sample header in wNoiseSampleAddress
	; are we on the last channel?
	ld a, [wCurChannel]
	and NUM_MUSIC_CHANS - 1
	cp CHAN4
	; ret if not
	ret nz
	; update note duration
	ld a, [wCurMusicByte]
	and $f
	call SetNoteDuration
	; check current channel
	ld a, [wCurChannel]
	bit NOISE_CHAN_F, a
	jr nz, .sfx
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl] ; is ch8 on? (noise)
	ret nz
	ld a, [wMusicNoiseSampleSet]
	jr .next

.sfx
	ld a, [wSFXNoiseSampleSet]
.next
	; load noise sample set id into de
	ld e, a
	ld d, 0
	; load ptr to noise sample set in hl
	ld hl, Drumkits
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; get pitch
	ld a, [wCurMusicByte]
	swap a
	; non-rest note?
	and $f
	ret z
	; use 'pitch' to seek noise sample set
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	; load sample pointer into wNoiseSampleAddress
	ld a, [hli]
	ld [wNoiseSampleAddress], a
	ld a, [hl]
	ld [wNoiseSampleAddress + 1], a
	; clear ????
	xor a
	ld [wNoiseSampleDelay], a
	ret

ParseMusicCommand:
	; reload command
	ld a, [wCurMusicByte]
	; get command #
	sub FIRST_MUSIC_CMD
	ld e, a
	ld d, 0
	; seek command pointer
	ld hl, MusicCommands
	add hl, de
	add hl, de
	; jump to the new pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

MusicCommands:
; entries correspond to audio constants (see macros/scripts/audio.asm)
	dw Music_Octave8
	dw Music_Octave7
	dw Music_Octave6
	dw Music_Octave5
	dw Music_Octave4
	dw Music_Octave3
	dw Music_Octave2
	dw Music_Octave1
	dw Music_NoteType ; note length + volume envelope
	dw Music_Transpose 
	dw Music_Tempo
	dw Music_DutyCycle
	dw Music_VolumeEnvelope 
	dw Music_PitchSweep
	dw Music_DutyCyclePattern
	dw Music_ToggleSFX 
	dw Music_PitchSlide 
	dw Music_Vibrato 
	dw MusicE2 ; unused
	dw Music_ToggleNoise 
	dw Music_ForceStereoPanning 
	dw Music_Volume 
	dw Music_PitchOffset 
	dw MusicE7 ; unused
	dw MusicE8 ; unused
	dw Music_TempoRelative
	dw Music_RestartChannel
	dw Music_NewSong 
	dw Music_SFXPriorityOn 
	dw Music_SFXPriorityOff 
	dw MusicEE ; unused
	dw Music_StereoPanning 
	dw Music_SFXToggleNoise
	dw MusicF1 ; nothing
	dw MusicF2 ; nothing
	dw MusicF3 ; nothing
	dw MusicF4 ; nothing
	dw MusicF5 ; nothing
	dw MusicF6 ; nothing
	dw MusicF7 ; nothing
	dw MusicF8 ; nothing
	dw MusicF9 ; unused
	dw Music_SetCondition 
	dw Music_JumpIf
	dw Music_Jump
	dw Music_Loop
	dw Music_Call
	dw Music_Ret

MusicF1:
MusicF2:
MusicF3:
;custom waveform
	ld e, 16
	ld hl, rWave_0
.read
	call GetMusicByte
	ld [hli], a
	dec e
	jr nz, .read
	ret

MusicF4:
;inc_octave
	ld hl, CHANNEL_OCTAVE
	add hl, bc
	ld a, [hl]
	dec a
	and 7
	ld [hl], a
	ret

MusicF5:
;dec_octave
	ld hl, CHANNEL_OCTAVE
	add hl, bc
	ld a, [hl]
	inc a
	and 7
	ld [hl], a
	ret

MusicF6:
;speed
	call GetMusicByte
	ld hl, CHANNEL_NOTE_LENGTH
	add hl, bc
	ld [hl], a
	ret

MusicF7:
;channel_volume
	call GetMusicByte
	ld hl, CHANNEL_VOLUME_ENVELOPE
	add hl, bc
	rla
	rla
	rla
	rla
	and $f0
	push bc
	ld b, a
	ld a, [hl]
	and $f
	add b
	pop bc
	ld [hl], a
	ret

MusicF8:
;fade_wave
	call GetMusicByte
	ld hl, CHANNEL_VOLUME_ENVELOPE
	add hl, bc
	push bc
	ld b, a
	ld a, [hl]
	and $f0
	add b
	pop bc
	ld [hl], a
	ret

Music_Ret:
; called when $ff is encountered w/ subroutine flag set
; end music stream
; return to caller of the subroutine
	; reset subroutine flag
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	res SOUND_SUBROUTINE, [hl]
	; copy LastMusicAddress to MusicAddress
	ld hl, CHANNEL_LAST_MUSIC_ADDRESS
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Music_Call:
; call music stream (subroutine)
; parameters: ll hh ; pointer to subroutine
	; get pointer from next 2 bytes
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	push de
	; copy MusicAddress to LastMusicAddress
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, CHANNEL_LAST_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; load pointer into MusicAddress
	pop de
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; set subroutine flag
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_SUBROUTINE, [hl]
	ret

Music_Jump:
; jump
; parameters: ll hh ; pointer
	; get pointer from next 2 bytes
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Music_Loop:
; loops xx - 1 times
; 	00: infinite
; params: 3
;	xx ll hh
;		xx : loop count
;   	ll hh : pointer

	; get loop count
	call GetMusicByte
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_LOOPING, [hl] ; has the loop been initiated?
	jr nz, .checkloop
	and a ; loop counter 0 = infinite
	jr z, .loop
	; initiate loop
	dec a
	set SOUND_LOOPING, [hl] ; set loop flag
	ld hl, CHANNEL_LOOP_COUNT
	add hl, bc
	ld [hl], a ; store loop counter
.checkloop
	ld hl, CHANNEL_LOOP_COUNT
	add hl, bc
	ld a, [hl]
	and a ; are we done?
	jr z, .endloop
	dec [hl]
.loop
	; get pointer
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	; load new pointer into MusicAddress
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.endloop
	; reset loop flag
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	res SOUND_LOOPING, [hl]
	; skip to next command
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de ; skip
	inc de ; pointer
	ld [hl], d
	dec hl
	ld [hl], e
	ret

Music_SetCondition:
; set condition for a jump
; used with FB
; params: 1
;	xx ; condition

	; set condition
	call GetMusicByte
	ld hl, CHANNEL_CONDITION
	add hl, bc
	ld [hl], a
	ret

Music_JumpIf:
; conditional jump
; used with FA
; params: 3
; 	xx: condition
;	ll hh: pointer

; check condition
	; a = condition
	call GetMusicByte
	; if existing condition matches, jump to new address
	ld hl, CHANNEL_CONDITION
	add hl, bc
	cp [hl]
	jr z, .jump
; skip to next command
	; get address
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; skip pointer
	inc de
	inc de
	; update address
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.jump
; jump to the new address
	; get pointer
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	; update pointer in MusicAddress
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

MusicEE:
; unused
; conditional jump
; checks a byte in ram corresponding to the current channel
; params: 2
;		ll hh ; pointer

; if ????, jump
	; get channel
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	ld e, a
	ld d, 0
	; hl = wChannel1JumpCondition + channel id
	ld hl, wChannel1JumpCondition
	add hl, de
	; if set, jump
	ld a, [hl]
	and a
	jr nz, .jump
; skip to next command
	; get address
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; skip pointer
	inc de
	inc de
	; update address
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.jump
	; reset jump flag
	ld [hl], 0
	; de = pointer
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	; update address
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

MusicF9:
; unused
; sets some flag
; params: 0
	ld a, TRUE
	ld [wUnusedMusicF9Flag], a
	ret

MusicE2:
; unused
; params: 1
	call GetMusicByte
	ld hl, CHANNEL_FIELD2C
	add hl, bc
	ld [hl], a
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_UNKN_0B, [hl]
	ret

Music_Vibrato:
; vibrato
; params: 2
;	1: [xx]
	; delay in frames
;	2: [yz]
	; y: extent
	; z: rate (# frames per cycle)

	; set vibrato flag?
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_VIBRATO, [hl]
	; start at lower frequency (extent is positive)
	ld hl, CHANNEL_FLAGS3
	add hl, bc
	res SOUND_VIBRATO_DIR, [hl]
	; get delay
	call GetMusicByte
; update delay
	ld hl, CHANNEL_VIBRATO_DELAY
	add hl, bc
	ld [hl], a
; update delay count
	ld hl, CHANNEL_VIBRATO_DELAY_COUNT
	add hl, bc
	ld [hl], a
; update extent
; this is split into halves only to get added back together at the last second
	; get extent/rate
	call GetMusicByte
	ld hl, CHANNEL_VIBRATO_EXTENT
	add hl, bc
	ld d, a
	; get top nybble
	and $f0
	swap a
	srl a ; halve
	ld e, a
	adc 0 ; round up
	swap a
	or e
	ld [hl], a
; update rate
	ld hl, CHANNEL_VIBRATO_RATE
	add hl, bc
	; get bottom nybble
	ld a, d
	and $f
	ld d, a
	swap a
	or d
	ld [hl], a
	ret

Music_PitchSlide:
; set the target for pitch slide
; params: 2
; note duration
; target note
	call GetMusicByte
	ld [wCurNoteDuration], a

	call GetMusicByte
	; pitch in e
	ld d, a
	and $f
	ld e, a

	; octave in d
	ld a, d
	swap a
	and $f
	ld d, a
	call GetFrequency
	ld hl, CHANNEL_PITCH_SLIDE_TARGET
	add hl, bc
	ld [hl], e
	ld hl, CHANNEL_PITCH_SLIDE_TARGET + 1
	add hl, bc
	ld [hl], d
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_PITCH_SLIDE, [hl]
	ret

Music_PitchOffset:
; tone
; params: 1 (dw)
; offset to add to each note frequency
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_PITCH_OFFSET, [hl]
	ld hl, CHANNEL_PITCH_OFFSET + 1
	add hl, bc
	call GetMusicByte
	ld [hld], a
	call GetMusicByte
	ld [hl], a
	ret

MusicE7:
; unused
; params: 1
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_UNKN_0E, [hl]
	call GetMusicByte
	ld hl, CHANNEL_FIELD29
	add hl, bc
	ld [hl], a
	ret

Music_DutyCyclePattern:
; sequence of 4 duty cycles to be looped
; params: 1 (4 2-bit duty cycle arguments)
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_DUTY_LOOP, [hl] ; duty cycle looping
	; sound duty sequence
	call GetMusicByte
	rrca
	rrca
	ld hl, CHANNEL_DUTY_CYCLE_PATTERN
	add hl, bc
	ld [hl], a
	; update duty cycle
	and $c0 ; only uses top 2 bits
	ld hl, CHANNEL_DUTY_CYCLE
	add hl, bc
	ld [hl], a
	ret

MusicE8:
; unused
; params: 1
	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_UNKN_0D, [hl]
	call GetMusicByte
	ld hl, CHANNEL_FIELD2A
	add hl, bc
	ld [hl], a
	ret

Music_ToggleSFX:
; toggle something
; params: none
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_SFX, [hl]
	jr z, .on
	res SOUND_SFX, [hl]
	ret

.on
	set SOUND_SFX, [hl]
	ret

Music_ToggleNoise:
; toggle music noise sampling
; can't be used as a straight toggle since the param is not read from on->off
; params:
; 	noise on: 1
; 	noise off: 0
	; check if noise sampling is on
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_NOISE, [hl]
	jr z, .on
	; turn noise sampling off
	res SOUND_NOISE, [hl]
	ret

.on
	; turn noise sampling on
	set SOUND_NOISE, [hl]
	call GetMusicByte
	ld [wMusicNoiseSampleSet], a
	ret

Music_SFXToggleNoise:
; toggle sfx noise sampling
; params:
;	on: 1
; 	off: 0
	; check if noise sampling is on
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	bit SOUND_NOISE, [hl]
	jr z, .on
	; turn noise sampling off
	res SOUND_NOISE, [hl]
	ret

.on
	; turn noise sampling on
	set SOUND_NOISE, [hl]
	call GetMusicByte
	ld [wSFXNoiseSampleSet], a
	ret

Music_NoteType:
; note length
;	# frames per 16th note
; volume envelope: see Music_VolumeEnvelope
; params: 2
	; note length
	call GetMusicByte
	ld hl, CHANNEL_NOTE_LENGTH
	add hl, bc
	ld [hl], a
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	cp CHAN4
	ret z
	; volume envelope
	call Music_VolumeEnvelope
	ret

Music_PitchSweep:
; update pitch sweep
; params: 1
	call GetMusicByte
	ld [wPitchSweep], a
	ld hl, CHANNEL_NOTE_FLAGS
	add hl, bc
	set NOTE_PITCH_SWEEP, [hl]
	ret

Music_DutyCycle:
; duty cycle
; params: 1
	call GetMusicByte
	rrca
	rrca
	and $c0
	ld hl, CHANNEL_DUTY_CYCLE
	add hl, bc
	ld [hl], a
	ret

Music_VolumeEnvelope:
; volume envelope
; params: 1
;	hi: volume
;   lo: fade
	call GetMusicByte
	ld hl, CHANNEL_VOLUME_ENVELOPE
	add hl, bc
	ld [hl], a
	ret

Music_Tempo:
; global tempo
; params: 2
;	de: tempo
	call GetMusicByte
	ld d, a
	call GetMusicByte
	ld e, a
	call SetGlobalTempo
	ret

Music_Octave8:
Music_Octave7:
Music_Octave6:
Music_Octave5:
Music_Octave4:
Music_Octave3:
Music_Octave2:
Music_Octave1:
; set octave based on lo nybble of the command
	ld hl, CHANNEL_OCTAVE
	add hl, bc
	ld a, [wCurMusicByte]
	and 7
	ld [hl], a
	ret

Music_Transpose:
; set starting octave
; this forces all notes up by the starting octave
; params: 1
	call GetMusicByte
	ld hl, CHANNEL_TRANSPOSITION
	add hl, bc
	ld [hl], a
	ret

Music_StereoPanning:
; stereo panning
; params: 1
;	; stereo on?
;	ld a, [wOptions]
;	bit STEREO, a
;	jr nz, Music_ForceStereoPanning
;	; skip param
;	call GetMusicByte
;	ret

Music_ForceStereoPanning:
; force panning
; params: 1
	call SetLRTracks
	call GetMusicByte
	ld hl, CHANNEL_TRACKS
	add hl, bc
	and [hl]
	ld [hl], a
	ret

Music_Volume:
; set volume
; params: 1
;	see Volume
	; read param even if it's not used
	call GetMusicByte
	; is the song fading?
	ld a, [wMusicFade]
	and a
	ret nz
	; reload param
	ld a, [wCurMusicByte]
	; set volume
	ld [wVolume], a
	ret

Music_TempoRelative:
; set global tempo to current channel tempo +/- param
; params: 1 signed
	call GetMusicByte
	ld e, a
	; check sign
	cp $80
	jr nc, .negative
;positive
	ld d, 0
	jr .ok

.negative
	ld d, -1
.ok
	ld hl, CHANNEL_TEMPO
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call SetGlobalTempo
	ret

Music_SFXPriorityOn:
; turn sfx priority on
; params: none
	ld a, 1
	ld [wSFXPriority], a
	ret

Music_SFXPriorityOff:
; turn sfx priority off
; params: none
	xor a
	ld [wSFXPriority], a
	ret

Music_RestartChannel:
; restart current channel from channel header (same bank)
; params: 2 (5)
; ll hh: pointer to new channel header
;	header format: 0x yy zz
;		x: channel # (0-3)
;		zzyy: pointer to new music data

	; update music id
	ld hl, CHANNEL_MUSIC_ID
	add hl, bc
	ld a, [hli]
	ld [wMusicID], a
	ld a, [hl]
	ld [wMusicID + 1], a
	; update music bank
	ld hl, CHANNEL_MUSIC_BANK
	add hl, bc
	ld a, [hl]
	ld [wMusicBank], a
	; get pointer to new channel header
	call GetMusicByte
	ld l, a
	call GetMusicByte
	ld h, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	push bc ; save current channel
	call LoadChannel
	call StartChannel
	pop bc ; restore current channel
	ret

Music_NewSong:
; new song
; params: 2
;	de: song id
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	push bc
	call _PlayMusic
	pop bc
	ret

GetMusicByte:
; returns byte from current address in a
; advances to next byte in music data
; input: bc = start of current channel
	push hl
	push de
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, CHANNEL_MUSIC_BANK
	add hl, bc
	ld a, [hl]
	call _LoadMusicByte ; load data into [wCurMusicByte]
	inc de ; advance to next byte for next time this is called
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	pop de
	pop hl
	ld a, [wCurMusicByte]
	ret

GetFrequency:
; generate frequency
; input:
; 	d: octave
;	e: pitch
; output:
; 	de: frequency

; get octave
	; get starting octave
	ld hl, CHANNEL_TRANSPOSITION
	add hl, bc
	ld a, [hl]
	swap a ; hi nybble
	and $f
	; add current octave
	add d
	push af ; we'll use this later
	; get starting octave
	ld hl, CHANNEL_TRANSPOSITION
	add hl, bc
	ld a, [hl]
	and $f ; lo nybble
	ld l, a ; ok
	ld d, 0
	ld h, d
	add hl, de ; add current pitch
	add hl, hl ; skip 2 bytes for each
	ld de, FrequencyTable
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	; get our octave
	pop af
	; shift right by [7 - octave] bits
.loop
	; [7 - octave] loops
	cp $7
	jr nc, .ok
	; sra de
	sra d
	rr e
	inc a
	jr .loop

.ok
	ld a, d
	and $7 ; top 3 bits for frequency (11 total)
	ld d, a
	ret

SetNoteDuration:
; input: a = note duration in 16ths
	; store delay units in de
	inc a
	ld e, a
	ld d, 0
	ld hl, CHANNEL_NOTE_LENGTH
	add hl, bc
	ld a, [hl]
	; multiply NoteLength by delay units
	ld l, 0 ; just multiply
	call .Multiply
	ld a, l ; low
	; store Tempo in de
	ld hl, CHANNEL_TEMPO
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; add ???? to the next result
	ld hl, CHANNEL_FIELD16
	add hl, bc
	ld l, [hl]
	; multiply Tempo by last result (NoteLength * LOW(delay))
	call .Multiply
	; copy result to de
	ld e, l
	ld d, h
	; store result in ????
	ld hl, CHANNEL_FIELD16
	add hl, bc
	ld [hl], e
	; store result in NoteDuration
	ld hl, CHANNEL_NOTE_DURATION
	add hl, bc
	ld [hl], d
	ret

.Multiply:
; multiplies a and de
; adds the result to l
; stores the result in hl
	ld h, 0
.loop
	; halve a
	srl a
	; is there a remainder?
	jr nc, .skip
	; add it to the result
	add hl, de
.skip
	; add de, de
	sla e
	rl d
	; are we done?
	and a
	jr nz, .loop
	ret

SetGlobalTempo:
	push bc ; save current channel
	; are we dealing with music or sfx?
	ld a, [wCurChannel]
	cp CHAN5
	jr nc, .sfxchannels
	ld bc, wChannel1
	call Tempo
	ld bc, wChannel2
	call Tempo
	ld bc, wChannel3
	call Tempo
	ld bc, wChannel4
	call Tempo
	jr .end

.sfxchannels
	ld bc, wChannel5
	call Tempo
	ld bc, wChannel6
	call Tempo
	ld bc, wChannel7
	call Tempo
	ld bc, wChannel8
	call Tempo
.end
	pop bc ; restore current channel
	ret

Tempo:
; input:
; 	de: note length
	; update Tempo
	ld hl, CHANNEL_TEMPO
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; clear ????
	xor a
	ld hl, CHANNEL_FIELD16
	add hl, bc
	ld [hl], a
	ret

StartChannel:
	call SetLRTracks
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_CHANNEL_ON, [hl] ; turn channel on
	ret

SetLRTracks:
; set tracks for a the current channel to default
; seems to be redundant since this is overwritten by stereo data later
	push de
	; store current channel in de
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	ld e, a
	ld d, 0
	call GetLRTracks
	add hl, de ; de = channel 0-3
	ld a, [hl]
	; load lr tracks into Tracks
	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld [hl], a
	pop de
	ret

_PlayMusic::
; load music
	call MusicOff
	ld hl, wMusicID
	ld [hl], e ; song number
	inc hl
	ld [hl], d ; (always 0)
	ld hl, Music
	add hl, de ; three
	add hl, de ; byte
	add hl, de ; pointer
	ld a, [hli]
	ld [wMusicBank], a
	ld e, [hl]
	inc hl
	ld d, [hl] ; music header address

	; pre-emptively disable all channels.  for some reason, this
	; does not happen.
	xor a
	ld [wChannel1 + CHANNEL_FLAGS1], a
	ld [wChannel2 + CHANNEL_FLAGS1], a
	ld [wChannel3 + CHANNEL_FLAGS1], a
	ld [wChannel4 + CHANNEL_FLAGS1], a

	call LoadMusicByte ; store first byte of music header in a
	rlca
	rlca
	maskbits NUM_MUSIC_CHANS
	inc a
.loop
; start playing channels
	push af
	call LoadChannel
	call StartChannel
	pop af
	dec a
	jr nz, .loop
	xor a
	ld [wUnusedMusicF9Flag], a
	ld [wChannel1JumpCondition], a
	ld [wChannel2JumpCondition], a
	ld [wChannel3JumpCondition], a
	ld [wChannel4JumpCondition], a
	ld [wNoiseSampleAddress], a
	ld [wNoiseSampleAddress + 1], a
	ld [wNoiseSampleDelay], a
	ld [wMusicNoiseSampleSet], a
	call MusicOn
	ret

_PlayCry::
; Play cry de using parameters:
;	wCryPitch
;	wCryLength

	call MusicOff

; Overload the music id with the cry id
	ld hl, wMusicID
	ld [hl], e
	inc hl
	ld [hl], d

; 3-byte pointers (bank, address)
	ld hl, Cries
	add hl, de
	add hl, de
	add hl, de

	ld a, [hli]
	ld [wMusicBank], a

	ld e, [hl]
	inc hl
	ld d, [hl]

; Read the cry's sound header
	call LoadMusicByte
	; Top 2 bits contain the number of channels
	rlca
	rlca
	maskbits NUM_MUSIC_CHANS

; For each channel:
	inc a
.loop
	push af
	call LoadChannel ; bc = current channel

	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_REST, [hl]

	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_PITCH_OFFSET, [hl]

	ld hl, CHANNEL_PITCH_OFFSET
	add hl, bc
	ld a, [wCryPitch]
	ld [hli], a
	ld a, [wCryPitch + 1]
	ld [hl], a

; No tempo for channel 4
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	cp CHAN4
	jr nc, .start

; Tempo is effectively length
	ld hl, CHANNEL_TEMPO
	add hl, bc
	ld a, [wCryLength]
	ld [hli], a
	ld a, [wCryLength + 1]
	ld [hl], a
.start
	call StartChannel
	ld a, [wStereoPanningMask]
	and a
	jr z, .next

; Stereo only: Play cry from the monster's side.
; This only applies in-battle.

;	ld a, [wOptions]
;	bit STEREO, a
;	jr z, .next

; [CHANNEL_TRACKS] &= [wCryTracks]
	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld a, [hl]
	ld hl, wCryTracks
	and [hl]
	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld [hl], a

.next
	pop af
	dec a
	jr nz, .loop

; Cries play at max volume, so we save the current volume for later.
	ld a, [wLastVolume]
	and a
	jr nz, .end

	ld a, [wVolume]
	ld [wLastVolume], a
	ld a, MAX_VOLUME
	ld [wVolume], a

.end
	ld a, 1 ; stop playing music
	ld [wSFXPriority], a
	call MusicOn
	ret

_PlayBattleSound::
; clear channels if they aren't already
	call MusicOff
	ld hl, wChannel5Flags1
	bit SOUND_CHANNEL_ON, [hl] ; ch5 on?
	jr z, .ch6
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR11], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR12], a ; envelope = 0
	xor a
	ldh [rNR13], a ; frequency lo = 0
	ld a, $80
	ldh [rNR14], a ; restart sound (freq hi = 0)
	xor a
	ld [wPitchSweep], a ; pitch sweep off
	ldh [rNR10], a ; pitch sweep off
.ch6
	ld hl, wChannel6Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .ch7
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR21], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR22], a ; envelope = 0
	xor a
	ldh [rNR23], a ; frequency lo = 0
	ld a, $80
	ldh [rNR24], a ; restart sound (freq hi = 0)
.ch7
	ld hl, wChannel7Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .ch8
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR30], a ; sound mode #3 off
	ldh [rNR31], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR32], a ; envelope = 0
	xor a
	ldh [rNR33], a ; frequency lo = 0
	ld a, $80
	ldh [rNR34], a ; restart sound (freq hi = 0)
.ch8
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .chscleared
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR41], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR42], a ; envelope = 0
	xor a
	ldh [rNR43], a ; frequency lo = 0
	ld a, $80
	ldh [rNR44], a ; restart sound (freq hi = 0)
	xor a
	ld [wNoiseSampleAddress], a
	ld [wNoiseSampleAddress + 1], a
.chscleared
; start reading sfx header for # chs
	ld hl, wMusicID
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SFX
	add hl, de ; three
	add hl, de ; byte
	add hl, de ; pointers
	; get bank
	ld a, [hli]
	ld [wMusicBank], a
	; get address
	ld e, [hl]
	inc hl
	ld d, [hl]
	; get # channels
	call LoadMusicByte
	rlca ; top 2
	rlca ; bits
	maskbits NUM_MUSIC_CHANS
	inc a ; # channels -> # loops
.startchannels
	push af
	call LoadChannel ; bc = current channel
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_SFX, [hl]

	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_PITCH_OFFSET, [hl]

	ld hl, CHANNEL_PITCH_OFFSET
	add hl, bc
	ld a, [wCryPitch]
	ld [hli], a
	ld a, [wCryPitch + 1]
	ld [hl], a

; No tempo for channel 4
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	cp CHAN4
	jr nc, .start

; Tempo is effectively length
	ld hl, CHANNEL_TEMPO
	add hl, bc
	ld a, [wCryLength]
	ld [hli], a
	ld a, [wCryLength + 1]
	ld [hl], a
.start
	call StartChannel
	pop af
	dec a
	jr nz, .startchannels
	call MusicOn
	xor a
	ld [wSFXPriority], a
	ret

_PlaySFX::
; clear channels if they aren't already
	call MusicOff
	ld hl, wChannel5Flags1
	bit SOUND_CHANNEL_ON, [hl] ; ch5 on?
	jr z, .ch6
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR11], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR12], a ; envelope = 0
	xor a
	ldh [rNR13], a ; frequency lo = 0
	ld a, $80
	ldh [rNR14], a ; restart sound (freq hi = 0)
	xor a
	ld [wPitchSweep], a ; pitch sweep off
	ldh [rNR10], a ; pitch sweep off
.ch6
	ld hl, wChannel6Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .ch7
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR21], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR22], a ; envelope = 0
	xor a
	ldh [rNR23], a ; frequency lo = 0
	ld a, $80
	ldh [rNR24], a ; restart sound (freq hi = 0)
.ch7
	ld hl, wChannel7Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .ch8
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR30], a ; sound mode #3 off
	ldh [rNR31], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR32], a ; envelope = 0
	xor a
	ldh [rNR33], a ; frequency lo = 0
	ld a, $80
	ldh [rNR34], a ; restart sound (freq hi = 0)
.ch8
	ld hl, wChannel8Flags1
	bit SOUND_CHANNEL_ON, [hl]
	jr z, .chscleared
	res SOUND_CHANNEL_ON, [hl] ; turn it off
	xor a
	ldh [rNR41], a ; length/wavepattern = 0
	ld a, $8
	ldh [rNR42], a ; envelope = 0
	xor a
	ldh [rNR43], a ; frequency lo = 0
	ld a, $80
	ldh [rNR44], a ; restart sound (freq hi = 0)
	xor a
	ld [wNoiseSampleAddress], a
	ld [wNoiseSampleAddress + 1], a
.chscleared
; start reading sfx header for # chs
	ld hl, wMusicID
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SFX
	add hl, de ; three
	add hl, de ; byte
	add hl, de ; pointers
	; get bank
	ld a, [hli]
	ld [wMusicBank], a
	; get address
	ld e, [hl]
	inc hl
	ld d, [hl]
	; get # channels
	call LoadMusicByte
	rlca ; top 2
	rlca ; bits
	maskbits NUM_MUSIC_CHANS
	inc a ; # channels -> # loops
.startchannels
	push af
	call LoadChannel ; bc = current channel
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_SFX, [hl]
	call StartChannel
	pop af
	dec a
	jr nz, .startchannels
	call MusicOn
	xor a
	ld [wSFXPriority], a
	ret

PlayStereoSFX::
; play sfx de

	call MusicOff

; standard procedure if stereo's off
;	ld a, [wOptions]
;	bit STEREO, a
;	jp z, _PlaySFX

; else, let's go ahead with this
	ld hl, wMusicID
	ld [hl], e
	inc hl
	ld [hl], d

; get sfx ptr
	ld hl, SFX
	add hl, de
	add hl, de
	add hl, de

; bank
	ld a, [hli]
	ld [wMusicBank], a
; address
	ld e, [hl]
	inc hl
	ld d, [hl]

; bit 2-3
	call LoadMusicByte
	rlca
	rlca
	maskbits NUM_MUSIC_CHANS
	inc a

.loop
	push af
	call LoadChannel

	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_SFX, [hl]

	push de
	; get tracks for this channel
	ld a, [wCurChannel]
	maskbits NUM_MUSIC_CHANS
	ld e, a
	ld d, 0
	call GetLRTracks
	add hl, de
	ld a, [hl]
	ld hl, wStereoPanningMask
	and [hl]

	ld hl, CHANNEL_TRACKS
	add hl, bc
	ld [hl], a

	ld hl, CHANNEL_FIELD30
	add hl, bc
	ld [hl], a

	ld a, [wCryTracks]
	cp 2 ; ch 1-2
	jr c, .skip

; ch3-4
	ld a, [wSFXDuration]

	ld hl, CHANNEL_FIELD2E
	add hl, bc
	ld [hl], a

	ld hl, CHANNEL_FIELD2F
	add hl, bc
	ld [hl], a

	ld hl, CHANNEL_FLAGS2
	add hl, bc
	set SOUND_UNKN_0F, [hl]

.skip
	pop de

; turn channel on
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	set SOUND_CHANNEL_ON, [hl] ; on

; done?
	pop af
	dec a
	jr nz, .loop

; we're done
	call MusicOn
	ret

LoadChannel:
; input: de = audio pointer
; sets bc to current channel pointer
	call LoadMusicByte
	inc de
	maskbits NUM_CHANNELS
	ld [wCurChannel], a
	ld c, a
	ld b, 0
	ld hl, ChannelPointers
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl] ; bc = channel pointer
	ld hl, CHANNEL_FLAGS1
	add hl, bc
	res SOUND_CHANNEL_ON, [hl] ; channel off
	call ChannelInit
	; load music pointer
	ld hl, CHANNEL_MUSIC_ADDRESS
	add hl, bc
	call LoadMusicByte
	ld [hli], a
	inc de
	call LoadMusicByte
	ld [hl], a
	inc de
	; load music id
	ld hl, CHANNEL_MUSIC_ID
	add hl, bc
	ld a, [wMusicID]
	ld [hli], a
	ld a, [wMusicID + 1]
	ld [hl], a
	; load music bank
	ld hl, CHANNEL_MUSIC_BANK
	add hl, bc
	ld a, [wMusicBank]
	ld [hl], a
	ret

ChannelInit:
; make sure channel is cleared
; set default tempo and note length in case nothing is loaded
; input:
;   bc = channel struct pointer
	push de
	xor a
	; get channel struct location and length
	ld hl, CHANNEL_MUSIC_ID ; start
	add hl, bc
	ld e, CHANNEL_STRUCT_LENGTH ; channel struct length
	; clear channel
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	; set tempo to default ($100)
	ld hl, CHANNEL_TEMPO
	add hl, bc
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	; set note length to default ($1) (fast)
	ld hl, CHANNEL_NOTE_LENGTH
	add hl, bc
	ld [hl], a
	pop de
	ret

LoadMusicByte::
; input:
;   de = current music address
; output:
;   a = wCurMusicByte
	ld a, [wMusicBank]
	call _LoadMusicByte
	ld a, [wCurMusicByte]
	ret

INCLUDE "crysaudio/notes.asm"

INCLUDE "crysaudio/wave_samples.asm"

INCLUDE "crysaudio/drumkits.asm"

GetLRTracks:
; gets the default sound l/r channels
; stores mono/stereo table in hl
;	ld a, [wOptions]
;	bit STEREO, a
;	; made redundant, could have had a purpose in gold
;	jr nz, .stereo
;	ld hl, MonoTracks
;	ret

.stereo
	ld hl, StereoTracks
	ret

MonoTracks:
; bit corresponds to track #
; hi: left channel
; lo: right channel
	db $11, $22, $44, $88

StereoTracks:
; made redundant
; seems to be modified on a per-song basis
	db $11, $22, $44, $88

ChannelPointers:
; music channels
	dw wChannel1
	dw wChannel2
	dw wChannel3
	dw wChannel4
; sfx channels
	dw wChannel5
	dw wChannel6
	dw wChannel7
	dw wChannel8

ClearChannels::
; runs ClearChannel for all 4 channels
; doesn't seem to be used, but functionally identical to InitSound
	ld hl, rNR50
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld hl, rNR10
	ld e, NUM_MUSIC_CHANS
.loop
	call ClearChannel
	dec e
	jr nz, .loop
	ret

ClearChannel:
; input: hl = beginning hw sound register (rNR10, rNR20, rNR30, rNR40)
; output: 00 00 80 00 80

;   sound channel   1      2      3      4
	xor a
	ld [hli], a ; rNR10, rNR20, rNR30, rNR40 ; sweep = 0

	ld [hli], a ; rNR11, rNR21, rNR31, rNR41 ; length/wavepattern = 0
	ld a, $8
	ld [hli], a ; rNR12, rNR22, rNR32, rNR42 ; envelope = 0
	xor a
	ld [hli], a ; rNR13, rNR23, rNR33, rNR43 ; frequency lo = 0
	ld a, $80
	ld [hli], a ; rNR14, rNR24, rNR34, rNR44 ; restart sound (freq hi = 0)
	ret

;PlayTrainerEncounterMusic::
; input: e = trainer type
;	; turn fade off
;	xor a
;	ld [wMusicFade], a
;	; play nothing for one frame
;	push de
;	ld de, MUSIC_NONE
;	call PlayMusic
;	call DelayFrame
;	; play new song
;	call MaxVolume
;	pop de
;	ld d, $00
;	ld hl, TrainerEncounterMusic
;	add hl, de
;	ld e, [hl]
;	call PlayMusic
;	ret
