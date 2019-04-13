; The entire sound engine. Uses section "audio" in WRAM.

; Interfaces are in bank 0.

; Notable functions:
; 	FadeMusic
; 	PlayStereoSFX
; 	PlayCry

_SoundRestart:: ; e8000
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
	ld [hli], a ; ff26 ; music channels

	ld hl, rNR10 ; sound channel registers
	ld e, $04 ; number of channels
.clearsound
;   sound channel   1      2      3      4
	xor a
	ld [hli], a ; rNR10, $ff15, rNR30, $ff1f ; sweep = 0

	ld [hli], a ; rNR11, rNR21, rNR31, rNR41 ; length/wavepattern = 0
	ld a, $08
	ld [hli], a ; rNR12, rNR22, rNR32, rNR42 ; envelope = 0
	xor a
	ld [hli], a ; rNR13, rNR23, rNR33, rNR43 ; frequency lo = 0
	ld a, $80
	ld [hli], a ; rNR14, rNR24, rNR34, rNR44 ; restart sound (freq hi = 0)
	dec e
	jr nz, .clearsound

	ld hl, Channel1 ; start of channel data
	ld de, $01bf ; length of area to clear (entire sound wram area)
.clearchannels ; clear Crysaudio+$01-Crysaudio+$1bf
	xor a
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .clearchannels
	ld a, $77 ; max
	ld [Volume], a
	call MusicOn
	pop af
	pop bc
	pop de
	pop hl
	ret
; e803d

MusicFadeRestart: ; e803d
; restart but keep the music id to fade in to
	ld a, [MusicFadeIDHi]
	push af
	ld a, [MusicFadeIDLo]
	push af
	call _SoundRestart
	pop af
	ld [MusicFadeIDLo], a
	pop af
	ld [MusicFadeIDHi], a
	ret
; e8051

MusicOn: ; e8051
	ld a, $01
	ld [MusicPlaying], a
	ret
; e8057

MusicOff: ; e8057
	xor a
	ld [MusicPlaying], a
	ret
; e805c

_UpdateSound:: ; e805c
	call OpenSRAMForSound
; called once per frame
	; no use updating audio if it's not playing
	ld a, [MusicPlaying]
	and a
	ret z
	; start at ch1
	xor a
	ld [CurChannel], a ; just
	ld [SoundOutput], a ; off
	ld bc, Channel1
.loop
	; is the channel active?
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 0, [hl]
	jp z, .nextchannel
	; check time left in the current note
	ld hl, Channel1NoteDuration - Channel1
	add hl, bc
	ld a, [hl]
	cp a, $02 ; 1 or 0?
	jr c, .noteover
	dec [hl]
	jr .asm_e8093
.noteover
	; reset vibrato delay
	ld hl, Channel1VibratoDelay - Channel1
	add hl, bc
	ld a, [hl]
	ld hl, Channel1VibratoDelayCount - Channel1
	add hl, bc
	ld [hl], a
	; turn vibrato off for now
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	res 1, [hl]
	; get next note
	call ParseMusic
.asm_e8093
	;
	call Functione84f9
	; duty cycle
	ld hl, Channel1DutyCycle - Channel1
	add hl, bc
	ld a, [hli]
	ld [Crysaudio+$192], a
	; intensity
	ld a, [hli]
	ld [Crysaudio+$193], a
	; frequency
	ld a, [hli]
	ld [Crysaudio+$194], a
	ld a, [hl]
	ld [Crysaudio+$195], a
	;
	call Functione8466 ; handle vibrato and other things
	call HandleNoise
	; turn off music when playing sfx?
	ld a, [SFXPriority]
	and a
	jr z, .next
	; are we in a sfx channel right now?
	ld a, [CurChannel]
	cp a, $04
	jr nc, .next
	; are any sfx channels active?
	; if so, mute
	ld hl, Crysaudio+$cc ; Channel5Flags
	bit 0, [hl]
	jr nz, .restnote
	ld hl, Crysaudio+$fe ; Channel6Flags
	bit 0, [hl]
	jr nz, .restnote
	ld hl, Crysaudio+$130 ; Channel7Flags
	bit 0, [hl]
	jr nz, .restnote
	ld hl, Crysaudio+$162 ; Channel8Flags
	bit 0, [hl]
	jr z, .next
.restnote
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 5, [hl] ; Rest
.next
	; are we in a sfx channel right now?
	ld a, [CurChannel]
	cp a, $04 ; sfx
	jr nc, .asm_e80ee
	ld hl, $00cb
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_e80fc
.asm_e80ee
	call UpdateChannels
	ld hl, Channel1Tracks - Channel1
	add hl, bc
	ld a, [SoundOutput]
	or [hl]
	ld [SoundOutput], a
.asm_e80fc
	; clear note flags
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	xor a
	ld [hl], a
.nextchannel
	; next channel
	ld hl, Channel2 - Channel1
	add hl, bc
	ld c, l
	ld b, h
	ld a, [CurChannel]
	inc a
	ld [CurChannel], a
	cp a, $08 ; are we done?
	jp nz, .loop ; do it all again
	; writing to hardware registers?
	call Functione8307
	; fade music in/out
	call FadeMusic
	; write volume to hardware register
	ld a, [Volume]
	ld [rNR50], a
	; write SO on/off to hardware register
	ld a, [SoundOutput]
	ld [rNR51], a
	ret
; e8125

UpdateChannels: ; e8125
	ld hl, .ChannelFnPtrs
	ld a, [CurChannel]
	and a, $07
	add a
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.ChannelFnPtrs
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

.Channel1
	ld a, [Crysaudio+$1a6]
	bit 7, a
	ret nz
.Channel5
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	bit 3, [hl]
	jr z, .asm_e8159
	;
	ld a, [SoundInput]
	ld [rNR10], a
.asm_e8159
	bit 5, [hl] ; rest
	jr nz, .ch1rest
	bit 4, [hl]
	jr nz, .asm_e81a2
	bit 1, [hl]
	jr nz, .asm_e816b
	bit 6, [hl]
	jr nz, .asm_e8184
	jr .asm_e8175
.asm_e816b
	ld a, [Crysaudio+$194]
	ld [rNR13], a
	ld a, [Crysaudio+$195]
	ld [rNR14], a
.asm_e8175
	bit 0, [hl]
	ret z
	ld a, [Crysaudio+$192]
	ld d, a
	ld a, [rNR11]
	and a, $3f ; sound length
	or d
	ld [rNR11], a
	ret
.asm_e8184
	ld a, [Crysaudio+$192]
	ld d, a
	ld a, [rNR11]
	and a, $3f ; sound length
	or d
	ld [rNR11], a
	ld a, [Crysaudio+$194]
	ld [rNR13], a
	ret
.ch1rest
	ld a, [rNR52]
	and a, %10001110 ; ch1 off
	ld [rNR52], a
	ld hl, rNR10
	call ClearChannel
	ret
.asm_e81a2
	ld hl, Crysaudio+$192
	ld a, $3f ; sound length
	or [hl]
	ld [rNR11], a
	ld a, [Crysaudio+$193]
	ld [rNR12], a
	ld a, [Crysaudio+$194]
	ld [rNR13], a
	ld a, [Crysaudio+$195]
	or a, $80
	ld [rNR14], a
	ret

.Channel2
.Channel6
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	bit 5, [hl] ; rest
	jr nz, .ch2rest
	bit 4, [hl]
	jr nz, .asm_e8204
	bit 6, [hl]
	jr nz, .asm_e81e6
	bit 0, [hl]
	ret z
	ld a, [Crysaudio+$192]
	ld d, a
	ld a, [rNR21]
	and a, $3f ; sound length
	or d
	ld [rNR21], a
	ret
.asm_e81db ; unused
	ld a, [Crysaudio+$194]
	ld [rNR23], a
	ld a, [Crysaudio+$195]
	ld [rNR24], a
	ret
.asm_e81e6
	ld a, [Crysaudio+$192]
	ld d, a
	ld a, [rNR21]
	and a, $3f ; sound length
	or d
	ld [rNR21], a
	ld a, [Crysaudio+$194]
	ld [rNR23], a
	ret
.ch2rest
	ld a, [rNR52]
	and a, %10001101 ; ch2 off
	ld [rNR52], a
	ld hl, $ff15
	call ClearChannel
	ret
.asm_e8204
	ld hl, Crysaudio+$192
	ld a, $3f ; sound length
	or [hl]
	ld [rNR21], a
	ld a, [Crysaudio+$193]
	ld [rNR22], a
	ld a, [Crysaudio+$194]
	ld [rNR23], a
	ld a, [Crysaudio+$195]
	or a, $80 ; initial (restart)
	ld [rNR24], a
	ret

.Channel3
.Channel7
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	bit 5, [hl] ; rest
	jr nz, .ch3rest
	bit 4, [hl]
	jr nz, .asm_e824d
	bit 6, [hl]
	jr nz, .asm_e823a
	ret
.asm_e822f ; unused
	ld a, [Crysaudio+$194]
	ld [rNR33], a
	ld a, [Crysaudio+$195]
	ld [rNR34], a
	ret
.asm_e823a
	ld a, [Crysaudio+$194]
	ld [rNR33], a
	ret
