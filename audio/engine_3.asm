; The third of three duplicated sound engines.

Audio3_UpdateMusic:: ; 7d177 (1f:5177)
	ld c, CH0
.loop
	ld b, $0
	ld hl, wc026
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextChannel
	ld a, c
	cp CH4
	jr nc, .applyAffects ; if sfx channel
	ld a, [wc002]
	and a
	jr z, .applyAffects
	bit 7, a
	jr nz, .nextChannel
	set 7, a
	ld [wc002], a
	xor a
	ld [$ff25], a
	ld [$ff1a], a
	ld a, $80
	ld [$ff1a], a
	jr .nextChannel
.applyAffects
	call Audio3_ApplyMusicAffects
.nextChannel
	ld a, c
	inc c ; inc channel number
	cp CH7
	jr nz, .loop
	ret

; this routine checks flags for music effects currently applied
; to the channel and calls certain functions based on flags.
; known flags for wc02e:
;	0: toggleperfectpitch has been used
;	1: call has been used
;	3: a toggle used only by this routine for vibrato
;	4: pitchbend flag
;	6: dutycycle flag
Audio3_ApplyMusicAffects: ; 7d1ac (1f:51ac)
	ld b, $0
	ld hl, wc0b6 ; delay until next note
	add hl, bc
	ld a, [hl]
	cp $1 ; if delay is 1, play next note
	jp z, Audio3_PlayNextNote
	dec a ; otherwise, decrease the delay timer
	ld [hl], a
	ld a, c
	cp CH4
	jr nc, .startChecks ; if a sfx channel
	ld hl, wc02a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .startChecks
	ret
.startChecks
	ld hl, wc02e
	add hl, bc
	bit 6, [hl] ; dutycycle
	jr z, .checkForExecuteMusic
	call Audio3_ApplyDutyCycle
.checkForExecuteMusic
	ld b, $0
	ld hl, wc036
	add hl, bc
	bit 0, [hl]
	jr nz, .checkForPitchBend
	ld hl, wc02e
	add hl, bc
	bit 2, [hl]
	jr nz, .disablePitchBendVibrato
.checkForPitchBend
	ld hl, wc02e
	add hl, bc
	bit 4, [hl] ; pitchbend
	jr z, .checkVibratoDelay
	jp Audio3_ApplyPitchBend
.checkVibratoDelay
	ld hl, wc04e ; vibrato delay
	add hl, bc
	ld a, [hl]
	and a ; check if delay is over
	jr z, .checkForVibrato
	dec [hl] ; otherwise, dec delay
.disablePitchBendVibrato
	ret
.checkForVibrato
	ld hl, wc056 ; vibrato rate
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .vibrato
	ret ; no vibrato
.vibrato
	ld d, a
	ld hl, wc05e
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
	ld hl, wc066
	add hl, bc
	ld e, [hl] ; get note pitch
	ld hl, wc02e
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
	call Audio3_7d8ac
	ld [hl], d
	ret

; this routine executes all music commands that take up no time,
; like tempo changes, duty changes etc. and doesn't return
; until the first note is reached
Audio3_PlayNextNote: ; 7d244 (1f:5244)
	ld hl, wc06e
	add hl, bc
	ld a, [hl]
	ld hl, wc04e
	add hl, bc
	ld [hl], a
	ld hl, wc02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	call Audio3_endchannel
	ret

Audio3_endchannel: ; 7d25a (1f:525a)
	call Audio3_GetNextMusicByte
	ld d, a
	cp $ff ; is this command an endchannel?
	jp nz, Audio3_callchannel ; no
	ld b, $0 ; yes
	ld hl, wc02e
	add hl, bc
	bit 1, [hl]
	jr nz, .returnFromCall
	ld a, c
	cp CH3
	jr nc, .noiseOrSfxChannel
	jr .asm_7d2b3
.noiseOrSfxChannel
	res 2, [hl]
	ld hl, wc036
	add hl, bc
	res 0, [hl]
	cp CH6
	jr nz, .notSfxChannel3
	ld a, $0
	ld [$ff1a], a
	ld a, $80
	ld [$ff1a], a
.notSfxChannel3
	jr nz, .asm_7d296
	ld a, [wc003]
	and a
	jr z, .asm_7d296
	xor a
	ld [wc003], a
	jr .asm_7d2b3
.asm_7d296
	jr .asm_7d2bc
