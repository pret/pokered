PlayDefaultMusic::
	call WaitForSoundToFinish
	xor a
	ld c, a
	ld d, a
	ld [wLastMusicSoundID], a
	ld [wSpecialMusicBank], a ; PureRGBnote: ADDED: needs to be reset in order for other-bank-music to work properly
	jr PlayDefaultMusicCommon

PlayDefaultMusicFadeOutCurrent::
; Fade out the current music and then play the default music.
	ld c, 10
	ld d, 0
	ld a, [wStatusFlags4]
	bit BIT_BATTLE_OVER_OR_BLACKOUT, a
	jr z, PlayDefaultMusicCommon
	xor a
	ld [wLastMusicSoundID], a
	ld c, 8
	ld d, c

PlayDefaultMusicCommon::
	push bc
	callfar CheckForBikeSurfMusic
	pop bc
	jr c, .walking
	ld a, e ; which music will be played from the bike/surf music

.next
	ld b, a
	ld a, d
	and a ; should current music be faded out first?
	ld a, BANK(Music_BikeRiding)
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
	rst _PlaySound
	ret

;UpdateMusic6Times::
; This is called when entering a map, before fading out the current music and
; playing the default music (i.e. the map's music or biking/surfing music).
; shinpokerednote: audionote: updated to match pokemon yellow's audio engine code
;	ld c, 6
;UpdateMusicCTimes::
;.loop
;	push bc
;	push hl
;	farcall Audio1_UpdateMusic
;	pop hl
;	pop bc
;	dec c
;	jr nz, .loop
;	ret

CompareMapMusicBankWithCurrentBank::
; Compares the map music's audio ROM bank with the current audio ROM bank
; and updates the audio ROM bank variables.
; Returns whether the banks are different in carry.
	ld a, [wMapMusicROMBank]
	ld e, a
	ld a, [wAudioROMBank]
	cp e
	jr nz, .differentBanks
	ld [wAudioSavedROMBank], a
	and a
	ret
.differentBanks
	ld a, c ; this is a fade-out counter value and it's always non-zero
	and a
	ld a, e
	jr nz, .next
; If the fade-counter is non-zero, we don't change the audio ROM bank because
; it's needed to keep playing the music as it fades out. The FadeOutAudio
; routine will take care of copying [wAudioSavedROMBank] to [wAudioROMBank]
; when the music has faded out.
	ld [wAudioROMBank], a
.next
	ld [wAudioSavedROMBank], a
	scf
	ret

; shinpokerednote: audionote: updated to match pokemon yellow's audio engine code
PlayMusic::
	ld b, a
	ld [wNewSoundID], a
	xor a
;;;;;;;;;; PureRGBnote: ADDED: needs to be reset in order for other-bank-music to work properly
	ld [wSpecialMusicBank], a
;;;;;;;;;;
	ld [wAudioFadeOutControl], a
	ld a, c
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, b
	jr PlaySound

; shinpokerednote: audionote: updated to match pokemon yellow's audio engine code
StopAllMusic:: 
;;;;;;;;;; PureRGBnote: ADDED: needs to be reset in order for other-bank-music to work properly
	xor a
	ld [wSpecialMusicBank], a
;;;;;;;;;;
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
; shinpokerednote: audionote: updated to match pokemon yellow's audio engine code
; plays music specified by a. If value is $ff, music is stopped
PlaySound::
	push hl
	push de
	push bc
	ld b, a
	ld a, [wNewSoundID]
	and a
	jr z, .next
	xor a
	ld [wChannelSoundIDs + CHAN5], a
	ld [wChannelSoundIDs + CHAN6], a
	ld [wChannelSoundIDs + CHAN7], a
	ld [wChannelSoundIDs + CHAN8], a
.next
	ld a, [wAudioFadeOutControl]
	and a ; has a fade-out length been specified?
	jr z, .noFadeOut
	ld a, [wNewSoundID]
	and a ; is the new sound ID 0?
	jr z, .done ; if so, do nothing
	xor a
	ld [wNewSoundID], a
	ld a, [wLastMusicSoundID]
	cp $ff ; has the music been stopped?
	jr nz, .fadeOut ; if not, fade out the current music
; If it has been stopped, start playing the new music immediately.
	xor a
	ld [wAudioFadeOutControl], a
.noFadeOut
	xor a
	ld [wNewSoundID], a
	call DetermineAudioFunction
	jr .done

.fadeOut
	ld a, b
	ld [wLastMusicSoundID], a
	ld a, [wAudioFadeOutControl]
	ld [wAudioFadeOutCounterReloadValue], a
	ld [wAudioFadeOutCounter], a
	ld a, b
	ld [wAudioFadeOutControl], a

.done
	pop bc
	pop de
	pop hl
	ret

; shinpokerednote: audionote: everything below are genericized audio code pulled from yellow (they used to be duplicated in each audio engine)

GetNextMusicByte::
	ldh a, [hLoadedROMBank]
	push af
;;;;;;;;;; PureRGBnote: ADDED: needs to be reset in order for other-bank-music to work properly
	ld a, [wSpecialMusicBank]
	and a
	ld a, [wAudioROMBank]
	jr z, .doBankSwitch ; if wSpecialMusicBank not set
	ld a, c
	cp CHAN5
	ld a, [wSpecialMusicBank]
	jr c, .doBankSwitch
	ld a, [wAudioROMBank]
.doBankSwitch
;;;;;;;;;;
	call BankswitchCommon
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, wChannelCommandPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	ld a, [de]
	inc de
	ld [hl], e
	inc hl
	ld [hl], d
	ld e, a
	pop af
	call BankswitchCommon
	ld a, e
	ret

InitMusicVariables::
	push hl
	push de
	push bc
	homecall Audio2_InitMusicVariables
	pop bc
	pop de
	pop hl
	ret

InitSFXVariables::
	push hl
	push de
	push bc
	homecall Audio2_InitSFXVariables
	pop bc
	pop de
	pop hl
	ret

StopAllAudio::
	push hl
	push de
	push bc
	homecall Audio2_StopAllAudio
	pop bc
	pop de
	pop hl
	ret

DetermineAudioFunction::	
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wAudioROMBank]
	call BankswitchCommon