.ch3rest
	ld a, [rNR52]
	and a, %10001011 ; ch3 off
	ld [rNR52], a
	ld hl, rNR30
	call ClearChannel
	ret
.asm_e824d
	ld a, $3f
	ld [rNR31], a
	xor a
	ld [rNR30], a
	call .asm_e8268
	ld a, $80
	ld [rNR30], a
	ld a, [Crysaudio+$194]
	ld [rNR33], a
	ld a, [Crysaudio+$195]
	or a, $80
	ld [rNR34], a
	ret
.asm_e8268
	push hl
	ld a, [Crysaudio+$193]
	and a, $0f ; only 0-9 are valid
	ld l, a
	ld h, $00
	; hl << 4
	; each wavepattern is $0f bytes long
	; so seeking is done in $10s
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, WaveSamples
	add hl, de
	cp $f
	jr z, .skip
	; load wavepattern into $ff30-$ff3f
	ld a, [hli]
	ld [$ff30], a
	ld a, [hli]
	ld [$ff31], a
	ld a, [hli]
	ld [$ff32], a
	ld a, [hli]
	ld [$ff33], a
	ld a, [hli]
	ld [$ff34], a
	ld a, [hli]
	ld [$ff35], a
	ld a, [hli]
	ld [$ff36], a
	ld a, [hli]
	ld [$ff37], a
	ld a, [hli]
	ld [$ff38], a
	ld a, [hli]
	ld [$ff39], a
	ld a, [hli]
	ld [$ff3a], a
	ld a, [hli]
	ld [$ff3b], a
	ld a, [hli]
	ld [$ff3c], a
	ld a, [hli]
	ld [$ff3d], a
	ld a, [hli]
	ld [$ff3e], a
	ld a, [hli]
	ld [$ff3f], a
.skip
	pop hl
	ld a, [Crysaudio+$193]
	and a, $f0
	sla a
	ld [rNR32], a
	ret

.Channel4
.Channel8
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	bit 5, [hl] ; rest
	jr nz, .ch4rest
	bit 4, [hl]
	jr nz, .asm_e82d4
	ret
.asm_e82c1 ; unused
	ld a, [Crysaudio+$194]
	ld [rNR43], a
	ret
.ch4rest
	ld a, [rNR52]
	and a, %10000111 ; ch4 off
	ld [rNR52], a
	ld hl, $ff1f
	call ClearChannel
	ret
.asm_e82d4
	ld a, $3f ; sound length
	ld [rNR41], a
	ld a, [Crysaudio+$193]
	ld [rNR42], a
	ld a, [Crysaudio+$194]
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	ret
; e82e7

_CheckSFX: ; e82e7
; return carry if any sfx channels are active
	ld hl, Crysaudio+$cc ; Channel5Flags
	bit 0, [hl]
	jr nz, .sfxon
	ld hl, Crysaudio+$fe ; Channel6Flags
	bit 0, [hl]
	jr nz, .sfxon
	ld hl, Crysaudio+$130 ; Channel7Flags
	bit 0, [hl]
	jr nz, .sfxon
	ld hl, Crysaudio+$162 ; Channel8Flags
	bit 0, [hl]
	jr nz, .sfxon
	and a
	ret
.sfxon
	scf
	ret
; e8307

Functione8307: ; e8307
; what is Crysaudio+$1a6?
	ld a, [Crysaudio+$1a6]
	bit 7, a
	ret z
	and a, $7f
	ld d, a
	call _CheckSFX
	jr c, .asm_e8335
	and a
	jr z, .asm_e8323
	cp a, $10
	jr z, .asm_e831e
	jr .asm_e8335
.asm_e831e
	ld hl, Tablee8354
	jr .updatehw
.asm_e8323
	ld hl, Tablee8350
.updatehw
	xor a
	ld [rNR10], a ; sweep off
	ld a, [hli]
	ld [rNR11], a ; sound length / duty cycle
	ld a, [hli]
	ld [rNR12], a ; ch1 volume envelope
	ld a, [hli]
	ld [rNR13], a ; ch1 frequency lo
	ld a, [hli]
	ld [rNR14], a ; ch1 frequency hi
.asm_e8335
	ld a, d
	inc a
	cp a, $1e
	jr c, .asm_e833c
	xor a
.asm_e833c
	or a, $80
	ld [Crysaudio+$1a6], a
	; is hw ch1 on?
	ld a, [SoundOutput]
	and a, $11
	ret nz
	; if not, turn it on
	ld a, [SoundOutput]
	or a, $11
	ld [SoundOutput], a
	ret
; e8350

Tablee8350: ; e8350
	db $80 ; duty 50%
	db $e2 ; volume $e, envelope decrease sweep 2
	db $50 ; frequency: $750
	db $87 ; restart sound
; e8354

Tablee8354: ; e8354
	db $80 ; duty 50%
	db $e2 ; volume $e, envelope decrease sweep 2
	db $ee ; frequency: $6ee
	db $86 ; restart sound
; e8358

FadeMusic:: ; e8358
; fade music if applicable
; usage:
;	write to MusicFade
;	song fades out at the given rate
;	load song id in MusicFadeID
;	fade new song in
; notes:
;	max # frames per volume level is $3f

	; fading?
	ld a, [MusicFade]
	and a
	ret z
	; has the count ended?
	ld a, [MusicFadeCount]
	and a
	jr z, .update
	; count down
	dec a
	ld [MusicFadeCount], a
	ret
.update
	ld a, [MusicFade]
	ld d, a
	; get new count
	and a, $3f
	ld [MusicFadeCount], a
	; get SO1 volume
	ld a, [Volume]
	and a, $07
	; which way are we fading?
	bit 7, d
	jr nz, .fadein
	; fading out
	and a
	jr z, .novolume
	dec a
	jr .updatevolume
.novolume
	; make sure volume is off
	xor a
	ld [Volume], a
	; did we just get on a bike?
	ld a, [PlayerState]
	cp a, $01 ; bicycle
	jr z, .bicycle
	push bc
	; restart sound
	call MusicFadeRestart
	; get new song id
	ld a, [MusicFadeIDLo]
	and a
	jr z, .quit ; this assumes there are fewer than 256 songs!
	ld e, a
	ld a, [MusicFadeIDHi]
	ld d, a
	; load new song
	call _PlayMusic
.quit
	; cleanup
	pop bc
	; stop fading
	xor a
	ld [MusicFade], a
	ret
.bicycle
	push bc
	; restart sound
	call MusicFadeRestart
	; this turns the volume up
	; turn it back down
	xor a
	ld [Volume], a
	; get new song id
	ld a, [MusicFadeIDLo]
	ld e, a
	ld a, [MusicFadeIDHi]
	ld d, a
	; load new song
	call _PlayMusic
	pop bc
	; fade in
	ld hl, MusicFade
	set 7, [hl]
	ret
.fadein
	; are we done?
	cp a, $07
	jr nc, .maxvolume
	; inc volume
	inc a
	jr .updatevolume
.maxvolume
	; we're done
	xor a
	ld [MusicFade], a
	ret
.updatevolume
	; hi = lo
	ld d, a
	swap a
	or d
	ld [Volume], a
	ret
; e83d1

LoadNote: ; e83d1
	; check mute??
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	bit 1, [hl]
	ret z
	; get note duration
	ld hl, Channel1NoteDuration - Channel1
	add hl, bc
	ld a, [hl]
	ld hl, Crysaudio+$197 ; ????
	sub [hl]
	jr nc, .ok
	ld a, $01
.ok
	ld [hl], a
	; get frequency
	ld hl, Channel1Frequency - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; ????
	ld hl, $0021
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc a, $00
	ld d, a
	; ????
	ld hl, $0022
	add hl, bc
	sub [hl]
	jr nc, .asm_e8420
	; ????
	ld hl, Channel1Flags3 - Channel1
	add hl, bc
	set 1, [hl]
	; get frequency
	ld hl, Channel1Frequency - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; ????
	ld hl, $0021
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc a, $00
	ld d, a
	; ????
	ld hl, $0022
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	jr .asm_e843e
.asm_e8420
	; ????
	ld hl, Channel1Flags3 - Channel1
	add hl, bc
	res 1, [hl]
	; get frequency
	ld hl, Channel1Frequency - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; ????
	ld hl, $0021
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc a, $00
	ld d, a
	; ????
	ld hl, $0022
	add hl, bc
	sub [hl]
	ld d, a
.asm_e843e
	push bc
	ld hl, Crysaudio+$197
	ld b, $00 ; loop count
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
	ld a, e ; result
	add [hl]
	ld d, b ; loop count
	; ????
	pop bc
	ld hl, $0023
	add hl, bc
	ld [hl], d
	ld hl, $0024
	add hl, bc
	ld [hl], a
	; clear ????
	ld hl, $0025
	add hl, bc
	xor a
	ld [hl], a
	ret
; e8466

Functione8466: ; e8466
; handle vibrato and other things
; unknowns: Crysaudio+$192, Crysaudio+$194
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	bit 2, [hl]
	jr z, .next
	ld hl, $001c
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and a, $c0
	ld [Crysaudio+$192], a
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 0, [hl]
.next
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	bit 4, [hl]
	jr z, .vibrato
	ld hl, $0027
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Crysaudio+$194
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, Crysaudio+$194
	ld [hl], e
	inc hl
	ld [hl], d
