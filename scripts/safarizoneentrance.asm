SafariZoneEntranceScript: ; 751cd (1d:51cd)
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneEntranceScriptPointers
	ld a, [W_SAFARIZONEENTRANCECURSCRIPT]
	jp CallFunctionInTable

SafariZoneEntranceScriptPointers: ; 751d9 (1d:51d9)
	dw SafariZoneEntranceScript0
	dw SafariZoneEntranceScript1
	dw SafariZoneEntranceScript2
	dw SafariZoneEntranceScript3
	dw SafariZoneEntranceScript4
	dw SafariZoneEntranceScript5
	dw SafariZoneEntranceScript6

SafariZoneEntranceScript0: ; 751e7 (1d:51e7)
	ld hl, CoordsData_75221
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
	call SafariZoneEntranceScript_752a3
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

CoordsData_75221: ; 75221 (1d:5221)
	db $02,$03
	db $02,$04
	db $FF

SafariZoneEntranceScript1: ; 75226 (1d:5226)
	call SafariZoneEntranceScript_752b4
	ret nz
SafariZoneEntranceScript2: ; 7522a (1d:522a)
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

SafariZoneEntranceScript3: ; 75240 (1d:5240)
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $5
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

SafariZoneEntranceScript5: ; 7524e (1d:524e)
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
	call SafariZoneEntranceScript_752a3
	ld a, $4
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	jr .asm_75286 ; 0x7527d $7
.asm_7527f
	ld a, $5
	ld [$ff8c], a
	call DisplayTextID
.asm_75286
	ret

SafariZoneEntranceScript4: ; 75287 (1d:5287)
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

SafariZoneEntranceScript6: ; 75295 (1d:5295)
	call SafariZoneEntranceScript_752b4
	ret nz
	call Delay3
	ld a, [wcf0d]
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ret

SafariZoneEntranceScript_752a3: ; 752a3 (1d:52a3)
	push af
	ld b, $0
	ld a, c
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wSimulatedJoypadStatesEnd
	pop af
	call FillMemory
	jp StartSimulatingJoypadStates

SafariZoneEntranceScript_752b4: ; 752b4 (1d:52b4)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret

SafariZoneEntranceTextPointers: ; 752b9 (1d:52b9)
	dw SafariZoneEntranceText1
	dw SafariZoneEntranceText2
	dw SafariZoneEntranceText3
	dw SafariZoneEntranceText4
	dw SafariZoneEntranceText5
	dw SafariZoneEntranceText6

SafariZoneEntranceText3: ; 752c5 (1d:52c5)
SafariZoneEntranceText1: ; 752c5 (1d:52c5)
	TX_FAR _SafariZoneEntranceText1
	db "@"

SafariZoneEntranceText4: ; 752ca (1d:52ca)
	TX_FAR SafariZoneEntranceText_9e6e4 ; 0x9e6e4
	db $8
	ld a, $13
	ld [wd125], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .asm_75346
	xor a
	ld [$ff9f], a
	ld a, $5
	ld [$ffa0], a
	ld a, $0
	ld [$ffa1], a
	call HasEnoughMoney
	jr nc, .asm_752f9 ; 0x752ef $8
	ld hl, SafariZoneEntranceText_7536a
	call PrintText
	jr .asm_7534c ; 0x752f7 $53
.asm_752f9
	xor a
	ld [wWhichTrade], a
	ld a, $5
	ld [wTrainerEngageDistance], a
	ld a, $0
	ld [wTrainerFacingDirection], a
	ld hl, wTrainerFacingDirection
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, $13
	ld [wd125], a
	call DisplayTextBoxID
	ld hl, SafariZoneEntranceText_7535b
	call PrintText
	ld a, $1e
	ld [W_NUMSAFARIBALLS], a
	ld a, 502 / $100
	ld [wSafariSteps], a
	ld a, 502 % $100
	ld [wSafariSteps + 1], a
	ld a, $40
	ld c, $3
	call SafariZoneEntranceScript_752a3
	ld hl, wd790
	set 7, [hl]
	res 6, [hl]
	ld a, $3
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	jr .asm_75358 ; 0x75344 $12
.asm_75346
	ld hl, SafariZoneEntranceText_75365
	call PrintText
.asm_7534c
	ld a, $80
	ld c, $1
	call SafariZoneEntranceScript_752a3
	ld a, $4
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
.asm_75358
	jp TextScriptEnd

SafariZoneEntranceText_7535b: ; 7535b (1d:535b)
	TX_FAR SafariZoneEntranceText_9e747 ; 0x9e747
	db $0B

SafariZoneEntranceText_75360: ; 75360 (1d:5360)
	TX_FAR _SafariZoneEntranceText_75360
	db "@"

SafariZoneEntranceText_75365: ; 75365 (1d:5365)
	TX_FAR _SafariZoneEntranceText_75365
	db "@"

SafariZoneEntranceText_7536a: ; 7536a (1d:536a)
	TX_FAR _SafariZoneEntranceText_7536a
	db "@"

SafariZoneEntranceText5: ; 7536f (1d:536f)
	TX_FAR SafariZoneEntranceText_9e814 ; 0x9e814
	db $8
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_7539c ; 0x7537b $1f
	ld hl, SafariZoneEntranceText_753bb
	call PrintText
	xor a
	ld [wSpriteStateData1 + 9], a
	ld a, $80
	ld c, $3
	call SafariZoneEntranceScript_752a3
	ld hl, wd790
	res 6, [hl]
	res 7, [hl]
	ld a, $0
	ld [wcf0d], a
	jr .asm_753b3 ; 0x7539a $17
.asm_7539c
	ld hl, SafariZoneEntranceText_753c0
	call PrintText
	ld a, $4
	ld [wSpriteStateData1 + 9], a
	ld a, $40
	ld c, $1
	call SafariZoneEntranceScript_752a3
	ld a, $5
	ld [wcf0d], a
.asm_753b3
	ld a, $6
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	jp TextScriptEnd

SafariZoneEntranceText_753bb: ; 753bb (1d:53bb)
	TX_FAR _SafariZoneEntranceText_753bb
	db "@"

SafariZoneEntranceText_753c0: ; 753c0 (1d:53c0)
	TX_FAR _SafariZoneEntranceText_753c0
	db "@"

SafariZoneEntranceText6: ; 753c5 (1d:53c5)
	TX_FAR _SafariZoneEntranceText_753c5
	db "@"

SafariZoneEntranceText2: ; 753ca (1d:53ca)
	db $08 ; asm
	ld hl, SafariZoneEntranceText_753e6
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, SafariZoneEntranceText_753f0
	jr nz, .asm_278a6 ; 0x753db
	ld hl, SafariZoneEntranceText_753eb
.asm_278a6 ; 0x753e0
	call PrintText
	jp TextScriptEnd

SafariZoneEntranceText_753e6: ; 753e6 (1d:53e6)
	TX_FAR _SafariZoneEntranceText_753e6
	db "@"

SafariZoneEntranceText_753eb: ; 753eb (1d:53eb)
	TX_FAR _SafariZoneEntranceText_753eb
	db "@"

SafariZoneEntranceText_753f0: ; 753f0 (1d:53f0)
	TX_FAR _SafariZoneEntranceText_753f0
	db "@"
