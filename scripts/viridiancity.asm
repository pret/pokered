ViridianCityScript: ; 18ff1 (6:4ff1)
	call EnableAutoTextBoxDrawing
	ld hl, ViridianCityScriptPointers
	ld a, [W_VIRIDIANCITYCURSCRIPT]
	jp CallFunctionInTable

ViridianCityScriptPointers: ; 18ffd (6:4ffd)
	dw ViridianCityScript0
	dw ViridianCityScript1
	dw ViridianCityScript2
	dw ViridianCityScript3

ViridianCityScript0: ; 19005 (6:5005)
	call ViridianCityScript_1900b
	jp ViridianCityScript_1903d

ViridianCityScript_1900b: ; 1900b (6:500b)
	ld a, [wd74c]
	bit 0, a
	ret nz
	ld a, [W_OBTAINEDBADGES]
	cp %01111111
	jr nz, .asm_1901e ; 0x19016 $6
	ld hl, wd74c
	set 0, [hl]
	ret
.asm_1901e
	ld a, [W_YCOORD]
	cp $8
	ret nz
	ld a, [W_XCOORD]
	cp $20
	ret nz
	ld a, $e
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	call ViridianCityScript_190cf
	ld a, $3
	ld [W_VIRIDIANCITYCURSCRIPT], a
	ret

ViridianCityScript_1903d: ; 1903d (6:503d)
	ld a, [wd74b]
	bit 5, a
	ret nz
	ld a, [W_YCOORD]
	cp $9
	ret nz
	ld a, [W_XCOORD]
	cp $13
	ret nz
	ld a, $5
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	call ViridianCityScript_190cf
	ld a, $3
	ld [W_VIRIDIANCITYCURSCRIPT], a
	ret

ViridianCityScript1: ; 19062 (6:5062)
	ld a, [wSpriteStateData1 + $34]
	ld [$ffeb], a
	ld a, [wSpriteStateData1 + $36]
	ld [$ffec], a
	ld a, [wSpriteStateData2 + $34]
	ld [$ffed], a
	ld a, [wSpriteStateData2 + $35]
	ld [$ffee], a
	xor a
	ld [wListScrollOffset], a

	; set up battle for Old Man
	ld a, $1
	ld [W_BATTLETYPE], a
	ld a, 5
	ld [W_CURENEMYLVL], a
	ld a, WEEDLE
	ld [W_CUROPPONENT], a
	ld a, $2
	ld [W_VIRIDIANCITYCURSCRIPT], a
	ret

ViridianCityScript2: ; 1908f (6:508f)
	ld a, [$ffeb]
	ld [wSpriteStateData1 + $34], a
	ld a, [$ffec]
	ld [wSpriteStateData1 + $36], a
	ld a, [$ffed]
	ld [wSpriteStateData2 + $34], a
	ld a, [$ffee]
	ld [wSpriteStateData2 + $35], a
	call UpdateSprites
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld a, $f
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [W_BATTLETYPE], a
	ld [wJoyIgnore], a
	ld a, $0
	ld [W_VIRIDIANCITYCURSCRIPT], a
	ret

ViridianCityScript3: ; 190c1 (6:50c1)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, 0
	ld [W_VIRIDIANCITYCURSCRIPT], a
	ret

ViridianCityScript_190cf: ; 190cf (6:50cf)
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, $80
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpriteStateData1 + 9], a
	ld [wJoyIgnore], a
	ret

ViridianCityTextPointers: ; 190e4 (6:50e4)
	dw ViridianCityText1
	dw ViridianCityText2
	dw ViridianCityText3
	dw ViridianCityText4
	dw ViridianCityText5
	dw ViridianCityText6
	dw ViridianCityText7
	dw ViridianCityText8
	dw ViridianCityText9
	dw ViridianCityText10
	dw MartSignText
	dw PokeCenterSignText
	dw ViridianCityText13
	dw ViridianCityText14
	dw ViridianCityText15

ViridianCityText1: ; 19102 (6:5102)
	TX_FAR _ViridianCityText1
	db "@"

ViridianCityText2: ; 19107 (6:5107)
	db $08 ; asm
	ld a, [W_OBTAINEDBADGES]
	cp %01111111
	ld hl, ViridianCityText_19127
	jr z, .asm_ae9fe ; 0x19110
	ld a, [wd751]
	bit 1, a
	jr nz, .asm_ae9fe ; 0x19117
	ld hl, ViridianCityText_19122
.asm_ae9fe ; 0x1911c
	call PrintText
	jp TextScriptEnd

ViridianCityText_19122: ; 19122 (6:5122)
	TX_FAR _ViridianCityText_19122
	db "@"

ViridianCityText_19127: ; 19127 (6:5127)
	TX_FAR _ViridianCityText_19127
	db "@"

