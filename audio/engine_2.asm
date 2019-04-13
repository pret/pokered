; The second of three duplicated sound engines.

Audio2_UpdateMusic::
	ld c, Ch0
.loop
	ld b, $0
	ld hl, wChannelSoundIDs
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextChannel
	ld a, c
	cp Ch4
	jr nc, .applyAffects ; if sfx channel
	ld a, [wMuteAudioAndPauseMusic]
	and a
	jr z, .applyAffects
	bit 7, a
	jr nz, .nextChannel
	set 7, a
	ld [wMuteAudioAndPauseMusic], a
	xor a
	ld [rNR51], a
	ld [rNR30], a
	ld a, $80
	ld [rNR30], a
	jr .nextChannel
.applyAffects
	call Audio2_ApplyMusicAffects
.nextChannel
	ld a, c
	inc c
	cp Ch7
	jr nz, .loop
	ret

; this routine checks flags for music effects currently applied
; to the channel and calls certain functions based on flags.
; known flags for wChannelFlags1:
;   0: toggleperfectpitch has been used
;   1: call has been used
;   3: a toggle used only by this routine for vibrato
;   4: pitchbend flag
;   6: dutycycle flag
Audio2_ApplyMusicAffects:
	ld b, $0
	ld hl, wChannelNoteDelayCounters ; delay until next note
	add hl, bc
	ld a, [hl]
	cp $1 ; if the delay is 1, play next note
	jp z, Audio2_PlayNextNote
	dec a ; otherwise, decrease the delay timer
	ld [hl], a
	ld a, c
	cp Ch4
	jr nc, .startChecks ; if a sfx channel
	ld hl, wChannelSoundIDs + Ch4
	add hl, bc
	ld a, [hl]
	and a
	jr z, .startChecks
	ret
.startChecks
	ld hl, wChannelFlags1
	add hl, bc
	bit 6, [hl] ; dutycycle
	jr z, .checkForExecuteMusic
	call Audio2_ApplyDutyCycle
.checkForExecuteMusic
	ld b, $0
	ld hl, wChannelFlags2
	add hl, bc
	bit 0, [hl]
	jr nz, .checkForPitchBend
	ld hl, wChannelFlags1
	add hl, bc
	bit 2, [hl]
	jr nz, .disablePitchBendVibrato
.checkForPitchBend
	ld hl, wChannelFlags1
	add hl, bc
	bit 4, [hl] ; pitchbend
	jr z, .checkVibratoDelay
	jp Audio2_ApplyPitchBend
.checkVibratoDelay
	ld hl, wChannelVibratoDelayCounters ; vibrato delay
	add hl, bc
	ld a, [hl]
	and a ; check if delay is over
	jr z, .checkForVibrato
	dec [hl] ; otherwise, dec delay
.disablePitchBendVibrato
	ret
.checkForVibrato
	ld hl, wChannelVibratoExtents ; vibrato rate
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .vibrato
	ret ; no vibrato
.vibrato
	ld d, a
	ld hl, wChannelVibratoRates
	add hl, bc
	ld a, [hl]
	and $f
	and a
	jr z, .vibratoAlreadyDone
	dec [hl] ; apply vibrato pitch change
	ret
.vibratoAlreadyDone
	ld a, [hl]
	swap [hl]
	or [hl]
	ld [hl], a ; reset the vibrato value and start again
	ld hl, wChannelFrequencyLowBytes
	add hl, bc
	ld e, [hl] ; get note pitch
	ld hl, wChannelFlags1
	add hl, bc
	bit 3, [hl] ; this is the only code that sets/resets bit three so
	jr z, .unset ; it continuously alternates which path it takes
	res 3, [hl]
	ld a, d
	and $f
	ld d, a
	ld a, e
	sub d
	jr nc, .noCarry
	ld a, $0
.noCarry
	jr .done
.unset
	set 3, [hl]
	ld a, d
	and $f0
	swap a
	add e
	jr nc, .done
	ld a, $ff
.done
	ld d, a
	ld b, $3
	call Audio2_21ff7
	ld [hl], d
	ret

; this routine executes all music commands that take up no time,
; like tempo changes, duty changes etc. and doesn't return
; until the first note is reached
Audio2_PlayNextNote:
	ld hl, wChannelVibratoDelayCounterReloadValues
	add hl, bc
	ld a, [hl]
	ld hl, wChannelVibratoDelayCounters
	add hl, bc
	ld [hl], a
	ld hl, wChannelFlags1
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	ld a, c
	cp Ch4
	jr nz, .beginChecks
	ld a, [wLowHealthAlarm] ;low health alarm enabled?
	bit 7, a
	ret nz
