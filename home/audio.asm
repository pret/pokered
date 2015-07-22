PlayDefaultMusic:: ; 2307 (0:2307)
	call WaitForSoundToFinish
	xor a
	ld c, a
	ld d, a
	ld [wcfca], a
	jr Func_2324

Func_2312:: ; 2312 (0:2312)
	ld c, $a
	ld d, $0
	ld a, [wd72e]
	bit 5, a
	jr z, Func_2324
	xor a
	ld [wcfca], a
	ld c, $8
	ld d, c
Func_2324:: ; 2324 (0:2324)
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .asm_2343
	cp $2
	jr z, .asm_2332
	ld a, MUSIC_BIKE_RIDING
	jr .asm_2334
.asm_2332
	ld a, MUSIC_SURFING
.asm_2334
	ld b, a
	ld a, d
	and a
	ld a, BANK(Music_BikeRiding)
	jr nz, .asm_233e
	ld [wc0ef], a
.asm_233e
	ld [wc0f0], a
	jr .asm_234c
.asm_2343
	ld a, [wd35b]
	ld b, a
	call Func_2385
	jr c, .asm_2351
.asm_234c
	ld a, [wcfca]
	cp b
	ret z
.asm_2351
	ld a, c
	ld [wMusicHeaderPointer], a
	ld a, b
	ld [wcfca], a
	ld [wc0ee], a
	jp PlaySound

Func_235f:: ; 235f (0:235f)
	ld a, [wc0ef]
	ld b, a
	cp BANK(Audio1_UpdateMusic)
	jr nz, .checkForAudio2
.audio1
	ld hl, Audio1_UpdateMusic
	jr .asm_2378
.checkForAudio2
	cp BANK(Audio2_UpdateMusic)
	jr nz, .audio3
.audio2
	ld hl, Audio2_UpdateMusic
	jr .asm_2378
.audio3
	ld hl, Audio3_UpdateMusic
.asm_2378
	ld c, $6
.asm_237a
	push bc
	push hl
	call Bankswitch
	pop hl
	pop bc
	dec c
	jr nz, .asm_237a
	ret

Func_2385:: ; 2385 (0:2385)
	ld a, [wd35c]
	ld e, a
	ld a, [wc0ef]
	cp e
	jr nz, .asm_2394
	ld [wc0f0], a
	and a
	ret
.asm_2394
	ld a, c
	and a
	ld a, e
	jr nz, .asm_239c
	ld [wc0ef], a
.asm_239c
	ld [wc0f0], a
	scf
	ret

PlayMusic:: ; 23a1 (0:23a1)
	ld b, a
	ld [wc0ee], a
	xor a
	ld [wMusicHeaderPointer], a
	ld a, c
	ld [wc0ef], a
	ld [wc0f0], a
	ld a, b

; plays music specified by a. If value is $ff, music is stopped
PlaySound:: ; 23b1 (0:23b1)
	push hl
	push de
	push bc
	ld b, a
	ld a, [wc0ee]
	and a
	jr z, .asm_23c8
	xor a
	ld [wc02a], a
	ld [wc02b], a
	ld [wc02c], a
	ld [wc02d], a
.asm_23c8
	ld a, [wMusicHeaderPointer]
	and a
	jr z, .asm_23e3
	ld a, [wc0ee]
	and a
	jr z, .asm_2425
	xor a
	ld [wc0ee], a
	ld a, [wcfca]
	cp $ff
	jr nz, .asm_2414
	xor a
	ld [wMusicHeaderPointer], a
.asm_23e3
	xor a
	ld [wc0ee], a
	ld a, [H_LOADEDROMBANK]
	ld [$ffb9], a
	ld a, [wc0ef]
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	cp BANK(Audio1_9876)
	jr nz, .checkForAudio2
.audio1
	ld a, b
	call Audio1_9876
	jr .asm_240b
.checkForAudio2
	cp BANK(Audio2_22035)
	jr nz, .audio3
.audio2
	ld a, b
	call Audio2_22035
	jr .asm_240b
.audio3
	ld a, b
	call Audio3_7d8ea
.asm_240b
	ld a, [$ffb9]
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	jr .asm_2425
.asm_2414
	ld a, b
	ld [wcfca], a
	ld a, [wMusicHeaderPointer]
	ld [wcfc8], a
	ld [wcfc9], a
	ld a, b
	ld [wMusicHeaderPointer], a
.asm_2425
	pop bc
	pop de
	pop hl
	ret
