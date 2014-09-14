SaffronGymScript: ; 5d00d (17:500d)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	call nz, .extra
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGymTrainerHeader0
	ld de, SaffronGymScriptPointers
	ld a, [W_SAFFRONGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SAFFRONGYMCURSCRIPT], a
	ret

.extra
	ld hl, Gym6CityName ; $5033
	ld de, Gym6LeaderName ; $5040
	jp LoadGymLeaderAndCityName

Gym6CityName: ; 5d033 (17:5033)
	db "SAFFRON CITY@"

Gym6LeaderName: ; 5d040 (17:5040)
	db "SABRINA@"

SaffronGymText_5d048: ; 5d048 (17:5048)
	xor a
	ld [wJoyIgnore], a
	ld [W_SAFFRONGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

SaffronGymScriptPointers: ; 5d053 (17:5053)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SaffronGymScript3

SaffronGymScript3: ; 5d05b (17:505b)
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	cp $ff
	jp z, SaffronGymText_5d048
	ld a, $f0
	ld [wJoyIgnore], a

SaffronGymText_5d068: ; 5d068 (17:5068)
	ld a, $a
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd7b3
	set 1, [hl]
	ld bc, (TM_46 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $b
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, wd7b3
	set 0, [hl]
	jr .asm_5d091
.BagFull
	ld a, $c
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
.asm_5d091
	ld hl, W_OBTAINEDBADGES
	set 5, [hl]
	ld hl, wd72a
	set 5, [hl]

	; deactivate gym trainers
	ld a, [wd7b3]
	or %11111100
	ld [wd7b3], a
	ld hl, wd7b4
	set 0, [hl]

	jp SaffronGymText_5d048

SaffronGymTextPointers: ; 5d0ab (17:50ab)
	dw SaffronGymText1
	dw SaffronGymText2
	dw SaffronGymText3
	dw SaffronGymText4
	dw SaffronGymText5
	dw SaffronGymText6
	dw SaffronGymText7
	dw SaffronGymText8
	dw SaffronGymText9
	dw SaffronGymText10
	dw SaffronGymText11
	dw SaffronGymText12

SaffronGymTrainerHeaders: ; 5d0c3 (17:50c3)
SaffronGymTrainerHeader0: ; 5d0c3 (17:50c3)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText1 ; 0x51f0 TextBeforeBattle
	dw SaffronGymAfterBattleText1 ; 0x51fa TextAfterBattle
	dw SaffronGymEndBattleText1 ; 0x51f5 TextEndBattle
	dw SaffronGymEndBattleText1 ; 0x51f5 TextEndBattle

SaffronGymTrainerHeader1: ; 5d0cf (17:50cf)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText2 ; 0x51ff TextBeforeBattle
	dw SaffronGymAfterBattleText2 ; 0x5209 TextAfterBattle
	dw SaffronGymEndBattleText2 ; 0x5204 TextEndBattle
	dw SaffronGymEndBattleText2 ; 0x5204 TextEndBattle

SaffronGymTrainerHeader2: ; 5d0db (17:50db)
	db $4 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText3 ; 0x520e TextBeforeBattle
	dw SaffronGymAfterBattleText3 ; 0x5218 TextAfterBattle
	dw SaffronGymEndBattleText3 ; 0x5213 TextEndBattle
	dw SaffronGymEndBattleText3 ; 0x5213 TextEndBattle

SaffronGymTrainerHeader3: ; 5d0e7 (17:50e7)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText4 ; 0x521d TextBeforeBattle
	dw SaffronGymAfterBattleText4 ; 0x5227 TextAfterBattle
	dw SaffronGymEndBattleText4 ; 0x5222 TextEndBattle
	dw SaffronGymEndBattleText4 ; 0x5222 TextEndBattle

SaffronGymTrainerHeader4: ; 5d0f3 (17:50f3)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText5 ; 0x522c TextBeforeBattle
	dw SaffronGymAfterBattleText5 ; 0x5236 TextAfterBattle
	dw SaffronGymEndBattleText5 ; 0x5231 TextEndBattle
	dw SaffronGymEndBattleText5 ; 0x5231 TextEndBattle

SaffronGymTrainerHeader5: ; 5d0ff (17:50ff)
	db $7 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText6 ; 0x523b TextBeforeBattle
	dw SaffronGymAfterBattleText6 ; 0x5245 TextAfterBattle
	dw SaffronGymEndBattleText6 ; 0x5240 TextEndBattle
	dw SaffronGymEndBattleText6 ; 0x5240 TextEndBattle

SaffronGymTrainerHeader6: ; 5d10b (17:510b)
	db $8 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7b3 ; flag's byte
	dw SaffronGymBattleText7 ; 0x524a TextBeforeBattle
	dw SaffronGymAfterBattleText7 ; 0x5254 TextAfterBattle
	dw SaffronGymEndBattleText7 ; 0x524f TextEndBattle
	dw SaffronGymEndBattleText7 ; 0x524f TextEndBattle

	db $ff

SaffronGymText1: ; 5d118 (17:5118)
	db $08 ; asm
	ld a, [wd7b3]
	bit 1, a
	jr z, .asm_e3544 ; 0x5d11e
	bit 0, a
	jr nz, .asm_8d2f6 ; 0x5d122
	call z, SaffronGymText_5d068
	call DisableWaitingAfterTextDisplay
	jr .asm_34c2c ; 0x5d12a
.asm_8d2f6 ; 0x5d12c
	ld hl, SaffronGymText_5d16e
	call PrintText
	jr .asm_34c2c ; 0x5d132
.asm_e3544 ; 0x5d134
	ld hl, SaffronGymText_5d162
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SaffronGymText_5d167
	ld de, SaffronGymText_5d167
	call SaveEndBattleTextPointers
	ldh a, [$8c]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [W_GYMLEADERNO], a
	ld a, $3
	ld [W_SAFFRONGYMCURSCRIPT], a
.asm_34c2c ; 0x5d15f
	jp TextScriptEnd

SaffronGymText_5d162: ; 5d162 (17:5162)
	TX_FAR _SaffronGymText_5d162
	db "@"

SaffronGymText_5d167: ; 5d167 (17:5167)
	TX_FAR _SaffronGymText_5d167 ; 0xa1c73
	db $11 ; play same sound as red giving oak parcel
	db $6 ; wait for keypress
	db "@"

SaffronGymText_5d16e: ; 5d16e (17:516e)
	TX_FAR _SaffronGymText_5d16e
	db "@"

SaffronGymText10: ; 5d173 (17:5173)
	TX_FAR _SaffronGymText_5d173
	db "@"

SaffronGymText11: ; 5d178 (17:5178)
	TX_FAR ReceivedTM46Text
	db $b
	TX_FAR _TM46ExplanationText
	db "@"

SaffronGymText12: ; 5d182 (17:5182)
	TX_FAR _TM46NoRoomText
	db "@"

SaffronGymText2: ; 5d187 (17:5187)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText3: ; 5d191 (17:5191)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText4: ; 5d19b (17:519b)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText5: ; 5d1a5 (17:51a5)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText6: ; 5d1af (17:51af)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText7: ; 5d1b9 (17:51b9)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText8: ; 5d1c3 (17:51c3)
	db $08 ; asm
	ld hl, SaffronGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText9: ; 5d1cd (17:51cd)
	db $08 ; asm
	ld a, [wd7b3]
	bit 1, a
	jr nz, .asm_13f3c ; 0x5d1d3
	ld hl, SaffronGymText_5d1e6
	call PrintText
	jr .asm_e9907 ; 0x5d1db
.asm_13f3c ; 0x5d1dd
	ld hl, SaffronGymText_5d1eb
	call PrintText
.asm_e9907 ; 0x5d1e3
	jp TextScriptEnd

SaffronGymText_5d1e6: ; 5d1e6 (17:51e6)
	TX_FAR _SaffronGymText_5d1e6
	db "@"

SaffronGymText_5d1eb: ; 5d1eb (17:51eb)
	TX_FAR _SaffronGymText_5d1eb
	db "@"

SaffronGymBattleText1: ; 5d1f0 (17:51f0)
	TX_FAR _SaffronGymBattleText1
	db "@"

SaffronGymEndBattleText1: ; 5d1f5 (17:51f5)
	TX_FAR _SaffronGymEndBattleText1
	db "@"

SaffronGymAfterBattleText1: ; 5d1fa (17:51fa)
	TX_FAR _SaffronGymAfterBattleText1
	db "@"

SaffronGymBattleText2: ; 5d1ff (17:51ff)
	TX_FAR _SaffronGymBattleText2
	db "@"

SaffronGymEndBattleText2: ; 5d204 (17:5204)
	TX_FAR _SaffronGymEndBattleText2
	db "@"

SaffronGymAfterBattleText2: ; 5d209 (17:5209)
	TX_FAR _SaffronGymAfterBattleText2
	db "@"

SaffronGymBattleText3: ; 5d20e (17:520e)
	TX_FAR _SaffronGymBattleText3
	db "@"

SaffronGymEndBattleText3: ; 5d213 (17:5213)
	TX_FAR _SaffronGymEndBattleText3
	db "@"

SaffronGymAfterBattleText3: ; 5d218 (17:5218)
	TX_FAR _SaffronGymAfterBattleText3
	db "@"

SaffronGymBattleText4: ; 5d21d (17:521d)
	TX_FAR _SaffronGymBattleText4
	db "@"

SaffronGymEndBattleText4: ; 5d222 (17:5222)
	TX_FAR _SaffronGymEndBattleText4
	db "@"

SaffronGymAfterBattleText4: ; 5d227 (17:5227)
	TX_FAR _SaffronGymAfterBattleText4
	db "@"

SaffronGymBattleText5: ; 5d22c (17:522c)
	TX_FAR _SaffronGymBattleText5
	db "@"

SaffronGymEndBattleText5: ; 5d231 (17:5231)
	TX_FAR _SaffronGymEndBattleText5
	db "@"

SaffronGymAfterBattleText5: ; 5d236 (17:5236)
	TX_FAR _SaffronGymAfterBattleText5
	db "@"

SaffronGymBattleText6: ; 5d23b (17:523b)
	TX_FAR _SaffronGymBattleText6
	db "@"

SaffronGymEndBattleText6: ; 5d240 (17:5240)
	TX_FAR _SaffronGymEndBattleText6
	db "@"

SaffronGymAfterBattleText6: ; 5d245 (17:5245)
	TX_FAR _SaffronGymAfterBattleText6
	db "@"

SaffronGymBattleText7: ; 5d24a (17:524a)
	TX_FAR _SaffronGymBattleText7
	db "@"

SaffronGymEndBattleText7: ; 5d24f (17:524f)
	TX_FAR _SaffronGymEndBattleText7
	db "@"

SaffronGymAfterBattleText7: ; 5d254 (17:5254)
	TX_FAR _SaffronGymAfterBattleText7
	db "@"