.vibrato
	; is vibrato on?
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	bit 0, [hl] ; vibrato
	jr z, .quit
	; is vibrato active for this note yet?
	; is the delay over?
	ld hl, Channel1VibratoDelayCount - Channel1
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .subexit
	; is the extent nonzero?
	ld hl, Channel1VibratoExtent - Channel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .quit
	; save it for later
	ld d, a
	; is it time to toggle vibrato up/down?
	ld hl, Channel1VibratoRate - Channel1
	add hl, bc
	ld a, [hl]
	and a, $0f ; count
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
	ld a, [Crysaudio+$194]
	ld e, a
	; toggle vibrato up/down
	ld hl, Channel1Flags3 - Channel1
	add hl, bc
	bit 0, [hl] ; vibrato up/down
	jr z, .down
; up
	; vibrato down
	res 0, [hl]
	; get the delay
	ld a, d
	and a, $0f ; lo
	;
	ld d, a
	ld a, e
	sub d
	jr nc, .asm_e84ef
	ld a, $00
	jr .asm_e84ef
.down
	; vibrato up
	set 0, [hl]
	; get the delay
	ld a, d
	and a, $f0 ; hi
	swap a ; move it to lo
	;
	add e
	jr nc, .asm_e84ef
	ld a, $ff
.asm_e84ef
	ld [Crysaudio+$194], a
	;
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 6, [hl]
.quit
	ret
; e84f9

Functione84f9: ; e84f9
	; quit if ????
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	bit 1, [hl]
	ret z
	; de = Frequency
	ld hl, Channel1Frequency - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	;
	ld hl, Channel1Flags3 - Channel1
	add hl, bc
	bit 1, [hl]
	jr z, .next
	;
	ld hl, $0023
	add hl, bc
	ld l, [hl]
	ld h, $00
	add hl, de
	ld d, h
	ld e, l
	; get ????
	ld hl, $0024
	add hl, bc
	ld a, [hl]
	; add it to ????
	ld hl, $0025
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, $00
	adc e
	ld e, a
	ld a, $00
	adc d
	ld d, a
	;
	ld hl, $0022
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .quit1
	jr nz, .quit2
	ld hl, $0021
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .quit1
	jr .quit2
.next
	ld a, e
	ld hl, $0023
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc a, $00
	ld d, a
	ld hl, $0024
	add hl, bc
	ld a, [hl]
	add a
	ld [hl], a
	ld a, e
	sbc a, $00
	ld e, a
	ld a, d
	sbc a, $00
	ld d,a
	ld hl, $0022
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .quit1
	jr nz, .quit2
	ld hl, $0021
	add hl, bc
	ld a, e
	cp [hl]
	jr nc, .quit2
.quit1
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	res 1, [hl]
	ld hl, Channel1Flags3 - Channel1
	add hl, bc
	res 1, [hl]
	ret
.quit2
	ld hl, Channel1Frequency - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 1, [hl]
	set 0, [hl]
	ret
; e858c

HandleNoise: ; e858c
	; is noise sampling on?
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 4, [hl] ; noise sampling
	ret z
	; are we in a sfx channel?
	ld a, [CurChannel]
	bit 2, a ; sfx
	jr nz, .next
	; is ch8 on? (noise)
	ld hl, Crysaudio+$162 ; Channel8Flags
	bit 0, [hl] ; on?
	jr z, .next
	; is ch8 playing noise?
	bit 4, [hl]
	ret nz ; quit if so
	;
.next
	ld a, [Crysaudio+$1a2]
	and a
	jr z, ReadNoiseSample
	dec a
	ld [Crysaudio+$1a2], a
	ret
; e85af

ReadNoiseSample: ; e85af
; sample struct:
;	[wx] [yy] [zz]
;	w: ? either 2 or 3
;	x: duration
;	zz: intensity
;       yy: frequency

	; de = [NoiseSampleAddress]
	ld hl, NoiseSampleAddress
	ld e, [hl]
	inc hl
	ld d, [hl]

	; is it empty?
	ld a, e
	or d
	jr z, .quit

	ld a, [de]
	inc de

	cp $ff
	jr z, .quit

	and $f
	inc a
	ld [Crysaudio+$1a2], a
	ld a, [de]
	inc de
	ld [Crysaudio+$193], a
	ld a, [de]
	inc de
	ld [Crysaudio+$194], a
	xor a
	ld [Crysaudio+$195], a

	ld hl, NoiseSampleAddress
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 4, [hl]
	ret
.quit
	ret
; e85e1

ParseMusic: ; e85e1
; parses until a note is read or the song is ended
	call GetMusicByte ; store next byte in a
	cp a, $ff ; is the song over?
	jr z, .readff
	cp a, $d0 ; is it a note?
	jr c, .readnote
	; then it's a command
.readcommand
	call ParseMusicCommand
	jr ParseMusic ; start over

.readnote
; CurMusicByte contains current note
; special notes
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 3, [hl]
	jp nz, Functione8698
	bit 5, [hl]
	jp nz, Functione8698
	bit 4, [hl] ; noise sample
	jp nz, GetNoiseSample
; normal note
	; set note duration (bottom nybble)
	ld a, [CurMusicByte]
	and a, $0f
	call SetNoteDuration
	; get note pitch (top nybble)
	ld a, [CurChannel]
	ld e, a
	ld d, 0
	ld hl, wChannelSelectorSwitches
	add hl, de
	ld a, [hl]
	and a
	jr z, .notMuted
	xor a
	jr .rest
.notMuted
	ld a, [CurMusicByte]
	swap a
	and a, $0f
	jr z, .rest ; pitch $0 -> rest
	; update pitch
	ld hl, Channel1Pitch - Channel1
	add hl, bc
	ld [hl], a
	; store pitch in e
	ld e, a
	; store octave in d
	ld hl, Channel1Octave - Channel1
	add hl, bc
	ld d, [hl]
	; update frequency
	call GetFrequency
	ld hl, Channel1Frequency - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; ????
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 4, [hl]
	jp LoadNote
.rest
; note = rest
	ld hl, Channel1Pitch - Channel1
	add hl, bc
	ld [hl], a

	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 5, [hl] ; Rest
	ret
;
.readff
; $ff is reached in music data
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 1, [hl] ; in a subroutine?
	jr nz, .readcommand ; execute
	ld a, [CurChannel]
	cp a, $04 ; channels 0-3?
	jr nc, .asm_e8651
	; ????
	ld hl, $00cb
	add hl, bc
	bit 0, [hl]
	jr nz, .ok
.asm_e8651
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 5, [hl]
	call nz, RestoreVolume
	; end music
	ld a, [CurChannel]
	cp a, $04 ; channel 5?
	jr nz, .ok
	; ????
	xor a
	ld [rNR10], a ; sweep = 0
.ok
; stop playing
	; turn channel off
	ld hl, Channel1Flags - Channel1
	add hl, bc
	res 0, [hl]
	; note = rest
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 5, [hl]
	; clear music id & bank
	ld hl, Channel1MusicID - Channel1
	add hl, bc
	xor a
	ld [hli], a ; id hi
	ld [hli], a ; id lo
	ld [hli], a ; bank
	ret
; e8679

RestoreVolume: ; e8679
	; ch5 only
	ld a, [CurChannel]
	cp a, $04
	ret nz
	xor a
	ld hl, Crysaudio+$122
	ld [hli], a
	ld [hl], a
	ld hl, Crysaudio+$186
	ld [hli], a
	ld [hl], a
	ld a, [LastVolume]
	ld [Volume], a
	xor a
	ld [LastVolume], a
	ld [SFXPriority], a
	ret
; e8698

Functione8698: ; e8698
	; turn noise sampling on
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 4, [hl] ; noise sample
	; update note duration
	ld a, [CurMusicByte]
	call SetNoteDuration ; top nybble doesnt matter?
	; update intensity from next param
	call GetMusicByte
	ld hl, Channel1Intensity - Channel1
	add hl, bc
	ld [hl], a
	; update lo frequency from next param
	call GetMusicByte
	ld hl, Channel1FrequencyLo - Channel1
	add hl, bc
	ld [hl], a
	; are we on the last channel? (noise sampling)
	ld a, [CurChannel]
	and a, $03
	cp a, $03
	ret z
	; update hi frequency from next param
	call GetMusicByte
	ld hl, Channel1FrequencyHi - Channel1
	add hl, bc
	ld [hl], a
	ret
; e86c5

GetNoiseSample: ; e86c5
; load ptr to sample header in NoiseSampleAddress
	; are we on the last channel?
	ld a, [CurChannel]
	and a, $03
	cp a, $03
	; ret if not
	ret nz
	; update note duration
	ld a, [CurMusicByte]
	and a, $0f
	call SetNoteDuration
	ld a, [wChannelSelectorSwitches+3]
	and a
	ret nz
	; check current channel
	ld a, [CurChannel]
	bit 2, a ; are we in a sfx channel?
	jr nz, .sfx
	ld hl, Crysaudio+$162 ; Channel8Flags
	bit 0, [hl] ; is ch8 on? (noise)
	ret nz
	ld a, [MusicNoiseSampleSet]
	jr .next
.sfx
	ld a, [SFXNoiseSampleSet]
