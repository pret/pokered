BattleTent_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BattleTent_ScriptPointers
	ld a, [wBattleTentCurScript]
	jp CallFunctionInTable
	
BattleTent_ScriptPointers:
	dw BattleTent_Normal
	dw BattleTent_GuyWalking
	dw BattleTent_PlayerWalking
	dw BattleTent_InitPhase
	dw BattleTent_PrepareEnemy
	dw BattleTent_InitBattle
	dw BattleTent_AfterBattle
	dw BattleTent_Heal
	dw BattleTent_PlayerWalkBack
	dw BattleTent_Final
	
BattleTent_TextPointers:
	dw BattleTentGuy
	dw BattleTentMart
	dw BattleTentGuy2
	dw BattleTentTrainer
	dw BattleTentGuy2_Heal
	dw BattleTentGuy_After
	
BattleTent_LoadTeam:
	ld a, [wBoxCount]
	ld d, a
	push de
	ld a, [wPartyCount]
	ld b, a
	ld a, [wBTOrder+1]
	swap a
	or b
	swap a
	ld [wBTOrder+1], a
; deposit all party 'mons into the box
.depoloop
	push bc
	xor a
	ld [wWhichPokemon], a
	ld [wMonDataLocation], a
	call LoadMonData
	ld a, 1
	ld [wRemoveMonFromBox], a
	call MoveMon
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	pop bc
	dec b
	jr nz, .depoloop
; copy the selected 'mons from the box
	ld a, 2
	ld [wMonDataLocation], a
; first
	pop de
	push de
	ld a, [wBTOrder]
	and $7
	dec a
	add d
	ld [wWhichPokemon], a
	call LoadMonData
	xor a
	ld [wRemoveMonFromBox], a
	call MoveMon
; second
	pop de
	push de
	ld a, [wBTOrder]
	swap a
	and $7
	dec a
	add d
	ld [wWhichPokemon], a
	call LoadMonData
	xor a
	ld [wRemoveMonFromBox], a
	call MoveMon
; third
	pop de
	ld a, [wBTOrder+1]
	and $7
	dec a
	add d
	ld [wWhichPokemon], a
	call LoadMonData
	xor a
	ld [wRemoveMonFromBox], a
	call MoveMon
; limit party 'mons to lv. 50
	ld hl, wPartyMon1Level
	ld de, wPartyMon2Level - wPartyMon1Level
	ld b, 0
.lvloop
	ld a, [hl]
	cp 50
	jr c, .lvskip
	push bc
	push de
	ld a, 50
	ld [hl], a
	ld [wCurEnemyLVL], a
	push hl
	ld de, wPartyMon1BoxLevel - wPartyMon1Level
	add hl, de
	ld [hl], a
	pop hl
	ld a, b
	ld [wWhichPokemon], a
	xor a
	ld [wMonDataLocation], a
	push hl
	call LoadMonData
	pop hl
	push hl
	ld bc, wPartyMon1MaxHP - wPartyMon1Level
	add hl, bc
	ld d,h
	ld e,l ; de now points to stats
	ld bc,-18
	add hl,bc ; hl now points to byte 3 of experience
	ld b,1
	call CalcStats ; recalculate stats
	ld d, 50
	farcall CalcExperience ; calculate experience for next level and store it at $ff96
	pop hl
	push hl
	ld bc, wPartyMon1Exp - wPartyMon1Level
	add hl,bc ; hl now points to experience
; update experience to minimum for new level
	ld a,[$ff96]
	ld [hli],a
	ld a,[$ff97]
	ld [hli],a
	ld a,[$ff98]
	ld [hl],a
	pop hl
	push hl
	ld bc, wPartyMon1HP - wPartyMon1Level
	add hl,bc
	ld d, h
	ld e, l
	ld bc, wPartyMon1MaxHP - wPartyMon1HP
	add hl,bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop hl
	pop de
	pop bc
.lvskip
	add hl, de
	inc b
	ld a, b
	cp 3
	jr nz, .lvloop
	predef HealParty ; in case the player enters a team of fainted 'mon
BattleTent_Normal:
	ret
	
BattleTent_RestoreTeam:
	ld b, 3