.returnFromCall
	res 1, [hl]
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wc006
	add hl, de
	push hl ; store current channel address
	ld hl, wc016
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a ; loads channel address to return to
	jp Audio3_endchannel
.asm_7d2b3
	ld hl, Unknown_7db93
	add hl, bc
	ld a, [$ff25]
	and [hl]
	ld [$ff25], a
.asm_7d2bc
	ld a, [wc02a]
	cp $14
	jr nc, .asm_7d2c5
	jr .asm_7d2e2
.asm_7d2c5
	ld a, [wc02a]
	cp $86
	jr z, .asm_7d2e2
	jr c, .asm_7d2d0
	jr .asm_7d2e2
.asm_7d2d0
	ld a, c
	cp CH4
	jr z, .asm_7d2d9
	call Audio3_7d73b
	ret c
.asm_7d2d9
	ld a, [wc005]
	ld [$ff24], a
	xor a
	ld [wc005], a
.asm_7d2e2
	ld hl, wc026
	add hl, bc
	ld [hl], b
	ret

Audio3_callchannel: ; 7d2e8 (1f:52e8)
	cp $fd ; is this command a callchannel?
	jp nz, Audio3_loopchannel ; no
	call Audio3_GetNextMusicByte ; yes
	push af
	call Audio3_GetNextMusicByte
	ld d, a
	pop af
	ld e, a
	push de ; store pointer
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wc006
	add hl, de
	push hl
	ld hl, wc016
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
	ld hl, wc02e
	add hl, bc
	set 1, [hl] ; set the call flag
	jp Audio3_endchannel

Audio3_loopchannel: ; 7d31d (1f:531d)
	cp $fe ; is this command a loopchannel?
	jp nz, Audio3_notetype ; no
	call Audio3_GetNextMusicByte ; yes
	ld e, a
	and a
	jr z, .infiniteLoop
	ld b, $0
	ld hl, wc0be
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .loopAgain
	ld a, $1 ; if no more loops to make
	ld [hl], a
	call Audio3_GetNextMusicByte ; skip pointer
	call Audio3_GetNextMusicByte
	jp Audio3_endchannel
.loopAgain ; inc loop count
	inc a
	ld [hl], a
	; fall through
.infiniteLoop ; overwrite current address with pointer
	call Audio3_GetNextMusicByte
	push af
	call Audio3_GetNextMusicByte
	ld b, a
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wc006
	add hl, de
	pop af
	ld [hli], a
	ld [hl], b
	jp Audio3_endchannel

Audio3_notetype: ; 7d358 (1f:5358)
	and $f0
	cp $d0 ; is this command a notetype?
	jp nz, Audio3_toggleperfectpitch ; no
	ld a, d ; yes
	and $f
	ld b, $0
	ld hl, wc0c6
	add hl, bc
	ld [hl], a ; store low nibble as speed
	ld a, c
	cp CH3
	jr z, .noiseChannel ; noise channel has 0 params
	call Audio3_GetNextMusicByte
	ld d, a
	ld a, c
	cp CH2
	jr z, .musicChannel3
	cp CH6
	jr nz, .notChannel3
	ld hl, wc0e7
	jr .sfxChannel3
.musicChannel3
	ld hl, wc0e6
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
	ld hl, wc0de
	add hl, bc
	ld [hl], d
.noiseChannel
	jp Audio3_endchannel

Audio3_toggleperfectpitch: ; 7d397 (1f:5397)
	ld a, d
	cp $e8 ; is this command a toggleperfectpitch?
	jr nz, Audio3_vibrato ; no
	ld b, $0 ; yes
	ld hl, wc02e
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a ; flip bit 0 of wc02e
	jp Audio3_endchannel

Audio3_vibrato: ; 7d3a9 (1f:53a9)
	cp $ea ; is this command a vibrato?
	jr nz, Audio3_pitchbend ; no
	call Audio3_GetNextMusicByte ; yes
	ld b, $0
	ld hl, wc04e
	add hl, bc
	ld [hl], a ; store delay
	ld hl, wc06e
	add hl, bc
	ld [hl], a ; store delay
	call Audio3_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, $0
	ld hl, wc056
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
	ld hl, wc05e
	add hl, bc
	swap a
	or d
	ld [hl], a ; store depth as both high and low nibbles
	jp Audio3_endchannel

