; The first of three duplicated sound engines.

Func_9103: ; 0x9103
	ld c, CH0
.loop
	ld b, $0
	ld hl, $c026
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextChannel
	ld a, c
	cp CH4
	jr nc, .asm_912e ; if sfx channel
	ld a, [$c002]
	and a
	jr z, .asm_912e
	bit 7, a
	jr nz, .nextChannel
	set 7, a
	ld [$c002], a
	xor a
	ld [$ff00+$25], a
	ld [$ff00+$1a], a
	ld a, $80
	ld [$ff00+$1a], a
	jr .nextChannel
.asm_912e
	call Music2_ApplyMusicAffects
.nextChannel
	ld a, c
	inc c ; inc channel number
	cp CH7
	jr nz, .loop 
	ret

; this routine checks flags for music effects currently applied
; to the channel and calls certain functions based on flags.
; known flags for $c02e:
;	1: call has been used
;	3: a toggle used only by this routine for vibrato
;	4: pitchbend flag
;	6: dutycycle flag
Music2_ApplyMusicAffects: ; 0x9138
	ld b, $0
	ld hl, $c0b6 ; delay unitl next note
	add hl, bc
	ld a, [hl]
	cp $1 ; if the delay is 1, play next note
	jp z, Music2_PlayNextNote
	dec a ; otherwise, decrease the delay timer
	ld [hl], a
	ld a, c
	cp CH4
	jr nc, .startChecks ; if a sfx channel
	ld hl, $c02a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .startChecks
	ret
.startChecks
	ld hl, $c02e
	add hl, bc
	bit 6, [hl] ; dutycycle
	jr z, .checkForExecuteMusic
	call Music2_ApplyDutyCycle
.checkForExecuteMusic
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, .checkForPitchBend
	ld hl, $c02e
	add hl, bc
	bit 2, [hl]
	jr nz, .disablePitchBendVibrato
.checkForPitchBend
	ld hl, $c02e
	add hl, bc
	bit 4, [hl] ; pitchbend
	jr z, .checkVibratoDelay
	jp Music2_ApplyPitchBend
.checkVibratoDelay
	ld hl, $c04e ; vibrato delay
	add hl, bc
	ld a, [hl]
	and a ; check if delay is over
	jr z, .checkForVibrato
	dec [hl] ; otherwise, dec delay
.disablePitchBendVibrato
	ret
.checkForVibrato
	ld hl, $c056 ; vibrato rate
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .vibrato
	ret ; no vibrato
.vibrato
	ld d, a
	ld hl, $c05e
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
	ld hl, $c066
	add hl, bc
	ld e, [hl] ; get note pitch
	ld hl, $c02e
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
	call Func_9838
	ld [hl], d
	ret

; this routine executes all music commands that take up no time,
; like tempo changes, duty changes etc. and doesn't return
; until the first note is reached
Music2_PlayNextNote ; 0x91d0
	ld hl, $c06e
	add hl, bc
	ld a, [hl]
	ld hl, $c04e
	add hl, bc
	ld [hl], a
	ld hl, $c02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	call Music2_endchannel
	ret

Music2_endchannel: ; 0x91e6
	call Music2_GetNextMusicByte
	ld d, a
	cp $ff ; is this command an endchannel?
	jp nz, Music2_callchannel ; no
	ld b, $0 ; yes
	ld hl, $c02e
	add hl, bc
	bit 1, [hl]
	jr nz, .returnFromCall
	ld a, c
	cp CH3
	jr nc, .noiseOrSfxChannel
	jr .asm_923f
.noiseOrSfxChannel
	res 2, [hl]
	ld hl, $c036
	add hl, bc
	res 0, [hl]
	cp CH6
	jr nz, .notSfxChannel3
	ld a, $0
	ld [$ff00+$1a], a
	ld a, $80
	ld [$ff00+$1a], a
.notSfxChannel3
	jr nz, .asm_9222
	ld a, [$c003]
	and a
	jr z, .asm_9222
	xor a
	ld [$c003], a
	jr .asm_923f
.asm_9222
	jr .asm_9248
