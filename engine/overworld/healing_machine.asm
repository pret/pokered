AnimateHealingMachine: ; 70433 (1c:4433)
	ld de, PokeCenterFlashingMonitorAndHealBall ; $44b7
	ld hl, vChars0 + $7c0
	ld bc, (BANK(PokeCenterFlashingMonitorAndHealBall) << 8) + $03
	call CopyVideoData
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ld a, [rOBP1] ; $ff49
	push af
	ld a, $e0
	ld [rOBP1], a ; $ff49
	ld hl, wOAMBuffer + $84
	ld de, PokeCenterOAMData ; $44d7
	call Func_70503
	ld a, $4
	ld [wMusicHeaderPointer], a
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
.asm_70464
	ld a, [wMusicHeaderPointer]
	and a
	jr nz, .asm_70464
	ld a, [wPartyCount] ; wPartyCount
	ld b, a
.asm_7046e
	call Func_70503
	ld a, (SFX_02_4a - SFX_Headers_02) / 3
	call PlaySound
	ld c, $1e
	call DelayFrames
	dec b
	jr nz, .asm_7046e
	ld a, [wc0ef]
	cp BANK(Music1f_UpdateMusic)
	ld [wc0f0], a
	jr nz, .asm_70495
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld a, BANK(Music_PkmnHealed)
	ld [wc0ef], a
.asm_70495
	ld a, MUSIC_PKMN_HEALED
	ld [wc0ee], a
	call PlaySound
	ld d, $28
	call FlashSprite8Times
.asm_704a2
	ld a, [wc026]
	cp MUSIC_PKMN_HEALED
	jr z, .asm_704a2
	ld c, $20
	call DelayFrames
	pop af
	ld [rOBP1], a ; $ff49
	pop hl
	pop af
	ld [hl], a
	jp UpdateSprites

PokeCenterFlashingMonitorAndHealBall: ; 704b7 (1c:44b7)
	INCBIN "gfx/pokecenter_ball.2bpp"

PokeCenterOAMData: ; 704d7 (1c:44d7)
	db $24,$34,$7C,$10 ; heal machine monitor
	db $2B,$30,$7D,$10 ; pokeballs 1-6
	db $2B,$38,$7D,$30
	db $30,$30,$7D,$10
	db $30,$38,$7D,$30
	db $35,$30,$7D,$10
	db $35,$38,$7D,$30

; d = value to xor with palette
FlashSprite8Times: ; 704f3 (1c:44f3)
	ld b, 8
.loop
	ld a, [rOBP1]
	xor d
	ld [rOBP1], a
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .loop
	ret

Func_70503: ; 70503 (1c:4503)
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ret