.next
	; load noise sample set id into de
	ld e, a
	ld d, $00
	; load ptr to noise sample set in hl
	ld hl, NoiseSampleSetsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; get pitch
	ld a, [CurMusicByte]
	swap a
	; non-rest note?
	and a, $0f
	ret z
	; use 'pitch' to seek noise sample set
	ld e, a
	ld d, $00
	add hl, de
	add hl, de
	; load sample pointer into NoiseSampleAddress
	ld a, [hli]
	ld [NoiseSampleAddressLo], a
	ld a, [hl]
	ld [NoiseSampleAddressHi], a
	; clear ????
	xor a
	ld [Crysaudio+$1a2], a
	ret
; e870f

ParseMusicCommand: ; e870f
	; reload command
	ld a, [CurMusicByte]
	; get command #
	sub a, $d0 ; first command
	ld e, a
	ld d, $00
	; seek command pointer
	ld hl, MusicCommands
	add hl, de
	add hl, de
	; jump to the new pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e8720

MusicCommands: ; e8720
; pointer to each command in order
	; octaves
	dw MusicD0 ; octave 8
	dw MusicD1 ; octave 7
	dw MusicD2 ; octave 6
	dw MusicD3 ; octave 5
	dw MusicD4 ; octave 4
	dw MusicD5 ; octave 3
	dw MusicD6 ; octave 2
	dw MusicD7 ; octave 1
	dw MusicD8 ; note length + intensity
	dw MusicD9 ; set starting octave
	dw MusicDA ; tempo
	dw MusicDB ; duty cycle
	dw MusicDC ; intensity
	dw MusicDD ; update sound status
	dw MusicDE ; ???? + duty cycle
	dw MusicDF ;
	dw MusicE0 ;
	dw MusicE1 ; vibrato
	dw MusicE2 ;
	dw MusicE3 ; music noise sampling
	dw MusicE4 ; force panning
	dw MusicE5 ; volume
	dw MusicE6 ; tune
	dw MusicE7 ;
	dw MusicE8 ;
	dw MusicE9 ; global tempo
	dw MusicEA ; restart current channel from header
	dw MusicEB ; new song
	dw MusicEC ; sfx priority on
	dw MusicED ; sfx priority off
	dw MusicEE ;
	dw MusicEF ; stereo panning
	dw MusicF0 ; sfx noise sampling
	dw MusicF1 ; nothing
	dw MusicF2 ; nothing
	dw MusicF3 ; nothing
	dw MusicF4 ; nothing
	dw MusicF5 ; nothing
	dw MusicF6 ; nothing
	dw MusicF7 ; nothing
	dw MusicF8 ; nothing
	dw MusicF9 ;
	dw MusicFA ;
	dw MusicFB ;
	dw MusicFC ; jump
	dw MusicFD ; loop
	dw MusicFE ; call
	dw MusicFF ; return
; e8780

MusicF1: ; e8780
; global tempo
; params: 2
;	de: tempo
	call GetMusicByte
	ld d, a
	call GetMusicByte
	ld e, a
	call SetGlobalTempo
	ret

MusicF2: ; e8780
; duty cycle
; params: 1
	call GetMusicByte
	rrca
	rrca
	and a, $c0
	ld hl, Channel1DutyCycle - Channel1
	add hl, bc
	ld [hl], a
	ret

MusicF3: ; e8780
;custom waveform
	ld e, 16
	ld hl, $ff30
.read
	call GetMusicByte
	ldi [hl], a
	dec e
	jr nz, .read
	ret

MusicF4: ; e8780
;inc_octave
	ld hl, Channel1Octave - Channel1
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	ret

MusicF5: ; e8780
;dec_octave
	ld hl, Channel1Octave - Channel1
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ret

MusicF6: ; e8780
;notetype0
	call GetMusicByte
	ld hl, $002d
	add hl, bc
	ld [hl], a
	ret

MusicF7: ; e8780
;notetype1
	call GetMusicByte
	ld hl, Channel1Intensity - Channel1
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

MusicF8: ; e8780
;notetype2
	call GetMusicByte
	ld hl, Channel1Intensity - Channel1
	add hl, bc
	push bc
	ld b, a
	ld a, [hl]
	and $f0
	add b
	pop bc
	ld [hl], a
	ret
; e8781

MusicFF: ; e8781
; called when $ff is encountered w/ subroutine flag set
; end music stream
; return to caller of the subroutine
	; reset subroutine flag
	ld hl, Channel1Flags - Channel1
	add hl, bc
	res 1, [hl]
	; copy LastMusicAddress to MusicAddress
	ld hl, Channel1LastMusicAddress - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; e8796

MusicFE: ; e8796
; call music stream (subroutine)
; parameters: ll hh ; pointer to subroutine
	; get pointer from next 2 bytes
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	push de
	; copy MusicAddress to LastMusicAddress
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Channel1LastMusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; load pointer into MusicAddress
	pop de
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; set subroutine flag
	ld hl, Channel1Flags - Channel1
	add hl, bc
	set 1, [hl]
	ret
; e87bc

MusicFC: ; e87bc
; jump
; parameters: ll hh ; pointer
	; get pointer from next 2 bytes
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; e87cc

MusicFD: ; e87cc
; loops xx - 1 times
; 	00: infinite
; params: 3
;	xx ll hh
;		xx : loop count
;   	ll hh : pointer

	; get loop count
	call GetMusicByte
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 2, [hl] ; has the loop been initiated?
	jr nz, .checkloop
	and a ; loop counter 0 = infinite
	jr z, .loop
	; initiate loop
	dec a
	set 2, [hl] ; set loop flag
	ld hl, Channel1LoopCount - Channel1
	add hl, bc
	ld [hl], a ; store loop counter
.checkloop
	ld hl, Channel1LoopCount - Channel1
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
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.endloop
	; reset loop flag
	ld hl, Channel1Flags - Channel1
	add hl, bc
	res 2, [hl]
	; skip to next command
	ld hl, Channel1MusicAddress - Channel1
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
; e880e

MusicFA: ; e880e
; set condition for a jump
; used with FB
; params: 1
;	xx ; condition

	; set condition
	call GetMusicByte
	ld hl, Channel1Condition - Channel1
	add hl, bc
	ld [hl], a
	ret
; e8817

MusicFB: ; e8817
; conditional jump
; used with FA
; params: 3
; 	xx: condition
;	ll hh: pointer

; check condition
	; a = condition
	call GetMusicByte
	; if existing condition matches, jump to new address
	ld hl, Channel1Condition - Channel1
	add hl, bc
	cp [hl]
	jr z, .jump
; skip to next command
	; get address
	ld hl, Channel1MusicAddress - Channel1
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
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; e883e

MusicEE; e883e
; conditional jump
; checks a byte in ram corresponding to the current channel
; doesn't seem to be set by any commands
; params: 2
;		ll hh ; pointer

; if ????, jump
	; get channel
	ld a, [CurChannel]
	and a, $03 ; ch0-3
	ld e, a
	ld d, $00
	; hl = Crysaudio+$1b8 + channel id
	ld hl, Crysaudio+$1b8
	add hl, de
	; if set, jump
	ld a, [hl]
	and a
	jr nz, .jump
; skip to next command
	; get address
	ld hl, Channel1MusicAddress - Channel1
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
	ld [hl], $00
	; de = pointer
	call GetMusicByte
	ld e, a
	call GetMusicByte
	ld d, a
	; update address
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; e886d

MusicF9: ; e886d
; sets some flag
; seems to be unused
; params: 0
	ld a, $01
	ld [Crysaudio+$1b5], a
	ret
; e8873

MusicE2: ; e8873
; seems to have been dummied out
; params: 1
	call GetMusicByte
	ld hl, $002c
	add hl, bc
	ld [hl], a
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 3, [hl]
	ret
; e8882

MusicE1: ; e8882
; vibrato
; params: 2
;	1: [xx]
	; delay in frames