.returnFromCall
	res 1, [hl]
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	push hl ; store current channel address
	ld hl, $c016
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a ; loads channel address to return to
	jp Music2_endchannel
.asm_923f
	ld hl, Unknown_9b1f
	add hl, bc
	ld a, [$ff00+$25]
	and [hl]
	ld [$ff00+$25], a
.asm_9248
	ld a, [$c02a]
	cp $14
	jr nc, .asm_9251
	jr .asm_926e
.asm_9251
	ld a, [$c02a]
	cp $86
	jr z, .asm_926e
	jr c, .asm_925c
	jr .asm_926e
.asm_925c
	ld a, c
	cp CH4
	jr z, .asm_9265
	call Func_96c7
	ret c
.asm_9265
	ld a, [$c005]
	ld [$ff00+$24], a
	xor a
	ld [$c005], a
.asm_926e
	ld hl, $c026
	add hl, bc
	ld [hl], b
	ret

Music2_callchannel: ; 0x9274
	cp $fd ; is this command a callchannel?
	jp nz, Music2_loopchannel ; no
	call Music2_GetNextMusicByte ; yes
	push af
	call Music2_GetNextMusicByte
	ld d, a
	pop af
	ld e, a
	push de ; store pointer
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	push hl
	ld hl, $c016
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
	ld hl, $c02e
	add hl, bc
	set 1, [hl] ; set the call flag
	jp Music2_endchannel

Music2_loopchannel: ; 0x92a9
	cp $fe ; is this command a loopchannel?
	jp nz, Music2_notetype ; no
	call Music2_GetNextMusicByte ; yes
	ld e, a
	and a
	jr z, .infiniteLoop
	ld b, $0
	ld hl, $c0be
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .loopAgain
	ld a, $1 ; if no more loops to make,
	ld [hl], a
	call Music2_GetNextMusicByte ; skip pointer
	call Music2_GetNextMusicByte
	jp Music2_endchannel
.loopAgain ; inc loop count
	inc a
	ld [hl], a
	; fall through
.infiniteLoop ; overwrite current address with pointer
	call Music2_GetNextMusicByte
	push af
	call Music2_GetNextMusicByte
	ld b, a
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	pop af
	ld [hli], a
	ld [hl], b
	jp Music2_endchannel

Music2_notetype: ; 0x92e4
	and $f0
	cp $d0 ; is this command a notetype?
	jp nz, Music2_togglecall ; no
	ld a, d ; yes
	and $f
	ld b, $0
	ld hl, $c0c6
	add hl, bc
	ld [hl], a ; store low nibble as speed
	ld a, c
	cp CH3
	jr z, .noiseChannel ; noise channel has 0 params
	call Music2_GetNextMusicByte
	ld d, a
	ld a, c
	cp CH2
	jr z, .musicChannel3
	cp CH6
	jr nz, .notChannel3
	ld hl, $c0e7
	jr .sfxChannel3
.musicChannel3
	ld hl, $c0e6
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
	ld hl, $c0de
	add hl, bc
	ld [hl], d
.noiseChannel
	jp Music2_endchannel

Music2_togglecall: ; 0x9323
	ld a, d
	cp $e8 ; is this command an togglecall?
	jr nz, Music2_vibrato ; no
	ld b, $0 ; yes
	ld hl, $c02e
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a ; flip bit 0 of $c02e (toggle returning from call)
	jp Music2_endchannel

Music2_vibrato: ; 0x9335
	cp $ea ; is this command a vibrato?
	jr nz, Music2_pitchbend ; no
	call Music2_GetNextMusicByte ; yes
	ld b, $0
	ld hl, $c04e
	add hl, bc
	ld [hl], a ; store delay 
	ld hl, $c06e
	add hl, bc
	ld [hl], a ; store delay
	call Music2_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, $0
	ld hl, $c056
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
	ld hl, $c05e
	add hl, bc
	swap a
	or d
	ld [hl], a ; store depth as both high and low nibbles
	jp Music2_endchannel