Audio3_pitchbend: ; 7d3e1 (1f:53e1)
	cp $eb ; is this command a pitchbend?
	jr nz, Audio3_duty ; no
	call Audio3_GetNextMusicByte ; yes
	ld b, $0
	ld hl, wc076
	add hl, bc
	ld [hl], a ; store first param
	call Audio3_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, d
	and $f
	call Audio3_7d8cc
	ld b, $0
	ld hl, wc0a6
	add hl, bc
	ld [hl], d ; store unknown part of second param
	ld hl, wc0ae
	add hl, bc
	ld [hl], e ; store unknown part of second param
	ld b, $0
	ld hl, wc02e
	add hl, bc
	set 4, [hl] ; set pitchbend flag
	call Audio3_GetNextMusicByte
	ld d, a
	jp Audio3_notelength

Audio3_duty: ; 7d419 (1f:5419)
	cp $ec ; is this command a duty?
	jr nz, Audio3_tempo ; no
	call Audio3_GetNextMusicByte ; yes
	rrca
	rrca
	and $c0
	ld b, $0
	ld hl, wc03e
	add hl, bc
	ld [hl], a ; store duty
	jp Audio3_endchannel

Audio3_tempo: ; 7d42e (1f:542e)
	cp $ed ; is this command a tempo?
	jr nz, Audio3_stereopanning ; no
	ld a, c ; yes
	cp CH4
	jr nc, .sfxChannel
	call Audio3_GetNextMusicByte
	ld [wc0e8], a ; store first param
	call Audio3_GetNextMusicByte
	ld [wc0e9], a ; store second param
	xor a
	ld [wc0ce], a ; clear RAM
	ld [wc0cf], a
	ld [wc0d0], a
	ld [wc0d1], a
	jr .musicChannelDone
.sfxChannel
	call Audio3_GetNextMusicByte
	ld [wc0ea], a ; store first param
	call Audio3_GetNextMusicByte
	ld [wc0eb], a ; store second param
	xor a
	ld [wc0d2], a ; clear RAM
	ld [wc0d3], a
	ld [wc0d4], a
	ld [wc0d5], a
.musicChannelDone
	jp Audio3_endchannel

Audio3_stereopanning: ; 7d46e (1f:546e)
	cp $ee ; is this command a stereopanning?
	jr nz, Audio3_unknownmusic0xef ; no
	call Audio3_GetNextMusicByte ; yes
	ld [wc004], a ; store panning
	jp Audio3_endchannel

; this appears to never be used
Audio3_unknownmusic0xef: ; 7d47b (1f:547b)
	cp $ef ; is this command an unknownmusic0xef?
	jr nz, Audio3_dutycycle ; no
	call Audio3_GetNextMusicByte ; yes
	push bc
	call Audio3_7d8ea
	pop bc
	ld a, [wc003]
	and a
	jr nz, .skip
	ld a, [wc02d]
	ld [wc003], a
	xor a
	ld [wc02d], a
.skip
	jp Audio3_endchannel

Audio3_dutycycle: ; 7d49a (1f:549a)
	cp $fc ; is this command a dutycycle?
	jr nz, Audio3_volume ; no
	call Audio3_GetNextMusicByte ; yes
	ld b, $0
	ld hl, wc046
	add hl, bc
	ld [hl], a ; store full cycle
	and $c0
	ld hl, wc03e
	add hl, bc
	ld [hl], a ; store first duty
	ld hl, wc02e
	add hl, bc
	set 6, [hl] ; set duty flag
	jp Audio3_endchannel

Audio3_volume: ; 7d4b8 (1f:54b8)
	cp $f0 ; is this command a volume?
	jr nz, Audio3_executemusic ; no
	call Audio3_GetNextMusicByte ; yes
	ld [$ff24], a ; store volume
	jp Audio3_endchannel

Audio3_executemusic: ; 7d4c4 (1f:54c4)
	cp $f8 ; is this command an executemusic?
	jr nz, Audio3_octave ; no
	ld b, $0 ; yes
	ld hl, wc036
	add hl, bc
	set 0, [hl]
	jp Audio3_endchannel

Audio3_octave: ; 7d4d3 (1f:54d3)
	and $f0
	cp $e0 ; is this command an octave?
	jr nz, Audio3_unknownsfx0x20 ; no
	ld hl, wc0d6 ; yes
	ld b, $0
	add hl, bc
	ld a, d
	and $f
	ld [hl], a ; store low nibble as octave
	jp Audio3_endchannel