;	2: [yz]
	; y: extent
	; z: rate (# frames per cycle)

	; set vibrato flag?
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 0, [hl]
	; start at lower frequency (extent is positive)
	ld hl, Channel1Flags3 - Channel1
	add hl, bc
	res 0, [hl]
	; get delay
	call GetMusicByte
; update delay
	ld hl, Channel1VibratoDelay - Channel1
	add hl, bc
	ld [hl], a
; update delay count
	ld hl, Channel1VibratoDelayCount - Channel1
	add hl, bc
	ld [hl], a
; update extent
; this is split into halves only to get added back together at the last second
	; get extent/rate
	call GetMusicByte
	ld hl, Channel1VibratoExtent - Channel1
	add hl, bc
	ld d, a
	; get top nybble
	and a, $f0
	swap a
	srl a ; halve
	ld e, a
	adc a, $00 ; round up
	swap a
	or e
	ld [hl], a
; update rate
	ld hl, Channel1VibratoRate - Channel1
	add hl, bc
	; get bottom nybble
	ld a, d
	and a, $0f
	ld d, a
	swap a
	or d
	ld [hl], a
	ret
; e88bd

MusicE0: ; e88bd
; ????
; params: 2
	call GetMusicByte
	ld [Crysaudio+$197], a
	call GetMusicByte
	ld d, a
	and a, $0f
	ld e, a
	ld a, d
	swap a
	and a, $0f
	ld d, a
	call GetFrequency
	ld hl, $0021
	add hl, bc
	ld [hl], e
	ld hl, $0022
	add hl, bc
	ld [hl], d
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 1, [hl]
	ret
; e88e4

MusicE6: ; e88e4
; tone
; params: 2
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 4, [hl]
	ld hl, $0028
	add hl, bc
	call GetMusicByte
	ld [hld], a
	call GetMusicByte
	ld [hl], a
	ret
; e88f7

MusicE7: ; e88f7
; shrug
; params: 1
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 6, [hl]
	call GetMusicByte
	ld hl, $0029
	add hl, bc
	ld [hl], a
	ret
; e8906

MusicDE: ; e8906
; ???? + duty cycle
; params: 1
	;
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 2, [hl] ; duty cycle
	;
	call GetMusicByte
	rrca
	rrca
	ld hl, $001c
	add hl, bc
	ld [hl], a
	; update duty cycle
	and a, $c0 ; only uses top 2 bits
	ld hl, Channel1DutyCycle - Channel1
	add hl, bc
	ld [hl], a
	ret
; e891e

MusicE8: ; e891e
; shrug
; params: 1
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 5, [hl]
	call GetMusicByte
	ld hl, $002a
	add hl, bc
	ld [hl], a
	ret
; e892d

MusicDF: ; e892d
; toggle something
; params: none
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 3, [hl]
	jr z, .on
	res 3, [hl]
	ret
.on
	set 3, [hl]
	ret
; e893b

MusicE3: ; e893b
; toggle music noise sampling
; can't be used as a straight toggle since the param is not read from on->off
; params:
; 	noise on: 1
; 	noise off: 0
	; check if noise sampling is on
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 4, [hl]
	jr z, .on
	; turn noise sampling off
	res 4, [hl]
	ret
.on
	; turn noise sampling on
	set 4, [hl]
	call GetMusicByte
	ld [MusicNoiseSampleSet], a
	ret
; e894f

MusicF0: ; e894f
; toggle sfx noise sampling
; params:
;	on: 1
; 	off: 0
	; check if noise sampling is on
	ld hl, Channel1Flags - Channel1
	add hl, bc
	bit 4, [hl]
	jr z, .on
	; turn noise sampling off
	res 4, [hl]
	ret
.on
	; turn noise sampling on
	set 4, [hl]
	call GetMusicByte
	ld [SFXNoiseSampleSet], a
	ret
; e8963

MusicD8: ; e8963
; note length
;	# frames per 16th note
; intensity: see MusicDC
; params: 2
	; note length
	call GetMusicByte
	ld hl, $002d
	add hl, bc
	ld [hl], a
	ld a, [CurChannel]
	and a, $03
	cp a, $03
	ret z
	; intensity
	call MusicDC
	ret
; e8977

MusicDD: ; e8977
; update sound status
; params: 1
	call GetMusicByte
	ld [SoundInput], a
	ld hl, Channel1NoteFlags - Channel1
	add hl, bc
	set 3, [hl]
	ret
; e8984

MusicDB: ; e8984
; duty cycle, includes nite check
; params: 1
	ld a, [GBPrinter]
	bit 2, a
	jr nz, .ForceNite ;for the Music test
	bit 3, a
	jp nz, MusicF2 ;skip nite check
.ForceNite
	ld a, [CurChannel]
	cp a, $04
	jp nc, MusicF2 ;skip nite check
	call GetMusicByte
	rrca
	rrca
	and a, $c0
	ld hl, Channel1DutyCycle - Channel1
	add hl, bc
	ld d, a
	ld a, [GBPrinter]
	bit 2, a
	jr nz, .NiteDuty ;for the Music test
	;ld a, [TimeOfDay]
	;cp NITE
	;jr z, .NiteDuty
	ld a, d
	ld [hl], a
	ret
.NiteDuty
	ld a, d
	xor a, $40
	ld [hl], a
	ret
; e8991

MusicDC: ; e8991
; intensity
; params: 1
;	hi: pressure
;   lo: velocity
	call GetMusicByte
	ld hl, Channel1Intensity - Channel1
	add hl, bc
	ld [hl], a
	ret
; e899a

MusicDA: ; e899a
; global tempo includes nite check
; params: 2
;	de: tempo
	ld a, [GBPrinter]
	bit 2, a
	jr nz, .ForceNite ;for the Music test
	bit 3, a
	jp nz, MusicF1 ;skip nite check
.ForceNite
	ld a, [CurChannel]
	cp a, $04
	jp nc, MusicF1 ;skip nite check
	call GetMusicByte
	ld d, a
	call GetMusicByte
	ld e, a
	ld a, [GBPrinter]
	bit 2, a
	jr nz, .NiteTempo ;for the Music test
	;ld a, [TimeOfDay]
	;cp NITE
	;jr z, .NiteTempo
	call SetGlobalTempo
	ret
.NiteTempo
	push de
	srl d
	rr e
	srl d
	rr e
	push de
	pop hl
	pop de
	add hl, de
	push hl
	pop de
	call SetGlobalTempo
	ret
; e89a6

MusicD0: ; e89a6
MusicD1: ; e89a6
MusicD2: ; e89a6
MusicD3: ; e89a6
MusicD4: ; e89a6
MusicD5: ; e89a6
MusicD6: ; e89a6
MusicD7: ; e89a6
; set octave based on lo nybble of the command
	ld hl, Channel1Octave - Channel1
	add hl, bc
	ld a, [CurMusicByte]
	and 7
	ld [hl], a
	ret
; e89b1

MusicD9: ; e89b1
; set starting octave
; this forces all notes up by the starting octave
; params: 1
	call GetMusicByte
	ld hl, Channel1StartingOctave - Channel1
	add hl, bc
	ld [hl], a
	ret
; e89ba

MusicEF: ; e89ba
; stereo panning
; params: 1
	; stereo on?
	ld a, [Options]
	bit 5, a ; stereo
	jr nz, MusicE4
	; skip param
	call GetMusicByte
	ret
; e89c5

MusicE4: ; e89c5
; force panning
; params: 1
	call SetLRTracks
	call GetMusicByte
	ld hl, Channel1Tracks - Channel1
	add hl, bc
	and [hl]
	ld [hl], a
	ret
; e89d2

MusicE5: ; e89d2
; set volume
; params: 1
;	see Volume
	; read param even if it's not used
	call GetMusicByte
	; is the song fading?
	ld a, [MusicFade]
	and a
	ret nz
	; reload param
	ld a, [CurMusicByte]
	; set volume
	ld [Volume], a
	ret
; e89e1

MusicE9: ; e89e1
; set global tempo to current channel tempo +- param
; params: 1 signed
	call GetMusicByte
	ld e, a
	; check sign
	cp a, $80
	jr nc, .negative
;positive
	ld d, $00
	jr .ok
.negative
	ld d, $ff
.ok
	ld hl, Channel1Tempo - Channel1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call SetGlobalTempo
	ret
; e89fd

MusicEC: ; e89fd
; turn sfx priority on
; params: none
	ld a, $01
	ld [SFXPriority], a
	ret
; e8a03

MusicED: ; e8a03
; turn sfx priority off
; params: none
	xor a
	ld [SFXPriority], a
	ret
; e8a08

MusicEA: ; e8a08
; restart current channel from channel header (same bank)
; params: 2 (5)
; ll hh: pointer to new channel header
;	header format: 0x yy zz
;		x: channel # (0-3)
;		zzyy: pointer to new music data

	; update music id
	ld hl, Channel1MusicID - Channel1
	add hl, bc
	ld a, [hli]
	ld [MusicIDLo], a
	ld a, [hl]
	ld [MusicIDHi], a
	; update music bank
	ld hl, Channel1MusicBank - Channel1
	add hl, bc
	ld a, [hl]
	ld [MusicBank], a
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
; e8a30

MusicEB: ; e8a30
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
; e8a3e

GetMusicByte: ; e8a3e
; returns byte from current address in a
; advances to next byte in music data
; input: bc = start of current channel
	push hl
	push de
	; load address into de
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	; load bank into a
	ld hl, Channel1MusicBank - Channel1
	add hl, bc
	ld a, [hl]
	; get byte
	call _LoadMusicByte ; load data into CurMusicByte
	inc de ; advance to next byte for next time this is called
	; update channeldata address
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	; cleanup
	pop de
	pop hl
	; store channeldata in a
	ld a, [CurMusicByte]
	ret
; e8a5d

GetFrequency: ; e8a5d
; generate frequency
; input:
; 	d: octave
;	e: pitch
; output:
; 	de: frequency

; get octave
	ld a, [CurChannel]
	cp 3
	jr nc, .added
	ld a, [wTranspositionInterval]
	bit 7, a
	jr nz, .negative
.positive
	add e
	ld e, a
	cp 13
	jr c, .added
	sub 12
	ld e, a
	dec d
	jr .added
.negative
	dec e
	add e
	jr c, .c
	inc a
	add 12
	ld e, a
	inc d
	jr .added
.c
	inc a
	ld e, a
.added

	; get starting octave
	ld hl, Channel1StartingOctave - Channel1
	add hl, bc
	ld a, [hl]
	swap a ; hi nybble
	and a, $0f
	; add current octave
	add d
	push af ; we'll use this later
	; get starting octave
	ld hl, Channel1StartingOctave - Channel1
	add hl, bc
	ld a, [hl]
	and a, $0f ; lo nybble
	;
	ld l, a ; ok
	ld d, $00
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
.loop
	; [7 - octave] loops
	cp a, $07
	jr nc, .ok
	; sra de
	sra d
	rr e
	inc a
	jr .loop
.ok
	ld a, d
	and a, $07 ; top 3 bits for frequency (11 total)
	ld d, a
	ret
; e8a8d

SetNoteDuration: ; e8a8d
; input: a = note duration in 16ths
	; store delay units in de
	inc a
	ld e, a
	ld d, $00
	; store NoteLength in a
	ld hl, Channel1NoteLength - Channel1
	add hl, bc
	ld a, [hl]
	; multiply NoteLength by delay units
	ld l, $00 ; just multiply
	call MultiplySimple
	ld a, l ; % $100
	; store Tempo in de
	ld hl, Channel1Tempo - Channel1
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	; add ???? to the next result
	ld hl, $0016
	add hl, bc
	ld l, [hl]
	; multiply Tempo by last result (NoteLength * delay % $100)
	call MultiplySimple
	; copy result to de
	ld e, l
	ld d, h
	; store result in ????
	ld hl, $0016
	add hl, bc
	ld [hl], e
	; store result in NoteDuration
	ld hl, Channel1NoteDuration - Channel1
	add hl, bc
	ld [hl], d
	ret
; e8ab8

MultiplySimple: ; e8ab8
; multiplies a and de
; adds the result to l
; stores the result in hl
	ld h, $00
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
; e8ac7

SetGlobalTempo: ; e8ac7
	push bc ; save current channel
	; are we dealing with music or sfx?
	ld a, [CurChannel]
	cp a, $04
	jr nc, .sfxchannels
	ld bc, Channel1
	call SetTempo
	ld bc, Channel2
	call SetTempo
	ld bc, Channel3
	call SetTempo
	ld bc, Channel4
	call SetTempo
	jr .end
.sfxchannels
	ld bc, Channel5
	call SetTempo
	ld bc, Channel6
	call SetTempo
	ld bc, Channel7
	call SetTempo
	ld bc, Channel8
	call SetTempo
.end
	pop bc ; restore current channel
	ret
; e8b03

SetTempo: ; e8b03
; input:
; 	de: note length
	; update Tempo
	ld hl, Channel1Tempo - Channel1
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	; clear ????
	xor a
	ld hl, $0016
	add hl, bc
	ld [hl], a
	ret
; e8b11

StartChannel: ; e8b11
	call SetLRTracks
	ld hl, Channel1Flags - Channel1
	add hl, bc
	set 0, [hl] ; turn channel on
	ret
; e8b1b

SetLRTracks: ; e8b1b
; set tracks for a the current channel to default
; seems to be redundant since this is overwritten by stereo data later
	push de
	; store current channel in de
	ld a, [CurChannel]
	and a, $03
	ld e, a
	ld d, $00
	; get this channel's lr tracks
	call GetLRTracks
	add hl, de ; de = channel 0-3
	ld a, [hl]
	; load lr tracks into Tracks
	ld hl, Channel1Tracks - Channel1
	add hl, bc
	ld [hl], a
	pop de
	ret
; e8b30

SongTranspositions:
	ds 46

_PlayMusic:: ; e8b30
	call OpenSRAMForSound
	ld a, e
	and a
	jp z, _SoundRestart
; load music
	call MusicOff
	ld hl, MusicID
	ld [hl], e ; song number
	inc hl
	ld [hl], d ; MusicIDHi (always $00)

	ld hl, SongTranspositions
	add hl, de
	ld a, [hl]
	ld [wTranspositionInterval], a

	ld a, [GBPrinter]
	bit 1, a
	jr nz, .MTMusic
	bit 0, a
	jr nz, .AltMusic
	ld hl, Music
.ContinueMusic
	add hl, de ; three
	add hl, de ; byte
	add hl, de ; pointer
	ld a, [hli]
	ld [MusicBank], a
	ld e, [hl]
	inc hl
	ld d, [hl] ; music header address
	
	; pre-emptively disable all channels.  for some reason, this
	; does not happen.
	xor a
	ld [Channel1+3], a
	ld [Channel2+3], a
	ld [Channel3+3], a
	ld [Channel4+3], a
	
	call LoadMusicByte ; store first byte of music header in a
	rlca
	rlca
	and a, $03 ; get number of channels
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
	ld [Crysaudio+$1b5], a
	ld [Crysaudio+$1b8], a
	ld [Crysaudio+$1b9], a
	ld [Crysaudio+$1ba], a
	ld [Crysaudio+$1bb], a
	ld [NoiseSampleAddressLo], a
	ld [NoiseSampleAddressHi], a
	ld [Crysaudio+$1a2], a
	ld [MusicNoiseSampleSet], a
	call MusicOn
	ret
; e8b79

.AltMusic
	ld hl, Music2
	jr .ContinueMusic
.MTMusic
	ld hl, MusicMT
	jr .ContinueMusic
PlayCry_:: ; e8b79
; Play cry de using parameters:
;	CryPitch
;	CryEcho
;	CryLength
	call MusicOff
	
; Overload the music id with the cry id
	ld hl, MusicID
	ld [hl], e
	inc hl
	ld [hl], d
	
; 3-byte pointers (bank, address)
	ld hl, Cries
	add hl, de
	add hl, de
	add hl, de
	
	ld a, [hli]
	ld [MusicBank], a
	
	ld e, [hl]
	inc hl
	ld d, [hl]
	
; Read the cry's sound header
	call LoadMusicByte
	; Top 2 bits contain the number of channels
	rlca
	rlca
	and a, 3
	
; For each channel:
	inc a
.loop
	push af
	call LoadChannel
	
	ld hl, Channel1Flags - Channel1
	add hl, bc
	set 5, [hl]
	
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 4, [hl]
	
	ld hl, Channel1CryPitch - Channel1
	add hl, bc
	ld a, [CryPitch]
	ld [hli], a
	ld a, [CryEcho]
	ld [hl], a
	
; No tempo for channel 4
	ld a, [CurChannel]
	and a, 3
	cp 3
	jr nc, .start
	
; Tempo is effectively length
	ld hl, Channel1Tempo - Channel1
	add hl, bc
	ld a, [CryLength]
	ld [hli], a
	ld a, [CryLength+1]
	ld [hl], a
.start
	call StartChannel
	ld a, [Crysaudio+$1bc]
	and a
	jr z, .next
	
; Stereo only: Play cry from the monster's side.
; This only applies in-battle.
	
	ld a, [Options]
	bit 5, a ; stereo
	jr z, .next
	
; [Tracks] &= [CryTracks]
	ld hl, Channel1Tracks - Channel1
	add hl, bc
	ld a, [hl]
	ld hl, CryTracks
	and a, [hl]
	ld hl, Channel1Tracks - Channel1
	add hl, bc
	ld [hl], a
	
.next
	pop af
	dec a
	jr nz, .loop
	
	
; Cries play at max volume, so we save the current volume for later.
	ld a, [LastVolume]
	and a
	jr nz, .end
	
	ld a, [Volume]
	ld [LastVolume], a
	ld a, $77
	ld [Volume], a
	
.end
	ld a, 1 ; stop playing music
	ld [SFXPriority], a
	call MusicOn
	ret
; e8c04

_PlaySFX:: ; e8c04
; clear channels if they aren't already
	call MusicOff
	ld hl, Crysaudio+$cc ; Channel5Flags
	bit 0, [hl] ; ch5 on?
	jr z, .ch6
	res 0, [hl] ; turn it off
	xor a
	ld [rNR11], a ; length/wavepattern = 0
	ld a, $08
	ld [rNR12], a ; envelope = 0
	xor a
	ld [rNR13], a ; frequency lo = 0
	ld a, $80
	ld [rNR14], a ; restart sound (freq hi = 0)
	xor a
	ld [SoundInput], a ; global sound off
	ld [rNR10], a ; sweep = 0
.ch6
	ld hl, Crysaudio+$fe ; ch6 on?
	bit 0, [hl]
	jr z, .ch7
	res 0, [hl] ; turn it off
	xor a
	ld [rNR21], a ; length/wavepattern = 0
	ld a, $08
	ld [rNR22], a ; envelope = 0
	xor a
	ld [rNR23], a ; frequency lo = 0
	ld a, $80
	ld [rNR24], a ; restart sound (freq hi = 0)
.ch7
	ld hl, Crysaudio+$130 ; ch7 on?
	bit 0, [hl]
	jr z, .ch8
	res 0, [hl] ; turn it off
	xor a
	ld [rNR30], a ; sound mode #3 off
	ld [rNR31], a ; length/wavepattern = 0
	ld a, $08
	ld [rNR32], a ; envelope = 0
	xor a
	ld [rNR33], a ; frequency lo = 0
	ld a, $80
	ld [rNR34], a ; restart sound (freq hi = 0)
.ch8
	ld hl, Crysaudio+$162 ; ch8 on?
	bit 0, [hl]
	jr z, .chscleared
	res 0, [hl] ; turn it off
	xor a
	ld [rNR41], a ; length/wavepattern = 0
	ld a, $08
	ld [rNR42], a ; envelope = 0
	xor a
	ld [rNR43], a ; frequency lo = 0
	ld a, $80
	ld [rNR44], a ; restart sound (freq hi = 0)
	xor a
	ld [NoiseSampleAddressLo], a
	ld [NoiseSampleAddressHi], a
.chscleared
; start reading sfx header for # chs
	ld hl, MusicID
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SFX
	add hl, de ; three
	add hl, de ; byte
	add hl, de ; pointers
	; get bank
	ld a, [hli]
	ld [MusicBank], a
	; get address
	ld e, [hl]
	inc hl
	ld d, [hl]
	; get # channels
	call LoadMusicByte
	rlca ; top 2
	rlca ; bits
	and a, $03
	inc a ; # channels -> # loops
.startchannels
	push af
	call LoadChannel ; bc = current channel
	ld hl, Channel1Flags - Channel1
	add hl, bc
	set 3, [hl]
	call StartChannel
	pop af
	dec a
	jr nz, .startchannels
	call MusicOn
	xor a
	ld [SFXPriority], a
	ret
; e8ca6


PlayStereoSFX:: ; e8ca6
; play sfx de

	call MusicOff
	
; standard procedure if stereo's off
	ld a, [Options]
	bit 5, a
	jp z, _PlaySFX
	
; else, let's go ahead with this
	ld hl, MusicID
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
	ld [MusicBank], a
; address
	ld e, [hl]
	inc hl
	ld d, [hl]
	
; bit 2-3
	call LoadMusicByte
	rlca
	rlca
	and 3 ; ch1-4
	inc a
	
.loop
	push af
	call LoadChannel
	
	ld hl, Channel1Flags - Channel1
	add hl, bc
	set 3, [hl]
	
	push de
	; get tracks for this channel
	ld a, [CurChannel]
	and 3 ; ch1-4
	ld e, a
	ld d, $0
	call GetLRTracks
	add hl, de
	ld a, [hl]
	ld hl, Crysaudio+$1bc
	and [hl]
	
	ld hl, Channel1Tracks - Channel1
	add hl, bc
	ld [hl], a
	
	ld hl, $0030 ; Crysaudio+$31 - Channel1
	add hl, bc
	ld [hl], a
	
	ld a, [CryTracks]
	cp 2 ; ch 1-2
	jr c, .asm_e8d0c
	
; ch3-4
	ld a, [Crysaudio+$1be]
	
	ld hl, $002e ; Crysaudio+$2f - Channel1
	add hl, bc
	ld [hl], a
	
	ld hl, $002f ; Crysaudio+$30 - Channel1
	add hl, bc
	ld [hl], a
	
	ld hl, Channel1Flags2 - Channel1
	add hl, bc
	set 7, [hl]
	
.asm_e8d0c
	pop de
	
; turn channel on
	ld hl, Channel1Flags - Channel1
	add hl, bc
	set 0, [hl] ; on
	
; done?
	pop af
	dec a
	jr nz, .loop
	
; we're done
	call MusicOn
	ret
; e8d1b


LoadChannel: ; e8d1b
; prep channel for use
; input:
; 	de:
	; get pointer to current channel
	call LoadMusicByte
	inc de
	and a, $07 ; bit 0-2 (current channel)
	ld [CurChannel], a
	ld c, a
	ld b, $00
	ld hl, ChannelPointers
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl] ; bc = channel pointer
	ld hl, Channel1Flags - Channel1
	add hl, bc
	res 0, [hl] ; channel off
	call ChannelInit
	; load music pointer
	ld hl, Channel1MusicAddress - Channel1
	add hl, bc
	call LoadMusicByte
	ld [hli], a
	inc de
	call LoadMusicByte
	ld [hl], a
	inc de
	; load music id
	ld hl, Channel1MusicID - Channel1
	add hl, bc
	ld a, [MusicIDLo]
	ld [hli], a
	ld a, [MusicIDHi]
	ld [hl], a
	; load music bank
	ld hl, Channel1MusicBank - Channel1
	add hl, bc
	ld a, [MusicBank]
	ld [hl], a
	ret