; remove the current 3 team
.removeloop
	push bc
	xor a
	ld [wRemoveMonFromBox], a
	ld [wWhichPokemon], a
	call RemovePokemon
	pop bc
	dec b
	jr nz, .removeloop
	ld a, [wBTOrder+1]
	swap a
	and $7
	ld b, a
	ld a, [wBoxCount]
	sub b
	ld c, a
	
; withdraw all party 'mons from the box
.withdloop
	push bc
	ld a, c
	ld [wWhichPokemon], a
	ld a, 2
	ld [wMonDataLocation], a ; dammit FailFish
	call LoadMonData
	xor a
	ld [wRemoveMonFromBox], a
	call MoveMon
	ld a, $1
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	pop bc
	dec b
	jr nz, .withdloop
	ret
	
BattleTent_GuyWalking:
	ld a, [wFontLoaded] ; is the text box still open?
	and a
	ret nz
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $a
	ld [wNewTileBlockID], a
	ld bc, $702
	predef ReplaceTileBlock
	ld a, SFX_TINK
	call PlaySound
	ld c, 30
	call DelayFrames
	ld a, 2
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_PlayerWalking:
	ld hl, wSimulatedJoypadStatesEnd
	ld de, BattleTentMovement_1
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, 3
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_InitPhase:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, 2
	ld [wPlayerMovingDirection], a
	call Delay3
	ld a, 3
	ld [$ff8c], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wBTStreakCnt]
	cp 11
	ld a, 4
	jr nz, .skip
	ld a, 8 ; TEH URN!
.skip
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_PrepareEnemy:
	ld a, [wFontLoaded] ; is the text box still open?
	and a
	ret nz
	ld a, $ff
	ld [wJoyIgnore], a
	call Random
	and $1f
	ld [wBTClass], a
	ld hl, BTTrainerClassList + 1
	ld bc, 3
	call AddNTimes
	ld a, [hl] ; get the trainer's sprite
	ld [wSpriteStateData1 + $40], a
	; this will make the game blink
	call DisableLCD
	farcall InitMapSprites
	call EnableLCD
	ld a, $4
	ld [$ff8c], a
	ld de, BattleTentMovement_2
	call MoveSprite
	ld a, 1
	ld [wPlayerMovingDirection], a
	ld a, 5
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_InitBattle:
	ld a, [wNPCNumScriptedSteps]
	and a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, 4
	ld [$ff8c], a
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, BattleTentTrainer_After
	ld de, BattleTentTrainer_After
	call SaveEndBattleTextPointers
	ld a, [wBTClass]
	ld hl, BTTrainerClassList
	ld bc, 3
	call AddNTimes
	ld a, [hl] ; get trainer class
	add $c8
	ld [wCurOpponent], a
	xor a
	ld [wTrainerNo], a
	ld [hJoyHeld], a
	ld [wJoyIgnore], a
	ld a, 6
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_AfterBattle:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $4
	ld [$ff8c], a
	ld de, BattleTentMovement_3
	call MoveSprite
	ld a, 7
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_Heal:
	ld a, [wNPCNumScriptedSteps]
	and a
	ret nz
	ld a, [wBattleResult]
	cp 1
	jr nz, .stillTehUrn
	; rip
	ld a, 8
	ld [wBattleTentCurScript], a
	ret
.stillTehUrn
	ld hl, wBTStreakCnt
	inc [hl]
	ld a, 2
	ld [wPlayerMovingDirection], a
	call Delay3
	ld a, [hl]
	cp 11
	jr z, .skip ; No need to heal the party, let's just say that the player wins
	predef HealParty
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, 5
	ld [$ff8c], a
	call DisplayTextID
.skip
	ld a, 3
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_PlayerWalkBack:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $a
	ld [wNewTileBlockID], a
	ld bc, $702
	predef ReplaceTileBlock
	ld hl, wSimulatedJoypadStatesEnd
	ld de, BattleTentMovement_4
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, 9
	ld [wBattleTentCurScript], a
	ret
	
BattleTent_Final:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, 8
	ld [wPlayerMovingDirection], a
	call Delay3
	ld a, $7
	ld [wNewTileBlockID], a
	ld bc, $702
	predef ReplaceTileBlock
	ld a, SFX_TINK
	call PlaySound
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, 6
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wBattleTentCurScript], a
	ret
	
; Movements

BattleTentMovement_1:
	db D_UP, $02
	db D_LEFT, $01
	db D_UP, $0a
	db D_RIGHT, $02
	db $FF
	
