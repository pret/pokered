ViridianMartScript: ; 1d46e (7:546e)
	call ViridianMartScript_1d47d
	call EnableAutoTextBoxDrawing
	ld hl, ViridianMartScriptPointers
	ld a, [W_VIRIDIANMARKETCURSCRIPT]
	jp CallFunctionInTable

ViridianMartScript_1d47d: ; 1d47d (7:547d)
	ld a, [wd74e]
	bit 0, a
	jr nz, .asm_1d489
	ld hl, ViridianMartTextPointers
	jr .asm_1d48c
.asm_1d489
	ld hl, ViridianMartTextPointers + $a ; starts at ViridianMartText6
.asm_1d48c
	ld a, l
	ld [W_MAPTEXTPTR], a
	ld a, h
	ld [W_MAPTEXTPTR+1], a
	ret

ViridianMartScriptPointers: ; 1d495 (7:5495)
	dw ViridianMartScript0
	dw ViridianMartScript1
	dw ViridianMartScript2

ViridianMartScript0: ; 1d49b (7:549b)
	call UpdateSprites
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement1d4bb
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [W_VIRIDIANMARKETCURSCRIPT], a
	ret

RLEMovement1d4bb: ; 1d4bb (7:54bb)
	db D_LEFT, $01
	db D_UP, $02
	db $ff

ViridianMartScript1: ; 1d4c0 (7:54c0)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld bc, (OAKS_PARCEL << 8) + 1
	call GiveItem
	ld hl, wd74e
	set 1, [hl]
	ld a, $2
	ld [W_VIRIDIANMARKETCURSCRIPT], a
	; fallthrough
ViridianMartScript2: ; 1d4df (7:54df)
	ret

ViridianMartTextPointers: ; 1d4e0 (7:54e0)
	dw ViridianMartText1
	dw ViridianMartText2
	dw ViridianMartText3
	dw ViridianMartText4
	dw ViridianMartText5
	dw ViridianMartText6
	dw ViridianMartText2
	dw ViridianMartText3

ViridianMartText1: ; 1d4f0 (7:54f0)
	TX_FAR _ViridianMartText1
	db "@"

ViridianMartText4: ; 1d4f5 (7:54f5)
	TX_FAR _ViridianMartText4
	db "@"

ViridianMartText5: ; 1d4fa (7:54fa)
	TX_FAR ViridianMartParcelQuestText
	db $11
	db "@"

ViridianMartText2: ; 1d500 (7:5500)
	TX_FAR _ViridianMartText2
	db "@"

ViridianMartText3: ; 1d505 (7:5505)
	TX_FAR _ViridianMartText3
	db "@"
