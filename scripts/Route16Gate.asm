Route16GateMapScript: ; 496be (12:56be)
	ld hl, $d732
	res 5, [hl]
	call EnableAutoTextBoxDrawing
	ld a, [W_ROUTE16GATECURSCRIPT]
	ld hl, Route16GateMapScriptPointers
	jp CallFunctionInTable

Route16GateMapScriptPointers: ; 496cf (12:56cf)
	dw Route16GateMapScript0
	dw Route16GateMapScript1
	dw Route16GateMapScript2
	dw Route16GateMapScript3

Route16GateMapScript0: ; 496d7 (12:56d7)
	call Func_49755
	ret nz
	ld hl, CoordsData_49714
	call ArePlayerCoordsInArray
	ret nc
	ld a, $3
	ld [$ff00+$8c], a
	call DisplayTextID
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, [$cd3d]
	cp $1
	jr z, .asm_4970e ; 0x496f1 $1b
	ld a, [$cd3d]
	dec a
	ld [$cd38], a
	ld b, $0
	ld c, a
	ld a, $40
	ld hl, $ccd3
	call FillMemory
	call Func_3486
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

Route16GateMapScript1: ; 4971d (12:571d)
	ld a, [$cd38]
	and a
	ret nz
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a

Route16GateMapScript2: ; 49727 (12:5727)
	ld a, $1
	ld [H_SPRITEHEIGHT], a
	call DisplayTextID
	ld a, $1
	ld [$cd38], a
	ld a, $10
	ld [$ccd3], a
	call Func_3486
	ld a, $3
	ld [W_ROUTE16GATECURSCRIPT], a
	ret

Route16GateMapScript3: ; 49741 (12:5741)
	ld a, [$cd38]
	and a
	ret nz
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d730
	res 7, [hl]
	ld a, $0
	ld [W_ROUTE16GATECURSCRIPT], a
	ret

Func_49755: ; 49755 (12:5755)
	ld b, $6
	jp IsItemInBag

Route16GateMapTextPointers: ; 4975a (12:575a)
	dw Route16GateMapText1
	dw Route16GateMapText2
	dw Route16GateMapText3

Route16GateMapText1: ; 49760 (12:5760)
	db $08 ; asm
	call Func_49755
	jr z, .asm_0bdf3 ; 0x49764
	ld hl, UnnamedText_4977c
	call PrintText
	jr .asm_56c9d ; 0x4976c
.asm_0bdf3 ; 0x4976e
	ld hl, UnnamedText_49777
	call PrintText
.asm_56c9d ; 0x49774
	jp TextScriptEnd

UnnamedText_49777: ; 49777 (12:5777)
	TX_FAR _UnnamedText_49777
	db "@"

UnnamedText_4977c: ; 4977c (12:577c)
	TX_FAR _UnnamedText_4977c
	db "@"

Route16GateMapText3: ; 49781 (12:5781)
	TX_FAR _UnnamedText_49781
	db "@"

Route16GateMapText2: ; 49786 (12:5786)
	TX_FAR _Route16GateMapText2
	db "@"
	

