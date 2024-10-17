; PureRGBnote: CHANGED: The CAPTAIN now gets rid of your SS Ticket and makes it so you won't need one anymore.
; Also his bookcase has some unique text now.
SSAnneCaptainsRoom_Script:
	call SSAnneCaptainsRoomEventScript
	jp EnableAutoTextBoxDrawing

SSAnneCaptainsRoomEventScript:
	CheckEvent EVENT_RUBBED_CAPTAINS_BACK
	ret nz
	ld hl, wStatusFlags3
	set BIT_NO_NPC_FACE_PLAYER, [hl]
	ret

SSAnneCaptainsRoom_TextPointers:
	def_text_pointers
	dw_const SSAnneCaptainsRoomCaptainText,     TEXT_SSANNECAPTAINSROOM_CAPTAIN
	dw_const SSAnneCaptainsRoomTrashText,       TEXT_SSANNECAPTAINSROOM_TRASH
	dw_const SSAnneCaptainsRoomSeasickBookText, TEXT_SSANNECAPTAINSROOM_SEASICK_BOOK
	dw_const SSAnneCaptainsRoomCutBookText, TEXT_SSANNECAPTAINSROOM_CUT_BOOK

SSAnneCaptainsRoomCaptainText:
	text_asm
	CheckEvent EVENT_GOT_HM01
	ld hl, SSAnneCaptainsRoomCaptainNotSickAnymoreText
	jp nz, .printDone
	ld hl, SSAnneCaptainsRoomRubCaptainsBackText
	rst _PrintText
	ld hl, SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	rst _PrintText
	lb bc, HM_CUT, 1
	call GiveItem
	jp nc, .bag_full
	ld hl, SSAnneCaptainsRoomCaptainReceivedHM01Text
	rst _PrintText
	SetEvent EVENT_GOT_HM01
	ld hl, .SSAnneCaptainsRoomCaptainFeelingABitBetter
	rst _PrintText
	ld a, SFX_CUT
	rst _PlaySound
	ld a, [wPlayerDirection]
	cp PLAYER_DIR_UP
	jr z, .up
	ld hl, vNPCSprites tile 08
	ld de, RedSprite tile 20 ; red walking
	lb bc, BANK(RedSprite), 4
	call CopyVideoData
	ld hl, vNPCSprites tile $14
	ld de, CaptainWalking tile 4
	lb bc, BANK(CaptainWalking), 4
	call CopyVideoData
	rst _DelayFrame
	rst _DelayFrame
	ld hl, vNPCSprites tile 08
	ld de, RedSprite tile 8 ; red normal
	lb bc, BANK(RedSprite), 4
	call CopyVideoData
	ld hl, vNPCSprites tile $14
	ld de, CaptainSprite tile 8
	jr .cutTicket
.up
	ld hl, vNPCSprites tile 04
	ld de, RedSprite tile 16 ; red walking
	lb bc, BANK(RedSprite), 4
	call CopyVideoData
	ld hl, vNPCSprites tile 12
	ld de, CaptainWalking
	lb bc, BANK(CaptainWalking), 4
	call CopyVideoData
	rst _DelayFrame
	rst _DelayFrame
	ld hl, vNPCSprites tile 04
	ld de, RedSprite tile 4 ; red normal
	lb bc, BANK(RedSprite), 4
	call CopyVideoData
	ld hl, vNPCSprites tile 12
	ld de, CaptainSprite
.cutTicket
	push hl
	push de
	ld hl, .SSAnneCaptainCutYourTicket
	rst _PrintText
	pop de
	pop hl
	lb bc, BANK(CaptainSprite), 4
	call CopyVideoData
	ld a, S_S_TICKET
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	ld hl, .SSAnneWontBeNeedingThatAnymore
	jr .printDone
.bag_full
	ld hl, wStatusFlags3
	set BIT_NO_NPC_FACE_PLAYER, [hl]
	ld hl, SSAnneCaptainsRoomCaptainHM01NoRoomText
.printDone
	rst _PrintText
.done
	rst TextScriptEnd
.SSAnneCaptainsRoomCaptainFeelingABitBetter
	text_far _SSAnneCaptainsRoomCaptainFeelingABitBetter
	text_end
.SSAnneCaptainCutYourTicket
	text_far _SSAnneCaptainCutYourTicket
	text_end
.SSAnneWontBeNeedingThatAnymore
	text_far _SSAnneWontBeNeedingThatAnymore
	text_end

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
	ld hl, wStatusFlags3
	res BIT_NO_NPC_FACE_PLAYER, [hl]
	rst TextScriptEnd

SSAnneCaptainsRoomCaptainIFeelMuchBetterText:
	text_far _SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	text_end

SSAnneCaptainsRoomCaptainReceivedHM01Text:
	text_far _Route1Youngster1GotPotionText
	sound_get_key_item
	text_promptbutton
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

SSAnneCaptainsRoomCutBookText:
	text_far _SSAnneCaptainsRoomCutBookText
	text_far _FlippedToARandomPage
	text_far _SSAnneCaptainsRoomCutBookText2
	text_end
