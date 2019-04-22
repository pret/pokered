PlayDefaultMusic::
	call WaitForSoundToFinish
	xor a
	ld c, a
	ld d, a
	ld [wLastMusicSoundID], a
	jr PlayDefaultMusicCommon

PlayDefaultMusicFadeOutCurrent::
; Fade out the current music and then play the default music.
	ld c, 10
	ld d, 0
	ld a, [wd72e]
	bit 5, a ; has a battle just ended?
	jr z, PlayDefaultMusicCommon
	xor a
	ld [wLastMusicSoundID], a
	ld c, 8
	ld d, c

PlayDefaultMusicCommon::
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .walking
	cp $2
	jr z, .surfing
	ld a, MUSIC_BIKE_RIDING
	jr .next

.surfing
	ld a, MUSIC_SURFING

.next
	ld b, a
	ld a, d
	and a ; should current music be faded out first?
	ld a, 0 ; BANK(Music_BikeRiding)
	jr nz, .next2

; Only change the audio ROM bank if the current music isn't going to be faded
; out before the default music begins.
	ld [wAudioROMBank], a

.next2
; [wAudioSavedROMBank] will be copied to [wAudioROMBank] after fading out the
; current music (if the current music is faded out).
	ld [wAudioSavedROMBank], a
	jr .next3

.walking
	ld a, [wMapMusicSoundID]
	ld b, a
;	call CompareMapMusicBankWithCurrentBank
	jr c, .next4

.next3
	ld a, [wLastMusicSoundID]
	cp b ; is the default music already playing?
	ret z ; if so, do nothing

.next4
	ld a, c
	ld [wAudioFadeOutControl], a
	ld a, b
	ld [wLastMusicSoundID], a
	ld [wNewSoundID], a

	ld [wMusicFadeID], a
	ld a, 8
	ld [wMusicFade], a
	;call FadeMusic ; called in updatemusic
	ret

;UpdateMusic6Times::
;CompareMapMusicBankWithCurrentBank:
;	ret

; plays music or SFX specified by a. If value is $ff, music is stopped
PlaySound::
	push de
	cp $ff
	jr nz, .notff
	xor a
	call PlayMusic
	pop de
	ret
.notff
	ld e, a
	xor a
	ld d, a
	call PlaySFX
	pop de
	ret

OpenSRAMForSound::
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ret

;MapSetup_Sound_Off::
;	push hl
;	push de
;	push bc
;	push af
;
;	call OpenSRAMForSound
;
;	ldh a, [hROMBank]
;	push af
;	ld a, BANK(_MapSetup_Sound_Off)
;	ldh [hROMBank], a
;	ld [MBC1RomBank], a
;
;	call _MapSetup_Sound_Off
;
;	pop af
;	ldh [hROMBank], a
;	ld [MBC1RomBank], a
;
;	pop af
;	pop bc
;	pop de
;	pop hl
;	ret

UpdateSound::
;	push hl
;	push de
;	push bc
;	push af

	ld a, [wHaltAudio]
	and a
	ret nz

	ldh a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	call _UpdateSound

	pop af
	ldh [hROMBank], a
	ld [MBC1RomBank], a

;	pop af
;	pop bc
;	pop de
;	pop hl
	ret

_LoadMusicByte::
; wCurMusicByte = [a:de]
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(LoadMusicByte)

	ldh [hROMBank], a
	ld [MBC1RomBank], a
	ret

PlayMusic::
	ld e, a
	xor a
	ld d, a
; Play music de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic) ; aka BANK(_MapSetup_Sound_Off)
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _MapSetup_Sound_Off

.end
	pop af
	ldh [hROMBank], a
	ld [MBC1RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

;PlayMusic2::
;	ld e, a
;	xor a
;	ld d, a
; Stop playing music, then play music de.
;
;	push hl
;	push de
;	push bc
;	push af
;
;	ldh a, [hROMBank]
;	push af
;	ld a, BANK(_PlayMusic)
;	ldh [hROMBank], a
;	ld [MBC1RomBank], a
;
;	push de
;	ld de, MUSIC_NONE
;	call _PlayMusic
;	call DelayFrame
;	pop de
;	call _PlayMusic
;
;	pop af
;	ldh [hROMBank], a
;	ld [MBC1RomBank], a
;
;	pop af
;	pop bc
;	pop de
;	pop hl
;	ret

PlayCry::
; Play monster a's cry.

	push hl
	push de
	push bc
	push af

	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld e, a
	ld d, 0

	ldh a, [hROMBank]
	push af

	; Cries are stuck in one bank.
	ld a, BANK(PokemonCries)
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	ld hl, PokemonCries
rept 6 ; sizeof(mon_cry)
	add hl, de
endr

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	ld a, BANK(_PlayCry)
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	call _PlayCry

	pop af
	ldh [hROMBank], a
	ld [MBC1RomBank], a
	
	call WaitForSoundToFinish

	pop af
	pop bc
	pop de
	pop hl
	ret

PlaySFX::
; Play sound effect de.
; Sound effects are ordered by priority (lowest to highest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
;	call CheckSFX
;	jr nc, .play

	; Does it have priority?
;	ld a, [wCurSFX]
;	cp e
;	jr c, .done

.play
	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX)
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	ld a, e
	ld [wCurSFX], a
	call _PlaySFX

	pop af
	ldh [hROMBank], a
	ld [MBC1RomBank], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

PlaySoundWaitForCurrent::
WaitPlaySFX::
	push af
	call WaitForSoundToFinish
	pop af
	jp PlaySound

; Wait for sound to finish playing
WaitForSoundToFinish::
WaitSFX::
	ld a, [wDanger]
	and a
	ret nz
	ld a, [wSFXDontWait]
	and a
	ret nz

; infinite loop until sfx is done playing

	push hl

.wait
	ld hl, wChannel5Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel6Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel7Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel8Flags1
	bit 0, [hl]
	jr nz, .wait

	pop hl
	ret

WaitForSongToFinish::
.loop
	call IsSongPlaying
	jr c, .loop
	ret

IsSongPlaying::
; Return carry if any song channels are active.
	ld a, [wChannel1Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel2Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel3Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel4Flags1]
	bit 0, a
	jr nz, .playing
	and a
	ret
.playing
	scf
	ret
