EvolveMon: ; 7bde9 (1e:7de9)
	push hl
	push de
	push bc
	ld a, [wcf91]
	push af
	ld a, [wd0b5]
	push af
	xor a
	ld [wLowHealthAlarm], a
	ld [wc02a], a
	dec a
	ld [wc0ee], a
	call PlaySound
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, SFX_TINK
	call PlaySound
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld [hTilesetType], a
	ld a, [wEvoOldSpecies]
	ld [wcf1d], a
	ld c, $0
	call EvolutionSetWholeScreenPalette
	ld a, [wEvoNewSpecies]
	ld [wcf91], a
	ld [wd0b5], a
	call Evolution_LoadPic
	ld de, vFrontPic
	ld hl, vBackPic
	ld bc, 7 * 7
	call CopyVideoData
	ld a, [wEvoOldSpecies]
	ld [wcf91], a
	ld [wd0b5], a
	call Evolution_LoadPic
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, [wEvoOldSpecies]
	call PlayCry
	call WaitForSoundToFinish
	ld c, BANK(Music_SafariZone)
	ld a, MUSIC_SAFARI_ZONE
	call PlayMusic
	ld c, 80
	call DelayFrames
	ld c, $1
	call EvolutionSetWholeScreenPalette
	ld bc, $110
.animLoop
	push bc
	call Evolution_CheckForCancel
	jr c, .evolutionCancelled
	call Evolution_BackAndForthAnim
	pop bc
	inc b
	dec c
	dec c
	jr nz, .animLoop
	xor a
	ld [wEvoCancelled], a
	ld a, $31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic ; show the new species pic
	ld a, [wEvoNewSpecies]
.done
	ld [wcf1d], a
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld a, [wcf1d]
	call PlayCry
	ld c, $0
	call EvolutionSetWholeScreenPalette
	pop af
	ld [wd0b5], a
	pop af
	ld [wcf91], a
	pop bc
	pop de
	pop hl
	ld a, [wEvoCancelled]
	and a
	ret z
	scf
	ret
.evolutionCancelled
	pop bc
	ld a, 1
	ld [wEvoCancelled], a
	ld a, [wEvoOldSpecies]
	jr .done

EvolutionSetWholeScreenPalette: ; 7beb4 (1e:7eb4)
	ld b, $b
	jp GoPAL_SET

Evolution_LoadPic: ; 7beb9 (1e:7eb9)
	call GetMonHeader
	coord hl, 7, 2
	jp LoadFlippedFrontSpriteByMonIndex

Evolution_BackAndForthAnim: ; 7bec2 (1e:7ec2)
; show the mon change back and forth between the new and old species b times
	ld a, $31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic
	ld a, -$31
	ld [wEvoMonTileOffset], a
	call Evolution_ChangeMonPic
	dec b
	jr nz, Evolution_BackAndForthAnim
	ret

Evolution_ChangeMonPic: ; 7bed6 (1e:7ed6)
	push bc
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	coord hl, 7, 2
	lb bc, 7, 7
	ld de, SCREEN_WIDTH - 7
.loop
	push bc
.innerLoop
	ld a, [wEvoMonTileOffset]
	add [hl]
	ld [hli], a
	dec c
	jr nz, .innerLoop
	pop bc
	add hl, de
	dec b
	jr nz, .loop
	ld a, 1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	pop bc
	ret

Evolution_CheckForCancel: ; 7befa (1e:7efa)
	call DelayFrame
	push bc
	call JoypadLowSensitivity
	ld a, [hJoy5]
	pop bc
	and B_BUTTON
	jr nz, .pressedB
.notAllowedToCancel
	dec c
	jr nz, Evolution_CheckForCancel
	and a
	ret
.pressedB
	ld a, [wForceEvolution]
	and a
	jr nz, .notAllowedToCancel
	scf
	ret
