Route6GateScript: ; 1e03d (7:603d)
	call EnableAutoTextBoxDrawing
	ld hl, Route6GateScriptPointers
	ld a, [W_ROUTE6GATECURSCRIPT]
	call CallFunctionInTable
	ret

Route6GateScriptPointers: ; 1e04a (7:604a)
	dw Route6GateScript0
	dw Route6GateScript1

Route6GateScript0: ; 1e04e (7:604e)
	ld a, [wd728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1e08c
	call ArePlayerCoordsInArray
	ret nc
	ld a, $1
	ld [wd528], a
	xor a
	ld [hJoyHeld], a
	callba RemoveGuardDrink
	ld a, [$ffdb]
	and a
	jr nz, .asm_1e080 ; 0x1e06e $10
	ld a, $2
	ld [$ff8c], a
	call DisplayTextID
	call Route6GateScript_1e0a1
	ld a, $1
	ld [W_ROUTE6GATECURSCRIPT], a
	ret
.asm_1e080
	ld hl, wd728
	set 6, [hl]
	ld a, $3
	ld [$ff8c], a
	jp DisplayTextID

CoordsData_1e08c: ; 1e08c (7:608c)
	db $02,$03
	db $02,$04,$FF

Route6GateScript1: ; 1e091 (7:6091)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [W_ROUTE6GATECURSCRIPT], a
	ret

Route6GateScript_1e0a1: ; 1e0a1 (7:60a1)
	ld hl, wd730
	set 7, [hl]
	ld a, $80
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ret

Route6GateTextPointers: ; 1e0b8 (7:60b8)
	dw Route6GateText1
	dw Route6GateText2
	dw Route6GateText3
