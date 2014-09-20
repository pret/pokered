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
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, DataTable_51bc1 ; $5bc1
	call SilphCo7Text_51bc8
	call SilphCo7Text_51bf4
	ld a, [wd830]
	bit 4, a
	jr nz, .asm_51b9e
	push af
	ld a, $54
	ld [wd09f], a
	ld bc, $305
	predef ReplaceTileBlock
	pop af
.asm_51b9e
	bit 5, a
	jr nz, .asm_51bb1
	push af
	ld a, $54
	ld [wd09f], a
	ld bc, $20a
	predef ReplaceTileBlock
	pop af
.asm_51bb1
	bit 6, a
	ret nz
	ld a, $54
	ld [wd09f], a
	ld bc, $60a
	predef_jump ReplaceTileBlock

DataTable_51bc1: ; 51bc1 (14:5bc1)
	db $03,$05,$02,$0A,$06,$0A,$FF

SilphCo7Text_51bc8: ; 51bc8 (14:5bc8)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
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
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_51bf0
	xor a
	ld [$ffe0], a
	ret

SilphCo7Text_51bf4: ; 51bf4 (14:5bf4)
	ld hl, wd830
	ld a, [$ffe0]
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

SilphCo7Text_51c0c: ; 51c0c (14:5c0c)
	xor a
	ld [wJoyIgnore], a

