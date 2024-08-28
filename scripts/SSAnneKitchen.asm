SSAnneKitchen_Script:
	jp EnableAutoTextBoxDrawing

SSAnneKitchen_TextPointers:
	def_text_pointers
	dw_const SSAnneKitchenCook1Text, TEXT_SSANNEKITCHEN_COOK1
	dw_const SSAnneKitchenCook2Text, TEXT_SSANNEKITCHEN_COOK2
	dw_const SSAnneKitchenCook3Text, TEXT_SSANNEKITCHEN_COOK3
	dw_const SSAnneKitchenCook4Text, TEXT_SSANNEKITCHEN_COOK4
	dw_const SSAnneKitchenCook5Text, TEXT_SSANNEKITCHEN_COOK5
	dw_const SSAnneKitchenCook6Text, TEXT_SSANNEKITCHEN_COOK6
	dw_const SSAnneKitchenCook7Text, TEXT_SSANNEKITCHEN_COOK7
	dw_const SSAnneKitchenWaiterText, TEXT_SSANNEKITCHEN_WAITER

SSAnneKitchenCook1Text:
	text_far _SSAnneKitchenCook1Text
	text_end

SSAnneKitchenCook2Text:
	text_far _SSAnneKitchenCook2Text
	text_end

SSAnneKitchenCook3Text:
	text_far _SSAnneKitchenCook3Text
	text_end

SSAnneKitchenCook4Text:
	text_far _SSAnneKitchenCook4Text
	text_end

SSAnneKitchenCook5Text:
	text_far _SSAnneKitchenCook5Text
	text_end

SSAnneKitchenCook6Text:
	text_far _SSAnneKitchenCook6Text
	text_end

SSAnneKitchenCook7Text:
	text_asm
	ld hl, .MainCourseIsText
	rst _PrintText
	ldh a, [hRandomAdd]
	bit 7, a
	jr z, .not_dialog_1
	ld hl, .SalmonDuSaladText
	jr .done
.not_dialog_1
	bit 4, a
	jr z, .not_dialog_2
	ld hl, .EelsAuBarbecueText
	jr .done
.not_dialog_2
	ld hl, .PrimeBeefSteakText
.done
	rst _PrintText
	rst TextScriptEnd

.MainCourseIsText:
	text_far _SSAnneKitchenCook7MainCourseIsText
	text_end

.SalmonDuSaladText:
	text_far SSAnneKitchenCook7SalmonDuSaladText
	text_end

.EelsAuBarbecueText:
	text_far SSAnneKitchenCook7EelsAuBarbecueText
	text_end

.PrimeBeefSteakText:
	text_far SSAnneKitchenCook7PrimeBeefSteakText
	text_end

SSAnneKitchenWaiterText:
	text_far _SSAnneKitchenWaiter
	text_asm
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
	ld a, [wYCoord]
	cp 13
	jr nz, .haveSeat
	ld a, [wXCoord]
	cp 1
	jr nz, .haveSeat
	; player is in seat
	ld hl, .whatWouldYouLike
	rst _PrintText
	call SaveScreenTilesToBuffer2
	ld hl, SSAnneFoodMenu
	ld b, A_BUTTON | B_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	call Delay3
	jr nz, .suitYourself
	ld hl, .comingRightUp
	rst _PrintText
	call GBFadeOutToWhite
	ld c, 60
	rst _DelayFrames
	call GBFadeInFromWhite
	ld d, SSANNEKITCHEN_WAITER
	callfar FarNPCSpriteQuickSpin
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	ld a, $2B
	call .replaceFoodTileBlock
	ld a, SFX_NOISE_INSTRUMENT02
	rst _PlaySound
	ld a, SFX_59
	call PlaySoundWaitForCurrent
	ld c, 60
	rst _DelayFrames
	ld hl, .bonAppetit
	rst _PrintText
	call GBFadeOutToWhite
	callfar MomHealPokemonImmediate
	ld a, $3F
	call .replaceFoodTileBlock
	call GBFadeInFromWhite
	ld a, SSANNEKITCHEN_WAITER
	call SetSpriteFacingLeft
	ld hl, .comeAgain
	jr .printDone
.suitYourself
	ld hl, .suitYourselfText
	jr .printDone
.haveSeat
	ld a, SSANNEKITCHEN_WAITER
	call SetSpriteFacingLeft
	ld hl, .haveSeatText
.printDone
	rst _PrintText
	rst TextScriptEnd
.replaceFoodTileBlock
	lb bc, 7, 0
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock
.suitYourselfText
	text_far _FossilGuyDenied
	text_end
.haveSeatText
	text_far _SSAnneKitchenWaiterHaveSeat
	text_end
.whatWouldYouLike
	text_far _WhatWouldYouLikeText
	text_end
.comingRightUp
	text_far _SSAnneKitchenWaiterComingRightUp
	text_end
.bonAppetit
	text_far _MomFoodBonAppetit
	text_end
.comeAgain
	text_far _CableClubNPCPleaseComeAgainText
	text_end