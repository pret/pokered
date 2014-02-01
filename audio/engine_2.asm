; The second of three duplicated sound engines.

Func_21879:: ; 21879 (8:5879)
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
	jr nc, .applyAffects ; if sfx channel
	ld a, [$c002]
	and a
	jr z, .applyAffects
	bit 7, a
	jr nz, .nextChannel
	set 7, a
	ld [$c002], a
	xor a
	ld [$FF00+$25], a
	ld [$FF00+$1a], a
	ld a, $80
	ld [$FF00+$1a], a
	jr .nextChannel
.applyAffects
	call Music8_ApplyMusicAffects
.nextChannel
	ld a, c
	inc c
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
Music8_ApplyMusicAffects: ; 218ae (8:58ae)
	ld b, $0
	ld hl, $c0b6 ; delay unitl next note
	add hl, bc
	ld a, [hl]
	cp $1 ; if the delay is 1, play next note
	jp z, Music8_PlayNextNote
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
	call Music8_ApplyDutyCycle
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
	jp Music8_ApplyPitchBend
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
	call Func_21ff7
	ld [hl], d
	ret

; this routine executes all music commands that take up no time,
; like tempo changes, duty changes etc. and doesn't return
; until the first note is reached
Music8_PlayNextNote: ; 21946 (8:5946)
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
	ld a, c
	cp CH4
	jr nz, .beginChecks
	ld a, [$d083]
	bit 7, a
	ret nz
.beginChecks
	call Music8_endchannel
	ret

Music8_endchannel: ; 21967 (8:5967)
	call Music8_GetNextMusicByte
	ld d, a
	cp $ff ; is this command an endchannel?
	jp nz, Music8_callchannel ; no
	ld b, $0 ; yes
	ld hl, $c02e
	add hl, bc
	bit 1, [hl]
	jr nz, .returnFromCall
	ld a, c
	cp CH3
	jr nc, .noiseOrSfxChannel
	jr .asm_219c0
.noiseOrSfxChannel
	res 2, [hl]
	ld hl, $c036
	add hl, bc
	res 0, [hl]
	cp CH6
	jr nz, .notSfxChannel3
	ld a, $0
	ld [$FF00+$1a], a
	ld a, $80
	ld [$FF00+$1a], a
.notSfxChannel3
	jr nz, .asm_219a3
	ld a, [$c003]
	and a
	jr z, .asm_219a3
	xor a
	ld [$c003], a
	jr .asm_219c0
.asm_219a3
	jr .asm_219c9
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
	jp Music8_endchannel
.asm_219c0
	ld hl, Unknown_222de
	add hl, bc
	ld a, [$FF00+$25]
	and [hl]
	ld [$FF00+$25], a
.asm_219c9
	ld a, [$c02a]
	cp $14
	jr nc, .asm_219d2
	jr .asm_219ef
.asm_219d2
	ld a, [$c02a]
	cp $86
	jr z, .asm_219ef
	jr c, .asm_219dd
	jr .asm_219ef
.asm_219dd
	ld a, c
	cp CH4
	jr z, .asm_219e6
	call Func_21e6d
	ret c
.asm_219e6
	ld a, [$c005]
	ld [$FF00+$24], a
	xor a
	ld [$c005], a
.asm_219ef
	ld hl, $c026
	add hl, bc
	ld [hl], b
	ret

Music8_callchannel: ; 219f5 (8:59f5)
	cp $fd ; is this command a callchannel?
	jp nz, Music8_loopchannel ; no
	call Music8_GetNextMusicByte ; yes
	push af
	call Music8_GetNextMusicByte
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
	jp Music8_endchannel

Music8_loopchannel: ; 21a2a (8:5a2a)
	cp $fe ; is this command a loopchannel?
	jp nz, Music8_notetype ; no
	call Music8_GetNextMusicByte ; yes
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
	call Music8_GetNextMusicByte ; skip pointer
	call Music8_GetNextMusicByte
	jp Music8_endchannel