Music2_pitchbend: ; 0x936d
	cp $eb ; is this command a pitchbend?
	jr nz, Music2_duty ; no
	call Music2_GetNextMusicByte ; yes
	ld b, $0
	ld hl, $c076
	add hl, bc
	ld [hl], a ; store first param
	call Music2_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, d
	and $f
	call Func_9858
	ld b, $0
	ld hl, $c0a6
	add hl, bc
	ld [hl], d ; store unknown part of second param
	ld hl, $c0ae
	add hl, bc
	ld [hl], e ; store unknown part of second param
	ld b, $0
	ld hl, $c02e
	add hl, bc
	set 4, [hl] ; set pitchbend flag
	call Music2_GetNextMusicByte
	ld d, a
	jp Music2_notelength

Music2_duty: ; 0x93a5
	cp $ec ; is this command a duty?
	jr nz, Music2_tempo ; no
	call Music2_GetNextMusicByte ; yes
	rrca
	rrca
	and $c0
	ld b, $0
	ld hl, $c03e
	add hl, bc
	ld [hl], a ; store duty
	jp Music2_endchannel

Music2_tempo: ; 0x93ba
	cp $ed ; is this command a tempo?
	jr nz, Music2_unknownmusic0xee ; no
	ld a, c ; yes
	cp CH4
	jr nc, .sfxChannel
	call Music2_GetNextMusicByte
	ld [$c0e8], a ; store first param
	call Music2_GetNextMusicByte
	ld [$c0e9], a ; store second param
	xor a
	ld [$c0ce], a ; clear RAM
	ld [$c0cf], a
	ld [$c0d0], a
	ld [$c0d1], a
	jr .musicChannelDone
.sfxChannel
	call Music2_GetNextMusicByte
	ld [$c0ea], a ; store first param
	call Music2_GetNextMusicByte
	ld [$c0eb], a ; store second param
	xor a
	ld [$c0d2], a ; clear RAM
	ld [$c0d3], a
	ld [$c0d4], a
	ld [$c0d5], a
.musicChannelDone
	jp Music2_endchannel

Music2_unknownmusic0xee: ; 0x93fa
	cp $ee ; is this command an unknownmusic0xee?
	jr nz, Music2_unknownmusic0xef ; no
	call Music2_GetNextMusicByte ; yes
	ld [$c004], a ; store first param
	jp Music2_endchannel

; this appears to never be used
Music2_unknownmusic0xef ; 0x9407
	cp $ef ; is this command an unknownmusic0xef?
	jr nz, Music2_dutycycle ; no
	call Music2_GetNextMusicByte ; yes
	push bc
	call Func_9876
	pop bc
	ld a, [$c003]
	and a
	jr nz, .skip
	ld a, [$c02d]
	ld [$c003], a
	xor a
	ld [$c02d], a
.skip
	jp Music2_endchannel

Music2_dutycycle: ; 0x9426
	cp $fc ; is this command a dutycycle?
	jr nz, Music2_stereopanning ; no
	call Music2_GetNextMusicByte ; yes
	ld b, $0
	ld hl, $c046
	add hl, bc
	ld [hl], a ; store full cycle
	and $c0
	ld hl, $c03e
	add hl, bc
	ld [hl], a ; store first duty
	ld hl, $c02e
	add hl, bc
	set 6, [hl] ; set dutycycle flag
	jp Music2_endchannel

Music2_stereopanning: ; 0x9444
	cp $f0 ; is this command a stereopanning?
	jr nz, Music2_executemusic ; no
	call Music2_GetNextMusicByte ; yes
	ld [$ff00+$24], a ; store stereopanning
	jp Music2_endchannel

Music2_executemusic: ; 0x9450
	cp $f8 ; is this command an executemusic?
	jr nz, Music2_octave ; no
	ld b, $0 ; yes
	ld hl, $c036
	add hl, bc
	set 0, [hl]
	jp Music2_endchannel

Music2_octave: ; 0x945f
	and $f0
	cp $e0 ; is this command an octave?
	jr nz, Music2_unknownsfx0x20 ; no
	ld hl, $c0d6 ; yes
	ld b, $0
	add hl, bc
	ld a, d
	and $f
	ld [hl], a ; store low nibble as octave
	jp Music2_endchannel

