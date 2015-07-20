Route23Script: ; 511da (14:51da)
	call Route23Script_511e9
	call EnableAutoTextBoxDrawing
	ld hl, Route23ScriptPointers
	ld a, [W_ROUTE23CURSCRIPT]
	jp CallFunctionInTable

Route23Script_511e9: ; 511e9 (14:51e9)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, wd7ee
	res 0, [hl]
	res 7, [hl]
	ld hl, wd813
	res 0, [hl]
	res 6, [hl]
	ld a, HS_VICTORY_ROAD_3_BOULDER
	ld [wcc4d], a
	predef ShowObject
	ld a, HS_VICTORY_ROAD_2_BOULDER
	ld [wcc4d], a
	predef_jump HideObject

Route23ScriptPointers: ; 51213 (14:5213)
	dw Route23Script0
	dw Route23Script1
	dw Route23Script2

Route23Script0: ; 51219 (14:5219)
	ld hl, YCoordsData_51255
	ld a, [W_YCOORD]
	ld b, a
	ld e, $0
	ld c, $7
.asm_51224
	ld a, [hli]
	cp $ff
	ret z
	inc e
	dec c
	cp b
	jr nz, .asm_51224
	cp $23
	jr nz, .asm_51237
	ld a, [W_XCOORD]
	cp $e
	ret nc
.asm_51237
	ld a, e
	ld [hSpriteIndexOrTextID], a
	ld a, c
	ld [wWhichBadge], a
	ld b, FLAG_TEST
	ld hl, wd7ed
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	call Route23Script_5125d
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ret

YCoordsData_51255: ; 51255 (14:5255)
	db $23,$38,$55,$60,$69,$77,$88,$FF

Route23Script_5125d: ; 5125d (14:525d)
	ld hl, BadgeTextPointers
	ld a, [wWhichBadge]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcd6d
.copyTextLoop
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copyTextLoop
	ret

BadgeTextPointers: ; 51276 (14:5276)
	dw CascadeBadgeText
	dw ThunderBadgeText
	dw RainbowBadgeText
	dw SoulBadgeText
	dw MarshBadgeText
	dw VolcanoBadgeText
	dw EarthBadgeText

EarthBadgeText: ; 51284 (14:5284)
	db "EARTHBADGE@"

VolcanoBadgeText: ; 5128f (14:528f)
	db "VOLCANOBADGE@"

MarshBadgeText: ; 5129c (14:529c)
	db "MARSHBADGE@"

SoulBadgeText: ; 512a7 (14:52a7)
	db "SOULBADGE@"

RainbowBadgeText: ; 512b1 (14:52b1)
	db "RAINBOWBADGE@"

ThunderBadgeText: ; 512be (14:52be)
	db "THUNDERBADGE@"

CascadeBadgeText: ; 512cb (14:52cb)
	db "CASCADEBADGE@"

Route23Script_512d8: ; 512d8 (14:52d8)
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpriteStateData1 + 9], a
	ld [wJoyIgnore], a
	jp StartSimulatingJoypadStates

Route23Script1: ; 512ec (14:52ec)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
Route23Script2: ; 512f1 (14:52f1)
	ld a, $0
	ld [W_ROUTE23CURSCRIPT], a
	ret

Route23TextPointers: ; 512f7 (14:52f7)
	dw Route23Text1
	dw Route23Text2
	dw Route23Text3
	dw Route23Text4
	dw Route23Text5
	dw Route23Text6
	dw Route23Text7
	dw Route23Text8

Route23Text1: ; 51307 (14:5307)
	TX_ASM
	ld a, $6
	call Route23Script_51346
	jp TextScriptEnd

Route23Text2: ; 51310 (14:5310)
	TX_ASM
	ld a, $5
	call Route23Script_51346
	jp TextScriptEnd

Route23Text3: ; 51319 (14:5319)
	TX_ASM
	ld a, $4
	call Route23Script_51346
	jp TextScriptEnd

Route23Text4: ; 51322 (14:5322)
	TX_ASM
	ld a, $3
	call Route23Script_51346
	jp TextScriptEnd

Route23Text5: ; 5132b (14:532b)
	TX_ASM
	ld a, $2
	call Route23Script_51346
	jp TextScriptEnd

Route23Text6: ; 51334 (14:5334)
	TX_ASM
	ld a, $1
	call Route23Script_51346
	jp TextScriptEnd

Route23Text7: ; 5133d (14:533d)
	TX_ASM
	ld a, $0
	call Route23Script_51346
	jp TextScriptEnd

Route23Script_51346: ; 51346 (14:5346)
	ld [wWhichBadge], a
	call Route23Script_5125d
	ld a, [wWhichBadge]
	inc a
	ld c, a
	ld b, FLAG_TEST
	ld hl, W_OBTAINEDBADGES
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .asm_5136e
	ld hl, VictoryRoadGuardText1
	call PrintText
	call Route23Script_512d8
	ld a, $1
	ld [W_ROUTE23CURSCRIPT], a
	ret
.asm_5136e
	ld hl, VictoryRoadGuardText2
	call PrintText
	ld a, [wWhichBadge]
	ld c, a
	ld b, FLAG_SET
	ld hl, wd7ed
	predef FlagActionPredef
	ld a, $2
	ld [W_ROUTE23CURSCRIPT], a
	ret

Route23Script_51388: ; 51388 (14:5388)
	ld hl, VictoryRoadGuardText2
	jp PrintText

VictoryRoadGuardText1: ; 5138e (14:538e)
	TX_FAR _VictoryRoadGuardText1
	TX_ASM
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoadGuardText2: ; 5139e (14:539e)
	TX_FAR _VictoryRoadGuardText2
	db $b
	TX_FAR _VictoryRoadGuardText_513a3
	db "@"

Route23Text8: ; 513a8 (14:53a8)
	TX_FAR _Route23Text8
	db "@"
