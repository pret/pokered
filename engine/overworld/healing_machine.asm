AnimateHealingMachine: ; 70433 (1c:4433)
	ld de, PokeCenterFlashingMonitorAndHealBall
	ld hl, vChars0 + $7c0
	lb bc, BANK(PokeCenterFlashingMonitorAndHealBall), $03
	call CopyVideoData
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ld a, [rOBP1]
	push af
	ld a, $e0
	ld [rOBP1], a
	ld hl, wOAMBuffer + $84
	ld de, PokeCenterOAMData
	call CopyHealingMachineOAM
	ld a, $4
	ld [wMusicHeaderPointer], a
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
.asm_70464
	ld a, [wMusicHeaderPointer]
	and a
	jr nz, .asm_70464
	ld a, [wPartyCount]
	ld b, a
.asm_7046e
	call CopyHealingMachineOAM
	ld a, SFX_HEALING_MACHINE
	call PlaySound
	ld c, 30
	call DelayFrames
	dec b
	jr nz, .asm_7046e
	ld a, [wc0ef]
	cp BANK(Audio3_UpdateMusic)
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
	ld c, 32
	call DelayFrames
	pop af
	ld [rOBP1], a
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

CopyHealingMachineOAM: ; 70503 (1c:4503)
; copy one OAM entry and advance the pointers
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