.beginChecks
	call Audio2_endchannel
	ret

Audio2_endchannel:
	call Audio2_GetNextMusicByte
	ld d, a
	cp $ff ; is this command an endchannel?
	jp nz, Audio2_callchannel ; no
	ld b, $0 ; yes
	ld hl, wChannelFlags1
	add hl, bc
	bit 1, [hl]
	jr nz, .returnFromCall
	ld a, c
	cp Ch3
	jr nc, .noiseOrSfxChannel
	jr .asm_219c0
.noiseOrSfxChannel
	res 2, [hl]
	ld hl, wChannelFlags2
	add hl, bc
	res 0, [hl]
	cp Ch6
	jr nz, .notSfxChannel3
	ld a, $0
	ld [rNR30], a
	ld a, $80
	ld [rNR30], a
.notSfxChannel3
	jr nz, .asm_219a3
	ld a, [wDisableChannelOutputWhenSfxEnds]
	and a
	jr z, .asm_219a3
	xor a
	ld [wDisableChannelOutputWhenSfxEnds], a
	jr .asm_219c0
.asm_219a3
	jr .asm_219c9
.returnFromCall
	res 1, [hl]
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wChannelCommandPointers
	add hl, de
	push hl ; store current channel address
	ld hl, wChannelReturnAddresses
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a ; loads channel address to return to
	jp Audio2_endchannel
.asm_219c0
	ld hl, Unknown_222de
	add hl, bc
	ld a, [rNR51]
	and [hl]
	ld [rNR51], a
.asm_219c9
	ld a, [wChannelSoundIDs + Ch4]
	cp $14
	jr nc, .asm_219d2
	jr .asm_219ef
.asm_219d2
	ld a, [wChannelSoundIDs + Ch4]
	cp $86
	jr z, .asm_219ef
	jr c, .asm_219dd
	jr .asm_219ef
.asm_219dd
	ld a, c
	cp Ch4
	jr z, .asm_219e6
	call Audio2_21e6d
	ret c
.asm_219e6
	ld a, [wSavedVolume]
	ld [rNR50], a
	xor a
	ld [wSavedVolume], a
.asm_219ef
	ld hl, wChannelSoundIDs
	add hl, bc
	ld [hl], b
	ret

Audio2_callchannel:
	cp $fd ; is this command a callchannel?
	jp nz, Audio2_loopchannel ; no
	call Audio2_GetNextMusicByte ; yes
	push af
	call Audio2_GetNextMusicByte
	ld d, a
	pop af
	ld e, a
	push de ; store pointer
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wChannelCommandPointers
	add hl, de
	push hl
	ld hl, wChannelReturnAddresses
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a ; copy current channel address
	pop de
	ld [hl], e
	inc hl
	ld [hl], d ; overwrite current address with pointer
	ld b, $0
	ld hl, wChannelFlags1
	add hl, bc
	set 1, [hl] ; set the call flag
	jp Audio2_endchannel

Audio2_loopchannel:
	cp $fe ; is this command a loopchannel?
	jp nz, Audio2_notetype ; no
	call Audio2_GetNextMusicByte ; yes
	ld e, a
	and a
	jr z, .infiniteLoop
	ld b, $0
	ld hl, wChannelLoopCounters
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .loopAgain
	ld a, $1 ; if no more loops to make,
	ld [hl], a
	call Audio2_GetNextMusicByte ; skip pointer
	call Audio2_GetNextMusicByte
	jp Audio2_endchannel
.loopAgain ; inc loop count
	inc a
	ld [hl], a
	; fall through
.infiniteLoop ; overwrite current address with pointer
	call Audio2_GetNextMusicByte
	push af
	call Audio2_GetNextMusicByte
	ld b, a
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wChannelCommandPointers
	add hl, de
	pop af
	ld [hli], a
	ld [hl], b
	jp Audio2_endchannel

Audio2_notetype:
	and $f0
	cp $d0 ; is this command a notetype?
	jp nz, Audio2_toggleperfectpitch ; no
	ld a, d ; yes
	and $f
	ld b, $0
	ld hl, wChannelNoteSpeeds
	add hl, bc
	ld [hl], a ; store low nibble as speed
	ld a, c
	cp Ch3
	jr z, .noiseChannel ; noise channel has 0 params
	call Audio2_GetNextMusicByte
	ld d, a
	ld a, c
	cp Ch2
	jr z, .musicChannel3
	cp Ch6
	jr nz, .notChannel3
	ld hl, wSfxWaveInstrument
	jr .sfxChannel3