BattleTentMovement_2:
	db $80, $80, $80, $80, $ff
	
BattleTentMovement_3:
	db $c0, $c0, $c0, $c0, $ff
	
BattleTentMovement_4:
	db D_LEFT, $02
	db D_DOWN, $0a
	db D_RIGHT, $01
	db D_DOWN, $02
	db $FF
	
; Text scripts
	
BattleTentGuy:
	db $8
	ld hl, BattleTentWelcome
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .seeya
; party check
	ld a, [wPartyCount]
	cp 3
	ld hl, BattleTentNotEnough
	jr c, .finalskip
; box space check
	ld a, [wPartyCount]
	ld b, a
	ld a, [wBoxCount]
	add b
	cp MONS_PER_BOX + 1
	ld hl, BattleTentNoBoxTmp
	jr c, .skip2
.finalskip
	call PrintText
.seeya
	ld hl, BattleTentSeeYouAgain
	call PrintText
	jp TextScriptEnd

.skip2
	ld hl, BattleTentPlsSel
	call PrintText
	xor a
	ld [wUpdateSpritesEnabled], a
	call SaveScreenTilesToBuffer2
.partymenuloop
	ld a, $6
	ld [wPartyMenuTypeOrMessageID],a ; changed label from original
	call DisplayPartyMenu
	ld hl, wBTOrder
	jr nc, .monchosen
	xor a
	ld [hli], a
	ld [hl], a
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	jr .seeya
.monchosen
	ld a, [wWhichPokemon]
	inc a
	ld b, a
	ld a, [hl]
	and $7
	cp b
	jr z, .deselfirst
	cp 0
	jr nz, .skipfirst
	ld a, b
	ld [hl], a
	jr .partymenuloop
.deselfirst
	ld a, [hli]
	swap a
	and $7
	ld b, a
	ld a, [hl]
	and $7
	swap a
	or b
	ld b, a
	xor a
	ld [hld], a
	ld a, b
	ld [hl], a
	jr .partymenuloop
.skipfirst
	ld a, [hl]
	swap a
	and $7
	cp b
	jr z, .deselsecond
	cp 0
	jr nz, .skipsecond
	ld a, [hl]
	and $7
	swap b
	or b
	ld [hl], a
	jr .partymenuloop
.deselsecond
	ld a, [hli]
	and $7
	ld b, a
	ld a, [hld]
	and $7
	swap a
	or b
	ld [hli], a
	xor a
	ld [hl], a
	jr .partymenuloop
.skipsecond
	inc hl
	ld a, [hl]
	and $7
	cp b
	jr z, .deselthird
	cp 0
	jr z, .skipthird
	ld hl, BattleTentNoMoreThan3
	call PrintText
	jp .partymenuloop
.deselthird
	xor a
	ld [hl], a
	jp .partymenuloop
.skipthird
	ld a, b
	ld [hl], a
	push hl
	ld hl, wd730
	set 6,[hl] ; turn off letter printing delay
	call ClearScreen
	farcall RedrawPartyMenu_
	ld hl, BattleTentConfirm
	call PrintText
	call YesNoChoice
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .partymenuloop
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	ld hl, BattleTentPleaseWait
	call PrintText
	call BattleTent_LoadTeam
	ld hl, BattleTentLetsGo
	call PrintText
	ld a, 1
	ld [wBattleTentCurScript], a
	jp TextScriptEnd
	
BTReward: 
	db $03,$00,$00
	
BattleTentGuy_After:
	db $8
	ld a, [wBTStreakCnt]
	cp 11
	ld hl, BattleTentLost
	jr nz, .skip ; Not Teh Urn BibleThump
	ld a, $03 ; NO REVERTING THIS CODE PIGU IM SICK OF YOU BREAKING IT!
	ldh [$9f], a
	ld a, $00
	ldh [$a1], a
	ld a, $00
	ldh [$a0], a
	ld hl, $ffa1
	ld de, wPlayerMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, BattleTentWon
.skip
	call PrintText
	ld hl, BattleTentPleaseWait
	call PrintText
	call BattleTent_RestoreTeam
; clear up all variables
	xor a
	ld hl, wBTOrder
	ld bc, wBTDataEnd - wBTOrder
	call FillMemory
	ld hl, BattleTentSeeYouAgain
	call PrintText
	jp TextScriptEnd
	
