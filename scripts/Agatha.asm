AgathaScript: ; 7642d (1d:642d)
	call AgathaScript_76443
	call EnableAutoTextBoxDrawing
	ld hl, AgathaTrainerHeaders
	ld de, AgathaScriptPointers
	ld a, [W_AGATHACURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_AGATHACURSCRIPT], a
	ret

AgathaScript_76443: ; 76443 (1d:6443)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [$d865]
	bit 1, a
	jr z, .asm_76457
	ld a, $e
	jp Func_76459
.asm_76457
	ld a, $3b

Func_76459: ; 76459 (1d:6459)
	ld [$d09f], a
	ld bc, $2
	ld a, $17
	jp Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))

Func_76464: ; 76464 (1d:6464)
	xor a
	ld [W_AGATHACURSCRIPT], a
	ret

AgathaScriptPointers: ; 76469 (1d:6469)
	dw AgathaScript0
	dw Func_324c
	dw AgathaScript2
	dw AgathaScript3
	dw AgathaScript4

AgathaScript4: ; 76473 (1d:6473)
	ret
asm_76474: ; 76474 (1d:6474)
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
	ld [W_AGATHACURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

AgathaScript0: ; 76490 (1d:6490)
	ld hl, CoordsData_764d1
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [$ccd3], a
	ld [$cd38], a
	ld a, [wWhichTrade] ; $cd3d
	cp $3
	jr c, .asm_764b4
	ld hl, $d865
	bit 6, [hl]
	set 6, [hl]
	jr z, asm_76474
.asm_764b4
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld a, $40
	ld [$ccd3], a
	ld a, $1
	ld [$cd38], a
	call Func_3486
	ld a, $3
	ld [W_AGATHACURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CoordsData_764d1: ; 764d1 (1d:64d1)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

AgathaScript3: ; 764da (1d:64da)
	ld a, [$cd38]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_AGATHACURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

AgathaScript2: ; 764ed (1d:64ed)
	call EndTrainerBattle
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_76464
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld a, $1
	ld [W_GARYCURSCRIPT], a
	ret

AgathaTextPointers: ; 76505 (1d:6505)
	dw AgathaText1
	dw AgathaText2

AgathaTrainerHeaders: ; 76509 (1d:6509)
AgathaTrainerHeader0: ; 76509 (1d:6509)
	db $1 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw $d865 ; flag's byte
	dw AgathaBeforeBattleText ; 0x6520 TextBeforeBattle
	dw AgathaAfterBattleText ; 0x652a TextAfterBattle
	dw AgathaEndBattleText ; 0x6525 TextEndBattle
	dw AgathaEndBattleText ; 0x6525 TextEndBattle

	db $ff

AgathaText1: ; 76516 (1d:6516)
	db $08 ; asm
	ld hl, AgathaTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

AgathaBeforeBattleText: ; 76520 (1d:6520)
	TX_FAR _AgathaBeforeBattleText
	db "@"

AgathaEndBattleText: ; 76525 (1d:6525)
	TX_FAR _AgathaEndBattleText
	db "@"

AgathaAfterBattleText: ; 7652a (1d:652a)
	TX_FAR _AgathaAfterBattleText
	db "@"

AgathaText2: ; 7652f (1d:652f)
	TX_FAR _AgathaText2
	db "@"
	


