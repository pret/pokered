Museum1F_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, Museum1F_ScriptPointers
	ld a, [wMuseum1FCurScript]
	jp CallFunctionInTable

Museum1F_ScriptPointers:
	def_script_pointers
	dw_const Museum1FDefaultScript, SCRIPT_MUSEUM1F_DEFAULT
	dw_const Museum1FNoopScript,    SCRIPT_MUSEUM1F_NOOP

Museum1FDefaultScript:
	ld a, [wYCoord]
	cp 4
	ret nz
	ld a, [wXCoord]
	cp 9
	jr z, .continue
	ld a, [wXCoord]
	cp 10
	ret nz
.continue
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_MUSEUM1F_SCIENTIST1
	ldh [hTextID], a
	jp DisplayTextID

Museum1FNoopScript:
	ret

Museum1F_TextPointers:
	def_text_pointers
	dw_const Museum1FScientist1Text, TEXT_MUSEUM1F_SCIENTIST1
	dw_const Museum1FGamblerText,    TEXT_MUSEUM1F_GAMBLER
	dw_const Museum1FScientist2Text, TEXT_MUSEUM1F_SCIENTIST2
	dw_const Museum1FScientist3Text, TEXT_MUSEUM1F_SCIENTIST3
	dw_const Museum1FOldAmberText,   TEXT_MUSEUM1F_OLD_AMBER

Museum1FScientist1Text:
	text_asm
	ld a, [wYCoord]
	cp 4
	jr nz, .not_right_of_scientist
	ld a, [wXCoord]
	cp 13
	jp z, .behind_counter
	jr .check_ticket
.not_right_of_scientist
	cp 3
	jr nz, .not_behind_counter
	ld a, [wXCoord]
	cp 12
	jp z, .behind_counter
.not_behind_counter
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr nz, .already_bought_ticket
	ld hl, .GoToOtherSideText
	call PrintText
	jp .done
.check_ticket
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr z, .no_ticket
.already_bought_ticket
	ld hl, .TakePlentyOfTimeText
	call PrintText
	jp .done
.no_ticket
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ldh [hJoyHeld], a
	ld hl, .WouldYouLikeToComeInText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .deny_entry
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $50
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .buy_ticket
	ld hl, .DontHaveEnoughMoneyText
	call PrintText
	jp .deny_entry
.buy_ticket
	ld hl, .ThankYouText
	call PrintText
	SetEvent EVENT_BOUGHT_MUSEUM_TICKET
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $50
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jr .allow_entry
.deny_entry
	ld hl, .ComeAgainText
	call PrintText
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	call UpdateSprites
	jr .done
.allow_entry
	ld a, SCRIPT_MUSEUM1F_NOOP
	ld [wMuseum1FCurScript], a
	jr .done

.behind_counter
	ld hl, .DoYouKnowWhatAmberIsText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	jr nz, .explain_amber
	ld hl, .TheresALabSomewhereText
	call PrintText
	jr .done
.explain_amber
	ld hl, .AmberIsFossilizedTreeSapText
	call PrintText
.done
	jp TextScriptEnd

.ComeAgainText:
	text_far _Museum1FScientist1ComeAgainText
	text_end

.WouldYouLikeToComeInText:
	text_far _Museum1FScientist1WouldYouLikeToComeInText
	text_end

.ThankYouText:
	text_far _Museum1FScientist1ThankYouText
	text_end

.DontHaveEnoughMoneyText:
	text_far _Museum1FScientist1DontHaveEnoughMoneyText
	text_end

.DoYouKnowWhatAmberIsText:
	text_far _Museum1FScientist1DoYouKnowWhatAmberIsText
	text_end

.TheresALabSomewhereText:
	text_far _Museum1FScientist1TheresALabSomewhereText
	text_end

.AmberIsFossilizedTreeSapText:
	text_far _Museum1FScientist1AmberIsFossilizedTreeSapText
	text_end

.GoToOtherSideText:
	text_far _Museum1FScientist1GoToOtherSideText
	text_end

.TakePlentyOfTimeText:
	text_far _Museum1FScientist1TakePlentyOfTimeText
	text_end

Museum1FGamblerText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _Museum1FGamblerText
	text_end

Museum1FScientist2Text:
	text_asm
	CheckEvent EVENT_GOT_OLD_AMBER
	jr nz, .got_item
	ld hl, .TakeThisToAPokemonLabText
	call PrintText
	lb bc, OLD_AMBER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_OLD_AMBER
	ld a, HS_OLD_AMBER
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, .ReceivedOldAmberText
	jr .done
.bag_full
	ld hl, .YouDontHaveSpaceText
	jr .done
.got_item
	ld hl, .GetTheOldAmberCheckText
.done
	call PrintText
	jp TextScriptEnd

.TakeThisToAPokemonLabText:
	text_far _Museum1FScientist2TakeThisToAPokemonLabText
	text_end

.ReceivedOldAmberText:
	text_far _Museum1FScientist2ReceivedOldAmberText
	sound_get_item_1
	text_end

.GetTheOldAmberCheckText:
	text_far _Museum1FScientist2GetTheOldAmberCheckText
	text_end

.YouDontHaveSpaceText:
	text_far _Museum1FScientist2YouDontHaveSpaceText
	text_end

Museum1FScientist3Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _Museum1FScientist3Text
	text_end

Museum1FOldAmberText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _Museum1FOldAmberText
	text_end