Music2_unknownsfx0x20: ; 0x9472
	cp $20 ; is this command an unknownsfx0x20?
	jr nz, Music2_unknownsfx0x10 ; no
	ld a, c
	cp CH3 ; is this a noise or sfx channel?
	jr c, Music2_unknownsfx0x10 ; no
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, Music2_unknownsfx0x10 ; no
	call Music2_notelength ; yes
	ld d, a
	ld b, $0
	ld hl, $c03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
	ld b, $1
	call Func_9838
	ld [hl], d
	call Music2_GetNextMusicByte
	ld d, a
	ld b, $2
	call Func_9838
	ld [hl], d
	call Music2_GetNextMusicByte
	ld e, a
	ld a, c
	cp CH7
	ld a, $0
	jr z, .sfxNoiseChannel ; only two params for noise channel
	push de
	call Music2_GetNextMusicByte
	pop de
.sfxNoiseChannel
	ld d, a
	push de
	call Func_9629
	call Func_95f8
	pop de
	call Func_964b
	ret

Music2_unknownsfx0x10:
	ld a, c
	cp CH4
	jr c, Music2_note ; if not a sfx
	ld a, d
	cp $10 ; is this command a unknownsfx0x10?
	jr nz, Music2_note ; no
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, Music2_note ; no
	call Music2_GetNextMusicByte ; yes
	ld [$ff00+$10], a
	jp Music2_endchannel

Music2_note:
	ld a, c
	cp CH3
	jr nz, Music2_notelength ; if not noise channel
	ld a, d
	and $f0
	cp $b0 ; is this command a dnote?
	jr z, Music2_dnote ; yes
	jr nc, Music2_notelength ; no
	swap a
	ld b, a
	ld a, d
	and $f
	ld d, a
	ld a, b
	push de
	push bc
	jr asm_94fd

Music2_dnote:
	ld a, d
	and $f
	push af
	push bc
	call Music2_GetNextMusicByte ; get dnote instrument
asm_94fd
	ld d, a
	ld a, [$c003]
	and a
	jr nz, .asm_9508
	ld a, d
	call Func_9876
.asm_9508
	pop bc
	pop de

Music2_notelength: ; 0x950a
	ld a, d
	push af
	and $f
	inc a
	ld b, $0
	ld e, a  ; store note length (in 16ths)
	ld d, b
	ld hl, $c0c6
	add hl, bc
	ld a, [hl]
	ld l, b
	call Func_9847
	ld a, c
	cp CH4
	jr nc, .sfxChannel
	ld a, [$c0e8]
	ld d, a
	ld a, [$c0e9]
	ld e, a
	jr .skip
.sfxChannel
	ld d, $1
	ld e, $0
	cp CH7
	jr z, .skip ; if noise channel
	call Func_9693
	ld a, [$c0ea]
	ld d, a
	ld a, [$c0eb]
	ld e, a
.skip
	ld a, l
	ld b, $0
	ld hl, $c0ce
	add hl, bc
	ld l, [hl]
	call Func_9847
	ld e, l
	ld d, h
	ld hl, $c0ce
	add hl, bc
	ld [hl], e
	ld a, d
	ld hl, $c0b6
	add hl, bc
	ld [hl], a
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, Music2_notepitch
	ld hl, $c02e
	add hl, bc
	bit 2, [hl]
	jr z, Music2_notepitch
	pop hl
	ret

Music2_notepitch: ; 0x9568
	pop af
	and $f0
	cp $c0 ; compare to rest
	jr nz, .notRest
	ld a, c
	cp CH4
	jr nc, .sfxChannel
	ld hl, $c02a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .done
	; fall through
.sfxChannel
	ld a, c
	cp CH2
	jr z, .musicChannel3
	cp CH6
	jr nz, .notSfxChannel3
.musicChannel3
	ld b, $0
	ld hl, Unknown_9b1f
	add hl, bc
	ld a, [$ff00+$25]
	and [hl]
	ld [$ff00+$25], a
	jr .done
