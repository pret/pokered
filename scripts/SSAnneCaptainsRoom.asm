SSAnneCaptainsRoom_Script:
	call SSAnne7Script_6189b
	jp EnableAutoTextBoxDrawing

SSAnne7Script_6189b:
	CheckEvent EVENT_RUBBED_CAPTAINS_BACK
	ret nz
	ld hl, wd72d
	set 5, [hl]
	ret

SSAnneCaptainsRoom_TextPointers:
	dw SSAnne7Text1
	dw SSAnne7Text2
	dw SSAnne7Text3

SSAnne7Text1:
	text_asm
	CheckEvent EVENT_GOT_HM01
	jr nz, .got_item
	ld hl, SSAnne7RubText
	call PrintText
	ld hl, ReceivingHM01Text
	call PrintText
	lb bc, HM_CUT, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedHM01Text
	call PrintText
	SetEvent EVENT_GOT_HM01
	jr .done
.bag_full
	ld hl, HM01NoRoomText
	call PrintText
	ld hl, wd72d
	set 5, [hl]
	jr .done
.got_item
	ld hl, SSAnne7Text_61932
	call PrintText
.done
	jp TextScriptEnd

SSAnne7RubText:
	text_far _SSAnne7RubText
	text_asm
;	ld a, [wAudioROMBank]
;	cp BANK("Audio Engine 3")
;	ld [wAudioSavedROMBank], a
;	jr nz, .asm_61908
;	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
;	call PlaySound
;	ld a, 0 ; BANK(Music_PkmnHealed)
;	ld [wAudioROMBank], a
;.asm_61908
	ld a, MUSIC_PKMN_HEALED
;	ld [wNewSoundID], a
	call PlayMusic

	call WaitForSongToFinish
;.asm_61910
;	ld a, [wChannelSoundIDs]
;	cp MUSIC_PKMN_HEALED
;	jr z, .asm_61910

	call PlayDefaultMusic
	SetEvent EVENT_RUBBED_CAPTAINS_BACK
	ld hl, wd72d
	res 5, [hl]
	jp TextScriptEnd

ReceivingHM01Text:
	text_far _ReceivingHM01Text
	text_end

ReceivedHM01Text:
	text_far _ReceivedHM01Text
	sound_get_key_item
	text_end

SSAnne7Text_61932:
	text_far _SSAnne7Text_61932
	text_end

HM01NoRoomText:
	text_far _HM01NoRoomText
	text_end

SSAnne7Text2:
	text_far _SSAnne7Text2
	text_end

SSAnne7Text3:
	text_far _SSAnne7Text3
	text_end