; determine the audio function, based on the bank
	cp BANK(Audio1_PlaySound)
	jr nz, .checkForAudio2
; bank 02 (audio 1)
	ld a, b
	call Audio1_PlaySound
	jr .done
.checkForAudio2
	cp BANK(Audio2_PlaySound)
	jr nz, .audio3
; bank 08 (audio 2)
	ld a, b
	call Audio2_PlaySound
	jr .done
.audio3
; bank 1f (audio 3)
	ld a, b
	call Audio3_PlaySound
.done
	pop af
	jp BankswitchCommon

;;;;;;;;;; PureRGBnote: ADDED: new functions to play music from another bank while the "core" audio bank is engine 2 (battle) or 3 (overworld)

PlaySpecialBattleMusic3::
	ld b, 3
	ld a, MUSIC_GYM_LEADER_BATTLE
	ld d, BANK(Music_GymLeaderBattle)
	jr PlaySpecialBattleMusic.playSpecialMusic

PlaySpecialFieldMusic3::
	ld b, 3
	ld a, MUSIC_OAKS_LAB
	ld d, BANK(Music_OaksLab)
	jr PlaySpecialBattleMusic.playSpecialMusic

	; input hl = audio header
	; c = bank the music is in
PlaySpecialFieldMusic::
	ld b, 4
	ld a, MUSIC_CINNABAR_MANSION
	ld d, BANK(Music_CinnabarMansion)
	jr PlaySpecialBattleMusic.playSpecialMusic

	; input hl = audio header
	; c = bank the music is in
PlaySpecialBattleMusic::
	ld b, 4
	ld a, MUSIC_DEFEATED_GYM_LEADER
.playBattleMusic
	ld d, BANK(Music_DefeatedGymLeader)
.playSpecialMusic
	push hl
	push bc
	ld c, d
	call PlayMusic
	pop bc
	pop hl
	; fall through

RemapCommandPointerLoop:
	ldh a, [hLoadedROMBank]
	push af
	ld a, c
	ld [wSpecialMusicBank], a
	call BankswitchCommon
	ld de, wChannelCommandPointers + CHAN1 * 2
.loop
	inc hl
	push hl
	call GetAddressFromPointer
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	inc de
	inc hl
	inc hl
	dec b
	jr nz, .loop
	pop af
	jp BankswitchCommon

;;;;;;;;;;

;;;;;;;;;; PureRGBnote: ADDED: new functions to play new sound effects regardless of if they have a SFX identifier.

PlayNewSoundChannel5::
	ld a, SFX_TRADE_MACHINE
	ld hl, wChannelCommandPointers + CHAN5 * 2
	jr PlayNewSound

PlayNewSoundChannel8::
	ld a, SFX_PUSH_BOULDER
	ld hl, wChannelCommandPointers + CHAN8 * 2
	; fall through
; input hl = which channel the sound plays on
; input de = address of the sound effect
; sound effect data must use the same sound engine bank as the currently playing music to work
PlayNewSound::
	rst _PlaySound
	; remap the sound pointer immediately to cause the new sound to play.
RemapSoundChannel::
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
	
; input b = frequency mod, c = tempo mod
PlayBattleSFXWhenNotInBattleWithMods::
	ld a, b
	ld [wTempoModifier], a
	ld a, c
	ld [wFrequencyModifier], a
; d = which sound effect
; hl = what code to run while the sound is playing
; by definition map music can't be playing while the sound effect is
PlayBattleSFXWhenNotInBattle::
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, [wAudioROMBank]
	push af
	ld a, BANK("Audio Engine 2")
	ld [wAudioROMBank], a
	push hl
	ld a, d
	rst _PlaySound
	pop hl
	call hl_caller
	call WaitForSoundToFinish
	pop af
	ld [wAudioROMBank], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ret

;;;;;;;;;;