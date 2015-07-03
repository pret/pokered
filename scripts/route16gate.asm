Route16GateScript: ; 496be (12:56be)
	ld hl, wd732
	res 5, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [W_ROUTE16GATECURSCRIPT]
	ld hl, Route16GateScriptPointers
	jp CallFunctionInTable

Route16GateScriptPointers: ; 496cf (12:56cf)
	dw Route16GateScript0
	dw Route16GateScript1
	dw Route16GateScript2
	dw Route16GateScript3

Route16GateScript0: ; 496d7 (12:56d7)
	call Route16GateScript_49755
	ret nz
	ld hl, CoordsData_49714
	call ArePlayerCoordsInArray
	ret nc
	ld a, $3
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld a, [wWhichTrade]
	cp $1
	jr z, .asm_4970e
	ld a, [wWhichTrade]
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld b, $0
	ld c, a
	ld a, $40
	ld hl, wSimulatedJoypadStatesEnd
	call FillMemory
	call StartSimulatingJoypadStates
	ld a, $1
	ld [W_ROUTE16GATECURSCRIPT], a
	ret
.asm_4970e
	ld a, $2
	ld [W_ROUTE16GATECURSCRIPT], a
	ret

CoordsData_49714: ; 49714 (12:5714)
	db $07,$04
	db $08,$04
	db $09,$04
	db $0A,$04
	db $FF

Route16GateScript1: ; 4971d (12:571d)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a

Route16GateScript2: ; 49727 (12:5727)
	ld a, $1
	ld [H_SPRITEHEIGHT], a
	call DisplayTextID
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, $10
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [W_ROUTE16GATECURSCRIPT], a
	ret

Route16GateScript3: ; 49741 (12:5741)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld hl, wd730
	res 7, [hl]
	ld a, $0
	ld [W_ROUTE16GATECURSCRIPT], a
	ret

Route16GateScript_49755: ; 49755 (12:5755)
	ld b, BICYCLE
	jp IsItemInBag

Route16GateTextPointers: ; 4975a (12:575a)
	dw Route16GateText1
	dw Route16GateText2
	dw Route16GateText3

Route16GateText1: ; 49760 (12:5760)
	TX_ASM
	call Route16GateScript_49755
	jr z, .asm_0bdf3
	ld hl, Route16GateText_4977c
	call PrintText
	jr .asm_56c9d
.asm_0bdf3
	ld hl, Route16GateText_49777
	call PrintText
.asm_56c9d
	jp TextScriptEnd

Route16GateText_49777: ; 49777 (12:5777)
	TX_FAR _Route16GateText_49777
	db "@"

Route16GateText_4977c: ; 4977c (12:577c)
	TX_FAR _Route16GateText_4977c
	db "@"

Route16GateText3: ; 49781 (12:5781)
	TX_FAR _Route16GateText_49781
	db "@"

Route16GateText2: ; 49786 (12:5786)
	TX_FAR _Route16GateText2
	db "@"
