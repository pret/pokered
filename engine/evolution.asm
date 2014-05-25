Func_7bde9: ; 7bde9 (1e:7de9)
	push hl
	push de
	push bc
	ld a, [$cf91]
	push af
	ld a, [$d0b5]
	push af
	xor a
	ld [$d083], a
	ld [$c02a], a
	dec a
	ld [$c0ee], a
	call PlaySound
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, (SFX_08_3c - SFX_Headers_08) / 3
	call PlaySound
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld [$ffd7], a
	ld a, [$cee9]
	ld [$cf1d], a
	ld c, $0
	call Func_7beb4
	ld a, [$ceea]
	ld [$cf91], a
	ld [$d0b5], a
	call Func_7beb9
	ld de, $9000
	ld hl, $9310
	ld bc, $31
	call CopyVideoData
	ld a, [$cee9]
	ld [$cf91], a
	ld [$d0b5], a
	call Func_7beb9
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, [$cee9]
	call PlayCry
	call WaitForSoundToFinish
	ld c, BANK(Music_SafariZone)
	ld a, MUSIC_SAFARI_ZONE
	call PlayMusic
	ld c, $50
	call DelayFrames
	ld c, $1
	call Func_7beb4
	ld bc, $110
.asm_7be63
	push bc
	call asm_7befa
	jr c, .asm_7bea9
	call asm_7bec2
	pop bc
	inc b
	dec c
	dec c
	jr nz, .asm_7be63
	xor a
	ld [$ceec], a
	ld a, $31
	ld [$ceeb], a
	call Func_7bed6
	ld a, [$ceea]
.asm_7be81
	ld [$cf1d], a
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld a, [$cf1d]
	call PlayCry
	ld c, $0
	call Func_7beb4
	pop af
	ld [$d0b5], a
	pop af
	ld [$cf91], a
	pop bc
	pop de
	pop hl
	ld a, [$ceec]
	and a
	ret z
	scf
	ret
.asm_7bea9
	pop bc
	ld a, $1
	ld [$ceec], a
	ld a, [$cee9]
	jr .asm_7be81

Func_7beb4: ; 7beb4 (1e:7eb4)
	ld b, $b
	jp GoPAL_SET

Func_7beb9: ; 7beb9 (1e:7eb9)
	call GetMonHeader
	FuncCoord 7, 2 ; $c3cf
	ld hl, Coord
	jp LoadFlippedFrontSpriteByMonIndex
asm_7bec2: ; 7bec2 (1e:7ec2)
	ld a, $31
	ld [$ceeb], a
	call Func_7bed6
	ld a, $cf
	ld [$ceeb], a
	call Func_7bed6
	dec b
	jr nz, asm_7bec2
	ret

Func_7bed6: ; 7bed6 (1e:7ed6)
	push bc
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	FuncCoord 7, 2 ; $c3cf
	ld hl, Coord
	ld bc, $707
	ld de, $d
.asm_7bee3
	push bc
.asm_7bee4
	ld a, [$ceeb]
	add [hl]
	ld [hli], a
	dec c
	jr nz, .asm_7bee4
	pop bc
	add hl, de
	dec b
	jr nz, .asm_7bee3
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	pop bc
	ret
asm_7befa: ; 7befa (1e:7efa)
	call DelayFrame
	push bc
	call JoypadLowSensitivity
	ld a, [$ffb5]
	pop bc
	and $2
	jr nz, .asm_7bf0d
.asm_7bf08
	dec c
	jr nz, asm_7befa
	and a
	ret
.asm_7bf0d
	ld a, [$ccd4]
	and a
	jr nz, .asm_7bf08
	scf
	ret