Audio3_unknownsfx0x20: ; 7d4e6 (1f:54e6)
	cp $20 ; is this command an unknownsfx0x20?
	jr nz, Audio3_unknownsfx0x10 ; no
	ld a, c
	cp CH3 ; is this a noise or sfx channel?
	jr c, Audio3_unknownsfx0x10 ; no
	ld b, $0
	ld hl, wc036
	add hl, bc
	bit 0, [hl]
	jr nz, Audio3_unknownsfx0x10 ; no
	call Audio3_notelength ; yes
	ld d, a
	ld b, $0
	ld hl, wc03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
	ld b, $1
	call Audio3_7d8ac
	ld [hl], d
	call Audio3_GetNextMusicByte
	ld d, a
	ld b, $2
	call Audio3_7d8ac
	ld [hl], d
	call Audio3_GetNextMusicByte
	ld e, a
	ld a, c
	cp CH7
	ld a, $0
	jr z, .sfxNoiseChannel ; only two params for noise channel
	push de
	call Audio3_GetNextMusicByte
	pop de
.sfxNoiseChannel
	ld d, a
	push de
	call Audio3_7d69d
	call Audio3_7d66c
	pop de
	call Audio3_7d6bf
	ret

Audio3_unknownsfx0x10: ; 7d533 (1f:5533)
	ld a, c
	cp CH4
	jr c, Audio3_note ; if not a sfx
	ld a, d
	cp $10 ; is this command an unknownsfx0x10?
	jr nz, Audio3_note ; no
	ld b, $0
	ld hl, wc036
	add hl, bc
	bit 0, [hl]
	jr nz, Audio3_note ; no
	call Audio3_GetNextMusicByte ; yes
	ld [$ff10], a
	jp Audio3_endchannel

Audio3_note: ; 7d54f (1f:554f)
	ld a, c
	cp CH3
	jr nz, Audio3_notelength ; if not noise channel
	ld a, d
	and $f0
	cp $b0 ; is this command a dnote?
	jr z, Audio3_dnote ; yes
	jr nc, Audio3_notelength ; no
	swap a
	ld b, a
	ld a, d
	and $f
	ld d, a
	ld a, b
	push de
	push bc
	jr asm_7d571

Audio3_dnote: ; 7d569 (1f:5569)
	ld a, d
	and $f
	push af
	push bc
	call Audio3_GetNextMusicByte ; get dnote instrument
asm_7d571
	ld d, a
	ld a, [wc003]
	and a
	jr nz, .asm_7d57c
	ld a, d
	call Audio3_7d8ea
.asm_7d57c
	pop bc
	pop de

Audio3_notelength: ; 7d57e (1f:557e)
	ld a, d
	push af
	and $f
	inc a
	ld b, $0
	ld e, a  ; store note length (in 16ths)
	ld d, b
	ld hl, wc0c6
	add hl, bc
	ld a, [hl]
	ld l, b
	call Audio3_7d8bb
	ld a, c
	cp CH4
	jr nc, .sfxChannel
	ld a, [wc0e8]
	ld d, a
	ld a, [wc0e9]
	ld e, a
	jr .skip
.sfxChannel
	ld d, $1
	ld e, $0
	cp CH7
	jr z, .skip ; if noise channel
	call Audio3_7d707
	ld a, [wc0ea]
	ld d, a
	ld a, [wc0eb]
	ld e, a
.skip
	ld a, l
	ld b, $0
	ld hl, wc0ce
	add hl, bc
	ld l, [hl]
	call Audio3_7d8bb
	ld e, l
	ld d, h
	ld hl, wc0ce
	add hl, bc
	ld [hl], e
	ld a, d
	ld hl, wc0b6
	add hl, bc
	ld [hl], a
	ld hl, wc036
	add hl, bc
	bit 0, [hl]
	jr nz, Audio3_notepitch
	ld hl, wc02e
	add hl, bc
	bit 2, [hl]
	jr z, Audio3_notepitch
	pop hl
	ret

Audio3_notepitch: ; 7d5dc (1f:55dc)
	pop af
	and $f0
	cp $c0 ; compare to rest
	jr nz, .notRest
	ld a, c
	cp CH4
	jr nc, .sfxChannel
	ld hl, wc02a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .quit
	; fall through
