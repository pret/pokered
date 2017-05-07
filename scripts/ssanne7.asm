SSAnne7Script:
	call SSAnne7Script_6189b
	jp EnableAutoTextBoxDrawing

SSAnne7Script_6189b:
	CheckEvent EVENT_RUBBED_CAPTAINS_BACK
	ret nz
	ld hl, wd72d
	set 5, [hl]
	ret

SSAnne7TextPointers:
	dw SSAnne7Text1
	dw SSAnne7Text2
	dw SSAnne7Text3

SSAnne7Text1:
	TX_ASM
	CheckEvent EVENT_GOT_HM01
	jr nz, .asm_797c4
	ld hl, SSAnne7RubText
	call PrintText
	ld hl, ReceivingHM01Text
	call PrintText
	lb bc, HM_01, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM01Text
	call PrintText
	SetEvent EVENT_GOT_HM01
	jr .asm_0faf5
.BagFull
	ld hl, HM01NoRoomText
	call PrintText
	ld hl, wd72d
	set 5, [hl]
	jr .asm_0faf5
.asm_797c4
	ld hl, SSAnne7Text_61932
	call PrintText
.asm_0faf5
	jp TextScriptEnd

SSAnne7RubText:
	TX_FAR _SSAnne7RubText
	TX_ASM
	ld a, [wAudioROMBank]
	cp $1f ; 0 ; BANK(Audio3_UpdateMusic) XXXXX
	ld [wAudioSavedROMBank], a
	jr nz, .asm_61908
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld a, 0 ; Bank(Music_PkmnHealed)
	ld [wAudioROMBank], a
.asm_61908
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlayMusic
	call WaitForSongToFinish
	call PlayDefaultMusic
	SetEvent EVENT_RUBBED_CAPTAINS_BACK
	ld hl, wd72d
	res 5, [hl]
	jp TextScriptEnd

ReceivingHM01Text:
	TX_FAR _ReceivingHM01Text
	db "@"

ReceivedHM01Text:
	TX_FAR _ReceivedHM01Text
	TX_SFX_KEY_ITEM
	db "@"

SSAnne7Text_61932:
	TX_FAR _SSAnne7Text_61932
	db "@"

HM01NoRoomText:
	TX_FAR _HM01NoRoomText
	db "@"

SSAnne7Text2:
	TX_FAR _SSAnne7Text2
	db "@"

SSAnne7Text3:
	TX_FAR _SSAnne7Text3
	db "@"