.notSfxChannel3
	ld b, $2
	call Func_9838
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
	ld hl, $c0d6
	add hl, bc
	ld b, [hl]
	call Func_9858
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 4, [hl]
	jr z, .asm_95b8
	call Func_978f
.asm_95b8
	push de
	ld a, c
	cp CH4
	jr nc, .skip ; if sfx channel
	ld hl, $c02a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_95cb
	jr .skip
.asm_95cb
	pop de
	ret
.skip
	ld b, $0
	ld hl, $c0de
	add hl, bc
	ld d, [hl]
	ld b, $2
	call Func_9838
	ld [hl], d
	call Func_9629
	call Func_95f8
	pop de
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 0, [hl]
	jr z, .asm_95ef
	inc e
	jr nc, .asm_95ef
	inc d
.asm_95ef
	ld hl, $c066
	add hl, bc
	ld [hl], e
	call Func_964b
	ret

Func_95f8: ; 0x95f8
	ld b, $0
	ld hl, Unknown_9b27
	add hl, bc
	ld a, [$ff00+$25]
	or [hl]
	ld d, a
	ld a, c
	cp CH7
	jr z, .sfxNoiseChannel
	cp CH4
	jr nc, .skip ; if sfx channel
	ld hl, $c02a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .skip
.sfxNoiseChannel
	ld a, [$c004]
	ld hl, Unknown_9b27
	add hl, bc
	and [hl]
	ld d, a
	ld a, [$ff00+$25]
	ld hl, Unknown_9b1f
	add hl, bc
	and [hl]
	or d
	ld d, a
.skip
	ld a, d
	ld [$ff00+$25], a
	ret

Func_9629: ; 0x9629
	ld b, $0
	ld hl, $c0b6
	add hl, bc
	ld d, [hl]
	ld a, c
	cp CH2
	jr z, .channel3 ; if music channel 3
	cp CH6
	jr z, .channel3 ; if sfx channel 3
	ld a, d
	and $3f
	ld d, a
	ld hl, $c03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
.channel3
	ld b, $1
	call Func_9838
	ld [hl], d
	ret

Func_964b: ; 0x964b
	ld a, c
	cp CH2
	jr z, .channel3
	cp CH6
	jr nz, .notSfxChannel3
	; fall through
.channel3
	push de
	ld de, $c0e6
	cp CH2
	jr z, .musicChannel3
	ld de, $c0e7
.musicChannel3
	ld a, [de]
	add a
	ld d, $0
	ld e, a
	ld hl, Music2_Channel3DutyPointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ff30
	ld b, $f
	ld a, $0
	ld [$ff00+$1a], a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, b
	dec b
	and a
	jr nz, .loop
	ld a, $80
	ld [$ff00+$1a], a
	pop de
.notSfxChannel3
	ld a, d
	or $80
	and $c7
	ld d, a
	ld b, $3
	call Func_9838
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_96b5
	ret

Func_9693: ; 0x9693
	call Func_96e5
	jr nc, .asm_96ab
	ld d, $0
	ld a, [$c0f2]
	add $80
	jr nc, .asm_96a2
	inc d
.asm_96a2
	ld [$c0eb], a
	ld a, d
	ld [$c0ea], a
	jr .asm_96b4
.asm_96ab
	xor a
	ld [$c0eb], a
	ld a, $1
	ld [$c0ea], a
.asm_96b4
	ret

Func_96b5: ; 0x96b5
	call Func_96e5
	jr nc, .asm_96c6
	ld a, [$c0f1]
	add e
	jr nc, .asm_96c1
	inc d
.asm_96c1
	dec hl
	ld e, a
	ld [hl], e
	inc hl
	ld [hl], d
.asm_96c6
	ret

Func_96c7: ; 0x96c7
	call Func_96e5
	jr nc, .asm_96e2
	ld hl, $c006
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
.asm_96e2
	scf
	ccf
	ret

Func_96e5: ; 0x96e5
	ld a, [$c02a]
	cp $14
	jr nc, .asm_96ee
	jr .asm_96f4
.asm_96ee
	cp $86
	jr z, .asm_96f4
	jr c, .asm_96f7