.sfxChannel
	ld a, c
	cp CH2
	jr z, .musicChannel3
	cp CH6
	jr nz, .notSfxChannel3
.musicChannel3
	ld b, $0
	ld hl, Unknown_7db93
	add hl, bc
	ld a, [$ff25]
	and [hl]
	ld [$ff25], a
	jr .quit
.notSfxChannel3
	ld b, $2
	call Audio3_7d8ac
	ld a, $8
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.quit
	ret
.notRest
	swap a
	ld b, $0
	ld hl, wc0d6
	add hl, bc
	ld b, [hl]
	call Audio3_7d8cc
	ld b, $0
	ld hl, wc02e
	add hl, bc
	bit 4, [hl]
	jr z, .asm_7d62c
	call Audio3_7d803
.asm_7d62c
	push de
	ld a, c
	cp CH4
	jr nc, .skip ; if sfx Channel
	ld hl, wc02a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	and a
	jr nz, .done
	jr .skip
.done
	pop de
	ret
.skip
	ld b, $0
	ld hl, wc0de
	add hl, bc
	ld d, [hl]
	ld b, $2
	call Audio3_7d8ac
	ld [hl], d
	call Audio3_7d69d
	call Audio3_7d66c
	pop de
	ld b, $0
	ld hl, wc02e
	add hl, bc
	bit 0, [hl]   ; has toggleperfectpitch been used?
	jr z, .skip2
	inc e         ; if yes, increment the pitch by 1
	jr nc, .skip2
	inc d
.skip2
	ld hl, wc066
	add hl, bc
	ld [hl], e
	call Audio3_7d6bf
	ret

Audio3_7d66c: ; 7d66c (1f:566c)
	ld b, $0
	ld hl, Unknown_7db9b
	add hl, bc
	ld a, [$ff25]
	or [hl]
	ld d, a
	ld a, c
	cp CH7
	jr z, .sfxNoiseChannel
	cp CH4
	jr nc, .skip ; if sfx channel
	ld hl, wc02a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .skip
.sfxNoiseChannel
	ld a, [wc004]
	ld hl, Unknown_7db9b
	add hl, bc
	and [hl]
	ld d, a
	ld a, [$ff25]
	ld hl, Unknown_7db93
	add hl, bc
	and [hl]
	or d
	ld d, a
.skip
	ld a, d
	ld [$ff25], a
	ret

Audio3_7d69d: ; 7d69d (1f:569d)
	ld b, $0
	ld hl, wc0b6
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
	ld hl, wc03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
.channel3
	ld b, $1
	call Audio3_7d8ac
	ld [hl], d
	ret

Audio3_7d6bf: ; 7d6bf (1f:56bf)
	ld a, c
	cp CH2
	jr z, .channel3
	cp CH6
	jr nz, .notSfxChannel3
	; fall through
.channel3
	push de
	ld de, wc0e6
	cp CH2
	jr z, .musicChannel3
	ld de, wc0e7
.musicChannel3
	ld a, [de]
	add a
	ld d, $0
	ld e, a
	ld hl, Audio3_WavePointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ff30
	ld b, $f
	ld a, $0
	ld [$ff1a], a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, b
	dec b
	and a
	jr nz, .loop
	ld a, $80
	ld [$ff1a], a
	pop de
.notSfxChannel3
	ld a, d
	or $80
	and $c7
	ld d, a
	ld b, $3
	call Audio3_7d8ac
	ld [hl], e
	inc hl
	ld [hl], d
	call Audio3_7d729
	ret

Audio3_7d707: ; 7d707 (1f:5707)
	call Audio3_7d759
	jr nc, .asm_7d71f
	ld d, $0
	ld a, [wc0f2]
	add $80
	jr nc, .asm_7d716
	inc d
.asm_7d716
	ld [wc0eb], a
	ld a, d
	ld [wc0ea], a
	jr .asm_7d728
.asm_7d71f
	xor a
	ld [wc0eb], a
	ld a, $1
	ld [wc0ea], a
.asm_7d728
	ret

Audio3_7d729: ; 7d729 (1f:5729)
	call Audio3_7d759
	jr nc, .asm_7d73a
	ld a, [wc0f1]
	add e
	jr nc, .asm_7d735
	inc d