.musicChannel3
	ld hl, wMusicWaveInstrument
.sfxChannel3
	ld a, d
	and $f
	ld [hl], a ; store low nibble of param as duty
	ld a, d
	and $30
	sla a
	ld d, a
	; fall through

	; if channel 3, store high nibble as volume
	; else, store volume (high nibble) and fade (low nibble)
.notChannel3
	ld b, $0
	ld hl, wChannelVolumes
	add hl, bc
	ld [hl], d
.noiseChannel
	jp Audio2_endchannel

Audio2_toggleperfectpitch:
	ld a, d
	cp $e8 ; is this command a toggleperfectpitch?
	jr nz, Audio2_vibrato ; no
	ld b, $0 ; yes
	ld hl, wChannelFlags1
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a ; flip bit 0 of wChannelFlags1
	jp Audio2_endchannel

Audio2_vibrato:
	cp $ea ; is this command a vibrato?
	jr nz, Audio2_pitchbend ; no
	call Audio2_GetNextMusicByte ; yes
	ld b, $0
	ld hl, wChannelVibratoDelayCounters
	add hl, bc
	ld [hl], a ; store delay
	ld hl, wChannelVibratoDelayCounterReloadValues
	add hl, bc
	ld [hl], a ; store delay
	call Audio2_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, $0
	ld hl, wChannelVibratoExtents
	add hl, bc
	srl a
	ld e, a
	adc b
	swap a
	or e
	ld [hl], a ; store rate as both high and low nibbles
	ld a, d
	and $f
	ld d, a
	ld hl, wChannelVibratoRates
	add hl, bc
	swap a
	or d
	ld [hl], a ; store depth as both high and low nibbles
	jp Audio2_endchannel

Audio2_pitchbend:
	cp $eb ; is this command a pitchbend?
	jr nz, Audio2_duty ; no
	call Audio2_GetNextMusicByte ; yes
	ld b, $0
	ld hl, wChannelPitchBendLengthModifiers
	add hl, bc
	ld [hl], a ; store first param
	call Audio2_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, d
	and $f
	call Audio2_22017
	ld b, $0
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	add hl, bc
	ld [hl], d ; store unknown part of second param
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
	add hl, bc
	ld [hl], e ; store unknown part of second param
	ld b, $0
	ld hl, wChannelFlags1
	add hl, bc
	set 4, [hl] ; set pitchbend flag
	call Audio2_GetNextMusicByte
	ld d, a
	jp Audio2_notelength

Audio2_duty:
	cp $ec ; is this command a duty?
	jr nz, Audio2_tempo ; no
	call Audio2_GetNextMusicByte ; yes
	rrca
	rrca
	and $c0
	ld b, $0
	ld hl, wChannelDuties
	add hl, bc
	ld [hl], a ; store duty
	jp Audio2_endchannel

Audio2_tempo:
	cp $ed ; is this command a tempo?
	jr nz, Audio2_stereopanning ; no
	ld a, c ; yes
	cp Ch4
	jr nc, .sfxChannel
	call Audio2_GetNextMusicByte
	ld [wMusicTempo], a ; store first param
	call Audio2_GetNextMusicByte
	ld [wMusicTempo + 1], a ; store second param
	xor a
	ld [wChannelNoteDelayCountersFractionalPart], a ; clear RAM
	ld [wChannelNoteDelayCountersFractionalPart + 1], a
	ld [wChannelNoteDelayCountersFractionalPart + 2], a
	ld [wChannelNoteDelayCountersFractionalPart + 3], a
	jr .musicChannelDone
.sfxChannel
	call Audio2_GetNextMusicByte
	ld [wSfxTempo], a ; store first param
	call Audio2_GetNextMusicByte
	ld [wSfxTempo + 1], a ; store second param
	xor a
	ld [wChannelNoteDelayCountersFractionalPart + 4], a ; clear RAM
	ld [wChannelNoteDelayCountersFractionalPart + 5], a
	ld [wChannelNoteDelayCountersFractionalPart + 6], a
	ld [wChannelNoteDelayCountersFractionalPart + 7], a
.musicChannelDone
	jp Audio2_endchannel

Audio2_stereopanning:
	cp $ee ; is this command a stereopanning?
	jr nz, Audio2_unknownmusic0xef ; no
	call Audio2_GetNextMusicByte ; yes
	ld [wStereoPanning], a ; store panning
	jp Audio2_endchannel

