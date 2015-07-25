FightingDojoScript: ; 5cd5d (17:4d5d)
	call EnableAutoTextBoxDrawing
	ld hl, FightingDojoTrainerHeaders
	ld de, FightingDojoScriptPointers
	ld a, [W_FIGHTINGDOJOCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_FIGHTINGDOJOCURSCRIPT], a
	ret

FightingDojoScript_5cd70: ; 5cd70 (17:4d70)
	xor a
	ld [wJoyIgnore], a
	ld [W_FIGHTINGDOJOCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

FightingDojoScriptPointers: ; 5cd7b (17:4d7b)
	dw FightingDojoScript1
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FightingDojoScript3

FightingDojoScript1: ; 5cd83 (17:4d83)
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	ret nz
	call CheckFightingMapTrainers
	ld a, [wTrainerHeaderFlagBit]
	and a
	ret nz
	CheckEvent EVENT_BEAT_KARATE_MASTER
	ret nz
	xor a
	ld [hJoyHeld], a
	ld [wcf0d], a
	ld a, [W_YCOORD]
	cp $3
	ret nz
	ld a, [W_XCOORD]
	cp $4
	ret nz
	ld a, $1
	ld [wcf0d], a
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_LEFT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ret

FightingDojoScript3: ; 5cdc6 (17:4dc6)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, FightingDojoScript_5cd70
	ld a, [wcf0d]
	and a
	jr z, .asm_5cde4
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_LEFT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay

.asm_5cde4
	ld a, $f0
	ld [wJoyIgnore], a
	SetEventRange EVENT_BEAT_KARATE_MASTER, EVENT_BEAT_FIGHTING_DOJO_TRAINER_3
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [W_FIGHTINGDOJOCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

FightingDojoTextPointers: ; 5ce03 (17:4e03)
	dw FightingDojoText1
	dw FightingDojoText2
	dw FightingDojoText3
	dw FightingDojoText4
	dw FightingDojoText5
	dw FightingDojoText6
	dw FightingDojoText7
	dw FightingDojoText8

FightingDojoTrainerHeaders: ; 5ce13 (17:4e13)
FightingDojoTrainerHeader0: ; 5ce13 (17:4e13)
	dbEventFlagBit EVENT_BEAT_FIGHTING_DOJO_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FIGHTING_DOJO_TRAINER_0
	dw FightingDojoBattleText1 ; TextBeforeBattle
	dw FightingDojoAfterBattleText1 ; TextAfterBattle
	dw FightingDojoEndBattleText1 ; TextEndBattle
	dw FightingDojoEndBattleText1 ; TextEndBattle

FightingDojoTrainerHeader1: ; 5ce1f (17:4e1f)
	dbEventFlagBit EVENT_BEAT_FIGHTING_DOJO_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FIGHTING_DOJO_TRAINER_1
	dw FightingDojoBattleText2 ; TextBeforeBattle
	dw FightingDojoAfterBattleText2 ; TextAfterBattle
	dw FightingDojoEndBattleText2 ; TextEndBattle
	dw FightingDojoEndBattleText2 ; TextEndBattle

FightingDojoTrainerHeader2: ; 5ce2b (17:4e2b)
	dbEventFlagBit EVENT_BEAT_FIGHTING_DOJO_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FIGHTING_DOJO_TRAINER_2
	dw FightingDojoBattleText3 ; TextBeforeBattle
	dw FightingDojoAfterBattleText3 ; TextAfterBattle
	dw FightingDojoEndBattleText3 ; TextEndBattle
	dw FightingDojoEndBattleText3 ; TextEndBattle

FightingDojoTrainerHeader3: ; 5ce37 (17:4e37)
	dbEventFlagBit EVENT_BEAT_FIGHTING_DOJO_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FIGHTING_DOJO_TRAINER_3
	dw FightingDojoBattleText4 ; TextBeforeBattle
	dw FightingDojoAfterBattleText4 ; TextAfterBattle
	dw FightingDojoEndBattleText4 ; TextEndBattle
	dw FightingDojoEndBattleText4 ; TextEndBattle

	db $ff

FightingDojoText1: ; 5ce44 (17:4e44)
	TX_ASM
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jp nz, .continue1
	CheckEventReuseA EVENT_BEAT_KARATE_MASTER
	jp nz, .continue2
	ld hl, FightingDojoText_5ce8e
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, FightingDojoText_5ce93
	ld de, FightingDojoText_5ce93
	call SaveEndBattleTextPointers
	ld a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [W_FIGHTINGDOJOCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	jr .asm_9dba4
.continue1
	ld hl, FightingDojoText_5ce9d
	call PrintText
	jr .asm_9dba4
.continue2
	ld hl, FightingDojoText8
	call PrintText
.asm_9dba4
	jp TextScriptEnd

FightingDojoText_5ce8e: ; 5ce8e (17:4e8e)
	TX_FAR _FightingDojoText_5ce8e
	db "@"

FightingDojoText_5ce93: ; 5ce93 (17:4e93)
	TX_FAR _FightingDojoText_5ce93
	db "@"

FightingDojoText8: ; 5ce98 (17:4e98)
	TX_FAR _FightingDojoText_5ce98
	db "@"

FightingDojoText_5ce9d: ; 5ce9d (17:4e9d)
	TX_FAR _FightingDojoText_5ce9d
	db "@"

FightingDojoText2: ; 5cea2 (17:4ea2)
	TX_ASM
	ld hl, FightingDojoTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText1: ; 5ceac (17:4eac)
	TX_FAR _FightingDojoBattleText1
	db "@"

FightingDojoEndBattleText1: ; 5ceb1 (17:4eb1)
	TX_FAR _FightingDojoEndBattleText1
	db "@"

FightingDojoAfterBattleText1: ; 5ceb6 (17:4eb6)
	TX_FAR _FightingDojoAfterBattleText1
	db "@"

FightingDojoText3: ; 5cebb (17:4ebb)
	TX_ASM
	ld hl, FightingDojoTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText2: ; 5cec5 (17:4ec5)
	TX_FAR _FightingDojoBattleText2
	db "@"

FightingDojoEndBattleText2: ; 5ceca (17:4eca)
	TX_FAR _FightingDojoEndBattleText2
	db "@"

FightingDojoAfterBattleText2: ; 5cecf (17:4ecf)
	TX_FAR _FightingDojoAfterBattleText2
	db "@"

FightingDojoText4: ; 5ced4 (17:4ed4)
	TX_ASM
	ld hl, FightingDojoTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText3: ; 5cede (17:4ede)
	TX_FAR _FightingDojoBattleText3
	db "@"

FightingDojoEndBattleText3: ; 5cee3 (17:4ee3)
	TX_FAR _FightingDojoEndBattleText3
	db "@"

FightingDojoAfterBattleText3: ; 5cee8 (17:4ee8)
	TX_FAR _FightingDojoAfterBattleText3
	db "@"

FightingDojoText5: ; 5ceed (17:4eed)
	TX_ASM
	ld hl, FightingDojoTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText4: ; 5cef7 (17:4ef7)
	TX_FAR _FightingDojoBattleText4
	db "@"

FightingDojoEndBattleText4: ; 5cefc (17:4efc)
	TX_FAR _FightingDojoEndBattleText4
	db "@"

FightingDojoAfterBattleText4: ; 5cf01 (17:4f01)
	TX_FAR _FightingDojoAfterBattleText4
	db "@"

FightingDojoText6: ; 5cf06 (17:4f06)
; Hitmonlee Poké Ball
	TX_ASM
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONLEE
	call DisplayPokedex
	ld hl, WantHitmonleeText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvents EVENT_GOT_HITMONLEE, EVENT_DEFEATED_FIGHTING_DOJO
.done
	jp TextScriptEnd

WantHitmonleeText: ; 5cf49 (17:4f49)
	TX_FAR _WantHitmonleeText
	db "@"

FightingDojoText7: ; 5cf4e (17:4f4e)
; Hitmonchan Poké Ball
	TX_ASM
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONCHAN
	call DisplayPokedex
	ld hl, WantHitmonchanText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c,30
	call GivePokemon
	jr nc, .done
	SetEvents EVENT_GOT_HITMONCHAN, EVENT_DEFEATED_FIGHTING_DOJO

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_2
	ld [wMissableObjectIndex], a
	predef HideObject
.done
	jp TextScriptEnd

WantHitmonchanText: ; 5cf91 (17:4f91)
	TX_FAR _WantHitmonchanText
	db "@"

OtherHitmonText: ; 5cf96 (17:4f96)
	TX_FAR _OtherHitmonText
	db "@"
