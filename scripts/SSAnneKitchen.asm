SSAnneKitchen_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnneKitchen_TextPointers:
	def_text_pointers
	dw_const SSAnneKitchenCook1Text, TEXT_SSANNEKITCHEN_COOK1
	dw_const SSAnneKitchenCook2Text, TEXT_SSANNEKITCHEN_COOK2
	dw_const SSAnneKitchenCook3Text, TEXT_SSANNEKITCHEN_COOK3
	dw_const SSAnneKitchenCook4Text, TEXT_SSANNEKITCHEN_COOK4
	dw_const SSAnneKitchenCook5Text, TEXT_SSANNEKITCHEN_COOK5
	dw_const SSAnneKitchenCook6Text, TEXT_SSANNEKITCHEN_COOK6
	dw_const SSAnneKitchenCook7Text, TEXT_SSANNEKITCHEN_COOK7

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
	call PrintText
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
	call PrintText
	jp TextScriptEnd

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