; this appears to never be used
Audio2_unknownmusic0xef:
	cp $ef ; is this command an unknownmusic0xef?
	jr nz, Audio2_dutycycle ; no
	call Audio2_GetNextMusicByte ; yes
	push bc
	call Audio2_PlaySound
	pop bc
	ld a, [wDisableChannelOutputWhenSfxEnds]
	and a
	jr nz, .skip
	ld a, [wChannelSoundIDs + Ch7]
	ld [wDisableChannelOutputWhenSfxEnds], a
	xor a
	ld [wChannelSoundIDs + Ch7], a
.skip
	jp Audio2_endchannel

Audio2_dutycycle:
	cp $fc ; is this command a dutycycle?
	jr nz, Audio2_volume ; no
	call Audio2_GetNextMusicByte ; yes
	ld b, $0
	ld hl, wChannelDutyCycles
	add hl, bc
	ld [hl], a ; store full cycle
	and $c0
	ld hl, wChannelDuties
	add hl, bc
	ld [hl], a ; store first duty
	ld hl, wChannelFlags1
	add hl, bc
	set 6, [hl] ; set dutycycle flag
	jp Audio2_endchannel

Audio2_volume:
	cp $f0 ; is this command a volume?
	jr nz, Audio2_executemusic ; no
	call Audio2_GetNextMusicByte ; yes
	ld [rNR50], a ; store volume
	jp Audio2_endchannel

Audio2_executemusic:
	cp $f8 ; is this command an executemusic?
	jr nz, Audio2_octave ; no
	ld b, $0 ; yes
	ld hl, wChannelFlags2
	add hl, bc
	set 0, [hl]
	jp Audio2_endchannel

Audio2_octave:
	and $f0
	cp $e0 ; is this command an octave?
	jr nz, Audio2_sfxnote ; no
	ld hl, wChannelOctaves ; yes
	ld b, $0
	add hl, bc
	ld a, d
	and $f
	ld [hl], a ; store low nibble as octave
	jp Audio2_endchannel

; sfxnote is either squarenote or noisenote depending on the channel
Audio2_sfxnote:
	cp $20 ; is this command an sfxnote?
	jr nz, Audio2_pitchenvelope ; no
	ld a, c
	cp Ch3 ; is this a noise or sfx channel?
	jr c, Audio2_pitchenvelope ; no
	ld b, $0
	ld hl, wChannelFlags2
	add hl, bc
	bit 0, [hl]
	jr nz, Audio2_pitchenvelope ; no
	call Audio2_notelength
	ld d, a
	ld b, $0
	ld hl, wChannelDuties
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
	ld b, $1
	call Audio2_21ff7
	ld [hl], d
	call Audio2_GetNextMusicByte
	ld d, a
	ld b, $2
	call Audio2_21ff7
	ld [hl], d
	call Audio2_GetNextMusicByte
	ld e, a
	ld a, c
	cp Ch7
	ld a, $0
	jr z, .sfxNoiseChannel ; only two params for noise channel
	push de
	call Audio2_GetNextMusicByte
	pop de
.sfxNoiseChannel
	ld d, a
	push de
	call Audio2_21daa
	call Audio2_21d79
	pop de
	call Audio2_21dcc
	ret

Audio2_pitchenvelope:
	ld a, c
	cp Ch4
	jr c, Audio2_note ; if not a sfx
	ld a, d
	cp $10 ; is this command a pitchenvelope?
	jr nz, Audio2_note ; no
	ld b, $0
	ld hl, wChannelFlags2
	add hl, bc
	bit 0, [hl]
	jr nz, Audio2_note ; no
	call Audio2_GetNextMusicByte ; yes
	ld [rNR10], a
	jp Audio2_endchannel

Audio2_note:
	ld a, c
	cp Ch3
	jr nz, Audio2_notelength ; if not noise channel
	ld a, d
	and $f0
	cp $b0 ; is this command a dnote?
	jr z, Audio2_dnote ; yes
	jr nc, Audio2_notelength ; no
	swap a
	ld b, a
	ld a, d
	and $f
	ld d, a
	ld a, b
	push de
	push bc
	jr asm_21c7e

Audio2_dnote:
	ld a, d
	and $f
	push af
	push bc
	call Audio2_GetNextMusicByte ; get dnote instrument
asm_21c7e
	ld d, a
	ld a, [wDisableChannelOutputWhenSfxEnds]
	and a
	jr nz, .asm_21c89
	ld a, d
	call Audio2_PlaySound
.asm_21c89
	pop bc
	pop de