.loopAgain ; inc loop count
	inc a
	ld [hl], a
	; fall through
.infiniteLoop ; overwrite current address with pointer
	call Music8_GetNextMusicByte
	push af
	call Music8_GetNextMusicByte
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
	jp Music8_endchannel

Music8_notetype: ; 21a65 (8:5a65)
	and $f0
	cp $d0 ; is this command a notetype?
	jp nz, Music8_togglecall ; no
	ld a, d ; yes
	and $f
	ld b, $0
	ld hl, $c0c6
	add hl, bc
	ld [hl], a ; store low nibble as speed
	ld a, c
	cp CH3
	jr z, .noiseChannel ; noise channel has 0 params
	call Music8_GetNextMusicByte
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
	jp Music8_endchannel

Music8_togglecall: ; 21aa4 (8:5aa4)
	ld a, d
	cp $e8 ; is this command an togglecall?
	jr nz, Music8_vibrato ; no
	ld b, $0 ; yes
	ld hl, $c02e
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a ; flip bit 0 of $c02e (toggle returning from call)
	jp Music8_endchannel

Music8_vibrato: ; 21ab6 (8:5ab6)
	cp $ea ; is this command a vibrato?
	jr nz, Music8_pitchbend ; no
	call Music8_GetNextMusicByte ; yes
	ld b, $0
	ld hl, $c04e
	add hl, bc
	ld [hl], a ; store delay 
	ld hl, $c06e
	add hl, bc
	ld [hl], a ; store delay 
	call Music8_GetNextMusicByte
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
	jp Music8_endchannel

Music8_pitchbend: ; 21aee (8:5aee)
	cp $eb ; is this command a pitchbend?
	jr nz, Music8_duty ; no
	call Music8_GetNextMusicByte ; yes
	ld b, $0
	ld hl, $c076
	add hl, bc
	ld [hl], a ; store first param
	call Music8_GetNextMusicByte
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, d
	and $f
	call Func_22017
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
	call Music8_GetNextMusicByte
	ld d, a
	jp Music8_notelength

Music8_duty: ; 21b26 (8:5b26)
	cp $ec ; is this command a duty?
	jr nz, Music8_tempo ; no
	call Music8_GetNextMusicByte ; yes
	rrca
	rrca
	and $c0
	ld b, $0
	ld hl, $c03e
	add hl, bc
	ld [hl], a ; store duty
	jp Music8_endchannel

Music8_tempo: ; 21b3b (8:5b3b)
	cp $ed ; is this command a tempo?
	jr nz, Music8_unknownmusic0xee ; no
	ld a, c ; yes
	cp CH4
	jr nc, .sfxChannel
	call Music8_GetNextMusicByte
	ld [$c0e8], a ; store first param
	call Music8_GetNextMusicByte
	ld [$c0e9], a ; store second param
	xor a
	ld [$c0ce], a ; clear RAM
	ld [$c0cf], a
	ld [$c0d0], a
	ld [$c0d1], a
	jr .musicChannelDone
.sfxChannel
	call Music8_GetNextMusicByte
	ld [$c0ea], a ; store first param
	call Music8_GetNextMusicByte
	ld [$c0eb], a ; store second param
	xor a
	ld [$c0d2], a ; clear RAM
	ld [$c0d3], a
	ld [$c0d4], a
	ld [$c0d5], a
.musicChannelDone
	jp Music8_endchannel

Music8_unknownmusic0xee: ; 21b7b (8:5b7b)
	cp $ee ; is this command an unknownmusic0xee?
	jr nz, Music8_unknownmusic0xef ; no
	call Music8_GetNextMusicByte ; yes
	ld [$c004], a ; store first param
	jp Music8_endchannel