; e8d5b

ChannelInit: ; e8d5b
; make sure channel is cleared
; set default tempo and note length in case nothing is loaded
; input:
;   bc = channel struct pointer
	push de
	xor a
	; get channel struct location and length
	ld hl, Channel1MusicID - Channel1 ; start
	add hl, bc
	ld e, Channel2 - Channel1 ; channel struct length
	; clear channel
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	; set tempo to default ($100)
	ld hl, Channel1Tempo - Channel1
	add hl, bc
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	; set note length to default ($01) (fast)
	ld hl, Channel1NoteLength - Channel1
	add hl, bc
	ld [hl], a
	pop de
	ret
; e8d76

LoadMusicByte:: ; e8d76
; input:
;   de = current music address
; output:
;   a = CurMusicByte
	ld a, [MusicBank]
	call _LoadMusicByte
	ld a, [CurMusicByte]
	ret
; e8d80

FrequencyTable: ; e8d80
	dw $0000 ; filler
	dw $f82c
	dw $f89d
	dw $f907
	dw $f96b
	dw $f9ca
	dw $fa23
	dw $fa77
	dw $fac7
	dw $fb12
	dw $fb58
	dw $fb9b
	dw $fbda
	dw $fc16
	dw $fc4e
	dw $fc83
	dw $fcb5
	dw $fce5
	dw $fd11
	dw $fd3b
	dw $fd63
	dw $fd89
	dw $fdac
	dw $fdcd
	dw $fded
