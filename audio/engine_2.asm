; shinpokerednote: audionote: This file was heavily modified to be closer to pokeyellow's audio engine

Audio2_PlaySound::
	ld [wSoundID], a
	cp SFX_STOP_ALL_MUSIC
	jp z, StopAllAudio_2
	cp MAX_SFX_ID_2
	jr z, PlaySfxRemapDrums
	jr c, PlaySfxRemapDrums
	cp $fe
	jr z, .playMusic
	jr nc, PlaySfxRemapDrums
.playMusic
	call InitMusicVariables
	jp PlaySoundCommon_2

PlaySfxRemapDrums:
	push af
	call PlaySfx
	pop af
	jp CheckRemapNoiseInstrument_2


PlaySfx:
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_2
	add hl, de
	ld a, h
	ld [wSfxHeaderPointer], a
	ld a, l
	ld [wSfxHeaderPointer + 1], a
	ld a, [hl]
	and $c0
	rlca
	rlca
	ld c, a
.sfxChannelLoop
	ld d, c
	ld a, c
	add a
	add c
	ld c, a
	ld b, $0
	ld a, [wSfxHeaderPointer]
	ld h, a
	ld a, [wSfxHeaderPointer + 1]
	ld l, a
	add hl, bc
	ld c, d
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, wChannelSoundIDs
	add hl, de
	ld a, [hl]
	and a
	jr z, .playChannel
	ld a, e
	cp CHAN8
	jr nz, .notNoiseChannel
	ld a, [wSoundID]
	cp NOISE_INSTRUMENTS_END
	jr nc, .notNoiseInstrument
	ret
.notNoiseInstrument
	ld a, [hl]
	cp NOISE_INSTRUMENTS_END
	jr z, .playChannel
	jr c, .playChannel
.notNoiseChannel
	ld a, [wSoundID]
	cp [hl]
	jr z, .playChannel
	jr c, .playChannel
	ret
.playChannel
	call InitSFXVariables
.skipSweepDisable
	ld a, c
	and a
	jp z, PlaySoundCommon_2
	dec c
	jp .sfxChannelLoop

StopAllAudio_2:
	jp StopAllAudio

PlaySoundCommon_2:
	ld a, [wSoundID]
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_2
	add hl, de
	ld e, l
	ld d, h
	ld hl, wChannelCommandPointers
	ld a, [de] ; get channel number
	ld b, a
	rlca
	rlca
	and $3
	ld c, a
	ld a, b
	and $f
	ld b, c
	inc b
	inc de
	ld c, $0
.commandPointerLoop
	cp c
	jr z, .next
	inc c
	inc hl
	inc hl
	jr .commandPointerLoop
.next
	push af
	push hl
	push bc
	ld b, $0
	ld c, a
	cp CHAN4
	jr c, .skipSettingFlag
	ld hl, wChannelFlags1
	add hl, bc
	set BIT_NOISE_OR_SFX, [hl]
.skipSettingFlag
	pop bc
	pop hl
	ld a, [de] ; get channel pointer
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop af
	push hl
	push bc
	ld b, $0
	ld c, a
	ld hl, wChannelSoundIDs
	add hl, bc
	ld a, [wSoundID]
	ld [hl], a
	pop bc
	pop hl
	inc c
	dec b
	ld a, b
	and a
	ld a, [de]
	inc de
	jr nz, .commandPointerLoop
	ld a, [wSoundID]
	cp CRY_SFX_START
	jr nc, .maybeCry
	jr .done
.maybeCry
	ld a, [wSoundID]
	cp CRY_SFX_END
	jr z, .done
	jr c, .cry
	jr .done
.cry
	ld hl, wChannelSoundIDs + CHAN5
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wChannelCommandPointers + CHAN7 * 2 ; sfx noise channel pointer
	ld de, Noise2_endchannel
	ld [hl], e
	inc hl
	ld [hl], d ; overwrite pointer to point to endchannel
	ld a, [wSavedVolume]
	and a
	jr nz, .done
	ldh a, [rNR50]
	ld [wSavedVolume], a
	ld a, $77
	ldh [rNR50], a
