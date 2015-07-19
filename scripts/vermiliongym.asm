VermilionGymScript: ; 5ca26 (17:4a26)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, VermilionGymScript_5ca4c
	pop hl
	bit 6, [hl]
	res 6, [hl]
	call nz, VermilionGymScript_5ca6d
	call EnableAutoTextBoxDrawing
	ld hl, VermilionGymTrainerHeader0
	ld de, VermilionGymScriptPointers
	ld a, [W_VERMILIONGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VERMILIONGYMCURSCRIPT], a
	ret

VermilionGymScript_5ca4c: ; 5ca4c (17:4a4c)
	ld hl, Gym3CityName
	ld de, Gym3LeaderName
	jp LoadGymLeaderAndCityName

Gym3CityName: ; 5ca55 (17:4a55)
	db "VERMILION CITY@"

Gym3LeaderName: ; 5ca64 (17:4a64)
	db "LT.SURGE@"

VermilionGymScript_5ca6d: ; 5ca6d (17:4a6d)
	ld a, [wd773]
	bit 0, a
	jr nz, .asm_5ca78
	ld a, $24
	jr .asm_5ca7f
.asm_5ca78
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $5
.asm_5ca7f
	ld [wd09f], a
	ld bc, $202
	predef_jump ReplaceTileBlock