ViridianCityText3: ; 1912c (6:512c)
	db $08 ; asm
	ld hl, ViridianCityText_1914d
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_6dfea ; 0x1913a
	ld hl, ViridianCityText_19157
	call PrintText
	jr .asm_d611f ; 0x19142
.asm_6dfea ; 0x19144
	ld hl, ViridianCityText_19152
	call PrintText
.asm_d611f ; 0x1914a
	jp TextScriptEnd

ViridianCityText_1914d: ; 1914d (6:514d)
	TX_FAR _ViridianCityText_1914d
	db "@"

ViridianCityText_19152: ; 19152 (6:5152)
	TX_FAR _ViridianCityText_19152
	db "@"

ViridianCityText_19157: ; 19157 (6:5157)
	TX_FAR _ViridianCityText_19157
	db "@"

ViridianCityText4: ; 1915c (6:515c)
	db $08 ; asm
	ld a, [wd74b]
	bit 5, a
	jr nz, .asm_83894 ; 0x19162
	ld hl, ViridianCityText_19175
	call PrintText
	jr .asm_700a6 ; 0x1916a
.asm_83894 ; 0x1916c
	ld hl, ViridianCityText_1917a
	call PrintText
.asm_700a6 ; 0x19172
	jp TextScriptEnd

ViridianCityText_19175: ; 19175 (6:5175)
	TX_FAR _ViridianCityText_19175
	db "@"

ViridianCityText_1917a: ; 1917a (6:517a)
	TX_FAR _ViridianCityText_1917a
	db "@"

ViridianCityText5: ; 1917f (6:517f)
	db $08 ; asm
	ld hl, ViridianCityText_19191
	call PrintText
	call ViridianCityScript_190cf
	ld a, $3
	ld [W_VIRIDIANCITYCURSCRIPT], a
	jp TextScriptEnd

ViridianCityText_19191: ; 19191 (6:5191)
	TX_FAR _ViridianCityText_19191
	db "@"

ViridianCityText6: ; 19196 (6:5196)
	db $08 ; asm
	ld a, [wd74c]
	bit 1, a
	jr nz, .asm_4e5a0 ; 0x1919c
	ld hl, ViridianCityText_191ca
	call PrintText
	ld bc, (TM_42 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedTM42Text
	call PrintText
	ld hl, wd74c
	set 1, [hl]
	jr .asm_3c73c ; 0x191b7
.BagFull
	ld hl, TM42NoRoomText
	call PrintText
	jr .asm_3c73c ; 0x191bf
.asm_4e5a0 ; 0x191c1
	ld hl, TM42Explanation
	call PrintText
.asm_3c73c ; 0x191c7
	jp TextScriptEnd

ViridianCityText_191ca: ; 191ca (6:51ca)
	TX_FAR _ViridianCityText_191ca
	db "@"

ReceivedTM42Text: ; 191cf (6:51cf)
	TX_FAR _ReceivedTM42Text
	db $10, "@"

TM42Explanation: ; 191d5 (6:51d5)
	TX_FAR _TM42Explanation
	db "@"

TM42NoRoomText: ; 191da (6:51da)
	TX_FAR _TM42NoRoomText
	db "@"

ViridianCityText7: ; 191df (6:51df)
	db $08 ; asm
	ld hl, ViridianCityText_1920a
	call PrintText
	ld c, $2
	call DelayFrames
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .asm_42f68 ; 0x191f2
	ld hl, ViridianCityText_1920f
	call PrintText
	ld a, $1
	ld [W_VIRIDIANCITYCURSCRIPT], a
	jr .asm_2413a ; 0x191ff
.asm_42f68 ; 0x19201
	ld hl, ViridianCityText_19214
	call PrintText
.asm_2413a ; 0x19207
	jp TextScriptEnd

ViridianCityText_1920a: ; 1920a (6:520a)
	TX_FAR _ViridianCityText_1920a
	db "@"

ViridianCityText_1920f: ; 1920f (6:520f)
	TX_FAR _ViridianCityText_1920f
	db "@"

ViridianCityText_19214: ; 19214 (6:5214)
	TX_FAR _ViridianCityText_19214
	db "@"

ViridianCityText15: ; 19219 (6:5219)
	TX_FAR _ViridianCityText_19219
	db "@"

ViridianCityText8: ; 1921e (6:521e)
	TX_FAR _ViridianCityText8
	db "@"

ViridianCityText9: ; 19223 (6:5223)
	TX_FAR _ViridianCityText9
	db "@"

ViridianCityText10: ; 19228 (6:5228)
	TX_FAR _ViridianCityText10
	db "@"

ViridianCityText13: ; 1922d (6:522d)
	TX_FAR _ViridianCityText13
	db "@"

ViridianCityText14: ; 19232 (6:5232)
	TX_FAR _ViridianCityText14
	db "@"