; this appears to never be used
Music8_unknownmusic0xef: ; 21b88 (8:5b88)
	cp $ef ; is this command an unknownmusic0xef?
	jr nz, Music8_dutycycle ; no
	call Music8_GetNextMusicByte ; yes
	push bc
	call Func_22035
	pop bc
	ld a, [$c003]
	and a
	jr nz, .skip
	ld a, [$c02d]
	ld [$c003], a
	xor a
	ld [$c02d], a
.skip
	jp Music8_endchannel

Music8_dutycycle: ; 21ba7 (8:5ba7)
	cp $fc ; is this command a dutycycle?
	jr nz, Music8_stereopanning ; no
	call Music8_GetNextMusicByte ; yes
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
	jp Music8_endchannel

Music8_stereopanning: ; 21bc5 (8:5bc5)
	cp $f0 ; is this command a stereopanning?
	jr nz, Music8_executemusic ; no
	call Music8_GetNextMusicByte ; yes
	ld [$FF00+$24], a
	jp Music8_endchannel

Music8_executemusic: ; 21bd1 (8:5bd1)
	cp $f8 ; is this command an executemusic?
	jr nz, Music8_octave ; no
	ld b, $0 ; yes
	ld hl, $c036
	add hl, bc
	set 0, [hl]
	jp Music8_endchannel

Music8_octave: ; 21be0 (8:5be0)
	and $f0
	cp $e0 ; is this command an octave?
	jr nz, Music8_unknownsfx0x20 ; no
	ld hl, $c0d6 ; yes
	ld b, $0
	add hl, bc
	ld a, d
	and $f
	ld [hl], a ; store low nibble as octave
	jp Music8_endchannel

Music8_unknownsfx0x20: ; 21bf3
	cp $20 ; is this command an unknownsfx0x20?
	jr nz, Music8_unknownsfx0x10 ; no
	ld a, c
	cp CH3 ; is this a noise or sfx channel?
	jr c, Music8_unknownsfx0x10 ; no
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, Music8_unknownsfx0x10 ; no
	call Music8_notelength
	ld d, a
	ld b, $0
	ld hl, $c03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
	ld b, $1
	call Func_21ff7
	ld [hl], d
	call Music8_GetNextMusicByte
	ld d, a
	ld b, $2
	call Func_21ff7
	ld [hl], d
	call Music8_GetNextMusicByte
	ld e, a
	ld a, c
	cp CH7
	ld a, $0
	jr z, .sfxNoiseChannel ; only two params for noise channel
	push de
	call Music8_GetNextMusicByte
	pop de
.sfxNoiseChannel
	ld d, a
	push de
	call Func_21daa
	call Func_21d79
	pop de
	call Func_21dcc
	ret

Music8_unknownsfx0x10: ; 21c40 (8:5c40)
	ld a, c
	cp CH4
	jr c, Music8_note ; if not a sfx
	ld a, d
	cp $10 ; is this command a unknownsfx0x10?
	jr nz, Music8_note ; no
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, Music8_note ; no
	call Music8_GetNextMusicByte ; yes
	ld [$FF00+$10], a
	jp Music8_endchannel

Music8_note: ; 21c5c (8:5c5c)
	ld a, c
	cp CH3
	jr nz, Music8_notelength ; if not noise channel
	ld a, d
	and $f0
	cp $b0 ; is this command a dnote?
	jr z, Music8_dnote ; yes
	jr nc, Music8_notelength ; no
	swap a
	ld b, a
	ld a, d
	and $f
	ld d, a
	ld a, b
	push de
	push bc
	jr asm_21c7e

Music8_dnote: ; 21c76 (8:5c76)
	ld a, d
	and $f
	push af
	push bc
	call Music8_GetNextMusicByte ; get dnote instrument
asm_21c7e
	ld d, a
	ld a, [$c003]
	and a
	jr nz, .asm_21c89
	ld a, d
	call Func_22035
.asm_21c89
	pop bc
	pop de

