AnimateHealingMachine:
	xor a
	call PlayMusic

	ld de, PokeCenterFlashingMonitorAndHealBall
	ld hl, vChars0 + $7c0
	lb bc, BANK(PokeCenterFlashingMonitorAndHealBall), $03 ; loads one too many tiles
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

;	ld a, 4
;	ld [wAudioFadeOutControl], a
;	ld a, $ff
;	ld [wNewSoundID], a
;	call PlaySound
;.waitLoop
;	ld a, [wAudioFadeOutControl]
;	and a ; is fade-out finished?
;	jr nz, .waitLoop ; if not, check again

	ld a, [wPartyCount]
	ld b, a
.partyLoop
	call CopyHealingMachineOAM
	ld a, SFX_HEALING_MACHINE
	call PlaySound
	ld c, 30
	call DelayFrames
	dec b
	jr nz, .partyLoop
	ld a, [wAudioROMBank]
	cp $1f ; 0 ; BANK(Audio3_UpdateMusic) XXXXX
	ld [wAudioSavedROMBank], a
	jr nz, .next
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld a, 0 ; BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
.next
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlayMusic
	ld d, $28
	call FlashSprite8Times
.waitLoop2
	ld a, [Channel1MusicID]
	and a
	jr nz, .waitLoop2

	ld c, 32
	call DelayFrames
	pop af
	ld [rOBP1], a
	pop hl
	pop af
	ld [hl], a
	
	
	jp UpdateSprites

PokeCenterFlashingMonitorAndHealBall:
	INCBIN "gfx/pokecenter_ball.2bpp"

PokeCenterOAMData:
	db $24,$34,$7C,$10 ; heal machine monitor
	db $2B,$30,$7D,$10 ; pokeballs 1-6
	db $2B,$38,$7D,$30
	db $30,$30,$7D,$10
	db $30,$38,$7D,$30
	db $35,$30,$7D,$10
	db $35,$38,$7D,$30

; d = value to xor with palette
FlashSprite8Times:
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

CopyHealingMachineOAM:
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
