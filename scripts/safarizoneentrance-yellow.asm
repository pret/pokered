.xf1f77
	ld hl,.ForJust500Text
	call PrintText
	ld a,MONEY_BOX
	ld [wTextBoxID],a
	call DisplayTextBoxID
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jp nz,.PleaseComeAgain
	ld hl,$d346 ; yellow d346
	ld a,[hli]
	or [hl]
	inc hl
	or [hl]
	jr nz,.xf1f9f
.xf1f98
	call .xf20ce
	jr c,.CantPayWalkDown
	jr .xf1ff2

.xf1f9f
	xor a
	ld [hMoney],a
	ld a,$05
	ld [hMoney + 1],a
	ld a,$00
	ld [hMoney + 2],a
	call HasEnoughMoney
	jr nc,.success
	ld hl,.NotEnoughMoneyText
	call PrintText
	call .xf2077
	jr c,.CantPayWalkDown
	jr .xf1ff2

.success
	xor a
	ld [wPriceTemp],a
	ld a,$05
	ld [wPriceTemp + 1],a
	ld a,$00
	ld [wPriceTemp + 2],a
	ld hl,wPriceTemp + 2
	ld de,wPlayerMoney + 2
	ld c,3
	predef SubBCDPredef
	ld a,$b2
	call $3736
	call $373e
	ld a,MONEY_BOX
	ld [wTextBoxID],a
	call DisplayTextBoxID
	ld hl,.MakePaymentText
	call PrintText
	ld a,30
	lb hl, (502 / $100),  (502 % $100)
.xf1ff2
	ld [W_NUMSAFARIBALLS],a
	ld a,h
	ld [wSafariSteps],a
	ld a,l
	ld [wSafariSteps + 1],a
	ld a,D_UP
	ld c,3
	call SafariZoneEntranceAutoWalk
	SetEvent EVENT_IN_SAFARI_ZONE
	ResetEventReuseHL EVENT_SAFARI_GAME_OVER
	ld a,3
	ld [W_SAFARIZONEENTRANCECURSCRIPT],a
	jr .done

.PleaseComeAgain
	ld hl,.PleaseComeAgainText
	call PrintText
.CantPayWalkDown
	ld a,D_DOWN
	ld c,1
	call SafariZoneEntranceAutoWalk
	ld a,4
	ld [W_SAFARIZONEENTRANCECURSCRIPT],a
.done
	ret

.ForJust500Text
	TX_FAR SafariZoneEntranceText_9e6e4
	db "@"

.MakePaymentText
	TX_FAR SafariZoneEntranceText_9e747
	db $b
	TX_FAR _SafariZoneEntranceText_75360
	db "@"

.PleaseComeAgainText
	TX_FAR _SafariZoneEntranceText_75365
	db "@"

.NotEnoughMoneyText
	TX_FAR _SafariZoneEntranceText_7536a
	db "@"

.SafariZoneEntranceText2
	ld hl,.FirstTimeQuestionText
	call PrintText
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	ld hl,.RegularText
	jr nz,.Explanation
	ld hl,.ExplanationText
.Explanation
	call PrintText
	ret

.FirstTimeQuestionText
	TX_FAR _SafariZoneEntranceText_753e6
	db "@"

.ExplanationText
	TX_FAR _SafariZoneEntranceText_753eb
	db "@"

.RegularText
	TX_FAR _SafariZoneEntranceText_753f0
	db "@"

SafariZoneEntranceAutoWalk:
	push af
	ld b,0
	ld a,c
	ld [wSimulatedJoypadStatesIndex],a
	ld hl,wSimulatedJoypadStatesEnd
	pop af
	call FillMemory
	jp StartSimulatingJoypadStates

.xf2077
	ld hl,wPlayerMoney
	ld de,$ff9f
	ld bc,3
	call $b1 ; yellow $00b1
	xor a
	ld [$ffa2],a
	ld [$ffa3],a
	ld a,$17 ; ¥17 per safari ball
	ld [$ffa4],a
	predef DivideBCDPredef3
	ld a,[$ffa4]
	call .xf211e
	pop af
	ld hl,$d346
	xor a
	ld bc,3
	call FillMemory
	ld hl,.OhAllRightText
	call PrintText_NoCreatingTextBox
	ld a,MONEY_BOX
	ld a,[$d124]
	call DisplayTextBoxID
	ld hl,.CantGive30BallsText
	call PrintText
	pop af
	inc a
	jr z,.xf20bd
	cp 29
	jr c,.xf20bf
.xf20bd
	ld a,29
.xf20bf
	ld hl,$1f6
	and a
	ret

.OhAllRightText
	TX_FAR _SafariZoneLowCostText1
	db "@"

.CantGive30BallsText
	TX_FAR _SafariZoneLowCostText2
	db "@"

.xf20ce
	ld hl,$d70c
	ld a,[hl]
	push af
	inc [hl]
	ld e,a
	ld d,0
	ld hl,.lowcosttextpointers
	add hl,de
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call PrintText
	pop af
	cp 3
	jr z,.next
	scf
	ret

.next
	ld hl,.xf20f6
	call $3c46
	ld a,1
	ld hl,$01f6
	and a
	ret

.xf20f6
	TX_FAR _SafariZoneLowCostText3
	db $b
	TX_FAR _SafariZoneLowCostText4
	db "@"

.lowcosttextpointers
	dw .xf210a
	dw .xf210f
	dw .xf2114
	dw .xf2119
	dw .xf2119

.xf210a
	TX_FAR _SafariZoneLowCostText5
	db "@"

.xf210f
	TX_FAR _SafariZoneLowCostText6
	db "@"

.xf2114
	TX_FAR _SafariZoneLowCostText7
	db "@"

.xf2119
	TX_FAR _SafariZoneLowCostText8
	db "@"

.xf211e
	push hl
	ld c,a
	and $f
	ld l,a
	ld h,0
	ld a,c
	and $f0
	swap a
	ld bc,$a
	call $3a74
	ld a,l
	pop hl
	ret

.xf2133
