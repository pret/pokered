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
	call CompareMapMusicBankWithCurrentBank
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

	ld [MusicFadeID], a
	ld a, 8
	ld [MusicFade], a
	;call FadeMusic ; called in updatemusic
	ret

UpdateMusic6Times::
	;jp UpdateSound
	;ret ; XXX UpdateMusic

CompareMapMusicBankWithCurrentBank:
	ret

; plays <s>music</s>SFX specified by a. If value is $ff, music is stopped
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

;SoundRestart::
;	push hl
;	push de
;	push bc
;	push af
;
;	call OpenSRAMForSound
;
;	ld a, [hROMBank]
;	push af
;	ld a, BANK(_SoundRestart)
;	ld [hROMBank], a
;	ld [MBC1RomBank], a
;
;	call _SoundRestart
;
;	pop af
;	ld [hROMBank], a
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

	ld a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
	ld [hROMBank], a
	ld [MBC1RomBank], a

	call _UpdateSound

	pop af
	ld [hROMBank], a
	ld [MBC1RomBank], a

;	pop af
;	pop bc
;	pop de
;	pop hl
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

	ld a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic) ; and BANK(_SoundRestart)
	ld [hROMBank], a
	ld [MBC1RomBank], a

	call _PlayMusic

	pop af
	ld [hROMBank], a
	ld [MBC1RomBank], a
	jr PopAllRet


PlayCry::
; Play monster a's cry.
; Play a cry given parameters in header de

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

; Save current bank
	ld a, [hROMBank]
	push af

; Cry headers are stuck in one bank.
	ld a, BANK(CryHeaders)
	ld [hROMBank], a
	ld [$2000], a

; Each header is 6 bytes long:
	ld hl, CryHeaders
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [CryPitch], a
	ld a, [hli]
	ld [CryEcho], a
	ld a, [hli]
	ld [CryLength], a
	ld a, [hl]
	ld [CryLength+1], a

	ld a, BANK(PlayCry_)
	ld [hROMBank], a
	ld [$2000], a

	call PlayCry_

	pop af
	ld [hROMBank], a
	ld [$2000], a
	
	call WaitForSoundToFinish
	
	jr PopAllRet

PlaySFX::
; Play sound effect de.
; Sound effects are ordered by priority (lowest to highest)

	push hl
	push de
	push bc
	push af

; Is something already playing?
	;call CheckSFX
	;jr nc, .play
; Does it have priority?
	;ld a, [CurSFX]
	;cp e
	;jr c, .quit

PlaySFX_play
.play
	ld a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX)
	ld [hROMBank], a
	ld [$2000], a ; bankswitch

	ld a, e
	ld [CurSFX], a
	call _PlaySFX

	pop af
	ld [hROMBank], a
	ld [$2000], a ; bankswitch
.quit
PopAllRet:
	pop af
	pop bc
	pop de
	pop hl
	ret

_LoadMusicByte::
; CurMusicByte = [a:de]
GLOBAL LoadMusicByte

	ld [hROMBank], a
	ld [MBC1RomBank], a

	ld a, [de]
	ld [CurMusicByte], a
	ld a, BANK(LoadMusicByte)

	ld [hROMBank], a
	ld [MBC1RomBank], a
	ret