Music8_notelength: ; 21c8b (8:5c8b)
	ld a, d
	push af
	and $f
	inc a
	ld b, $0
	ld e, a ; store note length (in 16ths)
	ld d, b
	ld hl, $c0c6
	add hl, bc
	ld a, [hl]
	ld l, b
	call Func_22006
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
	call Func_21e2f
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
	call Func_22006
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
	jr nz, Music8_notepitch
	ld hl, $c02e
	add hl, bc
	bit 2, [hl]
	jr z, Music8_notepitch
	pop hl
	ret

Music8_notepitch: ; 21ce9 (8:5ce9)
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
	ld hl, Unknown_222de
	add hl, bc
	ld a, [$FF00+$25]
	and [hl]
	ld [$FF00+$25], a
	jr .done
.notSfxChannel3
	ld b, $2
	call Func_21ff7
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
	call Func_22017
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 4, [hl]
	jr z, .asm_21d39
	call Func_21f4e
.asm_21d39
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
	jr nz, .asm_21d4c
	jr .skip
.asm_21d4c
	pop de
	ret
.skip
	ld b, $0
	ld hl, $c0de
	add hl, bc
	ld d, [hl]
	ld b, $2
	call Func_21ff7
	ld [hl], d
	call Func_21daa
	call Func_21d79
	pop de
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 0, [hl]
	jr z, .asm_21d70
	inc e
	jr nc, .asm_21d70
	inc d
.asm_21d70
	ld hl, $c066
	add hl, bc
	ld [hl], e
	call Func_21dcc
	ret

Func_21d79: ; 21d79 (8:5d79)
	ld b, $0
	ld hl, Unknown_222e6
	add hl, bc
	ld a, [$FF00+$25]
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
	ld hl, Unknown_222e6
	add hl, bc
	and [hl]
	ld d, a
	ld a, [$FF00+$25]
	ld hl, Unknown_222de
	add hl, bc
	and [hl]
	or d
	ld d, a
.skip
	ld a, d
	ld [$FF00+$25], a
	ret

Func_21daa: ; 21daa (8:5daa)
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
	call Func_21ff7
	ld [hl], d
	ret

Func_21dcc: ; 21dcc (8:5dcc)
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
	ld hl, Music8_Channel3DutyPointers
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ff30
	ld b, $f
	ld a, $0
	ld [$FF00+$1a], a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, b
	dec b
	and a
	jr nz, .loop
	ld a, $80
	ld [$FF00+$1a], a
	pop de
.notSfxChannel3
	ld a, d
	or $80
	and $c7
	ld d, a
	ld b, $3
	call Func_21ff7
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	cp CH4
	jr c, .musicChannel
	call Func_21e56
.musicChannel
	ret

Func_21e19: ; 21e19 (8:5e19)
	ld a, c
	cp CH4
	jr nz, .asm_21e2e
	ld a, [$d083]
	bit 7, a
	jr z, .asm_21e2e
	xor a
	ld [$c0f1], a
	ld a, $80
	ld [$c0f2], a
.asm_21e2e
	ret

Func_21e2f: ; 21e2f (8:5e2f)
	call Func_21e8b
	jr c, .asm_21e39
	call Func_21e9f
	jr nc, .asm_21e4c
.asm_21e39
	ld d, $0
	ld a, [$c0f2]
	add $80
	jr nc, .asm_21e43
	inc d
.asm_21e43
	ld [$c0eb], a
	ld a, d
	ld [$c0ea], a
	jr .asm_21e55
.asm_21e4c
	xor a
	ld [$c0eb], a
	ld a, $1
	ld [$c0ea], a
.asm_21e55
	ret

Func_21e56: ; 21e56 (8:5e56)
	call Func_21e8b
	jr c, .asm_21e60
	call Func_21e9f
	jr nc, .asm_21e6c
.asm_21e60
	ld a, [$c0f1]
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

