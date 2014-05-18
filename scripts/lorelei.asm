LoreleiScript: ; 7617b (1d:617b)
	call LoreleiScript_76191
	call EnableAutoTextBoxDrawing
	ld hl, LoreleiTrainerHeaders
	ld de, LoreleiScriptPointers
	ld a, [W_LORELEICURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_LORELEICURSCRIPT], a
	ret

LoreleiScript_76191: ; 76191 (1d:6191)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, $d734
	set 1, [hl]
	ld a, [$d863]
	bit 1, a
	jr z, .asm_761a9
	ld a, $5
	jr .asm_761ab
.asm_761a9
	ld a, $24
.asm_761ab
	ld [$d09f], a
	ld bc, $2
	ld a, $17
	jp Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))

LoreleiScript_761b6: ; 761b6 (1d:61b6)
	xor a
	ld [W_LORELEICURSCRIPT], a
	ret

LoreleiScriptPointers: ; 761bb (1d:61bb)
	dw LoreleiScript0
	dw Func_324c
	dw LoreleiScript2
	dw LoreleiScript3
	dw LoreleiScript4

LoreleiScript4: ; 761c5 (1d:61c5)
	ret
asm_761c6: ; 761c6 (1d:61c6)
	ld hl, $ccd3
	ld a, $40
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [$cd38], a
	call Func_3486
	ld a, $3
	ld [W_LORELEICURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret
LoreleiScript0: ; 761e2 (1d:61e2)
	ld hl, CoordsData_76223
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [$ccd3], a
	ld [$cd38], a
	ld a, [wWhichTrade] ; $cd3d
	cp $3
	jr c, .asm_76206
	ld hl, $d863
	bit 6, [hl]
	set 6, [hl]
	jr z, asm_761c6
.asm_76206
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld a, $40
	ld [$ccd3], a
	ld a, $1
	ld [$cd38], a
	call Func_3486
	ld a, $3
	ld [W_LORELEICURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CoordsData_76223: ; 76223 (1d:6223)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

LoreleiScript3: ; 7622c (1d:622c)
	ld a, [$cd38]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_LORELEICURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret
LoreleiScript2: ; 7623f (1d:623f)
	call EndTrainerBattle
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, LoreleiScript_761b6
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	jp DisplayTextID

LoreleiTextPointers: ; 76251 (1d:6251)
	dw LoreleiText1
	dw LoreleiText2

LoreleiTrainerHeaders: ; 76255 (1d:6255)
LoreleiTrainerHeader0: ; 76255 (1d:6255)
	db $1 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw $d863 ; flag's byte
	dw LoreleiBeforeBattleText ; 0x626c TextBeforeBattle
	dw LoreleiAfterBattleText ; 0x6276 TextAfterBattle
	dw LoreleiEndBattleText ; 0x6271 TextEndBattle
	dw LoreleiEndBattleText ; 0x6271 TextEndBattle

	db $ff

LoreleiText1: ; 76262 (1d:6262)
	db $08 ; asm
	ld hl, LoreleiTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

LoreleiBeforeBattleText: ; 7626c (1d:626c)
	TX_FAR _LoreleiBeforeBattleText
	db "@"

LoreleiEndBattleText: ; 76271 (1d:6271)
	TX_FAR _LoreleiEndBattleText
	db "@"

LoreleiAfterBattleText: ; 76276 (1d:6276)
	TX_FAR _LoreleiAfterBattleText
	db "@"

LoreleiText2: ; 7627b (1d:627b)
	TX_FAR _LoreleiText2
	db "@"