Audio2_notelength:
	ld a, d
	push af
	and $f
	inc a
	ld b, $0
	ld e, a ; store note length (in 16ths)
	ld d, b
	ld hl, wChannelNoteSpeeds
	add hl, bc
	ld a, [hl]
	ld l, b
	call Audio2_22006
	ld a, c
	cp Ch4
	jr nc, .sfxChannel
	ld a, [wMusicTempo]
	ld d, a
	ld a, [wMusicTempo + 1]
	ld e, a
	jr .skip
.sfxChannel
	ld d, $1
	ld e, $0
	cp Ch7
	jr z, .skip ; if noise channel
	call Audio2_21e2f
	ld a, [wSfxTempo]
	ld d, a
	ld a, [wSfxTempo + 1]
	ld e, a
.skip
	ld a, l
	ld b, $0
	ld hl, wChannelNoteDelayCountersFractionalPart
	add hl, bc
	ld l, [hl]
	call Audio2_22006
	ld e, l
	ld d, h
	ld hl, wChannelNoteDelayCountersFractionalPart
	add hl, bc
	ld [hl], e
	ld a, d
	ld hl, wChannelNoteDelayCounters
	add hl, bc
	ld [hl], a
	ld hl, wChannelFlags2
	add hl, bc
	bit 0, [hl]
	jr nz, Audio2_notepitch
	ld hl, wChannelFlags1
	add hl, bc
	bit 2, [hl]
	jr z, Audio2_notepitch
	pop hl
	ret

Audio2_notepitch:
	pop af
	and $f0
	cp $c0 ; compare to rest
	jr nz, .notRest
	ld a, c
	cp Ch4
	jr nc, .sfxChannel
	ld hl, wChannelSoundIDs + Ch4
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .done
	; fall through
.sfxChannel
	ld a, c
	cp Ch2
	jr z, .musicChannel3
	cp Ch6
	jr nz, .notSfxChannel3
.musicChannel3
	ld b, $0
	ld hl, Unknown_222de
	add hl, bc
	ld a, [rNR51]
	and [hl]
	ld [rNR51], a
	jr .done
.notSfxChannel3
	ld b, $2
	call Audio2_21ff7
	ld a, $8
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.done
	ret
.notRest
	swap a
	ld b, $0
	ld hl, wChannelOctaves
	add hl, bc
	ld b, [hl]
	call Audio2_22017
	ld b, $0
	ld hl, wChannelFlags1
	add hl, bc
	bit 4, [hl]
	jr z, .asm_21d39
	call Audio2_21f4e
.asm_21d39
	push de
	ld a, c
	cp Ch4
	jr nc, .skip ; if sfx channel
	ld hl, wChannelSoundIDs + Ch4
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_21d4c
	jr .skip
.asm_21d4c
	pop de
	ret
.skip
	ld b, $0
	ld hl, wChannelVolumes
	add hl, bc
	ld d, [hl]
	ld b, $2
	call Audio2_21ff7
	ld [hl], d
	call Audio2_21daa
	call Audio2_21d79
	pop de
	ld b, $0
	ld hl, wChannelFlags1
	add hl, bc
	bit 0, [hl]   ; has toggleperfectpitch been used?
	jr z, .skip2
	inc e         ; if yes, increment the pitch by 1
	jr nc, .skip2
	inc d
.skip2
	ld hl, wChannelFrequencyLowBytes
	add hl, bc
	ld [hl], e
	call Audio2_21dcc
	ret

Audio2_21d79:
	ld b, $0
	ld hl, Unknown_222e6
	add hl, bc
	ld a, [rNR51]
	or [hl]
	ld d, a
	ld a, c
	cp Ch7
	jr z, .sfxNoiseChannel
	cp Ch4
	jr nc, .skip ; if sfx channel
	ld hl, wChannelSoundIDs + Ch4
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .skip
.sfxNoiseChannel
	ld a, [wStereoPanning]
	ld hl, Unknown_222e6
	add hl, bc
	and [hl]
	ld d, a
	ld a, [rNR51]
	ld hl, Unknown_222de
	add hl, bc
	and [hl]
	or d
	ld d, a
.skip
	ld a, d
	ld [rNR51], a
	ret

Audio2_21daa:
	ld b, $0
	ld hl, wChannelNoteDelayCounters
	add hl, bc
	ld d, [hl]
	ld a, c
	cp Ch2
	jr z, .channel3 ; if music channel 3
	cp Ch6
	jr z, .channel3 ; if sfx channel 3
	ld a, d
	and $3f
	ld d, a
	ld hl, wChannelDuties
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
.channel3
	ld b, $1
	call Audio2_21ff7
	ld [hl], d
	ret

Audio2_21dcc:
	ld a, c
	cp Ch2
	jr z, .channel3
	cp Ch6
	jr nz, .notSfxChannel3
	; fall through