.asm_96f4
	scf
	ccf
	ret
.asm_96f7
	scf
	ret

Music2_ApplyPitchBend: ; 0x96f9
	ld hl, $c02e
	add hl, bc
	bit 5, [hl]
	jp nz, .asm_9740
	ld hl, $c09e
	add hl, bc
	ld e, [hl]
	ld hl, $c096
	add hl, bc
	ld d, [hl]
	ld hl, $c07e
	add hl, bc
	ld l, [hl]
	ld h, b
	add hl, de
	ld d, h
	ld e, l
	ld hl, $c08e
	add hl, bc
	push hl
	ld hl, $c086
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
	ld hl, $c0a6
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .asm_9786
	jr nz, .asm_9773
	ld hl, $c0ae
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_9786
	jr .asm_9773
.asm_9740
	ld hl, $c09e
	add hl, bc
	ld a, [hl]
	ld hl, $c096
	add hl, bc
	ld d, [hl]
	ld hl, $c07e
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, $c086
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
	ld hl, $c0a6
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .asm_9786
	jr nz, .asm_9773
	ld hl, $c0ae
	add hl, bc
	ld a, e
	cp [hl]
	jr c, .asm_9786
.asm_9773
	ld hl, $c09e
	add hl, bc
	ld [hl], e
	ld hl, $c096
	add hl, bc
	ld [hl], d
	ld b, $3
	call Func_9838
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
.asm_9786
	ld hl, $c02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	ret

Func_978f: ; 0x978f
	ld hl, $c096
	add hl, bc
	ld [hl], d
	ld hl, $c09e
	add hl, bc
	ld [hl], e
	ld hl, $c0b6
	add hl, bc
	ld a, [hl]
	ld hl, $c076
	add hl, bc
	sub [hl]
	jr nc, .asm_97a7
	ld a, $1
.asm_97a7
	ld [hl], a
	ld hl, $c0ae
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc b
	ld hl, $c0a6
	add hl, bc
	sub [hl]
	jr c, .asm_97c3
	ld d, a
	ld b, $0
	ld hl, $c02e
	add hl, bc
	set 5, [hl]
	jr .asm_97e6
.asm_97c3
	ld hl, $c096
	add hl, bc
	ld d, [hl]
	ld hl, $c09e
	add hl, bc
	ld e, [hl]
	ld hl, $c0ae
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, $c0a6
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld b, $0
	ld hl, $c02e
	add hl, bc
	res 5, [hl]
.asm_97e6
	ld hl, $c076
	add hl, bc
.asm_97ea
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_97ea
	ld a, d
	and a
	jr z, .asm_97f8
	dec a
	ld d, a
	jr .asm_97ea
.asm_97f8
	ld a, e
	add [hl]
	ld d, b
	ld b, $0
	ld hl, $c07e
	add hl, bc
	ld [hl], d
	ld hl, $c086
	add hl, bc
	ld [hl], a
	ld hl, $c08e
	add hl, bc
	ld [hl], a
	ret

Music2_ApplyDutyCycle: ; 0x980d
	ld b, $0
	ld hl, $c046
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and $c0
	ld d, a
	ld b, $1
	call Func_9838
	ld a, [hl]
	and $3f
	or d
	ld [hl], a
	ret

Music2_GetNextMusicByte: ; 0x9825
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
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

Func_9838: ; 0x9838
	ld a, c
	ld hl, Unknown_9b17
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

Func_9847: ; 0x9847
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

Func_9858: ; 0x9858
	ld h, $0
	ld l, a
	add hl, hl
	ld d, h
	ld e, l
	ld hl, Unknown_9b2f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, b
.loop
	cp $7
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

Func_9876: ; 0x9876
	ld [$c001], a
	cp $ff
	jp z, Func_9a34
	cp $b9
	jp z, Func_994e
	jp c, Func_994e
	cp $fe
	jr z, .asm_988d
	jp nc, Func_994e