.asm_7d735
	dec hl
	ld e, a
	ld [hl], e
	inc hl
	ld [hl], d
.asm_7d73a
	ret

Audio3_7d73b: ; 7d73b (1f:573b)
	call Audio3_7d759
	jr nc, .asm_7d756
	ld hl, wc006
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
.asm_7d756
	scf
	ccf
	ret

Audio3_7d759: ; 7d759 (1f:5759)
	ld a, [wc02a]
	cp $14
	jr nc, .asm_7d762
	jr .asm_7d768
.asm_7d762
	cp $86
	jr z, .asm_7d768
	jr c, .asm_7d76b
.asm_7d768
	scf
	ccf
	ret
.asm_7d76b
	scf
	ret

Audio3_ApplyPitchBend: ; 7d76d (1f:576d)
	ld hl, wc02e
	add hl, bc
	bit 5, [hl]
	jp nz, .asm_7d7b4
	ld hl, wc09e
	add hl, bc
	ld e, [hl]
	ld hl, wc096
	add hl, bc
	ld d, [hl]
	ld hl, wc07e
	add hl, bc
	ld l, [hl]
	ld h, b
	add hl, de
	ld d, h
	ld e, l
	ld hl, wc08e
	add hl, bc
	push hl
	ld hl, wc086
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
	ld hl, wc0a6
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .asm_7d7fa
	jr nz, .asm_7d7e7
	ld hl, wc0ae
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_7d7fa
	jr .asm_7d7e7
.asm_7d7b4
	ld hl, wc09e
	add hl, bc
	ld a, [hl]
	ld hl, wc096
	add hl, bc
	ld d, [hl]
	ld hl, wc07e
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, wc086
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
	ld hl, wc0a6
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .asm_7d7fa
	jr nz, .asm_7d7e7
	ld hl, wc0ae
	add hl, bc
	ld a, e
	cp [hl]
	jr c, .asm_7d7fa
.asm_7d7e7
	ld hl, wc09e
	add hl, bc
	ld [hl], e
	ld hl, wc096
	add hl, bc
	ld [hl], d
	ld b, $3
	call Audio3_7d8ac
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
.asm_7d7fa
	ld hl, wc02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	ret

Audio3_7d803: ; 7d803 (1f:5803)
	ld hl, wc096
	add hl, bc
	ld [hl], d
	ld hl, wc09e
	add hl, bc
	ld [hl], e
	ld hl, wc0b6
	add hl, bc
	ld a, [hl]
	ld hl, wc076
	add hl, bc
	sub [hl]
	jr nc, .asm_7d81b
	ld a, $1
.asm_7d81b
	ld [hl], a
	ld hl, wc0ae
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc b
	ld hl, wc0a6
	add hl, bc
	sub [hl]
	jr c, .asm_7d837
	ld d, a
	ld b, $0
	ld hl, wc02e
	add hl, bc
	set 5, [hl]
	jr .asm_7d85a
.asm_7d837
	ld hl, wc096
	add hl, bc
	ld d, [hl]
	ld hl, wc09e
	add hl, bc
	ld e, [hl]
	ld hl, wc0ae
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, wc0a6
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld b, $0
	ld hl, wc02e
	add hl, bc
	res 5, [hl]
.asm_7d85a
	ld hl, wc076
	add hl, bc
.asm_7d85e
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_7d85e
	ld a, d
	and a
	jr z, .asm_7d86c
	dec a
	ld d, a
	jr .asm_7d85e
.asm_7d86c
	ld a, e
	add [hl]
	ld d, b
	ld b, $0
	ld hl, wc07e
	add hl, bc
	ld [hl], d
	ld hl, wc086
	add hl, bc
	ld [hl], a
	ld hl, wc08e
	add hl, bc
	ld [hl], a
	ret

Audio3_ApplyDutyCycle: ; 7d881 (1f:5881)
	ld b, $0
	ld hl, wc046
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and $c0
	ld d, a
	ld b, $1
	call Audio3_7d8ac
	ld a, [hl]
	and $3f
	or d
	ld [hl], a
	ret

Audio3_GetNextMusicByte: ; 7d899 (1f:5899)
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wc006
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

Audio3_7d8ac: ; 7d8ac (1f:58ac)
	ld a, c
	ld hl, Unknown_7db8b
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

Audio3_7d8bb: ; 7d8bb (1f:58bb)
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