VermilionGymScript_5ca8a: ; 5ca8a (17:4a8a)
	xor a
	ld [wJoyIgnore], a
	ld [W_VERMILIONGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

VermilionGymScriptPointers: ; 5ca95 (17:4a95)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw VermilionGymScript3

VermilionGymScript3: ; 5ca9d (17:4a9d)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, VermilionGymScript_5ca8a
	ld a, $f0
	ld [wJoyIgnore], a

VermilionGymScript_5caaa: ; 5caaa (17:4aaa)
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd773
	set 7, [hl]
	ld bc, (TM_24 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $7
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd773
	set 6, [hl]
	jr .asm_5cad3
.BagFull
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_5cad3
	ld hl, W_OBTAINEDBADGES
	set 2, [hl]
	ld hl, wd72a
	set 2, [hl]

	; deactivate gym trainers
	ld a, [wd773]
	or %00011100
	ld [wd773], a

	jp VermilionGymScript_5ca8a

VermilionGymTextPointers: ; 5cae8 (17:4ae8)
	dw VermilionGymText1
	dw VermilionGymText2
	dw VermilionGymText3
	dw VermilionGymText4
	dw VermilionGymText5
	dw VermilionGymText6
	dw VermilionGymText7
	dw VermilionGymText8

VermilionGymTrainerHeaders: ; 5caf8 (17:4af8)
VermilionGymTrainerHeader0: ; 5caf8 (17:4af8)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd773 ; flag's byte
	dw VermilionGymBattleText1 ; TextBeforeBattle
	dw VermilionGymAfterBattleText1 ; TextAfterBattle
	dw VermilionGymEndBattleText1 ; TextEndBattle
	dw VermilionGymEndBattleText1 ; TextEndBattle

VermilionGymTrainerHeader1: ; 5cb04 (17:4b04)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd773 ; flag's byte
	dw VermilionGymBattleText2 ; TextBeforeBattle
	dw VermilionGymAfterBattleText2 ; TextAfterBattle
	dw VermilionGymEndBattleText2 ; TextEndBattle
	dw VermilionGymEndBattleText2 ; TextEndBattle

VermilionGymTrainerHeader2: ; 5cb10 (17:4b10)
	db $4 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd773 ; flag's byte
	dw VermilionGymBattleText3 ; TextBeforeBattle
	dw VermilionGymAfterBattleText3 ; TextAfterBattle
	dw VermilionGymEndBattleText3 ; TextEndBattle
	dw VermilionGymEndBattleText3 ; TextEndBattle

	db $ff

VermilionGymText1: ; 5cb1d (17:4b1d)
	TX_ASM
	ld a, [wd773]
	bit 7, a
	jr z, .asm_5cb39
	bit 6, a
	jr nz, .asm_5cb31
	call z, VermilionGymScript_5caaa
	call DisableWaitingAfterTextDisplay
	jr .asm_5cb6a
.asm_5cb31
	ld hl, VermilionGymText_5cb72
	call PrintText
	jr .asm_5cb6a
.asm_5cb39
	ld hl, VermilionGymText_5cb6d
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedThunderbadgeText
	ld de, ReceivedThunderbadgeText
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [W_GYMLEADERNO], a
	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [W_VERMILIONGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
.asm_5cb6a
	jp TextScriptEnd

VermilionGymText_5cb6d: ; 5cb6d (17:4b6d)
	TX_FAR _VermilionGymText_5cb6d
	db "@"

VermilionGymText_5cb72: ; 5cb72 (17:4b72)
	TX_FAR _VermilionGymText_5cb72
	db "@"

VermilionGymText6: ; 5cb77 (17:4b77)
	TX_FAR _VermilionGymText_5cb77
	db "@"

VermilionGymText7: ; 5cb7c (17:4b7c)
	TX_FAR _ReceivedTM24Text
	db $11
	TX_FAR _TM24ExplanationText
	db "@"

VermilionGymText8: ; 5cb86 (17:4b86)
	TX_FAR _TM24NoRoomText
	db "@"

ReceivedThunderbadgeText: ; 5cb8b (17:4b8b)
	TX_FAR _ReceivedThunderbadgeText
	db "@"

VermilionGymText2: ; 5cb90 (17:4b90)
	TX_ASM
	ld hl, VermilionGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymBattleText1: ; 5cb9a (17:4b9a)
	TX_FAR _VermilionGymBattleText1
	db "@"

VermilionGymEndBattleText1: ; 5cb9f (17:4b9f)
	TX_FAR _VermilionGymEndBattleText1
	db "@"

VermilionGymAfterBattleText1: ; 5cba4 (17:4ba4)
	TX_FAR _VermilionGymAfterBattleText1
	db "@"

VermilionGymText3: ; 5cba9 (17:4ba9)
	TX_ASM
	ld hl, VermilionGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymBattleText2: ; 5cbb3 (17:4bb3)
	TX_FAR _VermilionGymBattleText2
	db "@"

VermilionGymEndBattleText2: ; 5cbb8 (17:4bb8)
	TX_FAR _VermilionGymEndBattleText2
	db "@"

VermilionGymAfterBattleText2: ; 5cbbd (17:4bbd)
	TX_FAR _VermilionGymAfterBattleText2
	db "@"

VermilionGymText4: ; 5cbc2 (17:4bc2)
	TX_ASM
	ld hl, VermilionGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymBattleText3: ; 5cbcc (17:4bcc)
	TX_FAR _VermilionGymBattleText3
	db "@"

VermilionGymEndBattleText3: ; 5cbd1 (17:4bd1)
	TX_FAR _VermilionGymEndBattleText3
	db "@"

VermilionGymAfterBattleText3: ; 5cbd6 (17:4bd6)
	TX_FAR _VermilionGymAfterBattleText3
	db "@"

VermilionGymText5: ; 5cbdb (17:4bdb)
	TX_ASM
	ld a, [wd72a]
	bit 2, a
	jr nz, .asm_5cbeb
	ld hl, VermilionGymText_5cbf4
	call PrintText
	jr .asm_5cbf1
.asm_5cbeb
	ld hl, VermilionGymText_5cbf9
	call PrintText
.asm_5cbf1
	jp TextScriptEnd

VermilionGymText_5cbf4: ; 5cbf4 (17:4bf4)
	TX_FAR _VermilionGymText_5cbf4
	db "@"

VermilionGymText_5cbf9: ; 5cbf9 (17:4bf9)
	TX_FAR _VermilionGymText_5cbf9
	db "@"
