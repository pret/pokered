SafariZoneEntranceScript: ; 751cd (1d:51cd)
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneEntranceScriptPointers
	ld a, [W_SAFARIZONEENTRANCECURSCRIPT]
	jp CallFunctionInTable

SafariZoneEntranceScriptPointers: ; 751d9 (1d:51d9)
	dw .SafariZoneEntranceScript0
	dw .SafariZoneEntranceScript1
	dw .SafariZoneEntranceScript2
	dw .SafariZoneEntranceScript3
	dw .SafariZoneEntranceScript4
	dw .SafariZoneEntranceScript5
	dw .SafariZoneEntranceScript6

.SafariZoneEntranceScript0
	ld hl, .CoordsData_75221
	call ArePlayerCoordsInArray
	ret nc
	ld a, $3
	ld [$ff8c], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	xor a
	ld [hJoyHeld], a
	ld a, $c
	ld [wSpriteStateData1 + 9], a
	ld a, [wWhichTrade]
	cp $1
	jr z, .asm_7520f ; 0x75207 $6
	ld a, $2
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret
.asm_7520f
	ld a, $10
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

.CoordsData_75221: ; 75221 (1d:5221)
	db $02,$03
	db $02,$04
	db $FF

.SafariZoneEntranceScript1
	call SafariZoneEntranceScript_752b4
	ret nz
.SafariZoneEntranceScript2
	xor a
	ld [hJoyHeld], a
	ld [wJoyIgnore], a
	call UpdateSprites
	ld a, $4
	ld [$ff8c], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ret

.SafariZoneEntranceScript3
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $5
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

.SafariZoneEntranceScript5
	ld a, $4
	ld [wd528], a
	ld hl, wd790
	bit 6, [hl]
	res 6, [hl]
	jr z, .asm_7527f ; 0x7525a $23
	res 7, [hl]
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $6
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [W_NUMSAFARIBALLS], a
	ld a, $80
	ld c, $3
	call SafariZoneEntranceAutoWalk
	ld a, $4
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	jr .asm_75286 ; 0x7527d $7
.asm_7527f
	ld a, $5
	ld [$ff8c], a
	call DisplayTextID
.asm_75286
	ret

.SafariZoneEntranceScript4
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

.SafariZoneEntranceScript6
	call SafariZoneEntranceScript_752b4
	ret nz
	call Delay3
	ld a, [wcf0d]
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

SafariZoneEntranceAutoWalk:
	push af
	ld b,0
	ld a,c
	ld [wSimulatedJoypadStatesIndex],a
	ld hl,wSimulatedJoypadStatesEnd
	pop af
	call FillMemory
	jp StartSimulatingJoypadStates

SafariZoneEntranceScript_752b4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret

SafariZoneEntranceTextPointers: ; 752b9 (1d:52b9)
	dw .SafariZoneEntranceText1
	dw .SafariZoneEntranceText2
	dw .SafariZoneEntranceText1
	dw .SafariZoneEntranceText4
	dw .SafariZoneEntranceText5
	dw .SafariZoneEntranceText6

.SafariZoneEntranceText1
	TX_FAR _SafariZoneEntranceText1
	db "@"

.SafariZoneEntranceText4
	TX_FAR SafariZoneEntranceText_9e6e4 ; 0x9e6e4
	db $8
	ld a, $13
	ld [wd125],a
	call DisplayTextBoxID
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jp nz,.PleaseComeAgain
	xor a
	ld [$ff9f],a
	ld a,$05
	ld [$ffa0],a
	ld a,$00
	ld [$ffa1],a
	call HasEnoughMoney
	jr nc,.success
	ld hl,.NotEnoughMoneyText
	call PrintText
	jr .CantPayWalkDown

.success
	xor a
	ld [wSubtrahend],a
	ld a,$05
	ld [wSubtrahend+1],a
	ld a,$00
	ld [wSubtrahend+2],a
	ld hl,wTrainerFacingDirection
	ld de,wPlayerMoney + 2
	ld c,3
	predef SubBCDPredef
	ld a,$13
	ld [wd125],a
	call DisplayTextBoxID
	ld hl,.MakePaymentText
	call PrintText
	ld a,30
	ld [W_NUMSAFARIBALLS],a
	ld a,502 / $100
	ld [wSafariSteps],a
	ld a, 502 % $100
	ld [wSafariSteps + 1],a
	ld a,$40
	ld c,3
	call SafariZoneEntranceAutoWalk
	ld hl,wd790
	set 7,[hl]
	res 6,[hl]
	ld a,3
	ld [W_SAFARIZONEENTRANCECURSCRIPT],a
	jr .done

.PleaseComeAgain
	ld hl,.PleaseComeAgainText
	call PrintText
.CantPayWalkDown
	ld a,$80
	ld c,1
	call SafariZoneEntranceAutoWalk
	ld a,4
	ld [W_SAFARIZONEENTRANCECURSCRIPT],a
.done
	jp TextScriptEnd

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

.SafariZoneEntranceText5
	TX_FAR SafariZoneEntranceText_9e814 ; 0x9e814
	db $8
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jr nz, .asm_7539c ; 0x7537b $1f
	ld hl, .SafariZoneEntranceText_753bb
	call PrintText
	xor a
	ld [wSpriteStateData1 + 9], a
	ld a, $80
	ld c, $3
	call SafariZoneEntranceAutoWalk
	ld hl, wd790
	res 6, [hl]
	res 7, [hl]
	ld a, $0
	ld [wcf0d], a
	jr .asm_753b3 ; 0x7539a $17
.asm_7539c
	ld hl, .SafariZoneEntranceText_753c0
	call PrintText
	ld a, $4
	ld [wSpriteStateData1 + 9], a
	ld a, $40
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $5
	ld [wcf0d], a
.asm_753b3
	ld a, $6
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	jp TextScriptEnd

.SafariZoneEntranceText_753bb
	TX_FAR _SafariZoneEntranceText_753bb
	db "@"

.SafariZoneEntranceText_753c0
	TX_FAR _SafariZoneEntranceText_753c0
	db "@"

.SafariZoneEntranceText6
	TX_FAR _SafariZoneEntranceText_753c5
	db "@"

.SafariZoneEntranceText2
	db $08 ; asm
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
	jp TextScriptEnd

.FirstTimeQuestionText
	TX_FAR _SafariZoneEntranceText_753e6
	db "@"

.ExplanationText
	TX_FAR _SafariZoneEntranceText_753eb
	db "@"

.RegularText
	TX_FAR _SafariZoneEntranceText_753f0
	db "@"
