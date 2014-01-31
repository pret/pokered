SilphCo7Script: ; 51b61 (14:5b61)
	call SilphCo7Script_51b77
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo7TrainerHeaders
	ld de, SilphCo7ScriptPointers
	ld a, [W_SILPHCO7CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO7CURSCRIPT], a
	ret

SilphCo7Script_51b77: ; 51b77 (14:5b77)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, DataTable_51bc1 ; $5bc1
	call Func_51bc8
	call Func_51bf4
	ld a, [$d830]
	bit 4, a
	jr nz, .asm_51b9e
	push af
	ld a, $54
	ld [$d09f], a
	ld bc, $305
	ld a, $17
	call Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))
	pop af
.asm_51b9e
	bit 5, a
	jr nz, .asm_51bb1
	push af
	ld a, $54
	ld [$d09f], a
	ld bc, $20a
	ld a, $17
	call Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))
	pop af
.asm_51bb1
	bit 6, a
	ret nz
	ld a, $54
	ld [$d09f], a
	ld bc, $60a
	ld a, $17
	jp Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))

DataTable_51bc1: ; 51bc1 (14:5bc1)
	db $03,$05,$02,$0A,$06,$0A,$FF

Func_51bc8: ; 51bc8 (14:5bc8)
	push hl
	ld hl, $d73f
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$FF00+$e0], a
	pop hl
.asm_51bd4
	ld a, [hli]
	cp $ff
	jr z, .asm_51bf0
	push hl
	ld hl, $ffe0
	inc [hl]
	pop hl
	cp b
	jr z, .asm_51be5
	inc hl
	jr .asm_51bd4
.asm_51be5
	ld a, [hli]
	cp c
	jr nz, .asm_51bd4
	ld hl, $d73f
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_51bf0
	xor a
	ld [$FF00+$e0], a
	ret

Func_51bf4: ; 51bf4 (14:5bf4)
	ld hl, $d830
	ld a, [$FF00+$e0]
	and a
	ret z
	cp $1
	jr nz, .asm_51c02
	set 4, [hl]
	ret
.asm_51c02
	cp $2
	jr nz, .asm_51c09
	set 5, [hl]
	ret
.asm_51c09
	set 6, [hl]
	ret

Func_51c0c: ; 51c0c (14:5c0c)
	xor a
	ld [wJoypadForbiddenButtonsMask], a