.done
	ret

Noise2_endchannel:
	sound_ret

Audio2_InitMusicVariables::
	xor a
	;ld [wUnusedC000], a
	ld [wDisableChannelOutputWhenSfxEnds], a
	ld [wMusicTempo + 1], a
	ld [wMusicWaveInstrument], a
	ld [wSfxWaveInstrument], a
	ld [wMusicDrumKit], a
	ld d, NUM_CHANNELS
	ld hl, wChannelReturnAddresses
	call FillAudioRAM2
	ld hl, wChannelCommandPointers
	call FillAudioRAM2
	ld d, NUM_MUSIC_CHANS
	ld hl, wChannelSoundIDs
	call FillAudioRAM2
	ld hl, wChannelFlags1
	call FillAudioRAM2
	ld hl, wChannelDutyCycles
	call FillAudioRAM2
	ld hl, wChannelDutyCyclePatterns
	call FillAudioRAM2
	ld hl, wChannelVibratoDelayCounters
	call FillAudioRAM2
	ld hl, wChannelVibratoExtents
	call FillAudioRAM2
	ld hl, wChannelVibratoRates
	call FillAudioRAM2
	ld hl, wChannelFrequencyLowBytes
	call FillAudioRAM2
	ld hl, wChannelVibratoDelayCounterReloadValues
	call FillAudioRAM2
	ld hl, wChannelFlags2
	call FillAudioRAM2
	ld hl, wChannelPitchSlideLengthModifiers
	call FillAudioRAM2
	ld hl, wChannelPitchSlideFrequencySteps
	call FillAudioRAM2
	ld hl, wChannelPitchSlideFrequencyStepsFractionalPart
	call FillAudioRAM2
	ld hl, wChannelPitchSlideCurrentFrequencyFractionalPart
	call FillAudioRAM2
	ld hl, wChannelPitchSlideCurrentFrequencyHighBytes
	call FillAudioRAM2
	ld hl, wChannelPitchSlideCurrentFrequencyLowBytes
	call FillAudioRAM2
	ld hl, wChannelPitchSlideTargetFrequencyHighBytes
	call FillAudioRAM2
	ld hl, wChannelPitchSlideTargetFrequencyLowBytes
	call FillAudioRAM2
	ld a, $1
	ld hl, wChannelLoopCounters
	call FillAudioRAM2
	ld hl, wChannelNoteDelayCounters
	call FillAudioRAM2
	ld hl, wChannelNoteSpeeds
	call FillAudioRAM2
	ld [wMusicTempo], a
	ld a, $ff
	ld [wStereoPanning], a
	xor a
	ld d, 3
	ld hl, wChannelTranspositions
	call FillAudioRAM2
	;ld hl, wChannelSimulatedRests
	;call FillAudioRAM2
	;ld hl, wChannelCutoffs
	;call FillAudioRAM2
	ldh [rNR50], a
	ld a, $8
	ldh [rNR10], a
	ld a, $0
	ldh [rNR51], a
	xor a
	ldh [rNR30], a
	ld a, $80
	ldh [rNR30], a
	ld a, $77
	ldh [rNR50], a
	ret