.channel3
	push de
	ld de, wMusicWaveInstrument
	cp Ch2
	jr z, .musicChannel3
	ld de, wSfxWaveInstrument
.musicChannel3
	ld a, [de]
	add a
	ld d, $0
	ld e, a
	ld hl, Audio2_WavePointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ff30
	ld b, $f
	ld a, $0
	ld [rNR30], a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, b
	dec b
	and a
	jr nz, .loop
	ld a, $80
	ld [rNR30], a
	pop de
.notSfxChannel3
	ld a, d
	or $80
	and $c7
	ld d, a
	ld b, $3
	call Audio2_21ff7
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	cp Ch4
	jr c, .musicChannel
	call Audio2_21e56
.musicChannel
	ret

Audio2_21e19:
	ld a, c
	cp Ch4
	jr nz, .asm_21e2e
	ld a, [wLowHealthAlarm]
	bit 7, a
	jr z, .asm_21e2e
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
.asm_21e2e
	ret

Audio2_21e2f:
	call Audio2_21e8b
	jr c, .asm_21e39
	call Audio2_21e9f
	jr nc, .asm_21e4c
.asm_21e39
	ld d, $0
	ld a, [wTempoModifier]
	add $80
	jr nc, .asm_21e43
	inc d
.asm_21e43
	ld [wSfxTempo + 1], a
	ld a, d
	ld [wSfxTempo], a
	jr .asm_21e55
.asm_21e4c
	xor a
	ld [wSfxTempo + 1], a
	ld a, $1
	ld [wSfxTempo], a
.asm_21e55
	ret

Audio2_21e56:
	call Audio2_21e8b
	jr c, .asm_21e60
	call Audio2_21e9f
	jr nc, .asm_21e6c
.asm_21e60
	ld a, [wFrequencyModifier]
	add e
	jr nc, .asm_21e67
	inc d
.asm_21e67
	dec hl
	ld e, a
	ld [hl], e
	inc hl
	ld [hl], d
.asm_21e6c
	ret

Audio2_21e6d:
	call Audio2_21e8b
	jr nc, .asm_21e88
	ld hl, wChannelCommandPointers
	ld e, c
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	scf
	ret
.asm_21e88
	scf
	ccf
	ret

Audio2_21e8b:
	ld a, [wChannelSoundIDs + Ch4]
	cp $14
	jr nc, .asm_21e94
	jr .asm_21e9a
.asm_21e94
	cp $86
	jr z, .asm_21e9a
	jr c, .asm_21e9d
.asm_21e9a
	scf
	ccf
	ret
.asm_21e9d
	scf
	ret

Audio2_21e9f:
	ld a, [wChannelSoundIDs + Ch7]
	ld b, a
	ld a, [wChannelSoundIDs + Ch4]
	or b
	cp $9d
	jr nc, .asm_21ead
	jr .asm_21eb3
.asm_21ead
	cp $ea
	jr z, .asm_21eb3
	jr c, .asm_21eb6
.asm_21eb3
	scf
	ccf
	ret
.asm_21eb6
	scf
	ret

Audio2_ApplyPitchBend:
	ld hl, wChannelFlags1
	add hl, bc
	bit 5, [hl]
	jp nz, .asm_21eff
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	add hl, bc
	ld e, [hl]
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	add hl, bc
	ld d, [hl]
	ld hl, wChannelPitchBendFrequencySteps
	add hl, bc
	ld l, [hl]
	ld h, b
	add hl, de
	ld d, h
	ld e, l
	ld hl, wChannelPitchBendCurrentFrequencyFractionalPart
	add hl, bc
	push hl
	ld hl, wChannelPitchBendFrequencyStepsFractionalPart
	add hl, bc
	ld a, [hl]
	pop hl
	add [hl]
	ld [hl], a
	ld a, $0
	adc e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .asm_21f45
	jr nz, .asm_21f32
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_21f45
	jr .asm_21f32
.asm_21eff
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	add hl, bc
	ld a, [hl]
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	add hl, bc
	ld d, [hl]
	ld hl, wChannelPitchBendFrequencySteps
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, wChannelPitchBendFrequencyStepsFractionalPart
	add hl, bc
	ld a, [hl]
	add a
	ld [hl], a
	ld a, e
	sbc b
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .asm_21f45
	jr nz, .asm_21f32
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
	add hl, bc
	ld a, e
	cp [hl]
	jr c, .asm_21f45
.asm_21f32
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	add hl, bc
	ld [hl], e
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	add hl, bc
	ld [hl], d
	ld b, $3
	call Audio2_21ff7
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
.asm_21f45
	ld hl, wChannelFlags1
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	ret

