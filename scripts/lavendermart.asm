LavenderMartScript: ; 5c92c (17:492c)
	jp EnableAutoTextBoxDrawing

LavenderMartTextPointers: ; 5c92f (17:492f)
	dw LavenderMartText1
	dw LavenderMartText2
	dw LavenderMartText3

LavenderMartText2: ; 5c935 (17:4935)
	TX_FAR _LavenderMartText2
	db "@"

LavenderMartText3: ; 5c93a (17:493a)
	TX_ASM
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .asm_c88d4
	ld hl, LavenderMart_5c953
	call PrintText
	jr .asm_6d225
.asm_c88d4
	ld hl, LavenderMart_5c958
	call PrintText
.asm_6d225
	jp TextScriptEnd

LavenderMart_5c953: ; 5c953 (17:4953)
	TX_FAR _LavenderMart_5c953
	db "@"

LavenderMart_5c958: ; 5c958 (17:4958)
	TX_FAR _LavenderMart_5c958
	db "@"