Audio3_7d8cc: ; 7d8cc (1f:58cc)
	ld h, $0
	ld l, a
	add hl, hl
	ld d, h
	ld e, l
	ld hl, Audio3_Pitches
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

Audio3_7d8ea:: ; 7d8ea (1f:58ea)
	ld [wc001], a
	cp $ff
	jp z, Audio3_7daa8
	cp $c2
	jp z, Audio3_7d9c2
	jp c, Audio3_7d9c2
	cp $fe
	jr z, .asm_7d901
	jp nc, Audio3_7d9c2
.asm_7d901
	xor a
	ld [wc000], a
	ld [wc003], a
	ld [wc0e9], a
	ld [wc0e6], a
	ld [wc0e7], a
	ld d, $8
	ld hl, wc016
	call FillAudioRAM3
	ld hl, wc006
	call FillAudioRAM3
	ld d, $4
	ld hl, wc026
	call FillAudioRAM3
	ld hl, wc02e
	call FillAudioRAM3
	ld hl, wc03e
	call FillAudioRAM3
	ld hl, wc046
	call FillAudioRAM3
	ld hl, wc04e
	call FillAudioRAM3
	ld hl, wc056
	call FillAudioRAM3
	ld hl, wc05e
	call FillAudioRAM3
	ld hl, wc066
	call FillAudioRAM3
	ld hl, wc06e
	call FillAudioRAM3
	ld hl, wc036
	call FillAudioRAM3
	ld hl, wc076
	call FillAudioRAM3
	ld hl, wc07e
	call FillAudioRAM3
	ld hl, wc086
	call FillAudioRAM3
	ld hl, wc08e
	call FillAudioRAM3
	ld hl, wc096
	call FillAudioRAM3
	ld hl, wc09e
	call FillAudioRAM3
	ld hl, wc0a6
	call FillAudioRAM3
	ld hl, wc0ae
	call FillAudioRAM3
	ld a, $1
	ld hl, wc0be
	call FillAudioRAM3
	ld hl, wc0b6
	call FillAudioRAM3
	ld hl, wc0c6
	call FillAudioRAM3
	ld [wc0e8], a
	ld a, $ff
	ld [wc004], a
	xor a
	ld [$ff24], a
	ld a, $8
	ld [$ff10], a
	ld a, $0
	ld [$ff25], a
	xor a
	ld [$ff1a], a
	ld a, $80
	ld [$ff1a], a
	ld a, $77
	ld [$ff24], a
	jp Audio3_7db03

Audio3_7d9c2: ; 7d9c2 (1f:59c2)
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_3
	add hl, de
	ld a, h
	ld [wc0ec], a
	ld a, l
	ld [wc0ed], a
	ld a, [hl]
	and $c0
	rlca
	rlca
	ld c, a
.asm_7d9db
	ld d, c
	ld a, c
	add a
	add c
	ld c, a
	ld b, $0
	ld a, [wc0ec]
	ld h, a
	ld a, [wc0ed]
	ld l, a
	add hl, bc
	ld c, d
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, wc026
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_7da17
	ld a, e
	cp $7
	jr nz, .asm_7da0e
	ld a, [wc001]
	cp $14
	jr nc, .asm_7da07
	ret
.asm_7da07
	ld a, [hl]
	cp $14
	jr z, .asm_7da17
	jr c, .asm_7da17
.asm_7da0e
	ld a, [wc001]
	cp [hl]
	jr z, .asm_7da17
	jr c, .asm_7da17
	ret
