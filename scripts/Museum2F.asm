; PureRGBnote: ADDED: new NPC who will give you LOST WALLET after beating them in a battle.

Museum2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Museum2FTrainerHeaders
	ld de, Museum2F_ScriptPointers
	jp ExecuteCurMapScriptInTable

Museum2F_TextPointers:
	def_text_pointers
	dw_const Museum2FWalletKid1,           TEXT_MUSEUM2F_WALLET_KID
	dw_const Museum2FYoungsterText,        TEXT_MUSEUM2F_YOUNGSTER
	dw_const Museum2FGrampsText,           TEXT_MUSEUM2F_GRAMPS
	dw_const Museum2FScientistText,        TEXT_MUSEUM2F_SCIENTIST
	dw_const Museum2FBrunetteGirlText,     TEXT_MUSEUM2F_BRUNETTE_GIRL
	dw_const Museum2FHikerText,            TEXT_MUSEUM2F_HIKER
	dw_const Museum2FSpaceShuttleSignText, TEXT_MUSEUM2F_SPACE_SHUTTLE_SIGN
	dw_const Museum2FMoonStoneSignText,    TEXT_MUSEUM2F_MOON_STONE_SIGN
	dw_const Museum2FWalletKidWalletGive,  TEXT_MUSEUM2F_WALLET_KID_WALLET_GIVE
	dw_const ReceivedLostWallet,           TEXT_MUSEUM2F_RECEIVED_LOST_WALLET
	dw_const WalletKidNoRoomText,          TEXT_MUSEUM2F_WALLET_KID_NO_ROOM

Museum2F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MUSEUM2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MUSEUM2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MUSEUM2F_END_BATTLE
	dw_const WalletKidPostBattle,                   SCRIPT_MUSEUM2F_WALLET_KID_POST_BATTLE
	
Museum2FYoungsterText:
	text_far _Museum2FYoungsterText
	text_end

Museum2FGrampsText:
	text_far _Museum2FGrampsText
	text_end

Museum2FScientistText:
	text_far _Museum2FScientistText
	text_end

Museum2FBrunetteGirlText:
	text_far _Museum2FBrunetteGirlText
	text_end

Museum2FHikerText:
	text_far _Museum2FHikerText
	text_end

Museum2FSpaceShuttleSignText:
	text_far _Museum2FSpaceShuttleSignText
	text_end

Museum2FMoonStoneSignText:
	text_far _Museum2FMoonStoneSignText
	text_end

Museum2FTrainerHeaders:
	def_trainers
WalletKidTrainerHeader:
	trainer EVENT_BEAT_WALLET_KID, 0, Museum2FWalletKidBattle, Museum2FWalletKidEndBattle, Museum2FWalletKidEndBattle
	db -1 ; end

Museum2FWalletKid1:
	text_asm
	CheckEvent EVENT_MET_POCKET_ABRA_LADY
	jr z, .intro
.battle
	CheckEvent EVENT_BEAT_WALLET_KID
	jp nz, .giveWallet
	ld hl, Museum2FWalletKid1IntroPrompt
	rst _PrintText
	ld hl, WalletKidTrainerHeader
	call TalkToTrainer
	ld a, SCRIPT_MUSEUM2F_WALLET_KID_POST_BATTLE
	ld [wCurMapScript], a 
	jr .done
.giveWallet
	CheckEvent EVENT_GOT_LOST_WALLET
	jr nz, .endText
	call GiveWallet
	call DisableWaitingAfterTextDisplay
	jr .done
.endText
	ld hl, Museum2FWalletKidEnd
	rst _PrintText
	jr .done
.intro
	ld hl, Museum2FWalletKid1Intro
	rst _PrintText
.done
	rst TextScriptEnd

ResetScripts:
	xor a
	ld [wCurMapScript], a
	ret

WalletKidPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jr z, ResetScripts
GiveWallet:
	SetEvent EVENT_BEAT_WALLET_KID
	ld a, TEXT_MUSEUM2F_WALLET_KID_WALLET_GIVE
	ldh [hTextID], a
	call DisplayTextID
	lb bc, LOST_WALLET, 1
	call GiveItem
	ld a, TEXT_MUSEUM2F_WALLET_KID_NO_ROOM
	jr nc, .done ; bag full
	SetEvent EVENT_GOT_LOST_WALLET
	ld a, TEXT_MUSEUM2F_RECEIVED_LOST_WALLET
.done
	ldh [hTextID], a
	call DisplayTextID
	jr ResetScripts

Museum2FWalletKid1Intro:
	text_far _Museum2FWalletKid1
	text_end

Museum2FWalletKidEnd:
	text_far _Museum2FWalletKidEnd
	text_end

Museum2FWalletKid1IntroPrompt:
	text_far _Museum2FWalletKid1
	text_promptbutton
	text_end

Museum2FWalletKidBattle:
	text_far _Museum2FWalletKidBattle
	text_end 

Museum2FWalletKidEndBattle:
	text_far _Museum2FWalletKidBattleAfter
	text_end 

Museum2FWalletKidWalletGive:
	text_far _Museum2FWalletKidWalletGive
	text_end

WalletKidNoRoomText:
	text_far _PewterGymTM34NoRoomText
	text_end

ReceivedLostWallet:
	text_far _Museum2FReceivedLostWalletText
	sound_get_key_item
	text_end