Func_51c10: ; 51c10 (14:5c10)
	ld [W_SILPHCO7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

SilphCo7ScriptPointers: ; 51c17 (14:5c17)
	dw SilphCo7Script0
	dw Func_324c
	dw EndTrainerBattle
	dw SilphCo7Script3
	dw SilphCo7Script4
	dw SilphCo7Script5

SilphCo7Script0: ; 51c23 (14:5c23)
	ld a, [$d82f]
	bit 0, a
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_51c78
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $4
	ld [$d528], a
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call SetSpriteMovementBytesToFF
	ld de, MovementData_51c7d
	ld a, [wWhichTrade] ; $cd3d
	ld [$cf0d], a
	cp $1
	jr z, .asm_51c6c
	inc de
.asm_51c6c
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call MoveSprite
	ld a, $3
	jp Func_51c10

CoordsData_51c78: ; 51c78 (14:5c78)
	db $02,$03
	db $03,$03
	db $FF

MovementData_51c7d: ; 51c7d (14:5c7d)
	db $40,$40,$40,$40,$FF

SilphCo7Script3: ; 51c82 (14:5c82)
	ld a, [$d730]
	bit 0, a
	ret nz
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $d
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	call Delay3
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo7Text14 ; $5ec8
	ld de, UnnamedText_51ecd ; $5ecd
	call PreBattleSaveRegisters
	ld a, $f2
	ld [W_CUROPPONENT], a ; $d059
	ld a, [W_RIVALSTARTER] ; $d715
	cp $b1
	jr nz, .asm_51cb6
	ld a, $7
	jr .asm_51cc0
.asm_51cb6
	cp $99
	jr nz, .asm_51cbe
	ld a, $8
	jr .asm_51cc0
.asm_51cbe
	ld a, $9
.asm_51cc0
	ld [W_TRAINERNO], a ; $d05d
	ld a, $4
	jp Func_51c10

SilphCo7Script4: ; 51cc8 (14:5cc8)
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_51c0c
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d82f
	set 0, [hl]
	ld a, $4
	ld [$d528], a
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	ld a, $4
	ld [$FF00+$8d], a
	call Func_34a6
	ld a, $f
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld b, BANK(Music_RivalAlternateStart)
	ld hl, Music_RivalAlternateStart
	call Bankswitch ; indirect jump to Music_RivalAlternateStart (9b47 (2:5b47))
	ld de, MovementData_51d1d
	ld a, [$cf0d]
	cp $1
	jr nz, .asm_51d0e
	ld de, MovementData_51d1a
.asm_51d0e
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call MoveSprite
	ld a, $5
	jp Func_51c10

MovementData_51d1a: ; 51d1a (14:5d1a)
	db $C0,$C0,$FF

MovementData_51d1d: ; 51d1d (14:5d1d)
	db $80,$40,$40,$C0,$C0,$C0,$00,$FF

SilphCo7Script5: ; 51d25 (14:5d25)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld a, $a7
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	call Func_2307
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	jp Func_51c10

SilphCo7TextPointers: ; 51d3f (14:5d3f)
	dw SilphCo7Text1
	dw SilphCo7Text2
	dw SilphCo7Text3
	dw SilphCo7Text4
	dw SilphCo7Text5
	dw SilphCo7Text6
	dw SilphCo7Text7
	dw SilphCo7Text8
	dw SilphCo7Text9
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText
	dw SilphCo7Text13
	dw SilphCo7Text14
	dw SilphCo7Text15

SilphCo7TrainerHeaders: ; 51d5d (14:5d5d)
SilphCo7TrainerHeader0: ; 51d5d (14:5d5d)
	db $5 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw $d82f ; flag's byte
	dw SilphCo7BattleText1 ; 0x5e5a TextBeforeBattle
	dw SilphCo7AfterBattleText1 ; 0x5e64 TextAfterBattle
	dw SilphCo7EndBattleText1 ; 0x5e5f TextEndBattle
	dw SilphCo7EndBattleText1 ; 0x5e5f TextEndBattle

SilphCo7TrainerHeader2: ; 51d69 (14:5d69)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d82f ; flag's byte
	dw SilphCo7BattleText2 ; 0x5e73 TextBeforeBattle
	dw SilphCo7AfterBattleText2 ; 0x5e7d TextAfterBattle
	dw SilphCo7EndBattleText2 ; 0x5e78 TextEndBattle
	dw SilphCo7EndBattleText2 ; 0x5e78 TextEndBattle

SilphCo7TrainerHeader3: ; 51d75 (14:5d75)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d82f ; flag's byte
	dw SilphCo7BattleText3 ; 0x5e8c TextBeforeBattle
	dw SilphCo7AfterBattleText3 ; 0x5e96 TextAfterBattle
	dw SilphCo7EndBattleText3 ; 0x5e91 TextEndBattle
	dw SilphCo7EndBattleText3 ; 0x5e91 TextEndBattle

SilphCo7TrainerHeader4: ; 51d81 (14:5d81)
	db $8 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw $d82f ; flag's byte
	dw SilphCo7BattleText4 ; 0x5ea5 TextBeforeBattle
	dw SilphCo7AfterBattleText4 ; 0x5eaf TextAfterBattle
	dw SilphCo7EndBattleText4 ; 0x5eaa TextEndBattle
	dw SilphCo7EndBattleText4 ; 0x5eaa TextEndBattle

	db $ff

SilphCo7Text1: ; 51d8e (14:5d8e)
	db $08 ; asm
	ld a, [$d72e]
	bit 0, a
	jr z, .asm_d7e17 ; 0x51d94
	ld a, [$d838]
	bit 7, a
	jr nz, .asm_688b4 ; 0x51d9b
	ld hl, UnnamedText_51ddd
	call PrintText
	jr .asm_b3069 ; 0x51da3
.asm_d7e17 ; 0x51da5
	ld hl, UnnamedText_51dd3
	call PrintText
	ld bc, (LAPRAS << 8) | 15
	call GivePokemon
	jr nc, .asm_b3069 ; 0x51db1
	ld a, [$ccd3]
	and a
	call z, WaitForTextScrollButtonPress
	call EnableAutoTextBoxDrawing
	ld hl, UnnamedText_51dd8
	call PrintText
	ld hl, $d72e
	set 0, [hl]
	jr .asm_b3069 ; 0x51dc8
.asm_688b4 ; 0x51dca
	ld hl, UnnamedText_51de2
	call PrintText
.asm_b3069 ; 0x51dd0
	jp TextScriptEnd

UnnamedText_51dd3: ; 51dd3 (14:5dd3)
	TX_FAR _UnnamedText_51dd3
	db "@"

UnnamedText_51dd8: ; 51dd8 (14:5dd8)
	TX_FAR _UnnamedText_51dd8
	db "@"

UnnamedText_51ddd: ; 51ddd (14:5ddd)
	TX_FAR _UnnamedText_51ddd
	db "@"

UnnamedText_51de2: ; 51de2 (14:5de2)
	TX_FAR _UnnamedText_51de2
	db "@"

SilphCo7Text2: ; 51de7 (14:5de7)
	db $8
	ld a, [$d838]
	bit 7, a
	jr nz, .asm_892ce ; 0x51ded $8
	ld hl, UnnamedText_51e00
	call PrintText
	jr .asm_e4d89 ; 0x51df5 $6
.asm_892ce ; 0x51df7
	ld hl, UnnamedText_51e05
	call PrintText
.asm_e4d89 ; 0x51dfd
	jp TextScriptEnd

UnnamedText_51e00: ; 51e00 (14:5e00)
	TX_FAR _UnnamedText_51e00
	db "@"

UnnamedText_51e05: ; 51e05 (14:5e05)
	TX_FAR _UnnamedText_51e05
	db "@"

SilphCo7Text3: ; 51e0a (14:5e0a)
	db $08 ; asm
	ld a, [$d838]
	bit 7, a
	jr nz, .asm_254aa ; 0x51e10
	ld hl, UnnamedText_51e23
	call PrintText
	jr .asm_6472b ; 0x51e18
.asm_254aa ; 0x51e1a
	ld hl, UnnamedText_51e28
	call PrintText
.asm_6472b ; 0x51e20
	jp TextScriptEnd

UnnamedText_51e23: ; 51e23 (14:5e23)
	TX_FAR _UnnamedText_51e23
	db "@"

UnnamedText_51e28: ; 51e28 (14:5e28)
	TX_FAR _UnnamedText_51e28
	db "@"

SilphCo7Text4: ; 51e2d (14:5e2d)
	db $08 ; asm
	ld a, [$d838]
	bit 7, a
	jr nz, .asm_0f7ee ; 0x51e33
	ld hl, UnnamedText_51e46
	call PrintText
	jr .selectLowNybble2 ; 0x51e3b
.asm_0f7ee ; 0x51e3d
	ld hl, UnnamedText_51e4b
	call PrintText
.selectLowNybble2 ; 0x51e43
	jp TextScriptEnd

UnnamedText_51e46: ; 51e46 (14:5e46)
	TX_FAR _UnnamedText_51e46
	db "@"

UnnamedText_51e4b: ; 51e4b (14:5e4b)
	TX_FAR _UnnamedText_51e4b
	db "@"

SilphCo7Text5: ; 51e50 (14:5e50)
	db $08 ; asm
	ld hl, SilphCo7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText1: ; 51e5a (14:5e5a)
	TX_FAR _SilphCo7BattleText1
	db "@"

SilphCo7EndBattleText1: ; 51e5f (14:5e5f)
	TX_FAR _SilphCo7EndBattleText1
	db "@"

SilphCo7AfterBattleText1: ; 51e64 (14:5e64)
	TX_FAR _SilphCo7AfterBattleText1
	db "@"

SilphCo7Text6: ; 51e69 (14:5e69)
	db $08 ; asm
	ld hl, SilphCo7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText2: ; 51e73 (14:5e73)
	TX_FAR _SilphCo7BattleText2
	db "@"

SilphCo7EndBattleText2: ; 51e78 (14:5e78)
	TX_FAR _SilphCo7EndBattleText2
	db "@"

SilphCo7AfterBattleText2: ; 51e7d (14:5e7d)
	TX_FAR _SilphCo7AfterBattleText2
	db "@"

SilphCo7Text7: ; 51e82 (14:5e82)
	db $08 ; asm
	ld hl, SilphCo7TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText3: ; 51e8c (14:5e8c)
	TX_FAR _SilphCo7BattleText3
	db "@"

SilphCo7EndBattleText3: ; 51e91 (14:5e91)
	TX_FAR _SilphCo7EndBattleText3
	db "@"

SilphCo7AfterBattleText3: ; 51e96 (14:5e96)
	TX_FAR _SilphCo7AfterBattleText3
	db "@"

SilphCo7Text8: ; 51e9b (14:5e9b)
	db $08 ; asm
	ld hl, SilphCo7TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SilphCo7BattleText4: ; 51ea5 (14:5ea5)
	TX_FAR _SilphCo7BattleText4
	db "@"

SilphCo7EndBattleText4: ; 51eaa (14:5eaa)
	TX_FAR _SilphCo7EndBattleText4
	db "@"

SilphCo7AfterBattleText4: ; 51eaf (14:5eaf)
	TX_FAR _SilphCo7AfterBattleText4
	db "@"

SilphCo7Text9: ; 51eb4 (14:5eb4)
	db $08 ; asm
	ld hl, UnnamedText_51ebe
	call PrintText
	jp TextScriptEnd

UnnamedText_51ebe: ; 51ebe (14:5ebe)
	TX_FAR _UnnamedText_51ebe
	db "@"

SilphCo7Text13: ; 51ec3 (14:5ec3)
	TX_FAR _UnnamedText_51ec3
	db "@"

SilphCo7Text14: ; 51ec8 (14:5ec8)
	TX_FAR _UnnamedText_51ec8
	db "@"

UnnamedText_51ecd: ; 51ecd (14:5ecd)
	TX_FAR _UnnamedText_51ecd
	db "@"

SilphCo7Text15: ; 51ed2 (14:5ed2)
	TX_FAR _UnnamedText_51ed2
	db "@"
	
