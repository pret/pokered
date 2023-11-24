; shinpokerednote: audionote: This file was heavily modified to be closer to pokeyellow's audio engine

Audio3_PlaySound::
	ld [wSoundID], a
	cp SFX_STOP_ALL_MUSIC
	jp z, StopAllAudio_3
	cp MAX_SFX_ID_3
	jr z, PlaySfxRemapDrums_3
	jr c, PlaySfxRemapDrums_3
	cp $fe
	jr z, .playMusic
	jr nc, PlaySfxRemapDrums_3
.playMusic
	call InitMusicVariables
	jp PlaySoundCommon_3

PlaySfxRemapDrums_3:
	push af
	call PlaySfx_3
	pop af
	jp CheckRemapNoiseInstrument_3

PlaySfx_3:
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_3
	add hl, de
	ld a, h
	ld [wSfxHeaderPointer], a
	ld a, l
	ld [wSfxHeaderPointer + 1], a
	ld a, [hl]
	and $c0
	rlca
	rlca
	ld c, a
.sfxChannelLoop
	ld d, c
	ld a, c
	add a
	add c
	ld c, a
	ld b, $0
	hl_deref_reverse wSfxHeaderPointer
	add hl, bc
	ld c, d
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, wChannelSoundIDs
	add hl, de
	ld a, [hl]
	and a
	jr z, .playChannel
	ld a, e
	cp CHAN8
	jr nz, .notNoiseChannel
	ld a, [wSoundID]
	cp NOISE_INSTRUMENTS_END
	ret c
	ld a, [hl]
	cp NOISE_INSTRUMENTS_END
	jr z, .playChannel
	jr c, .playChannel
.notNoiseChannel
	ld a, [wSoundID]
	cp [hl]
	jr z, .playChannel
	ret nc
.playChannel
	call InitSFXVariables
.skipSweepDisable
	ld a, c
	and a
	jp z, PlaySoundCommon_3
	dec c
	jp .sfxChannelLoop

StopAllAudio_3:
	jp StopAllAudio

PlaySoundCommon_3:
	ld a, [wSoundID]
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, SFX_Headers_3
	add hl, de
	ld e, l
	ld d, h
	ld hl, wChannelCommandPointers
	ld a, [de] ; get channel number
	ld b, a
	rlca
	rlca
	and $3
	ld c, a
	ld a, b
	and $f
	ld b, c
	inc b
	inc de
	ld c, $0
.commandPointerLoop
	cp c
	jr z, .next
	inc c
	inc hl
	inc hl
	jr .commandPointerLoop
.next
	push af
	push hl
	push bc
	ld b, $0
	ld c, a
	cp CHAN4
	jr c, .skipSettingFlag
	ld hl, wChannelFlags1
	add hl, bc
	set BIT_NOISE_OR_SFX, [hl]
.skipSettingFlag
	pop bc
	pop hl
	ld a, [de] ; get channel pointer
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop af
	push hl
	push bc
	ld b, $0
	ld c, a
	ld hl, wChannelSoundIDs
	add hl, bc
	ld a, [wSoundID]
	ld [hl], a
	pop bc
	pop hl
	inc c
	dec b
	ld a, b
	and a
	ld a, [de]
	inc de
	jr nz, .commandPointerLoop
	ld a, [wSoundID]
	cp CRY_SFX_START
	ret c
	ld a, [wSoundID]
	cp CRY_SFX_END
	ret z
	ret nc
	ld hl, wChannelSoundIDs + CHAN5
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wChannelCommandPointers + CHAN7 * 2 ; sfx noise channel pointer
	ld de, Noise3_endchannel
	ld a, e
	ld [hli], a
	ld [hl], d ; overwrite pointer to point to endchannel
	ld a, [wSavedVolume]
	and a
	ret nz
	ldh a, [rNR50]
	ld [wSavedVolume], a
	ld a, $77
	ldh [rNR50], a
	ret

Noise3_endchannel:
	sound_ret

; PureRGBnote: ADDED: code that allows default drum kit sounds to be overwritten with other drum kit sounds.
CheckRemapNoiseInstrument_3:
	ld a, [wChannelSoundIDs + CHAN8]
	cp REMAPPABLE_NOISE_INSTRUMENTS_END
	ret nc
	ld b, a
	ld a, [wMusicDrumKit]
	and a
	ret z
	dec a ; drumkit to use is wMusicDrumKit - 1
	ld hl, Drumkits_3
	call GetAddressFromPointerArray ; get drumkit
	ld a, b
	call GetAddressFromPointerArray ; get drum noise pointer
	ld d, h
	ld e, l
	ld hl, wChannelCommandPointers + CHAN8 * 2
	jp Audio3_OverwriteChannelPointer ; replace the original drum noise with the one from the drumkit we want

Drumkits_3: INCLUDE "audio/drumkits.asm"

