VermilionCityScript: ; 197a1 (6:57a1)
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	push hl
	call nz, VermilionCityScript_197cb
	pop hl
	bit 5, [hl]
	res 5, [hl]
	call nz, VermilionCityScript_197c0
	ld hl, VermilionCityScriptPointers
	ld a, [wVermilionCityCurScript]
	jp CallFunctionInTable

VermilionCityScript_197c0: ; 197c0 (6:57c0)
	call Random
	ld a, [$ffd4]
	and $e
	ld [wFirstLockTrashCanIndex], a
	ret

VermilionCityScript_197cb: ; 197cb (6:57cb)
	CheckEventHL EVENT_SS_ANNE_LEFT
	ret z
	CheckEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	SetEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	ret nz
	ld a, $2
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScriptPointers: ; 197dc (6:57dc)
	dw VermilionCityScript0
	dw VermilionCityScript1
	dw VermilionCityScript2
	dw VermilionCityScript3
	dw VermilionCityScript4

VermilionCityScript0: ; 197e6 (6:57e6)
	ld a, [wSpriteStateData1 + 9]
	and a ; cp SPRITE_FACING_DOWN
	ret nz
	ld hl, CoordsData_19823
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ld [hJoyHeld], a
	ld [wcf0d], a
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .asm_19810
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret nz
.asm_19810
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wVermilionCityCurScript], a
	ret

CoordsData_19823: ; 19823 (6:5823)
	db $1e,$12
	db $ff

VermilionCityScript4: ; 19826 (6:5826)
	ld hl, CoordsData_19823
	call ArePlayerCoordsInArray
	ret c
	ld a, $0
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScript2: ; 19833 (6:5833)
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScript3: ; 1984e (6:584e)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld [hJoyHeld], a
	ld a, $0
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScript1: ; 1985f (6:585f)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, $0
	ld [wVermilionCityCurScript], a
	ret

VermilionCityTextPointers: ; 1986f (6:586f)
	dw VermilionCityText1
	dw VermilionCityText2
	dw VermilionCityText3
	dw VermilionCityText4
	dw VermilionCityText5
	dw VermilionCityText6
	dw VermilionCityText7
	dw VermilionCityText8
	dw MartSignText
	dw PokeCenterSignText
	dw VermilionCityText11
	dw VermilionCityText12
	dw VermilionCityText13

VermilionCityText1: ; 19889 (6:5889)
	TX_FAR _VermilionCityText1
	db "@"

VermilionCityText2: ; 1988e (6:588e)
	TX_ASM
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .asm_1989e
	ld hl, VermilionCityText_198a7
	call PrintText
	jr .asm_198a4
.asm_1989e
	ld hl, VermilionCityText_198ac
	call PrintText
.asm_198a4
	jp TextScriptEnd

VermilionCityText_198a7: ; 198a7 (6:58a7)
	TX_FAR _VermilionCityText_198a7
	db "@"

VermilionCityText_198ac: ; 198ac (6:58ac)
	TX_FAR _VermilionCityText_198ac
	db "@"

VermilionCityText3: ; 198b1 (6:58b1)
	TX_ASM
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .asm_198f6
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_RIGHT
	jr z, .asm_198c8
	ld hl, VermilionCityCoords1
	call ArePlayerCoordsInArray
	jr nc, .asm_198d0
.asm_198c8
	ld hl, SSAnneWelcomeText4
	call PrintText
	jr .asm_198fc
.asm_198d0
	ld hl, SSAnneWelcomeText9
	call PrintText
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr nz, .asm_198e9
	ld hl, SSAnneNoTicketText
	call PrintText
	jr .asm_198fc
.asm_198e9
	ld hl, SSAnneFlashedTicketText
	call PrintText
	ld a, $4
	ld [wVermilionCityCurScript], a
	jr .asm_198fc
.asm_198f6
	ld hl, SSAnneNotHereText
	call PrintText
.asm_198fc
	jp TextScriptEnd

VermilionCityCoords1: ; 198ff (6:58ff)
	db $1d,$13
	db $1f,$13
	db $ff

SSAnneWelcomeText4: ; 19904 (6:5904)
	TX_FAR _SSAnneWelcomeText4
	db "@"

SSAnneWelcomeText9: ; 19909 (6:5909)
	TX_FAR _SSAnneWelcomeText9
	db "@"

SSAnneFlashedTicketText: ; 1990e (6:590e)
	TX_FAR _SSAnneFlashedTicketText
	db "@"

SSAnneNoTicketText: ; 19913 (6:5913)
	TX_FAR _SSAnneNoTicketText
	db "@"

SSAnneNotHereText: ; 19918 (6:5918)
	TX_FAR _SSAnneNotHereText
	db "@"

VermilionCityText4: ; 1991d (6:591d)
	TX_FAR _VermilionCityText4
	db "@"

VermilionCityText5: ; 19922 (6:5922)
	TX_FAR _VermilionCityText5
	TX_ASM
	ld a, MACHOP
	call PlayCry
	call WaitForSoundToFinish
	ld hl, VermilionCityText14
	ret

VermilionCityText14: ; 19933 (6:5933)
	TX_FAR _VermilionCityText14
	db "@"

VermilionCityText6: ; 19938 (6:5938)
	TX_FAR _VermilionCityText6
	db "@"

VermilionCityText7: ; 1993d (6:593d)
	TX_FAR _VermilionCityText7
	db "@"

VermilionCityText8: ; 19942 (6:5942)
	TX_FAR _VermilionCityText8
	db "@"

VermilionCityText11: ; 19947 (6:5947)
	TX_FAR _VermilionCityText11
	db "@"

VermilionCityText12: ; 1994c (6:594c)
	TX_FAR _VermilionCityText12
	db "@"

VermilionCityText13: ; 19951 (6:5951)
	TX_FAR _VermilionCityText13
	db "@"