Audio2_21f4e:
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	add hl, bc
	ld [hl], d
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	add hl, bc
	ld [hl], e
	ld hl, wChannelNoteDelayCounters
	add hl, bc
	ld a, [hl]
	ld hl, wChannelPitchBendLengthModifiers
	add hl, bc
	sub [hl]
	jr nc, .asm_21f66
	ld a, $1
.asm_21f66
	ld [hl], a
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc b
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	add hl, bc
	sub [hl]
	jr c, .asm_21f82
	ld d, a
	ld b, $0
	ld hl, wChannelFlags1
	add hl, bc
	set 5, [hl]
	jr .asm_21fa5
.asm_21f82
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	add hl, bc
	ld d, [hl]
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	add hl, bc
	ld e, [hl]
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld b, $0
	ld hl, wChannelFlags1
	add hl, bc
	res 5, [hl]
.asm_21fa5
	ld hl, wChannelPitchBendLengthModifiers
	add hl, bc
.asm_21fa9
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_21fa9
	ld a, d
	and a
	jr z, .asm_21fb7
	dec a
	ld d, a
	jr .asm_21fa9
.asm_21fb7
	ld a, e
	add [hl]
	ld d, b
	ld b, $0
	ld hl, wChannelPitchBendFrequencySteps
	add hl, bc
	ld [hl], d
	ld hl, wChannelPitchBendFrequencyStepsFractionalPart
	add hl, bc
	ld [hl], a
	ld hl, wChannelPitchBendCurrentFrequencyFractionalPart
	add hl, bc
	ld [hl], a
	ret

Audio2_ApplyDutyCycle:
	ld b, $0
	ld hl, wChannelDutyCycles
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and $c0
	ld d, a
	ld b, $1
	call Audio2_21ff7
	ld a, [hl]
	and $3f
	or d
	ld [hl], a
	ret

Audio2_GetNextMusicByte:
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wChannelCommandPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	ld a, [de] ; get next music command
	inc de
	ld [hl], e ; store address of next command
	inc hl
	ld [hl], d
	ret

Audio2_21ff7:
	ld a, c
	ld hl, Unknown_222d6
	add l
	jr nc, .noCarry
	inc h
.noCarry
	ld l, a
	ld a, [hl]
	add b
	ld l, a
	ld h, $ff
	ret

Audio2_22006:
	ld h, $0
.loop
	srl a
	jr nc, .noCarry
	add hl, de
.noCarry
	sla e
	rl d
	and a
	jr z, .done
	jr .loop
.done
	ret

Audio2_22017:
	ld h, $0
	ld l, a
	add hl, hl
	ld d, h
	ld e, l
	ld hl, Audio2_Pitches
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, b
.loop
	cp Ch7
	jr z, .done
	sra d
	rr e
	inc a
	jr .loop
.done
	ld a, $8
	add d
	ld d, a
	ret

Audio2_PlaySound::
	ld [wSoundID], a
	cp $ff
	jp z, Audio2_221f3
	cp $e9
	jp z, Audio2_2210d
	jp c, Audio2_2210d
	cp $fe
	jr z, .asm_2204c
	jp nc, Audio2_2210d
.asm_2204c
	xor a
	ld [wUnusedC000], a
	ld [wDisableChannelOutputWhenSfxEnds], a
	ld [wMusicTempo + 1], a
	ld [wMusicWaveInstrument], a
	ld [wSfxWaveInstrument], a
	ld d, $8
	ld hl, wChannelReturnAddresses
	call FillAudioRAM2
	ld hl, wChannelCommandPointers
	call FillAudioRAM2
	ld d, $4
	ld hl, wChannelSoundIDs
	call FillAudioRAM2
	ld hl, wChannelFlags1
	call FillAudioRAM2
	ld hl, wChannelDuties
	call FillAudioRAM2
	ld hl, wChannelDutyCycles
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
	ld hl, wChannelPitchBendLengthModifiers
	call FillAudioRAM2
	ld hl, wChannelPitchBendFrequencySteps
	call FillAudioRAM2
	ld hl, wChannelPitchBendFrequencyStepsFractionalPart
	call FillAudioRAM2
	ld hl, wChannelPitchBendCurrentFrequencyFractionalPart
	call FillAudioRAM2
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	call FillAudioRAM2
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	call FillAudioRAM2
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	call FillAudioRAM2
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
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
	ld [rNR50], a
	ld a, $8
	ld [rNR10], a
	ld a, $0
	ld [rNR51], a
	xor a
	ld [rNR30], a
	ld a, $80
	ld [rNR30], a
	ld a, $77
	ld [rNR50], a
	jp Audio2_2224e