Audio2_InitSFXVariables::
	xor a
	push de
	ld h, d
	ld l, e
	add hl, hl
	ld d, h
	ld e, l
	ld hl, wChannelReturnAddresses
	add hl, de
	ld [hli], a
	ld [hl], a
	ld hl, wChannelCommandPointers
	add hl, de
	ld [hli], a
	ld [hl], a
	pop de
	ld hl, wChannelSoundIDs
	add hl, de
	ld [hl], a
	ld hl, wChannelFlags1
	add hl, de
	ld [hl], a
	ld hl, wChannelDutyCycles
	add hl, de
	ld [hl], a
	ld hl, wChannelDutyCyclePatterns
	add hl, de
	ld [hl], a
	ld hl, wChannelVibratoDelayCounters
	add hl, de
	ld [hl], a
	ld hl, wChannelVibratoExtents
	add hl, de
	ld [hl], a
	ld hl, wChannelVibratoRates
	add hl, de
	ld [hl], a
	ld hl, wChannelFrequencyLowBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelVibratoDelayCounterReloadValues
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideLengthModifiers
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideFrequencySteps
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideFrequencyStepsFractionalPart
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideCurrentFrequencyFractionalPart
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideCurrentFrequencyHighBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideCurrentFrequencyLowBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideTargetFrequencyHighBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchSlideTargetFrequencyLowBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelFlags2
	add hl, de
	ld [hl], a
	ld a, $1
	ld hl, wChannelLoopCounters
	add hl, de
	ld [hl], a
	ld hl, wChannelNoteDelayCounters
	add hl, de
	ld [hl], a
	ld hl, wChannelNoteSpeeds
	add hl, de
	ld [hl], a
	ld a, e
	cp CHAN5
	ret nz
	ld a, $8
	ldh [rNR10], a
	ret

Audio2_StopAllAudio::
	ld a, $80
	ldh [rNR52], a
	ldh [rNR30], a
	xor a
	ldh [rNR51], a
	ldh [rNR32], a
	ld a, $8
	ldh [rNR10], a
	ldh [rNR12], a
	ldh [rNR22], a
	ldh [rNR42], a
	ld a, $40
	ldh [rNR14], a
	ldh [rNR24], a
	ldh [rNR44], a
	ld a, $77
	ldh [rNR50], a
	xor a
	;ld [wUnusedC000], a
	ld [wDisableChannelOutputWhenSfxEnds], a
	ld [wMuteAudioAndPauseMusic], a
	ld [wMusicTempo + 1], a
	ld [wSfxTempo + 1], a
	ld [wMusicWaveInstrument], a
	ld [wSfxWaveInstrument], a
	ld d, $b0 ;$a0
	ld hl, wChannelCommandPointers
	call FillAudioRAM2
	ld a, $1
	ld d, $18
	ld hl, wChannelNoteDelayCounters
	call FillAudioRAM2
	ld [wMusicTempo], a
	ld [wSfxTempo], a
	ld a, $ff
	ld [wStereoPanning], a
	ret

; fills d bytes at hl with a
FillAudioRAM2:
	ld b, d
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

; PureRGBnote: ADDED: code that allows default drum kit sounds to be overwritten with other drum kit sounds.
CheckRemapNoiseInstrument_2:
	ld a, [wChannelSoundIDs + CHAN8]
	cp REMAPPABLE_NOISE_INSTRUMENTS_END
	ret nc
	ld b, a
	ld a, [wMusicDrumKit]
	and a
	ret z
	dec a ; drumkit to use is wMusicDrumKit - 1
	ld hl, Drumkits_2
	call GetAddressFromPointerArray ; get drumkit
	ld a, b
	call GetAddressFromPointerArray ; get drum noise pointer
	ld d, h
	ld e, l
	ld hl, wChannelCommandPointers + CHAN8 * 2
	jp Audio2_OverwriteChannelPointer ; replace the original drum noise with the one from the drumkit we want

Drumkits_2: INCLUDE "audio/drumkits.asm"

; input d = which channel
; input e = note length
;CheckNoteCutoff::
;	ld a, d
;	cp CHAN4
;	ret nc ; no cutoff on channels above 3
;	ld c, d
;	ld hl, wChannelCutoffs
;	ld b, 0
;	add hl, bc
;	ld a, [hl]
;	and a
;	ret z
;	dec e
;	ld d, a
;	ld a, e
;	sub d
;	ld e, d ; resultant note length
;	inc e
;	ld hl, wChannelSimulatedRests
;	add hl, bc
;	ld [hl], a ; resultant simulated rest
;	ret