; e8db2

WaveSamples: ; e8db2
	; these are streams of 32 4-bit values used as wavepatterns
	; nothing interesting here!
	db $02, $46, $8a, $ce, $ff, $fe, $ed, $dc, $cb, $a9, $87, $65, $44, $33, $22, $11
	db $02, $46, $8a, $ce, $ef, $ff, $fe, $ee, $dd, $cb, $a9, $87, $65, $43, $22, $11
	db $13, $69, $bd, $ee, $ee, $ff, $ff, $ed, $de, $ff, $ff, $ee, $ee, $db, $96, $31
	db $02, $46, $8a, $cd, $ef, $fe, $de, $ff, $ee, $dc, $ba, $98, $76, $54, $32, $10
	db $01, $23, $45, $67, $8a, $cd, $ee, $f7, $7f, $ee, $dc, $a8, $76, $54, $32, $10
	db $00, $11, $22, $33, $44, $33, $22, $11, $ff, $ee, $cc, $aa, $88, $aa, $cc, $ee
	db $02, $46, $8a, $ce, $cb, $a9, $87, $65, $ff, $fe, $ed, $dc, $44, $33, $22, $11
	db $c0, $a9, $87, $f5, $ff, $fe, $ed, $dc, $44, $33, $22, $f1, $02, $46, $8a, $ce
	db $44, $33, $22, $1f, $00, $46, $8a, $ce, $f8, $fe, $ed, $dc, $cb, $a9, $87, $65
	db $11, $00, $00, $08, $00, $13, $57, $9a, $b4, $ba, $a9, $98, $87, $65, $43, $21
	db $79, $bd, $ff, $ff, $ff, $ff, $fd, $b9, $75, $31, $00, $00, $00, $00, $01, $35
	db $01, $12, $23, $34, $45, $56, $67, $77, $88, $99, $aa, $bb, $cc, $dd, $ee, $ff
	db $46, $8a, $cc, $cc, $cc, $cc, $ca, $86, $42, $11, $00, $00, $00, $00, $01, $12
	db $7a, $df, $ff, $da, $74, $10, $00, $14, $7a, $df, $ff, $da, $74, $10, $00, $14
	db $ee, $ee, $ee, $ee, $ee, $ee, $ee, $ee, $00, $00, $00, $00, $00, $00, $00, $00
	db $ee, $ee, $ee, $ee, $ee, $ee, $ed, $cb, $21, $00, $00, $00, $00, $00, $00, $00
; e8e52

NoiseSampleSetsPointers: ; e8e52
	dw NoiseSampleSets0
	dw NoiseSampleSets1
	dw NoiseSampleSets2
	dw NoiseSampleSets3
	dw NoiseSampleSets4
	dw NoiseSampleSets5
	dw NoiseSampleSets6
; e8e5e

NoiseSampleSets:
NoiseSampleSets0: ; e8e5e
	dw NoiseSampleSet00 ; rest
	dw NoiseSampleSet01 ; c
	dw NoiseSampleSet02 ; c#
	dw NoiseSampleSet03 ; d
	dw NoiseSampleSet04 ; d#
	dw NoiseSampleSet05 ; e
	dw NoiseSampleSet06 ; f
	dw NoiseSampleSet07 ; f#
	dw NoiseSampleSet08 ; g
	dw NoiseSampleSet09 ; g#
	dw NoiseSampleSet10 ; a
	dw NoiseSampleSet11 ; a#
	dw NoiseSampleSet12 ; b
NoiseSampleSets1: ; e8e78
	dw NoiseSampleSet00
	dw NoiseSampleSet08
	dw NoiseSampleSet09
	dw NoiseSampleSet10
	dw NoiseSampleSet11
	dw NoiseSampleSet12
	dw NoiseSampleSet13
	dw NoiseSampleSet14
	dw NoiseSampleSet15
	dw NoiseSampleSet16
	dw NoiseSampleSet17
	dw NoiseSampleSet18
	dw NoiseSampleSet19