Audio2_2210d:
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
.asm_22126
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
	jr z, .asm_22162
	ld a, e
	cp $7
	jr nz, .asm_22159
	ld a, [wSoundID]
	cp $14
	jr nc, .asm_22152
	ret
.asm_22152
	ld a, [hl]
	cp $14
	jr z, .asm_22162
	jr c, .asm_22162
.asm_22159
	ld a, [wSoundID]
	cp [hl]
	jr z, .asm_22162
	jr c, .asm_22162
	ret
.asm_22162
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
	ld hl, wChannelDuties
	add hl, de
	ld [hl], a
	ld hl, wChannelDutyCycles
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
	ld hl, wChannelPitchBendLengthModifiers
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendFrequencySteps
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendFrequencyStepsFractionalPart
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendCurrentFrequencyFractionalPart
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendCurrentFrequencyHighBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendCurrentFrequencyLowBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendTargetFrequencyHighBytes
	add hl, de
	ld [hl], a
	ld hl, wChannelPitchBendTargetFrequencyLowBytes
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
	cp $4
	jr nz, .asm_221ea
	ld a, $8
	ld [rNR10], a
.asm_221ea
	ld a, c
	and a
	jp z, Audio2_2224e
	dec c
	jp .asm_22126

Audio2_221f3:
	ld a, $80
	ld [rNR52], a
	ld [rNR30], a
	xor a
	ld [rNR51], a
	ld [rNR32], a
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	ld [rNR22], a
	ld [rNR42], a
	ld a, $40
	ld [rNR14], a
	ld [rNR24], a
	ld [rNR44], a
	ld a, $77
	ld [rNR50], a
	xor a
	ld [wUnusedC000], a
	ld [wDisableChannelOutputWhenSfxEnds], a
	ld [wMuteAudioAndPauseMusic], a
	ld [wMusicTempo + 1], a
	ld [wSfxTempo + 1], a
	ld [wMusicWaveInstrument], a
	ld [wSfxWaveInstrument], a
	ld d, $a0
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

Audio2_2224e:
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
.asm_22270
	cp c
	jr z, .asm_22278
	inc c
	inc hl
	inc hl
	jr .asm_22270
.asm_22278
	push hl
	push bc
	push af
	ld b, $0
	ld c, a
	ld hl, wChannelSoundIDs
	add hl, bc
	ld a, [wSoundID]
	ld [hl], a
	pop af
	cp $3
	jr c, .asm_22291
	ld hl, wChannelFlags1
	add hl, bc
	set 2, [hl]
.asm_22291
	pop bc
	pop hl
	ld a, [de] ; get channel pointer
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc c
	dec b
	ld a, b
	and a
	ld a, [de]
	inc de
	jr nz, .asm_22270
	ld a, [wSoundID]
	cp $14
	jr nc, .asm_222aa
	jr .asm_222d4
.asm_222aa
	ld a, [wSoundID]
	cp $86
	jr z, .asm_222d4
	jr c, .asm_222b5
	jr .asm_222d4
.asm_222b5
	ld hl, wChannelSoundIDs + Ch4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wChannelCommandPointers + Ch6 * 2 ; sfx noise channel pointer
	ld de, Noise2_endchannel
	ld [hl], e
	inc hl
	ld [hl], d ; overwrite pointer to point to endchannel
	ld a, [wSavedVolume]
	and a
	jr nz, .asm_222d4
	ld a, [rNR50]
	ld [wSavedVolume], a
	ld a, $77
	ld [rNR50], a
.asm_222d4
	ret

Noise2_endchannel:
	endchannel

Unknown_222d6:
	db $10, $15, $1A, $1F ; channels 0-3
	db $10, $15, $1A, $1F ; channels 4-7

Unknown_222de:
	db $EE, $DD, $BB, $77 ; channels 0-3
	db $EE, $DD, $BB, $77 ; channels 4-7

Unknown_222e6:
	db $11, $22, $44, $88 ; channels 0-3
	db $11, $22, $44, $88 ; channels 4-7

Audio2_Pitches:
	dw $F82C ; C_
	dw $F89D ; C#
	dw $F907 ; D_
	dw $F96B ; D#
	dw $F9CA ; E_
	dw $FA23 ; F_
	dw $FA77 ; F#
	dw $FAC7 ; G_
	dw $FB12 ; G#
	dw $FB58 ; A_
	dw $FB9B ; A#
	dw $FBDA ; B_