BattleTentGuy2:
	db $8
	ld a, [wBTStreakCnt]
	and a
	ld hl, BattleTentGuy2_Streak
	jr nz, .skip
	inc a
	ld [wBTStreakCnt], a
	ld hl, BattleTentGuy2_Init
	jr .skip2
.skip
	cp 11
	jr nz, .skip2
	ld hl, BattleTentGuy2_Win
.skip2
	call PrintText
	jp TextScriptEnd
	
BattleTentTrainer:
	db $8
	call Random
	and $3
	ld hl, BTLib1
	ld bc, 9
	call AddNTimes
	ld de, wStringBuffer1
	call CopyData
	ld a, [hRandomAdd]
	swap a
	and $3
	ld hl, BTLib2
	ld bc, 7
	call AddNTimes
	ld de, wStringBuffer2
	call CopyData
	ld a, [hRandomSub]
	and $7
	ld hl, BTBeforeBattlePtrTable
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld l, e
	ld h, d
	call PrintText
	jp TextScriptEnd
	
BattleTentTrainer_After:
	db $8
	call Random
	and $3
	ld hl, BTLib3
	ld bc, 10
	call AddNTimes
	ld de, wStringBuffer1
	call CopyData
	ld a, [hRandomAdd]
	swap a
	and $3
	ld hl, BTLib4
	ld bc, 7
	call AddNTimes
	ld de, wStringBuffer2
	call CopyData
	ld a, [hRandomSub]
	and $7
	ld hl, BTAfterBattlePtrTable
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld l, e
	ld h, d
	call PrintText
	jp TextScriptEnd
	
BattleTentWelcome:
	text "Welcome to the"
	line "BATTLE TENT!"
	
	para "Here, TRAINERs"
	line "from far and"
	cont "wide come to"
	cont "face a gauntlet"
	cont "of 10 TRAINERs!"
	
	para "If you win them"
	line "all, you win"
	cont "a prize!"
	
	para "Would you like"
	line "to participate?"
	
	prompt
	
BattleTentNotEnough:
	text "..whoops! You don't"
	line "have enough"
	cont "#MON that"
	cont "follow the rules!"
	prompt
	
BattleTentNoBoxTmp:
	text "..whoops! your"
	line "current #MON"
	cont "BOX does not"
	cont "have enough"
	cont "space!"
	
	para "We need to"
	line "store all of your"
	cont "party's #MON"
	cont "into the box."
	
	para "Try changing"
	line "or emptying it."
	
	prompt
	
BattleTentPlsSel:
	text "Please select the"
	line "#MON you wish"
	cont "to enter."
	prompt
	
BattleTentNoMoreThan3:
	text "No more than three"
	line "#MON may enter!"
	prompt
	
BattleTentConfirm:
	text "Are you okay with"
	line "these choices?"
	prompt
	
BattleTentPleaseWait:
	text "Please wait…"
	done
	
BattleTentLetsGo:
	text "Alright, this way."
	done
	
BattleTentWon:
	text "Wow! You finally"
	line "did it!"
	
	para "Here is the"
	line "reward!"
	
	para $52, " received"
	line "¥30000!"
	prompt
	
BattleTentLost:
	text "It's a shame that"
	line "you lost."
	cont "Try again later!"
	prompt
	
BattleTentSeeYouAgain:
	text_far _PokemonCenterFarewellText
	db "@"
	
BattleTentGuy2_Init:
	text "Your battle will"
	line "begin soon."
	
	para "Good luck!"
	done
	
BattleTentGuy2_Streak:
	text "Opponent no. @"
	text_decimal wBTStreakCnt, 1, 2
	db $0
	line "is up next."
	para "Good luck!"
	done
	
BattleTentGuy2_Win:
	text "Congratulations!"
	
	para "You have defeated"
	line "all 10 opponents!"
	
	para "Please go back to"
	line "the counter to"
	cont "claim your prize!"
	done

BattleTentGuy2_Heal:
	text "Your #MON will"
	line "be restored to"
	cont "full health."
	done

; Battle Tent
BattleTentMart::
	script_mart POTION, SUPER_POTION, HYPER_POTION, REVIVE, FULL_HEAL, POKE_DOLL, X_ATTACK, X_DEFEND, X_SPEED, X_SPECIAL
	