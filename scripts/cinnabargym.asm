CinnabarGymScript: ; 7574a (1d:574a)
	call CinnabarGymScript_75759
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarGymScriptPointers
	ld a, [W_CINNABARGYMCURSCRIPT]
	jp CallFunctionInTable

CinnabarGymScript_75759: ; 75759 (1d:5759)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	push hl
	call nz, CinnabarGymScript_75772
	pop hl
	bit 5, [hl]
	res 5, [hl]
	call nz, Func_3ead
	ld hl, wd79b
	res 7, [hl]
	ret
CinnabarGymScript_75772: ; 75772 (1d:5772)
	ld hl, Gym7CityName
	ld de, Gym7LeaderName
	jp LoadGymLeaderAndCityName

Gym7CityName: ; 7577b (1d:577b)
	db "CINNABAR ISLAND@"
Gym7LeaderName: ; 7578b (1d:578b)
	db "BLAINE@"

CinnabarGymScript_75792: ; 75792 (1d:5792)
	xor a
	ld [wJoyIgnore], a
	ld [W_CINNABARGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ld [wda38], a
	ret

CinnabarGymScript_757a0: ; 757a0 (1d:57a0)
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld [wTrainerHeaderFlagBit], a
	ret

CinnabarGymScriptPointers: ; 757a6 (1d:57a6)
	dw CinnabarGymScript0
	dw CinnabarGymScript1
	dw CinnabarGymScript2
	dw CinnabarGymScript3

CinnabarGymScript0: ; 757ae (1d:57ae)
	ld a, [wda38]
	and a
	ret z
	ld [$ff8c], a
	cp $4
	jr nz, .asm_757c3 ; 0x757b7 $a
	ld a, $4
	ld [wd528], a
	ld de, MovementData_757d7
	jr .asm_757cb ; 0x757c1 $8
.asm_757c3
	ld de, MovementData_757da
	ld a, $1
	ld [wd528], a
.asm_757cb
	call MoveSprite
	ld a, $1
	ld [W_CINNABARGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

MovementData_757d7: ; 757d7 (1d:57d7)
	db $80,$40,$FF

MovementData_757da: ; 757da (1d:57da)
	db $80,$FF

CinnabarGymScript1: ; 757dc (1d:57dc)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wda38]
	ld [wTrainerHeaderFlagBit], a
	ld [$ff8c], a
	jp DisplayTextID

CinnabarGymScript_757f1: ; 757f1 (1d:57f1)
	predef_jump FlagActionPredef

CinnabarGymScript2: ; 757f6 (1d:57f6)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, CinnabarGymScript_75792
	ld a, [wTrainerHeaderFlagBit]
	ld [$ffdb], a
	ld c, a
	ld b, $2
	ld hl, wd79a
	call CinnabarGymScript_757f1
	ld a, c
	and a
	jr nz, .asm_7581b ; 0x7580e $b
	call WaitForSoundToFinish
	ld a, (SFX_02_57 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
.asm_7581b
	ld a, [wTrainerHeaderFlagBit]
	ld [$ffdb], a
	ld c, a
	ld b, $1
	ld hl, wd79a
	call CinnabarGymScript_757f1
	ld a, [wTrainerHeaderFlagBit]
	sub $2
	ld c, a
	ld b, $1
	ld hl, wd79c
	call CinnabarGymScript_757f1
	call Func_3ead
	xor a
	ld [wJoyIgnore], a
	ld [wda38], a
	ld a, $0
	ld [W_CINNABARGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CinnabarGymScript3: ; 7584a (1d:584a)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, CinnabarGymScript_75792
	ld a, $f0
	ld [wJoyIgnore], a
CinnabarGymScript3_75857: ; 75857 (1d:5857)
	ld a, $a
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd79a
	set 1, [hl]
	ld bc, (TM_38 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $b
	ld [$ff8c], a
	call DisplayTextID
	ld hl, wd79a
	set 0, [hl]
	jr .asm_75880 ; 0x75877 $7
.BagFull
	ld a, $c
	ld [$ff8c], a
	call DisplayTextID
.asm_75880
	ld hl, W_OBTAINEDBADGES
	set 6, [hl]
	ld hl, wd72a
	set 6, [hl]

	; deactivate gym trainers
	ld a, [wd79a]
	or %11111100
	ld [wd79a], a
	ld hl, wd79b
	set 0, [hl]

	ld hl, wd126
	set 5, [hl]

	jp CinnabarGymScript_75792

CinnabarGymTextPointers: ; 7589f (1d:589f)
	dw CinnabarGymText1
	dw CinnabarGymText2
	dw CinnabarGymText3
	dw CinnabarGymText4
	dw CinnabarGymText5
	dw CinnabarGymText6
	dw CinnabarGymText7
	dw CinnabarGymText8
	dw CinnabarGymText9
	dw BlaineBadgeText
	dw ReceivedTM38Text
	dw TM38NoRoomText

CinnabarGymScript_758b7: ; 758b7 (1d:58b7)
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld a, [wSpriteIndex]
	cp $1
	jr z, .asm_758d4
	ld a, $2
	jr .asm_758d6
.asm_758d4
	ld a, $3
.asm_758d6
	ld [W_CINNABARGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	jp TextScriptEnd

CinnabarGymText1: ; 758df (1d:58df)
	db $8
	ld a, [wd79a]
	bit 1, a
	jr z, .asm_d9332 ; 0x758e5 $16
	bit 0, a
	jr nz, .asm_3012f ; 0x758e9 $9
	call z, CinnabarGymScript3_75857
	call DisableWaitingAfterTextDisplay
	jp TextScriptEnd
.asm_3012f ; 0x758f4
	ld hl, BlaineFireBlastText
	call PrintText
	jp TextScriptEnd
.asm_d9332 ; 0x758fd
	ld hl, BlaineBattleText
	call PrintText
	ld hl, BlaineEndBattleText
	ld de, BlaineEndBattleText
	call SaveEndBattleTextPointers
	ld a, $7
	ld [W_GYMLEADERNO], a
	jp CinnabarGymScript_758b7

BlaineBattleText: ; 75914 (1d:5914)
	TX_FAR _BlaineBattleText
	db "@"

BlaineEndBattleText: ; 75919 (1d:5919)
	TX_FAR _BlaineEndBattleText
	db $11
	db $d
	db "@"

BlaineFireBlastText: ; 75920 (1d:5920)
	TX_FAR _BlaineFireBlastText
	db "@"

BlaineBadgeText: ; 75925 (1d:5925)
	TX_FAR _BlaineBadgeText
	db "@"

ReceivedTM38Text: ; 7592a (1d:592a)
	TX_FAR _ReceivedTM38Text
	db $0B
	TX_FAR _TM38ExplanationText
	db "@"

TM38NoRoomText: ; 75934 (1d:5934)
	TX_FAR _TM38NoRoomText
	db "@"

CinnabarGymText2: ; 75939 (1d:5939)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79a]
	bit 2, a
	jr nz, .asm_46bb4 ; 0x75942
	ld hl, CinnabarGymText_7595f
	call PrintText
	ld hl, CinnabarGymText_75964
	ld de, CinnabarGymText_75964 ; $5964 XXX
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_46bb4 ; 0x75956
	ld hl, CinnabarGymText_75969
	call PrintText
	jp TextScriptEnd

CinnabarGymText_7595f: ; 7595f (1d:595f)
	TX_FAR _CinnabarGymText_7595f
	db "@"

CinnabarGymText_75964: ; 75964 (1d:5964)
	TX_FAR _CinnabarGymText_75964
	db "@"

CinnabarGymText_75969: ; 75969 (1d:5969)
	TX_FAR _CinnabarGymText_75969
	db "@"

CinnabarGymText3: ; 7596e (1d:596e)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79a]
	bit 3, a
	jr nz, .asm_4b406 ; 0x75977
	ld hl, CinnabarGymText_75994
	call PrintText
	ld hl, CinnabarGymText_75999
	ld de, CinnabarGymText_75999 ; $5999 XXX
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_4b406 ; 0x7598b
	ld hl, CinnabarGymText_7599e
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75994: ; 75994 (1d:5994)
	TX_FAR _CinnabarGymText_75994
	db "@"

CinnabarGymText_75999: ; 75999 (1d:5999)
	TX_FAR _CinnabarGymText_75999
	db "@"

CinnabarGymText_7599e: ; 7599e (1d:599e)
	TX_FAR _CinnabarGymText_7599e
	db "@"

CinnabarGymText4: ; 759a3 (1d:59a3)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79a]
	bit 4, a
	jr nz, .asm_c0673 ; 0x759ac
	ld hl, CinnabarGymText_759c9
	call PrintText
	ld hl, CinnabarGymText_759ce
	ld de, CinnabarGymText_759ce ; $59ce XXX
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_c0673 ; 0x759c0
	ld hl, CinnabarGymText_759d3
	call PrintText
	jp TextScriptEnd

CinnabarGymText_759c9: ; 759c9 (1d:59c9)
	TX_FAR _CinnabarGymText_759c9
	db "@"

CinnabarGymText_759ce: ; 759ce (1d:59ce)
	TX_FAR _CinnabarGymText_759ce
	db "@"

CinnabarGymText_759d3: ; 759d3 (1d:59d3)
	TX_FAR _CinnabarGymText_759d3
	db "@"

CinnabarGymText5: ; 759d8 (1d:59d8)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79a]
	bit 5, a
	jr nz, .asm_5cfd7 ; 0x759e1
	ld hl, CinnabarGymText_759fe
	call PrintText
	ld hl, CinnabarGymText_75a03
	ld de, CinnabarGymText_75a03 ; $5a03 XXX
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_5cfd7 ; 0x759f5
	ld hl, CinnabarGymText_75a08
	call PrintText
	jp TextScriptEnd

CinnabarGymText_759fe: ; 759fe (1d:59fe)
	TX_FAR _CinnabarGymText_759fe
	db "@"

CinnabarGymText_75a03: ; 75a03 (1d:5a03)
	TX_FAR _CinnabarGymText_75a03
	db "@"

CinnabarGymText_75a08: ; 75a08 (1d:5a08)
	TX_FAR _CinnabarGymText_75a08
	db "@"

CinnabarGymText6: ; 75a0d (1d:5a0d)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79a]
	bit 6, a
	jr nz, .asm_776b4 ; 0x75a16
	ld hl, CinnabarGymText_75a33
	call PrintText
	ld hl, CinnabarGymText_75a38
	ld de, CinnabarGymText_75a38
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_776b4 ; 0x75a2a
	ld hl, CinnabarGymText_75a3d
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75a33: ; 75a33 (1d:5a33)
	TX_FAR _CinnabarGymText_75a33
	db "@"