Func_21e6d: ; 21e6d (8:5e6d)
	call Func_21e8b
	jr nc, .asm_21e88
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
.asm_21e88
	scf
	ccf
	ret

Func_21e8b: ; 21e8b (8:5e8b)
	ld a, [$c02a]
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

Func_21e9f: ; 21e9f (8:5e9f)
	ld a, [$c02d]
	ld b, a
	ld a, [$c02a]
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

Music8_ApplyPitchBend: ; 21eb8 (8:5eb8)
	ld hl, $c02e
	add hl, bc
	bit 5, [hl]
	jp nz, .asm_21eff
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
	jp c, .asm_21f45
	jr nz, .asm_21f32
	ld hl, $c0ae
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_21f45
	jr .asm_21f32
.asm_21eff
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
	jr c, .asm_21f45
	jr nz, .asm_21f32
	ld hl, $c0ae
	add hl, bc
	ld a, e
	cp [hl]
	jr c, .asm_21f45
.asm_21f32
	ld hl, $c09e
	add hl, bc
	ld [hl], e
	ld hl, $c096
	add hl, bc
	ld [hl], d
	ld b, $3
	call Func_21ff7
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
.asm_21f45
	ld hl, $c02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	ret

Func_21f4e: ; 21f4e (8:5f4e)
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
	jr nc, .asm_21f66
	ld a, $1
.asm_21f66
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
	jr c, .asm_21f82
	ld d, a
	ld b, $0
	ld hl, $c02e
	add hl, bc
	set 5, [hl]
	jr .asm_21fa5
.asm_21f82
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
.asm_21fa5
	ld hl, $c076
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

Music8_ApplyDutyCycle: ; 21fcc (8:5fcc)
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
	call Func_21ff7
	ld a, [hl]
	and $3f
	or d
	ld [hl], a
	ret

Music8_GetNextMusicByte: ; 21fe4 (8:5fe4)
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

Func_21ff7: ; 21ff7 (8:5ff7)
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

Func_22006: ; 22006 (8:6006)
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

Func_22017: ; 22017 (8:6017)
	ld h, $0
	ld l, a
	add hl, hl
	ld d, h
	ld e, l
	ld hl, Unknown_222ee
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, b
.loop
	cp CH7
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

Func_22035:: ; 22035 (8:6035)
	ld [$c001], a
	cp $ff
	jp z, Func_221f3
	cp $e9
	jp z, Func_2210d
	jp c, Func_2210d
	cp $fe
	jr z, .asm_2204c
	jp nc, Func_2210d
.asm_2204c
	xor a
	ld [$c000], a
	ld [$c003], a
	ld [$c0e9], a
	ld [$c0e6], a
	ld [$c0e7], a
	ld d, $8
	ld hl, $c016
	call FillMusicRAM8
	ld hl, $c006
	call FillMusicRAM8
	ld d, $4
	ld hl, $c026
	call FillMusicRAM8
	ld hl, $c02e
	call FillMusicRAM8
	ld hl, $c03e
	call FillMusicRAM8
	ld hl, $c046
	call FillMusicRAM8
	ld hl, $c04e
	call FillMusicRAM8
	ld hl, $c056
	call FillMusicRAM8
	ld hl, $c05e
	call FillMusicRAM8
	ld hl, $c066
	call FillMusicRAM8
	ld hl, $c06e
	call FillMusicRAM8
	ld hl, $c036
	call FillMusicRAM8
	ld hl, $c076
	call FillMusicRAM8
	ld hl, $c07e
	call FillMusicRAM8
	ld hl, $c086
	call FillMusicRAM8
	ld hl, $c08e
	call FillMusicRAM8
	ld hl, $c096
	call FillMusicRAM8
	ld hl, $c09e
	call FillMusicRAM8
	ld hl, $c0a6
	call FillMusicRAM8
	ld hl, $c0ae
	call FillMusicRAM8
	ld a, $1
	ld hl, $c0be
	call FillMusicRAM8
	ld hl, $c0b6
	call FillMusicRAM8
	ld hl, $c0c6
	call FillMusicRAM8
	ld [$c0e8], a
	ld a, $ff
	ld [$c004], a
	xor a
	ld [$FF00+$24], a
	ld a, $8
	ld [$FF00+$10], a
	ld a, $0
	ld [$FF00+$25], a
	xor a
	ld [$FF00+$1a], a
	ld a, $80
	ld [$FF00+$1a], a
	ld a, $77
	ld [$FF00+$24], a
	jp Func_2224e

