ShakeElevator::
	ld de, -$20
	call ShakeElevatorRedrawRow
	ld de, SCREEN_HEIGHT * $20
	call ShakeElevatorRedrawRow
	call Delay3
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ldh a, [hSCY]
	ld d, a
	ld e, $1
	ld b, 100
.shakeLoop ; scroll the BG up and down and play a sound effect
	ld a, e
	xor $fe
	ld e, a
	add d
	ldh [hSCY], a
	push bc
	ld c, BANK(SFX_Collision_1)
	ld a, SFX_COLLISION
	call PlayMusic
	pop bc
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .shakeLoop
	ld a, d
	ldh [hSCY], a
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, BANK(SFX_Safari_Zone_PA)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic
.musicLoop
	ld a, [wChannelSoundIDs + CHAN5]
	cp SFX_SAFARI_ZONE_PA
	jr z, .musicLoop
	call UpdateSprites
	jp PlayDefaultMusic

ShakeElevatorRedrawRow:
; Redraws slightly above the top and bottom edges of the screen in the bgmap
; This prevents small white lines from showing during the shaking animation if the bgmap hasn't been loaded outside the boundaries of the screen yet
; (For example, after loading a save in an elevator)
	ld hl, wMapViewVRAMPointer + 1
	ld a, [hld]
	push af
	ld a, [hl]
	push af
	push hl
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, h
	and $3
	or HIGH(vBGMap0)
	ld d, a
	ld a, l
	pop hl
	ld [hli], a
	ld [hl], d
	call ScheduleNorthRowRedraw
	pop hl
	pop af
	ld [hli], a
	pop af
	ld [hl], a
	jp Delay3