NoiseSampleSets2: ; e8e92
	dw NoiseSampleSet00
	dw NoiseSampleSet01
	dw NoiseSampleSet17
	dw NoiseSampleSet18
	dw NoiseSampleSet19
	dw NoiseSampleSet05
	dw NoiseSampleSet06
	dw NoiseSampleSet07
	dw NoiseSampleSet08
	dw NoiseSampleSet09
	dw NoiseSampleSet10
	dw NoiseSampleSet11
	dw NoiseSampleSet12
NoiseSampleSets3: ; e8eac
	dw NoiseSampleSet21
	dw NoiseSampleSet22
	dw NoiseSampleSet23
	dw NoiseSampleSet24
	dw NoiseSampleSet25
	dw NoiseSampleSet26
	dw NoiseSampleSet20
	dw NoiseSampleSet27
	dw NoiseSampleSet28
	dw NoiseSampleSet29
	dw NoiseSampleSet21
	dw NoiseSampleSet37
	dw NoiseSampleSet34
NoiseSampleSets4: ; e8ec6
	dw NoiseSampleSet21
	dw NoiseSampleSet20
	dw NoiseSampleSet23
	dw NoiseSampleSet24
	dw NoiseSampleSet25
	dw NoiseSampleSet33
	dw NoiseSampleSet26
	dw NoiseSampleSet35
	dw NoiseSampleSet31
	dw NoiseSampleSet32
	dw NoiseSampleSet36
	dw NoiseSampleSet37
	dw NoiseSampleSet30
NoiseSampleSets5: ; e8ee0
	dw NoiseSampleSet00
	dw NoiseSampleSet17
	dw NoiseSampleSet18
	dw NoiseSampleSet19
	dw NoiseSampleSet27
	dw NoiseSampleSet28
	dw NoiseSampleSet29
	dw NoiseSampleSet05
	dw NoiseSampleSet06
	dw NoiseSampleSet30
	dw NoiseSampleSet24
	dw NoiseSampleSet23
	dw NoiseSampleSet37
NoiseSampleSets6:
	dw NoiseSampleSet00
	dw NoiseSampleSet37
	dw NoiseSampleSet17
	dw NoiseSampleSet18
	dw NoiseSampleSet19
	dw NoiseSampleSet34
	dw NoiseSampleSet30
	dw NoiseSampleSet17
	dw NoiseSampleSet17
	dw NoiseSampleSet17
	dw NoiseSampleSet17
	dw NoiseSampleSet17
; e8efa

NoiseSampleSet00: ; e8efa
; unused
	db $20, $11, $00
	db $ff ; end
; e8efe

NoiseSampleSet01: ; e8efe
	db $20, $c1, $33
	db $ff ; end
; e8f02

NoiseSampleSet02: ; e8f02
	db $20, $b1, $33
	db $ff ; end
; e8f06

NoiseSampleSet03: ; e8f06
	db $20, $a1, $33
	db $ff ; end
; e8f0a

NoiseSampleSet04: ; e8f0a
	db $20, $81, $33
	db $ff ; end
; e8f0e

NoiseSampleSet05: ; e8f0e
	db $27, $84, $37
	db $26, $84, $36
	db $25, $83, $35
	db $24, $83, $34
	db $23, $82, $33
	db $22, $81, $32
	db $ff ; end
; e8f21

NoiseSampleSet06: ; e8f21
	db $20, $51, $2a
	db $ff ; end
; e8f25

NoiseSampleSet07: ; e8f25
	db $21, $41, $2b
	db $20, $61, $2a
	db $ff ; end
; e8f2c

NoiseSampleSet08: ; e8f2c
	db $20, $81, $10
	db $ff ; end
; e8f30

NoiseSampleSet09: ; e8f30
	db $20, $82, $23
	db $ff ; end
; e8f34

NoiseSampleSet10: ; e8f34
	db $20, $82, $25
	db $ff ; end
; e8f38

NoiseSampleSet11: ; e8f38
	db $20, $82, $26
	db $ff ; end
; e8f3c

NoiseSampleSet12: ; e8f3c
	db $20, $a1, $10
	db $ff ; end
; e8f40

NoiseSampleSet13: ; e8f40
	db $20, $a2, $11
	db $ff ; end
; e8f44

NoiseSampleSet14: ; e8f44
	db $20, $a2, $50
	db $ff ; end
; e8f48

NoiseSampleSet15: ; e8f48
	db $20, $a1, $18
	db $20, $31, $33
	db $ff ; end
; e8f4f

NoiseSampleSet16: ; e8f4f
	db $22, $91, $28
	db $20, $71, $18
	db $ff ; end
; e8f56

NoiseSampleSet17: ; e8f56
	db $20, $91, $22
	db $ff ; end
; e8f5a

NoiseSampleSet18: ; e8f5a
	db $20, $71, $22
	db $ff ; end
; e8f5e

NoiseSampleSet19: ; e8f5e
	db $20, $61, $22
	db $ff ; end
; e8f62

NoiseSampleSet20: ; e8f62
	db $20, $11, $11
	db $ff ; end
; e8f66

NoiseSampleSet21: ; e8f66
	db $ff
; e8f67

NoiseSampleSet22: ; e8f67
	db $20, $91, $33
	db $ff ; end
; e8f6b

NoiseSampleSet23: ; e8f6b
	db $20, $51, $32
	db $ff ; end
; e8f6f

NoiseSampleSet24: ; e8f6f
	db $20, $81, $31
	db $ff ; end
; e8f73

NoiseSampleSet25: ; e8f73
	db $20, $88, $6b
	db $20, $71, $00
	db $ff ; end
; e8f7a

NoiseSampleSet26: ; e8f7a
	db $30, $91, $18
	db $ff ; end
; e8f7e

NoiseSampleSet27: ; e8f7e
	db $27, $92, $10
	db $ff ; end
; e8f82

NoiseSampleSet28: ; e8f82
	db $33, $91, $00
	db $33, $11, $00
	db $ff ; end
; e8f89

NoiseSampleSet29: ; e8f89
	db $33, $91, $11
	db $33, $11, $00
	db $ff ; end
; e8f90

NoiseSampleSet30: ; e8f90
	db $33, $88, $15
	db $20, $65, $12
	db $ff ; end
; e8f97

NoiseSampleSet31: ; e8f97
	db $33, $51, $21
	db $33, $11, $11
	db $ff ; end
; e8f9e

NoiseSampleSet32: ; e8f9e
	db $33, $51, $50
	db $33, $11, $11
	db $ff ; end
; e8fa5

NoiseSampleSet33: ; e8fa5
	db $20, $a1, $31
	db $ff ; end
; e8fa9

NoiseSampleSet34: ; e8fa9
	db $20, $84, $12
	db $ff ; end
; e8fad

NoiseSampleSet35: ; e8fad
	db $33, $81, $00
	db $33, $11, $00
	db $ff ; end
; e8fb4

NoiseSampleSet36: ; e8fb4
	db $33, $81, $21
	db $33, $11, $11
	db $ff ; end
; e8fbb

NoiseSampleSet37: ; e8fbb
	db $20, $a8, $6b
	db $20, $71, $00
	db $ff ; end
; e8fc2

GetLRTracks: ; e8fc2
; gets the default sound l/r channels
; stores mono/stereo table in hl
	ld a, [Options]
	bit 5, a ; stereo
	; made redundant, could have had a purpose in gold
	jr nz, .stereo
	ld hl, MonoTracks
	ret
.stereo
	ld hl, StereoTracks
	ret
; e8fd1

MonoTracks: ; e8fd1
; bit corresponds to track #
; hi: left channel
; lo: right channel
	db $11, $22, $44, $88
; e8fd5

StereoTracks: ; e8fd5
; made redundant
; seems to be modified on a per-song basis
	db $11, $22, $44, $88
; e8fd9

ChannelPointers: ; e8fd9
; music channels
	dw Channel1
	dw Channel2
	dw Channel3
	dw Channel4
; sfx channels
	dw Channel5
	dw Channel6
	dw Channel7
	dw Channel8
; e8fe9

ClearChannels:: ; e8fe9
; runs ClearChannel for all 4 channels
; doesn't seem to be used, but functionally identical to SoundRestart
	ld hl, rNR50
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld hl, rNR10
	ld e, $04
.loop
	call ClearChannel
	dec e
	jr nz, .loop
	ret
; e8ffe

ClearChannel: ; e8ffe
; input: hl = beginning hw sound register (rNR10, $ff15, rNR30, $ff1f)
; output: 00 00 80 00 80

;   sound channel   1      2      3      4
	xor a
	ld [hli], a ; rNR10, $ff15, rNR30, $ff1f ; sweep = 0

	ld [hli], a ; rNR11, rNR21, rNR31, rNR41 ; length/wavepattern = 0
	ld a, $08
	ld [hli], a ; rNR12, rNR22, rNR32, rNR42 ; envelope = 0
	xor a
	ld [hli], a ; rNR13, rNR23, rNR33, rNR43 ; frequency lo = 0
	ld a, $80
	ld [hli], a ; rNR14, rNR24, rNR34, rNR44 ; restart sound (freq hi = 0)
	ret
; e900a