Func_2210d: ; 2210d (8:610d)
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_08
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
.asm_22126
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
	jr z, .asm_22162
	ld a, e
	cp $7
	jr nz, .asm_22159
	ld a, [$c001]
	cp $14
	jr nc, .asm_22152
	ret
.asm_22152
	ld a, [hl]
	cp $14
	jr z, .asm_22162
	jr c, .asm_22162
.asm_22159
	ld a, [$c001]
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
	jr nz, .asm_221ea
	ld a, $8
	ld [$FF00+$10], a
.asm_221ea
	ld a, c
	and a
	jp z, Func_2224e
	dec c
	jp .asm_22126

Func_221f3: ; 221f3 (8:61f3)
	ld a, $80
	ld [$FF00+$26], a
	ld [$FF00+$1a], a
	xor a
	ld [$FF00+$25], a
	ld [$FF00+$1c], a
	ld a, $8
	ld [$FF00+$10], a
	ld [$FF00+$12], a
	ld [$FF00+$17], a
	ld [$FF00+$21], a
	ld a, $40
	ld [$FF00+$14], a
	ld [$FF00+$19], a
	ld [$FF00+$23], a
	ld a, $77
	ld [$FF00+$24], a
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
	call FillMusicRAM8
	ld a, $1
	ld d, $18
	ld hl, $c0b6
	call FillMusicRAM8
	ld [$c0e8], a
	ld [$c0ea], a
	ld a, $ff
	ld [$c004], a
	ret

; fills d bytes at hl with a
FillMusicRAM8: ; 22248 (8:6248)
	ld b, d
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

Func_2224e: ; 2224e (8:624e)
	ld a, [$c001]
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_08
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
	ld hl, $c026
	add hl, bc
	ld a, [$c001]
	ld [hl], a
	pop af
	cp $3
	jr c, .asm_22291
	ld hl, $c02e
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
	ld a, [$c001]
	cp $14
	jr nc, .asm_222aa
	jr .asm_222d4
.asm_222aa
	ld a, [$c001]
	cp $86
	jr z, .asm_222d4
	jr c, .asm_222b5
	jr .asm_222d4
.asm_222b5
	ld hl, $c02a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $c012 ; sfx noise channel pointer
	ld de, Noise8_endchannel
	ld [hl], e
	inc hl
	ld [hl], d ; overwrite pointer to point to endchannel
	ld a, [$c005]
	and a
	jr nz, .asm_222d4
	ld a, [$FF00+$24]
	ld [$c005], a
	ld a, $77
	ld [$FF00+$24], a
.asm_222d4
	ret

Noise8_endchannel: ; 222d5 (8:62d5)
	endchannel

Unknown_222d6: ; 222d6 (8:62d6)
	db $10, $15, $1A, $1F ; channels 0-3
	db $10, $15, $1A, $1F ; channels 4-7

Unknown_222de: ; 222de (8:62de)
	db $EE, $DD, $BB, $77 ; channels 0-3
	db $EE, $DD, $BB, $77 ; channels 4-7

Unknown_222e6: ; 222e6 (8:62e6)
	db $11, $22, $44, $88 ; channels 0-3
	db $11, $22, $44, $88 ; channels 4-7

Unknown_222ee: ; 222ee (8:62ee)
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


