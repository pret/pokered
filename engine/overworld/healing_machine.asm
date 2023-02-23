; PureRGBnote: ADDED: function updated so holding B when talking to the pokemon center nurse speeds up the healing process.
;                     wUnusedC000 is set earlier in pokemon center code and indicates whether to speed things up or not.
AnimateHealingMachine:
	ld de, PokeCenterFlashingMonitorAndHealBall
	ld hl, vChars0 tile $7c
	lb bc, BANK(PokeCenterFlashingMonitorAndHealBall), 3 ; should be 2
	call CopyVideoData
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ldh a, [rOBP1]
	push af
	ld a, $e0
	ldh [rOBP1], a
	call UpdateGBCPal_OBP1
	ld hl, wShadowOAMSprite33
	ld de, PokeCenterOAMData
	call CopyHealingMachineOAM
	ld c, 30
	ld a, [wUnusedC000]
	and a
	jr nz, .noFadeout ; NEW: if you're holding b when you start talking to the nurse, it'll do healing faster
	ld a, 4
	ld [wAudioFadeOutControl], a
.noFadeout
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
.waitLoop
	ld a, [wAudioFadeOutControl]
	and a ; is fade-out finished?
	jr nz, .waitLoop ; if not, check again
	ld a, [wPartyCount]
	ld b, a
.partyLoop
	call CopyHealingMachineOAM
	ld a, SFX_HEALING_MACHINE
	call PlaySound
	ld a, [wUnusedC000]
	and a
	jr nz, .shortDelay ; NEW: if you're holding b when you start talking to the nurse, it'll do healing faster
	ld c, 30
	jr .doDelay
.shortDelay
	ld c, 5
.doDelay	
	rst DelayFramesRST
	dec b
	jr nz, .partyLoop
	ld a, [wAudioROMBank]
	cp BANK("Audio Engine 3")
	ld [wAudioSavedROMBank], a
	jr nz, .next
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld a, BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
.next
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
	ld d, $28
	call FlashSprite8Times
.waitLoop2
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED ; is the healed music still playing?
	jr z, .waitLoop2 ; if so, check gain
	ld c, 32
	rst DelayFramesRST
	pop af
	ldh [rOBP1], a
	call UpdateGBCPal_OBP1 ; shinpokerednote: gbcnote: gbc color code from yellow 
	pop hl
	pop af
	ld [hl], a
	jp UpdateSprites

PokeCenterFlashingMonitorAndHealBall:
	INCBIN "gfx/overworld/heal_machine.2bpp"

PokeCenterOAMData:
; shinpokerednote: gbcnote: updated for GBC
	db $24,$34,$7C,$14 ; heal machine monitor
	db $2B,$30,$7D,$14 ; pokeballs 1-6
	db $2B,$38,$7D,$34
	db $30,$30,$7D,$14
	db $30,$38,$7D,$34
	db $35,$30,$7D,$14
	db $35,$38,$7D,$34

; d = value to xor with palette
FlashSprite8Times:
	ld b, 8
.loop
	ldh a, [rOBP1]
	xor d
	ldh [rOBP1], a
	call UpdateGBCPal_OBP1 ; shinpokerednote: gbcnote: gbc color code from yellow 
	ld c, 10
	rst DelayFramesRST
	dec b
	jr nz, .loop
	ret

CopyHealingMachineOAM:
; copy one OAM entry and advance the pointers
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	ret