.asm_988d
	xor a
	ld [$c000], a
	ld [$c003], a
	ld [$c0e9], a
	ld [$c0e6], a
	ld [$c0e7], a
	ld d, $8
	ld hl, $c016
	call FillMusicRAM2
	ld hl, $c006
	call FillMusicRAM2
	ld d, $4
	ld hl, $c026
	call FillMusicRAM2
	ld hl, $c02e
	call FillMusicRAM2
	ld hl, $c03e
	call FillMusicRAM2
	ld hl, $c046
	call FillMusicRAM2
	ld hl, $c04e
	call FillMusicRAM2
	ld hl, $c056
	call FillMusicRAM2
	ld hl, $c05e
	call FillMusicRAM2
	ld hl, $c066
	call FillMusicRAM2
	ld hl, $c06e
	call FillMusicRAM2
	ld hl, $c036
	call FillMusicRAM2
	ld hl, $c076
	call FillMusicRAM2
	ld hl, $c07e
	call FillMusicRAM2
	ld hl, $c086
	call FillMusicRAM2
	ld hl, $c08e
	call FillMusicRAM2
	ld hl, $c096
	call FillMusicRAM2
	ld hl, $c09e
	call FillMusicRAM2
	ld hl, $c0a6
	call FillMusicRAM2
	ld hl, $c0ae
	call FillMusicRAM2
	ld a, $1
	ld hl, $c0be
	call FillMusicRAM2
	ld hl, $c0b6
	call FillMusicRAM2
	ld hl, $c0c6
	call FillMusicRAM2
	ld [$c0e8], a
	ld a, $ff
	ld [$c004], a
	xor a
	ld [$ff00+$24], a
	ld a, $8
	ld [$ff00+$10], a
	ld a, $0
	ld [$ff00+$25], a
	xor a
	ld [$ff00+$1a], a
	ld a, $80
	ld [$ff00+$1a], a
	ld a, $77
	ld [$ff00+$24], a
	jp Func_9a8f

Func_994e: ; 0x994e
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_02
	add hl, de
	ld a, h
	ld [$c0ec], a
	ld a, l
	ld [$c0ed], a
	ld a, [hl]
	and $c0
	rlca
	rlca
	ld c, a
.asm_9967
	ld d, c
	ld a, c
	add a
	add c
	ld c, a
	ld b, $0
	ld a, [$c0ec]
	ld h, a
	ld a, [$c0ed]
	ld l, a
	add hl, bc
	ld c, d
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, $c026
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_99a3
	ld a, e
	cp $7
	jr nz, .asm_999a
	ld a, [$c001]
	cp $14
	jr nc, .asm_9993
	ret
.asm_9993
	ld a, [hl]
	cp $14
	jr z, .asm_99a3
	jr c, .asm_99a3
.asm_999a
	ld a, [$c001]
	cp [hl]
	jr z, .asm_99a3
	jr c, .asm_99a3
	ret
.asm_99a3
	xor a
	push de
	ld h, d
	ld l, e
	add hl, hl
	ld d, h
	ld e, l
	ld hl, $c016
	add hl, de
	ld [hli], a
	ld [hl], a
	ld hl, $c006
	add hl, de
	ld [hli], a
	ld [hl], a
	pop de
	ld hl, $c026
	add hl, de
	ld [hl], a
	ld hl, $c02e
	add hl, de
	ld [hl], a
	ld hl, $c03e
	add hl, de
	ld [hl], a
	ld hl, $c046
	add hl, de
	ld [hl], a
	ld hl, $c04e
	add hl, de
	ld [hl], a
	ld hl, $c056
	add hl, de
	ld [hl], a
	ld hl, $c05e
	add hl, de
	ld [hl], a
	ld hl, $c066
	add hl, de
	ld [hl], a
	ld hl, $c06e
	add hl, de
	ld [hl], a
	ld hl, $c076
	add hl, de
	ld [hl], a
	ld hl, $c07e
	add hl, de
	ld [hl], a
	ld hl, $c086
	add hl, de
	ld [hl], a
	ld hl, $c08e
	add hl, de
	ld [hl], a
	ld hl, $c096
	add hl, de
	ld [hl], a
	ld hl, $c09e
	add hl, de
	ld [hl], a
	ld hl, $c0a6
	add hl, de
	ld [hl], a
	ld hl, $c0ae
	add hl, de
	ld [hl], a
	ld hl, $c036
	add hl, de
	ld [hl], a
	ld a, $1
	ld hl, $c0be
	add hl, de
	ld [hl], a
	ld hl, $c0b6
	add hl, de
	ld [hl], a
	ld hl, $c0c6
	add hl, de
	ld [hl], a
	ld a, e
	cp $4
	jr nz, .asm_9a2b
	ld a, $8
	ld [$ff00+$10], a
