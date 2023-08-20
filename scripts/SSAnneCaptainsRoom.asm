SSAnneCaptainsRoom_Script:
	call SSAnneCaptainsRoomEventScript
	jp EnableAutoTextBoxDrawing

SSAnneCaptainsRoomEventScript:
	CheckEvent EVENT_RUBBED_CAPTAINS_BACK
	ret nz
	ld hl, wd72d
	set 5, [hl]
	ret

SSAnneCaptainsRoom_TextPointers:
	def_text_pointers
	dw_const SSAnneCaptainsRoomCaptainText,     TEXT_SSANNECAPTAINSROOM_CAPTAIN
	dw_const SSAnneCaptainsRoomTrashText,       TEXT_SSANNECAPTAINSROOM_TRASH
	dw_const SSAnneCaptainsRoomSeasickBookText, TEXT_SSANNECAPTAINSROOM_SEASICK_BOOK

SSAnneCaptainsRoomCaptainText:
	text_asm
	CheckEvent EVENT_GOT_HM01
	jr nz, .got_item
	ld hl, SSAnneCaptainsRoomRubCaptainsBackText
	rst _PrintText
	ld hl, SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	rst _PrintText
	lb bc, HM_CUT, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, SSAnneCaptainsRoomCaptainReceivedHM01Text
	rst _PrintText
	SetEvent EVENT_GOT_HM01
	jr .done
.bag_full
	ld hl, SSAnneCaptainsRoomCaptainHM01NoRoomText
	rst _PrintText
	ld hl, wd72d
	set 5, [hl]
	jr .done
.got_item
	ld hl, SSAnneCaptainsRoomCaptainNotSickAnymoreText
	rst _PrintText
.done
	rst TextScriptEnd

SSAnneCaptainsRoomRubCaptainsBackText:
	text_far _SSAnneCaptainsRoomRubCaptainsBackText
	text_asm
	ld a, [wAudioROMBank]
	cp BANK("Audio Engine 3")
	ld [wAudioSavedROMBank], a
	jr nz, .not_audio_engine_3
	call StopAllMusic
	ld a, BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
.not_audio_engine_3
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	rst _PlaySound
.loop
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .loop
	call PlayDefaultMusic
	SetEvent EVENT_RUBBED_CAPTAINS_BACK
	ld hl, wd72d
	res 5, [hl]
	rst TextScriptEnd

SSAnneCaptainsRoomCaptainIFeelMuchBetterText:
	text_far _SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	text_end

SSAnneCaptainsRoomCaptainReceivedHM01Text:
	text_far _SSAnneCaptainsRoomCaptainReceivedHM01Text
	sound_get_key_item
	text_end

SSAnneCaptainsRoomCaptainNotSickAnymoreText:
	text_far _SSAnneCaptainsRoomCaptainNotSickAnymoreText
	text_end

SSAnneCaptainsRoomCaptainHM01NoRoomText:
	text_far _SSAnneCaptainsRoomCaptainHM01NoRoomText
	text_end

SSAnneCaptainsRoomTrashText:
	text_far _SSAnneCaptainsRoomTrashText
	text_end

SSAnneCaptainsRoomSeasickBookText:
	text_far _SSAnneCaptainsRoomSeasickBookText
	text_end