.asm_7da17
	xor a
	push de
	ld h, d
	ld l, e
	add hl, hl
	ld d, h
	ld e, l
	ld hl, wc016
	add hl, de
	ld [hli], a
	ld [hl], a
	ld hl, wc006
	add hl, de
	ld [hli], a
	ld [hl], a
	pop de
	ld hl, wc026
	add hl, de
	ld [hl], a
	ld hl, wc02e
	add hl, de
	ld [hl], a
	ld hl, wc03e
	add hl, de
	ld [hl], a
	ld hl, wc046
	add hl, de
	ld [hl], a
	ld hl, wc04e
	add hl, de
	ld [hl], a
	ld hl, wc056
	add hl, de
	ld [hl], a
	ld hl, wc05e
	add hl, de
	ld [hl], a
	ld hl, wc066
	add hl, de
	ld [hl], a
	ld hl, wc06e
	add hl, de
	ld [hl], a
	ld hl, wc076
	add hl, de
	ld [hl], a
	ld hl, wc07e
	add hl, de
	ld [hl], a
	ld hl, wc086
	add hl, de
	ld [hl], a
	ld hl, wc08e
	add hl, de
	ld [hl], a
	ld hl, wc096
	add hl, de
	ld [hl], a
	ld hl, wc09e
	add hl, de
	ld [hl], a
	ld hl, wc0a6
	add hl, de
	ld [hl], a
	ld hl, wc0ae
	add hl, de
	ld [hl], a
	ld hl, wc036
	add hl, de
	ld [hl], a
	ld a, $1
	ld hl, wc0be
	add hl, de
	ld [hl], a
	ld hl, wc0b6
	add hl, de
	ld [hl], a
	ld hl, wc0c6
	add hl, de
	ld [hl], a
	ld a, e
	cp $4
	jr nz, .asm_7da9f
	ld a, $8
	ld [$ff10], a
.asm_7da9f
	ld a, c
	and a
	jp z, Audio3_7db03
	dec c
	jp .asm_7d9db

Audio3_7daa8: ; 7daa8 (1f:5aa8)
	ld a, $80
	ld [$ff26], a
	ld [$ff1a], a
	xor a
	ld [$ff25], a
	ld [$ff1c], a
	ld a, $8
	ld [$ff10], a
	ld [$ff12], a
	ld [$ff17], a
	ld [$ff21], a
	ld a, $40
	ld [$ff14], a
	ld [$ff19], a
	ld [$ff23], a
	ld a, $77
	ld [$ff24], a
	xor a
	ld [wc000], a
	ld [wc003], a
	ld [wc002], a
	ld [wc0e9], a
	ld [wc0eb], a
	ld [wc0e6], a
	ld [wc0e7], a
	ld d, $a0
	ld hl, wc006
	call FillAudioRAM3
	ld a, $1
	ld d, $18
	ld hl, wc0b6
	call FillAudioRAM3
	ld [wc0e8], a
	ld [wc0ea], a
	ld a, $ff
	ld [wc004], a
	ret

; fills d bytes at hl with a
FillAudioRAM3: ; 7dafd (1f:5afd)
	ld b, d
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

Audio3_7db03: ; 7db03 (1f:5b03)
	ld a, [wc001]
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_3
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc006
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
.asm_7db25
	cp c
	jr z, .asm_7db2d
	inc c
	inc hl
	inc hl
	jr .asm_7db25
.asm_7db2d
	push hl
	push bc
	push af
	ld b, $0
	ld c, a
	ld hl, wc026
	add hl, bc
	ld a, [wc001]
	ld [hl], a
	pop af
	cp $3
	jr c, .asm_7db46
	ld hl, wc02e
	add hl, bc
	set 2, [hl]
.asm_7db46
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
	jr nz, .asm_7db25
	ld a, [wc001]
	cp $14
	jr nc, .asm_7db5f
	jr .asm_7db89
.asm_7db5f
	ld a, [wc001]
	cp $86
	jr z, .asm_7db89
	jr c, .asm_7db6a
	jr .asm_7db89
.asm_7db6a
	ld hl, wc02a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wc012 ; sfx noise channel pointer
	ld de, Noise3_endchannel
	ld [hl], e
	inc hl
	ld [hl], d ; overwrite pointer to point to endchannel
	ld a, [wc005]
	and a
	jr nz, .asm_7db89
	ld a, [$ff24]
	ld [wc005], a
	ld a, $77
	ld [$ff24], a
.asm_7db89
	ret

Noise3_endchannel: ; 7db8a (1f:5b8a)
	endchannel

Unknown_7db8b: ; 7db8b (1f:5b8b)
	db $10, $15, $1A, $1F ; channels 0-3
	db $10, $15, $1A, $1F ; channels 4-7

Unknown_7db93: ; 7db93 (1f:5b93)
	db $EE, $DD, $BB, $77 ; channels 0-3
	db $EE, $DD, $BB, $77 ; channels 4-7

Unknown_7db9b: ; 7db9b (1f:5b9b)
	db $11, $22, $44, $88 ; channels 0-3
	db $11, $22, $44, $88 ; channels 4-7

Audio3_Pitches: ; 7dba3 (1f:5ba3)
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