.asm_9a2b
	ld a, c
	and a
	jp z, Func_9a8f
	dec c
	jp .asm_9967

Func_9a34: ; 0x9a34
	ld a, $80
	ld [$ff00+$26], a
	ld [$ff00+$1a], a
	xor a
	ld [$ff00+$25], a
	ld [$ff00+$1c], a
	ld a, $8
	ld [$ff00+$10], a
	ld [$ff00+$12], a
	ld [$ff00+$17], a
	ld [$ff00+$21], a
	ld a, $40
	ld [$ff00+$14], a
	ld [$ff00+$19], a
	ld [$ff00+$23], a
	ld a, $77
	ld [$ff00+$24], a
	xor a
	ld [$c000], a
	ld [$c003], a
	ld [$c002], a
	ld [$c0e9], a
	ld [$c0eb], a
	ld [$c0e6], a
	ld [$c0e7], a
	ld d, $a0
	ld hl, $c006
	call FillMusicRAM2
	ld a, $1
	ld d, $18
	ld hl, $c0b6
	call FillMusicRAM2
	ld [$c0e8], a
	ld [$c0ea], a
	ld a, $ff
	ld [$c004], a
	ret

; fills d bytes at hl with a
FillMusicRAM2: ; 0x9a89
	ld b, d
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

Func_9a8f: ; 0x9a8f
	ld a, [$c001]
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_02
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c006
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
.asm_9ab1
	cp c
	jr z, .asm_9ab9
	inc c
	inc hl
	inc hl
	jr .asm_9ab1
.asm_9ab9
	push hl
	push bc
	push af
	ld b, $0
	ld c, a
	ld hl, $c026
	add hl, bc
	ld a, [$c001]
	ld [hl], a
	pop af
	cp $3
	jr c, .asm_9ad2
	ld hl, $c02e
	add hl, bc
	set 2, [hl]
.asm_9ad2
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
	jr nz, .asm_9ab1
	ld a, [$c001]
	cp $14
	jr nc, .asm_9aeb
	jr .asm_9b15
.asm_9aeb
	ld a, [$c001]
	cp $86
	jr z, .asm_9b15
	jr c, .asm_9af6
	jr .asm_9b15
.asm_9af6
	ld hl, $c02a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $c012 ; sfx noise channel pointer
	ld de, Noise2_endchannel
	ld [hl], e
	inc hl
	ld [hl], d ; overwrite pointer to point to endchannel
	ld a, [$c005]
	and a
	jr nz, .asm_9b15
	ld a, [$ff00+$24]
	ld [$c005], a
	ld a, $77
	ld [$ff00+$24], a
.asm_9b15
	ret

Noise2_endchannel: ; 0x9b16
	endchannel

Unknown_9b17: ; 0x9b17
	db $10, $15, $1A, $1F ; channels 0-3
	db $10, $15, $1A, $1F ; channels 4-7

Unknown_9b1f: ; 0x9b1f
	db $EE, $DD, $BB, $77 ; channels 0-3
	db $EE, $DD, $BB, $77 ; channels 4-7

Unknown_9b27: ; 0x9b27
	db $11, $22, $44, $88 ; channels 0-3
	db $11, $22, $44, $88 ; channels 4-7

Unknown_9b2f: ; 0x9b2f
	dw $F82C
	dw $F89D
	dw $F907
	dw $F96B
	dw $F9CA
	dw $FA23
	dw $FA77
	dw $FAC7
	dw $FB12
	dw $FB58
	dw $FB9B
	dw $FBDA