CinnabarGymText_75a38: ; 75a38 (1d:5a38)
	TX_FAR _CinnabarGymText_75a38
	db "@"

CinnabarGymText_75a3d: ; 75a3d (1d:5a3d)
	TX_FAR _CinnabarGymText_75a3d
	db "@"

CinnabarGymText7: ; 75a42 (1d:5a42)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79a]
	bit 7, a
	jr nz, .asm_2f755 ; 0x75a4b
	ld hl, CinnabarGymText_75a68
	call PrintText
	ld hl, CinnabarGymText_75a6d
	ld de, CinnabarGymText_75a6d
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_2f755 ; 0x75a5f
	ld hl, CinnabarGymText_75a72
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75a68: ; 75a68 (1d:5a68)
	TX_FAR _CinnabarGymText_75a68
	db "@"

CinnabarGymText_75a6d: ; 75a6d (1d:5a6d)
	TX_FAR _CinnabarGymText_75a6d
	db "@"

CinnabarGymText_75a72: ; 75a72 (1d:5a72)
	TX_FAR _CinnabarGymText_75a72
	db "@"

CinnabarGymText8: ; 75a77 (1d:5a77)
	db $08 ; asm
	call CinnabarGymScript_757a0
	ld a, [wd79b]
	bit 0, a
	jr nz, .asm_d87be ; 0x75a80
	ld hl, CinnabarGymText_75a9d
	call PrintText
	ld hl, CinnabarGymText_75aa2
	ld de, CinnabarGymText_75aa2 ; $5aa2 XXX
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_d87be ; 0x75a94
	ld hl, CinnabarGymText_75aa7
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75a9d: ; 75a9d (1d:5a9d)
	TX_FAR _CinnabarGymText_75a9d
	db "@"

CinnabarGymText_75aa2: ; 75aa2 (1d:5aa2)
	TX_FAR _CinnabarGymText_75aa2
	db "@"

CinnabarGymText_75aa7: ; 75aa7 (1d:5aa7)
	TX_FAR _CinnabarGymText_75aa7
	db "@"

CinnabarGymText9: ; 75aac (1d:5aac)
	db $08 ; asm
	ld a, [wd79a]
	bit 1, a
	jr nz, .asm_627d9 ; 0x75ab2
	ld hl, CinnabarGymText_75ac2
	jr .asm_0b11d ; 0x75ab7
.asm_627d9 ; 0x75ab9
	ld hl, CinnabarGymText_75ac7
.asm_0b11d ; 0x75abc
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75ac2: ; 75ac2 (1d:5ac2)
	TX_FAR _CinnabarGymText_75ac2
	db "@"

CinnabarGymText_75ac7: ; 75ac7 (1d:5ac7)
	TX_FAR _CinnabarGymText_75ac7
	db "@"