SilphCo7Text_51c10: ; 51c10 (14:5c10)
	ld [W_SILPHCO7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

SilphCo7ScriptPointers: ; 51c17 (14:5c17)
	dw SilphCo7Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SilphCo7Script3
	dw SilphCo7Script4
	dw SilphCo7Script5

SilphCo7Script0: ; 51c23 (14:5c23)
	ld a, [wd82f]
	bit 0, a
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_51c78
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $4
	ld [wd528], a
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call SetSpriteMovementBytesToFF
	ld de, MovementData_51c7d
	ld a, [wWhichTrade] ; wWhichTrade
	ld [wcf0d], a
	cp $1
	jr z, .asm_51c6c
	inc de
.asm_51c6c
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call MoveSprite
	ld a, $3
	jp SilphCo7Text_51c10

CoordsData_51c78: ; 51c78 (14:5c78)
	db $02,$03
	db $03,$03
	db $FF

MovementData_51c7d: ; 51c7d (14:5c7d)
	db $40,$40,$40,$40,$FF

SilphCo7Script3: ; 51c82 (14:5c82)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $d
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo7Text14 ; $5ec8
	ld de, SilphCo7Text_51ecd ; $5ecd
	call SaveEndBattleTextPointers
	ld a, SONY2 + $c8
	ld [W_CUROPPONENT], a ; wd059
	ld a, [W_RIVALSTARTER] ; wd715
	cp STARTER2
	jr nz, .asm_51cb6
	ld a, $7
	jr .asm_51cc0
.asm_51cb6
	cp STARTER3
	jr nz, .asm_51cbe
	ld a, $8
	jr .asm_51cc0
.asm_51cbe
	ld a, $9
.asm_51cc0
	ld [W_TRAINERNO], a ; wd05d
	ld a, $4
	jp SilphCo7Text_51c10

SilphCo7Script4: ; 51cc8 (14:5cc8)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, SilphCo7Text_51c0c
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd82f
	set 0, [hl]
	ld a, $4
	ld [wd528], a
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld a, $4
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $f
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld de, MovementData_51d1d
	ld a, [wcf0d]
	cp $1
	jr nz, .asm_51d0e
	ld de, MovementData_51d1a
.asm_51d0e
	ld a, $9
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call MoveSprite
	ld a, $5
	jp SilphCo7Text_51c10

MovementData_51d1a: ; 51d1a (14:5d1a)
	db $C0,$C0,$FF

MovementData_51d1d: ; 51d1d (14:5d1d)
	db $80,$40,$40,$C0,$C0,$C0,$00,$FF

SilphCo7Script5: ; 51d25 (14:5d25)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $a7
	ld [wcc4d], a
	predef HideObject
	call PlayDefaultMusic
	xor a
	ld [wJoyIgnore], a
	jp SilphCo7Text_51c10

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
	dw wd82f ; flag's byte
	dw SilphCo7BattleText1 ; 0x5e5a TextBeforeBattle
	dw SilphCo7AfterBattleText1 ; 0x5e64 TextAfterBattle
	dw SilphCo7EndBattleText1 ; 0x5e5f TextEndBattle
	dw SilphCo7EndBattleText1 ; 0x5e5f TextEndBattle

SilphCo7TrainerHeader2: ; 51d69 (14:5d69)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd82f ; flag's byte
	dw SilphCo7BattleText2 ; 0x5e73 TextBeforeBattle
	dw SilphCo7AfterBattleText2 ; 0x5e7d TextAfterBattle
	dw SilphCo7EndBattleText2 ; 0x5e78 TextEndBattle
	dw SilphCo7EndBattleText2 ; 0x5e78 TextEndBattle

SilphCo7TrainerHeader3: ; 51d75 (14:5d75)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd82f ; flag's byte
	dw SilphCo7BattleText3 ; 0x5e8c TextBeforeBattle
	dw SilphCo7AfterBattleText3 ; 0x5e96 TextAfterBattle
	dw SilphCo7EndBattleText3 ; 0x5e91 TextEndBattle
	dw SilphCo7EndBattleText3 ; 0x5e91 TextEndBattle

SilphCo7TrainerHeader4: ; 51d81 (14:5d81)
	db $8 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd82f ; flag's byte
	dw SilphCo7BattleText4 ; 0x5ea5 TextBeforeBattle
	dw SilphCo7AfterBattleText4 ; 0x5eaf TextAfterBattle
	dw SilphCo7EndBattleText4 ; 0x5eaa TextEndBattle
	dw SilphCo7EndBattleText4 ; 0x5eaa TextEndBattle

	db $ff

SilphCo7Text1:
; lapras guy
	db $08 ; asm
	ld a, [wd72e]
	bit 0, a ; got lapras?
	jr z, .givelapras
	ld a, [wd838]
	bit 7, a ; saved silph?
	jr nz, .savedsilph
	ld hl, .LaprasGuyText
	call PrintText
	jr .done
.givelapras
	ld hl, .MeetLaprasGuyText
	call PrintText
	ld bc, (LAPRAS << 8) | 15
	call GivePokemon
	jr nc, .done
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	call EnableAutoTextBoxDrawing
	ld hl, .HeresYourLaprasText
	call PrintText
	ld hl, wd72e
	set 0, [hl]
	jr .done
.savedsilph
	ld hl, .LaprasGuySavedText
	call PrintText
.done
	jp TextScriptEnd

.MeetLaprasGuyText
	TX_FAR _MeetLaprasGuyText
	db "@"

.HeresYourLaprasText
	TX_FAR _HeresYourLaprasText
	db "@"

.LaprasGuyText
	TX_FAR _LaprasGuyText
	db "@"

.LaprasGuySavedText
	TX_FAR _LaprasGuySavedText
	db "@"

SilphCo7Text2:
	db $8
	ld a, [wd838]
	bit 7, a ; saved silph?
	jr nz, .savedsilph
	ld hl, .rockettext
	call PrintText
	jr .done
.savedsilph
	ld hl, .savedtext
	call PrintText
.done
	jp TextScriptEnd

.rockettext
	TX_FAR _SilphCo7Text_51e00
	db "@"

.savedtext
	TX_FAR _CanceledMasterBallText
	db "@"

SilphCo7Text3:
	db $08 ; asm
	ld a, [wd838]
	bit 7, a ; saved silph?
	jr nz, .savedsilph
	ld hl, .rockettext
	call PrintText
	jr .done
.savedsilph
	ld hl, .savedtext
	call PrintText
.done
	jp TextScriptEnd

.rockettext
	TX_FAR _SilphCo7Text_51e23
	db "@"

.savedtext
	TX_FAR _SilphCo7Text_51e28
	db "@"

SilphCo7Text4:
	db $08 ; asm
	ld a, [wd838]
	bit 7, a ; saved silph?
	jr nz, .savedsilph
	ld hl, .rockettext
	call PrintText
	jr .done
.savedsilph
	ld hl, .savedtext
	call PrintText
.done
	jp TextScriptEnd

.rockettext
	TX_FAR _SilphCo7Text_51e46
	db "@"

.savedtext
	TX_FAR _SilphCo7Text_51e4b
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
	ld hl, SilphCo7Text_51ebe
	call PrintText
	jp TextScriptEnd

SilphCo7Text_51ebe: ; 51ebe (14:5ebe)
	TX_FAR _SilphCo7Text_51ebe
	db "@"

SilphCo7Text13: ; 51ec3 (14:5ec3)
	TX_FAR _SilphCo7Text_51ec3
	db "@"

SilphCo7Text14: ; 51ec8 (14:5ec8)
	TX_FAR _SilphCo7Text_51ec8
	db "@"

SilphCo7Text_51ecd: ; 51ecd (14:5ecd)
	TX_FAR _SilphCo7Text_51ecd
	db "@"

SilphCo7Text15: ; 51ed2 (14:5ed2)
	TX_FAR _SilphCo7Text_51ed2
	db "@"
