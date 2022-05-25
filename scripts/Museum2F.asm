Museum2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Museum2FTrainerHeaders
	ld de, Museum2F_ScriptPointers
	call ExecuteCurMapScriptInTable
	ret

Museum2F_TextPointers:
	dw Museum2FWalletKid1
	dw Museum2FText1
	dw Museum2FText2
	dw Museum2FText3
	dw Museum2FText4
	dw Museum2FText5
	dw Museum2FText6
	dw Museum2FText7
	dw Museum2FWalletKidWalletGive
	dw ReceivedLostWallet
	dw WalletKidNoRoomText

Museum2F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw WalletKidPostBattle

Museum2FText1:
	text_far _Museum2FText1
	text_end

Museum2FText2:
	text_far _Museum2FText2
	text_end

Museum2FText3:
	text_far _Museum2FText3
	text_end

Museum2FText4:
	text_far _Museum2FText4
	text_end

Museum2FText5:
	text_far _Museum2FText5
	text_end

Museum2FText6:
	text_far _Museum2FText6
	text_end

Museum2FText7:
	text_far _Museum2FText7
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
	jr .battle
.battle
	CheckEvent EVENT_BEAT_WALLET_KID
	jp nz, .giveWallet
	ld hl, Museum2FWalletKid1IntroPrompt
	call PrintText
	ld hl, WalletKidTrainerHeader
	call TalkToTrainer
	ld a, 3
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
	call PrintText
	jr .done
.intro
	ld hl, Museum2FWalletKid1Intro
	call PrintText
.done
	jp TextScriptEnd

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
	ld a, 9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	lb bc, LOST_WALLET, 1
	call GiveItem
	jr nc, .BagFull
	ld a, 10
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_LOST_WALLET
	jr .done
.BagFull
	ld a, 11
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	jr .done
.done
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
	text_far _TM34NoRoomText
	text_end

ReceivedLostWallet:
	text_far _Museum2FReceivedLostWalletText
	sound_get_key_item
	text_end