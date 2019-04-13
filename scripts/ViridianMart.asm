ViridianMart_Script:
	call ViridianMartScript_1d47d
	call EnableAutoTextBoxDrawing
	ld hl, ViridianMart_ScriptPointers
	ld a, [wViridianMartCurScript]
	jp CallFunctionInTable

ViridianMartScript_1d47d:
	CheckEvent EVENT_OAK_GOT_PARCEL
	jr nz, .asm_1d489
	ld hl, ViridianMart_TextPointers
	jr .asm_1d48c
.asm_1d489
	ld hl, ViridianMart_TextPointers2
.asm_1d48c
	ld a, l
	ld [wMapTextPtr], a
	ld a, h
	ld [wMapTextPtr+1], a
	ret

ViridianMart_ScriptPointers:
	dw ViridianMartScript0
	dw ViridianMartScript1
	dw ViridianMartScript2

ViridianMartScript0:
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
	ld [wViridianMartCurScript], a
	ret

RLEMovement1d4bb:
	db D_LEFT, $01
	db D_UP, $02
	db $ff

ViridianMartScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	lb bc, OAKS_PARCEL, 1
	call GiveItem
	SetEvent EVENT_GOT_OAKS_PARCEL
	ld a, $2
	ld [wViridianMartCurScript], a
	; fallthrough
ViridianMartScript2:
	ret

ViridianMart_TextPointers:
	dw ViridianMartText1
	dw ViridianMartText2
	dw ViridianMartText3
	dw ViridianMartText4
	dw ViridianMartText5
ViridianMart_TextPointers2:
	dw ViridianCashierText
	dw ViridianMartText2
	dw ViridianMartText3

ViridianMartText1:
	TX_FAR _ViridianMartText1
	db "@"

ViridianMartText4:
	TX_FAR _ViridianMartText4
	db "@"

ViridianMartText5:
	TX_FAR ViridianMartParcelQuestText
	TX_SFX_KEY_ITEM
	db "@"

ViridianMartText2:
	TX_FAR _ViridianMartText2
	db "@"

ViridianMartText3:
	TX_FAR _ViridianMartText3
	db "@"
