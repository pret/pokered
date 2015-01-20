BattleCore:

; These are move effects (second value from the Moves table in bank $E).
EffectsArray1: ; 3c000 (f:4000)
	db CONVERSION_EFFECT
	db HAZE_EFFECT
	db SWITCH_AND_TELEPORT_EFFECT
	db MIST_EFFECT
	db FOCUS_ENERGY_EFFECT
	db CONFUSION_EFFECT
	db HEAL_EFFECT
	db TRANSFORM_EFFECT
	db LIGHT_SCREEN_EFFECT
	db REFLECT_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db SUBSTITUTE_EFFECT
	db MIMIC_EFFECT
	db LEECH_SEED_EFFECT
	db SPLASH_EFFECT
	db -1
EffectsArray2: ; 3c011 (f:4011)
; moves that do damage but not through normal calculations
; e.g., Super Fang, Psywave
	db SUPER_FANG_EFFECT
	db SPECIAL_DAMAGE_EFFECT
	db -1
EffectsArray3: ; 3c014 (f:4014)
; stat-affecting moves, sleep-inflicting moves, and Bide
; e.g., Meditate, Bide, Hypnosis
	db $01
	db ATTACK_UP1_EFFECT
	db DEFENSE_UP1_EFFECT
	db SPEED_UP1_EFFECT
	db SPECIAL_UP1_EFFECT
	db ACCURACY_UP1_EFFECT
	db EVASION_UP1_EFFECT
	db ATTACK_DOWN1_EFFECT
	db DEFENSE_DOWN1_EFFECT
	db SPEED_DOWN1_EFFECT
	db SPECIAL_DOWN1_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db EVASION_DOWN1_EFFECT
	db BIDE_EFFECT
	db SLEEP_EFFECT
	db ATTACK_UP2_EFFECT
	db DEFENSE_UP2_EFFECT
	db SPEED_UP2_EFFECT
	db SPECIAL_UP2_EFFECT
	db ACCURACY_UP2_EFFECT
	db EVASION_UP2_EFFECT
	db ATTACK_DOWN2_EFFECT
	db DEFENSE_DOWN2_EFFECT
	db SPEED_DOWN2_EFFECT
	db SPECIAL_DOWN2_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_DOWN2_EFFECT
	db -1
EffectsArray4: ; 3c030 (f:4030)
; Attacks that aren't finished after they faint the opponent.
	db DRAIN_HP_EFFECT
	db EXPLODE_EFFECT
	db DREAM_EATER_EFFECT
	db PAY_DAY_EFFECT
	db TWO_TO_FIVE_ATTACKS_EFFECT
	db $1E
	db ATTACK_TWICE_EFFECT
	db RECOIL_EFFECT
	db TWINEEDLE_EFFECT
	db RAGE_EFFECT
	db -1
EffectsArray5: ; 3c03b (f:403b)
; Effects from arrays 2, 4, and 5B, minus Twineedle and Rage.
; Includes all effects that do not need to be called at the end of 
; ExecutePlayerMove (or ExecuteEnemyMove), because they have already been handled
	db DRAIN_HP_EFFECT
	db EXPLODE_EFFECT
	db DREAM_EATER_EFFECT
	db PAY_DAY_EFFECT
	db SWIFT_EFFECT
	db TWO_TO_FIVE_ATTACKS_EFFECT
	db $1E
	db CHARGE_EFFECT
	db SUPER_FANG_EFFECT
	db SPECIAL_DAMAGE_EFFECT
	db FLY_EFFECT
	db ATTACK_TWICE_EFFECT
	db JUMP_KICK_EFFECT
	db RECOIL_EFFECT
	; fallthrough to Next EffectsArray
EffectsArray5B: ; 3c049 (f:4049)
; damaging moves whose effect is executed prior to damage calculation
	db THRASH_PETAL_DANCE_EFFECT
	db TRAPPING_EFFECT
	db -1

SlidePlayerAndEnemySilhouettesOnScreen: ; 3c04c (f:404c)
	call LoadPlayerBackPic
	ld a, $1 ; the usual text box at the bottom of the screen
	ld [wd125], a
	call DisplayTextBoxID
	hlCoord 1, 5
	ld bc, $307
	call ClearScreenArea
	call DisableLCD
	call LoadFontTilePatterns
	call LoadHudAndHpBarAndStatusTilePatterns
	ld hl, vBGMap0
	ld bc, $400
.clearBackgroundLoop
	ld a, $7f
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .clearBackgroundLoop
; copy the work RAM tile map to VRAM
	ld hl, wTileMap
	ld de, vBGMap0
	ld b, 18 ; number of rows
.copyRowLoop
	ld c, 20 ; number of columns
.copyColumnLoop
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .copyColumnLoop
	ld a, 12 ; number of off screen tiles to the right of screen in VRAM
	add e ; skip the off screen tiles
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	dec b
	jr nz, .copyRowLoop
	call EnableLCD
	ld a, $90
	ld [hWY], a
	ld [rWY], a
	xor a
	ld [hTilesetType], a
	ld [hSCY], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld b, $70
	ld c, $90
	ld a, c
	ld [hSCX], a
	call DelayFrame
	ld a, %11100100 ; inverted palette for silhouette effect
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
.slideSilhouettesLoop ; slide silhouettes of the player's pic and the enemy's pic onto the screen
	ld h, b
	ld l, $40
	call SetScrollXForSlidingPlayerBodyLeft ; begin background scrolling on line $40
	inc b
	inc b
	ld h, $0
	ld l, $60
	call SetScrollXForSlidingPlayerBodyLeft ; end background scrolling on line $60
	call SlidePlayerHeadLeft
	ld a, c
	ld [hSCX], a
	dec c
	dec c
	jr nz, .slideSilhouettesLoop
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, $31
	ld [$ffe1], a
	hlCoord 1, 5
	predef Func_3f0c6
	xor a
	ld [hWY], a
	ld [rWY], a
	inc a
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	ld b, $1
	call GoPAL_SET
	call HideSprites
	ld hl, PrintBeginningBattleText
	ld b, BANK(PrintBeginningBattleText)
	jp Bankswitch

; when a battle is starting, silhouettes of the player's pic and the enemy's pic are slid onto the screen
; the lower of the player's pic (his body) is part of the background, but his head is a sprite
; the reason for this is that it shares Y coordinates with the lower part of the enemy pic, so background scrolling wouldn't work for both pics
; instead, the enemy pic is part of the background and uses the scroll register, while the player's head is a sprite and is slid by changing its X coordinates in a loop
SlidePlayerHeadLeft: ; 3c0ff (f:40ff)
	push bc
	ld hl, wOAMBuffer + $01
	ld c, $15 ; number of OAM entries
	ld de, $4 ; size of OAM entry
.loop
	dec [hl] ; decrement X
	dec [hl] ; decrement X
	add hl, de ; next OAM entry
	dec c
	jr nz, .loop
	pop bc
	ret

SetScrollXForSlidingPlayerBodyLeft: ; 3c110 (f:4110)
	ld a, [rLY]
	cp l
	jr nz, SetScrollXForSlidingPlayerBodyLeft
	ld a, h
	ld [rSCX], a
.loop
	ld a, [rLY]
	cp h
	jr z, .loop
	ret

StartBattle: ; 3c11e (f:411e)
	xor a
	ld [wPartyGainExpFlags], a
	ld [wPartyFoughtCurrentEnemyFlags], a
	ld [wcd6a], a
	inc a
	ld [wd11d], a
	ld hl, wEnemyMon1HP
	ld bc, wEnemyMon2 - wEnemyMon1 - 1
	ld d, $3
.findFirstAliveEnemyMonLoop
	inc d
	ld a, [hli]
	or [hl]
	jr nz, .foundFirstAliveEnemyMon
	add hl, bc
	jr .findFirstAliveEnemyMonLoop
.foundFirstAliveEnemyMon
	ld a, d
	ld [wcc3e], a
	ld a, [W_ISINBATTLE]
	dec a ; is it a trainer battle?
	call nz, EnemySendOutFirstMon ; if it is a trainer battle, send out enemy mon
	ld c, 40
	call DelayFrames
	call SaveScreenTilesToBuffer1
.checkAnyPartyAlive
	call AnyPartyAlive
	ld a, d
	and a
	jp z, HandlePlayerBlackOut ; jump if no mon is alive
	call LoadScreenTilesFromBuffer1
	ld a, [W_BATTLETYPE]
	and a ; is it a normal battle?
	jp z, .playerSendOutFirstMon ; if so, send out player mon
; safari zone battle
.displaySafariZoneBattleMenu
	call DisplayBattleMenu
	ret c ; return if the player ran from battle
	ld a, [wcd6a]
	and a ; was the item used successfully?
	jr z, .displaySafariZoneBattleMenu ; if not, display the menu again; XXX does this ever jump?
	ld a, [W_NUMSAFARIBALLS]
	and a
	jr nz, .notOutOfSafariBalls
	call LoadScreenTilesFromBuffer1
	ld hl, .outOfSafariBallsText
	jp PrintText
.notOutOfSafariBalls
	callab PrintSafariZoneBattleText
	ld a, [wEnemyMonSpeed + 1]
	add a
	ld b, a ; init b (which is later compared with random value) to (enemy speed % 256) * 2
	jp c, EnemyRan ; if (enemy speed % 256) > 127, the enemy runs
	ld a, [wSafariBaitFactor]
	and a ; is bait factor 0?
	jr z, .checkEscapeFactor
; bait factor is not 0
; divide b by 4 (making the mon less likely to run)
	srl b
	srl b
.checkEscapeFactor
	ld a, [wSafariEscapeFactor]
	and a ; is escape factor 0?
	jr z, .compareWithRandomValue
; escape factor is not 0
; multiply b by 2 (making the mon more likely to run)
	sla b
	jr nc, .compareWithRandomValue
; cap b at 255
	ld b, $ff
.compareWithRandomValue
	call Random
	cp b
	jr nc, .checkAnyPartyAlive
	jr EnemyRan ; if b was greater than the random value, the enemy runs

.outOfSafariBallsText
	TX_FAR _OutOfSafariBallsText
	db "@"

.playerSendOutFirstMon
	xor a
	ld [wWhichPokemon], a
.findFirstAliveMonLoop
	call HasMonFainted
	jr nz, .foundFirstAliveMon
; fainted, go to the next one
	ld hl, wWhichPokemon
	inc [hl]
	jr .findFirstAliveMonLoop
.foundFirstAliveMon
	ld a, [wWhichPokemon]
	ld [wPlayerMonNumber], a
	inc a
	ld hl, wPartySpecies - 1
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl] ; species
	ld [wcf91], a
	ld [wBattleMonSpecies2], a
	call LoadScreenTilesFromBuffer1
	hlCoord 1, 5
	ld a, $9
	call SlideTrainerPicOffScreen
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld c, a
	ld b, $1
	push bc
	ld hl, wPartyGainExpFlags
	predef FlagActionPredef
	ld hl, wPartyFoughtCurrentEnemyFlags
	pop bc
	predef FlagActionPredef
	call LoadBattleMonFromParty
	call LoadScreenTilesFromBuffer1
	call SendOutMon
	jr MainInBattleLoop

; wild mon or link battle enemy ran from battle
EnemyRan: ; 3c202 (f:4202)
	call LoadScreenTilesFromBuffer1
	ld a, [W_ISLINKBATTLE]
	cp $4
	ld hl, WildRanText
	jr nz, .printText
; link battle
	xor a
	ld [wBattleResult], a
	ld hl, EnemyRanText
.printText
	call PrintText
	ld a, (SFX_08_44 - SFX_Headers_08) / 3
	call PlaySoundWaitForCurrent
	xor a
	ld [H_WHOSETURN], a
	ld hl, AnimationSlideEnemyMonOut
	ld b, BANK(AnimationSlideEnemyMonOut)
	jp Bankswitch

WildRanText: ; 3c229 (f:4229)
	TX_FAR _WildRanText
	db "@"

EnemyRanText: ; 3c22e (f:422e)
	TX_FAR _EnemyRanText
	db "@"

MainInBattleLoop: ; 3c233 (f:4233)
	call ReadPlayerMonCurHPAndStatus
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl] ; is battle mon HP 0?
	jp z, HandlePlayerMonFainted  ; if battle mon HP is 0, jump
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl] ; is enemy mon HP 0?
	jp z, HandleEnemyMonFainted ; if enemy mon HP is 0, jump
	call SaveScreenTilesToBuffer1
	xor a
	ld [wd11d], a
	ld a, [W_PLAYERBATTSTATUS2]
	and %01100000 ; check if the player is using Rage or needs to recharge
	jr nz, .selectEnemyMove
; the player is not using Rage and doesn't need to recharge
	ld hl, W_ENEMYBATTSTATUS1
	res 3, [hl] ; reset flinch bit
	ld hl, W_PLAYERBATTSTATUS1
	res 3, [hl] ; reset flinch bit
	ld a, [hl]
	and %00010010 ; check if the player is thrashing about or charging for an attack
	jr nz, .selectEnemyMove ; if so, jump
; the player is neither thrashing about nor charging for an attack
	call DisplayBattleMenu ; show battle menu
	ret c ; return if player ran from battle
	ld a, [wEscapedFromBattle]
	and a
	ret nz ; return if pokedoll was used to escape from battle
	ld a, [wBattleMonStatus]
	and (1 << FRZ) | SLP ; is mon frozen or asleep?
	jr nz, .selectEnemyMove ; if so, jump
	ld a, [W_PLAYERBATTSTATUS1]
	and %00100001 ; check player is using Bide or using a multi-turn attack like wrap
	jr nz, .selectEnemyMove ; if so, jump
	ld a, [W_ENEMYBATTSTATUS1]
	bit 5, a ; check if enemy is using a multi-turn attack like wrap
	jr z, .selectPlayerMove ; if not, jump
; enemy is using a mult-turn attack like wrap, so player is trapped and cannot execute a move
	ld a, $ff
	ld [wPlayerSelectedMove], a
	jr .selectEnemyMove
.selectPlayerMove
	ld a, [wcd6a]
	and a
	jr nz, .selectEnemyMove
	ld [wMoveMenuType], a
	inc a
	ld [W_ANIMATIONID], a
	xor a
	ld [wMenuItemToSwap], a
	call MoveSelectionMenu
	push af
	call LoadScreenTilesFromBuffer1
	call DrawHUDsAndHPBars
	pop af
	jr nz, MainInBattleLoop ; if the player didn't select a move, jump
.selectEnemyMove
	call SelectEnemyMove
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .noLinkBattle
; link battle
	ld a, [wcc3e]
	cp $f
	jp z, EnemyRan
	cp $e
	jr z, .noLinkBattle
	cp $d
	jr z, .noLinkBattle
	sub $4
	jr c, .noLinkBattle
; the link battle enemy has switched mons
	ld a, [W_PLAYERBATTSTATUS1]
	bit 5, a ; check if using multi-turn move like Wrap
	jr z, .asm_3c2dd
	ld a, [wPlayerMoveListIndex]
	ld hl, wBattleMonMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp METRONOME ; a MIRROR MOVE check is missing, might lead to a desync in link battles when combined with multi-turn moves
	jr nz, .asm_3c2dd
	ld [wPlayerSelectedMove], a
.asm_3c2dd
	callab SwitchEnemyMon
.noLinkBattle
	ld a, [wPlayerSelectedMove]
	cp QUICK_ATTACK
	jr nz, .playerDidNotUseQuickAttack
	ld a, [wEnemySelectedMove]
	cp QUICK_ATTACK
	jr z, .compareSpeed  ; if both used Quick Attack
	jp .playerMovesFirst ; if player used Quick Attack and enemy didn't
.playerDidNotUseQuickAttack
	ld a, [wEnemySelectedMove]
	cp QUICK_ATTACK
	jr z, .enemyMovesFirst ; if enemy used Quick Attack and player didn't
	ld a, [wPlayerSelectedMove]
	cp COUNTER
	jr nz, .playerDidNotUseCounter
	ld a, [wEnemySelectedMove]
	cp COUNTER
	jr z, .compareSpeed ; if both used Counter
	jr .enemyMovesFirst ; if player used Counter and enemy didn't
.playerDidNotUseCounter
	ld a, [wEnemySelectedMove]
	cp COUNTER
	jr z, .playerMovesFirst ; if enemy used Counter and player didn't
.compareSpeed
	ld de, wBattleMonSpeed ; player speed value
	ld hl, wEnemyMonSpeed ; enemy speed value
	ld c, $2
	call StringCmp ; compare speed values
	jr z, .speedEqual
	jr nc, .playerMovesFirst ; if player is faster
	jr .enemyMovesFirst ; if enemy is faster
.speedEqual ; 50/50 chance for both players
	ld a, [$ffaa]
	cp $2
	jr z, .invertOutcome
	call BattleRandom
	cp $80
	jr c, .playerMovesFirst
	jr .enemyMovesFirst
.invertOutcome
	call BattleRandom
	cp $80
	jr c, .enemyMovesFirst
	jr .playerMovesFirst
.enemyMovesFirst
	ld a, $1
	ld [H_WHOSETURN], a
	callab TrainerAI
	jr c, .AIActionUsedEnemyFirst
	call ExecuteEnemyMove
	ld a, [wEscapedFromBattle]
	and a ; was Teleport, Road, or Whirlwind used to escape from battle?
	ret nz ; if so, return
	ld a, b
	and a
	jp z, HandlePlayerMonFainted 
.AIActionUsedEnemyFirst
	call HandlePoisonBurnLeechSeed
	jp z, HandleEnemyMonFainted
	call DrawHUDsAndHPBars
	call ExecutePlayerMove
	ld a, [wEscapedFromBattle]
	and a ; was Teleport, Road, or Whirlwind used to escape from battle?
	ret nz ; if so, return
	ld a, b
	and a
	jp z, HandleEnemyMonFainted
	call HandlePoisonBurnLeechSeed
	jp z, HandlePlayerMonFainted
	call DrawHUDsAndHPBars
	call CheckNumAttacksLeft
	jp MainInBattleLoop
.playerMovesFirst
	call ExecutePlayerMove
	ld a, [wEscapedFromBattle]
	and a ; was Teleport, Road, or Whirlwind used to escape from battle?
	ret nz ; if so, return
	ld a, b
	and a
	jp z, HandleEnemyMonFainted
	call HandlePoisonBurnLeechSeed
	jp z, HandlePlayerMonFainted
	call DrawHUDsAndHPBars
	ld a, $1
	ld [H_WHOSETURN], a
	callab TrainerAI
	jr c, .AIActionUsedPlayerFirst
	call ExecuteEnemyMove
	ld a, [wEscapedFromBattle]
	and a ; was Teleport, Road, or Whirlwind used to escape from battle?
	ret nz ; if so, return
	ld a, b
	and a
	jp z, HandlePlayerMonFainted
.AIActionUsedPlayerFirst
	call HandlePoisonBurnLeechSeed
	jp z, HandleEnemyMonFainted
	call DrawHUDsAndHPBars
	call CheckNumAttacksLeft
	jp MainInBattleLoop

HandlePoisonBurnLeechSeed: ; 3c3bd (f:43bd)
	ld hl, wBattleMonHP
	ld de, wBattleMonStatus
	ld a, [H_WHOSETURN]
	and a
	jr z, .playersTurn
	ld hl, wEnemyMonHP
	ld de, wEnemyMonStatus
.playersTurn
	ld a, [de]
	and (1 << BRN) | (1 << PSN)
	jr z, .notBurnedOrPoisoned
	push hl
	ld hl, HurtByPoisonText
	ld a, [de]
	and 1 << BRN
	jr z, .poisoned
	ld hl, HurtByBurnText
.poisoned
	call PrintText
	xor a
	ld [wcc5b], a
	ld a,BURN_PSN_ANIM
	call PlayMoveAnimation   ; play burn/poison animation
	pop hl
	call HandlePoisonBurnLeechSeed_DecreaseOwnHP
.notBurnedOrPoisoned
	ld de, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .playersTurn2
	ld de, W_ENEMYBATTSTATUS2
.playersTurn2
	ld a, [de]
	add a
	jr nc, .notLeechSeeded
	push hl
	ld a, [H_WHOSETURN]
	push af
	xor $1
	ld [H_WHOSETURN], a
	xor a
	ld [wcc5b], a
	ld a,ABSORB
	call PlayMoveAnimation ; play leech seed animation (from opposing mon)
	pop af
	ld [H_WHOSETURN], a
	pop hl
	call HandlePoisonBurnLeechSeed_DecreaseOwnHP
	call HandlePoisonBurnLeechSeed_IncreaseEnemyHP
	push hl
	ld hl, HurtByLeechSeedText
	call PrintText
	pop hl
.notLeechSeeded
	ld a, [hli]
	or [hl]
	ret nz          ; test if fainted
	call DrawHUDsAndHPBars
	ld c, $14
	call DelayFrames
	xor a
	ret

HurtByPoisonText: ; 3c42e (f:442e)
	TX_FAR _HurtByPoisonText
	db "@"

HurtByBurnText: ; 3c433 (f:4433)
	TX_FAR _HurtByBurnText
	db "@"

HurtByLeechSeedText: ; 3c438 (f:4438)
	TX_FAR _HurtByLeechSeedText
	db "@"

; decreases the mon's current HP by 1/16 of the Max HP (multiplied by number of toxic ticks if active)
; note that the toxic ticks are considered even if the damage is not poison (hence the Leech Seed glitch)
; hl: HP pointer
; bc (out): total damage
HandlePoisonBurnLeechSeed_DecreaseOwnHP: ; 3c43d (f:443d)
	push hl
	push hl
	ld bc, $e      ; skip to max HP
	add hl, bc
	ld a, [hli]    ; load max HP
	ld [wHPBarMaxHP+1], a
	ld b, a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld c, a
	srl b
	rr c
	srl b
	rr c
	srl c
	srl c         ; c = max HP/16 (assumption: HP < 1024)
	ld a, c
	and a
	jr nz, .nonZeroDamage
	inc c         ; damage is at least 1
.nonZeroDamage
	ld hl, W_PLAYERBATTSTATUS3
	ld de, W_PLAYERTOXICCOUNTER
	ld a, [H_WHOSETURN]
	and a
	jr z, .playersTurn
	ld hl, W_ENEMYBATTSTATUS3
	ld de, W_ENEMYTOXICCOUNTER
.playersTurn
	bit 0, [hl]
	jr z, .noToxic
	ld a, [de]    ; increment toxic counter
	inc a
	ld [de], a
	ld hl, $0000
.toxicTicksLoop
	add hl, bc
	dec a
	jr nz, .toxicTicksLoop
	ld b, h       ; bc = damage * toxic counter
	ld c, l
.noToxic
	pop hl
	inc hl
	ld a, [hl]    ; subtract total damage from current HP
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [hl], a
	ld [wHPBarNewHP+1], a
	jr nc, .noOverkill
	xor a         ; overkill: zero HP
	ld [hli], a
	ld [hl], a
	ld [wHPBarNewHP], a
	ld [wHPBarNewHP+1], a
.noOverkill
	call UpdateCurMonHPBar
	pop hl
	ret

; adds bc to enemy HP
; bc isn't updated if HP substracted was capped to prevent overkill
HandlePoisonBurnLeechSeed_IncreaseEnemyHP: ; 3c4a3 (f:44a3)
	push hl
	ld hl, wEnemyMonMaxHP
	ld a, [H_WHOSETURN]
	and a
	jr z, .playersTurn
	ld hl, wBattleMonMaxHP
.playersTurn
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld de, $fff2
	add hl, de           ; skip back fomr max hp to current hp
	ld a, [hl]
	ld [wHPBarOldHP], a ; add bc to current HP
	add c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, [wHPBarMaxHP]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [wHPBarMaxHP+1]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .noOverfullHeal
	ld a, b                ; overfull heal, set HP to max HP
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, c
	ld [hl], a
	ld [wHPBarNewHP], a
.noOverfullHeal
	ld a, [H_WHOSETURN]
	xor $1
	ld [H_WHOSETURN], a
	call UpdateCurMonHPBar
	ld a, [H_WHOSETURN]
	xor $1
	ld [H_WHOSETURN], a
	pop hl
	ret

UpdateCurMonHPBar: ; 3c4f6 (f:44f6)
	hlCoord 10, 9    ; tile pointer to player HP bar
	ld a, [H_WHOSETURN]
	and a
	ld a, $1
	jr z, .playersTurn
	hlCoord 2, 2    ; tile pointer to enemy HP bar
	xor a
.playersTurn
	push bc
	ld [wListMenuID], a
	predef UpdateHPBar2
	pop bc
	ret

CheckNumAttacksLeft: ; 3c50f (f:450f)
	ld a, [wPlayerNumAttacksLeft]
	and a
	jr nz, .checkEnemy
; player has 0 attacks left
	ld hl, W_PLAYERBATTSTATUS1
	res 5, [hl] ; player not using multi-turn attack like wrap any more
.checkEnemy
	ld a, [wEnemyNumAttacksLeft]
	and a
	ret nz
; enemy has 0 attacks left
	ld hl, W_ENEMYBATTSTATUS1
	res 5, [hl] ; enemy not using multi-turn attack like wrap any more
	ret

HandleEnemyMonFainted: ; 3c525 (f:4525)
	xor a
	ld [wccf0], a
	call FaintEnemyPokemon
	call AnyPartyAlive
	ld a, d
	and a
	jp z, HandlePlayerBlackOut ; if no party mons are alive, the player blacks out
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl] ; is battle mon HP zero?
	call nz, DrawPlayerHUDAndHPBar ; if battle mon HP is not zero, draw player HD and HP bar
	ld a, [W_ISINBATTLE]
	dec a
	ret z ; return if it's a wild battle
	call AnyEnemyPokemonAliveCheck
	jp z, TrainerBattleVictory
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl] ; does battle mon have 0 HP?
	jr nz, .skipReplacingBattleMon ; if not, skip replacing battle mon
	call DoUseNextMonDialogue ; this call is useless in a trainer battle. it shouldn't be here
	ret c
	call ChooseNextMon
.skipReplacingBattleMon
	ld a, $1
	ld [wcd6a], a
	call ReplaceFaintedEnemyMon
	jp z, EnemyRan
	xor a
	ld [wcd6a], a
	jp MainInBattleLoop

FaintEnemyPokemon ; 0x3c567
	call ReadPlayerMonCurHPAndStatus
	ld a, [W_ISINBATTLE]
	dec a
	jr z, .wild
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1HP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hli], a
	ld [hl], a
.wild
	ld hl, W_PLAYERBATTSTATUS1
	res 2, [hl]
	xor a
	ld [W_NUMHITS], a
	ld hl, wd065 ; clear enemy statuses
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [W_ENEMYDISABLEDMOVE], a
	ld [wccef], a
	ld [wccf3], a
	ld hl, wccf1
	ld [hli], a
	ld [hl], a
	hlCoord 12, 5
	deCoord 12, 6
	call SlideDownFaintedMonPic
	ld hl, wTileMap
	ld bc, $40b
	call ClearScreenArea
	ld a, [W_ISINBATTLE]
	dec a
	jr z, .wild_win
	xor a
	ld [wc0f1], a
	ld [wc0f2], a
	ld a, (SFX_08_48 - SFX_Headers_08) / 3 ; SFX_FALL?
	call PlaySoundWaitForCurrent
.sfxwait
	ld a, [wc02a]
	cp (SFX_08_48 - SFX_Headers_08) / 3
	jr z, .sfxwait
	ld a, (SFX_08_43 - SFX_Headers_08) / 3 ; SFX_DROP
	call PlaySound
	call WaitForSoundToFinish
	jr .sfxplayed
.wild_win
	call Func_3c643
	ld a, MUSIC_DEFEATED_WILD_MON
	call PlayBattleVictoryMusic
.sfxplayed
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .playermonnotfaint
	ld a, [wccf0]
	and a
	jr nz, .playermonnotfaint
	call RemoveFaintedPlayerMon
.playermonnotfaint
	call AnyPartyAlive
	ld a, d
	and a
	ret z
	ld hl, EnemyMonFaintedText
	call PrintText
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
	xor a
	ld [wBattleResult], a
	ld b, EXP__ALL
	call IsItemInBag
	push af
	jr z, .giveExpToMonsThatFought ; if no exp all, then jump

; the player has exp all
; first, we halve the values that determine exp gain
; the enemy mon base stats are added to stat exp, so they are halved
; the base exp (which determines normal exp) is also halved
	ld hl, wEnemyMonBaseStats
	ld b, $7
.halveExpDataLoop
	srl [hl]
	inc hl
	dec b
	jr nz, .halveExpDataLoop

; give exp (divided evenly) to the mons that actually fought in battle against the enemy mon that has fainted
; if exp all is in the bag, this will be only be half of the stat exp and normal exp, due to the above loop
.giveExpToMonsThatFought
	xor a
	ld [wcc5b], a
	callab GainExperience
	pop af
	ret z ; return if no exp all

; the player has exp all
; now, set the gain exp flag for every party member
; half of the total stat exp and normal exp will divided evenly amongst every party member
	ld a, $1
	ld [wcc5b], a
	ld a, [wPartyCount]
	ld b, 0
.gainExpFlagsLoop
	scf
	rl b
	dec a
	jr nz, .gainExpFlagsLoop
	ld a, b
	ld [wPartyGainExpFlags], a
	ld hl, GainExperience
	ld b, BANK(GainExperience)
	jp Bankswitch

EnemyMonFaintedText: ; 0x3c63e
	TX_FAR _EnemyMonFaintedText
	db "@"

Func_3c643: ; 3c643 (f:4643)
	xor a
	ld [wd083], a
	ld [wc02a], a
	inc a
	ld [wccf6], a
	ret

AnyEnemyPokemonAliveCheck: ; 3c64f (f:464f)
	ld a, [wEnemyPartyCount]
	ld b, a
	xor a
	ld hl, wEnemyMon1HP
	ld de, $2c
.asm_3c65a
	or [hl]
	inc hl
	or [hl]
	dec hl
	add hl, de
	dec b
	jr nz, .asm_3c65a
	and a
	ret

; stores whether enemy ran in Z flag
ReplaceFaintedEnemyMon: ; 3c664 (f:4664)
	ld hl, wcf1e
	ld e, $30
	call GetBattleHealthBarColor
	callab DrawEnemyPokeballs
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .asm_3c687
; link battle
	call LinkBattleExchangeData
	ld a, [wcc3e]
	cp $f
	ret z
	call LoadScreenTilesFromBuffer1
.asm_3c687
	call EnemySendOut
	xor a
	ld [W_ENEMYMOVENUM], a
	ld [wcd6a], a
	ld [wccd5], a
	inc a ; reset Z flag
	ret

TrainerBattleVictory: ; 3c696 (f:4696)
	call Func_3c643
	ld b, MUSIC_DEFEATED_GYM_LEADER
	ld a, [W_GYMLEADERNO]
	and a
	jr nz, .gymleader
	ld b, MUSIC_DEFEATED_TRAINER
.gymleader
	ld a, [W_TRAINERCLASS]
	cp SONY3 ; final battle against rival
	jr nz, .notrival
	ld b, MUSIC_DEFEATED_GYM_LEADER
	ld hl, W_FLAGS_D733
	set 1, [hl]
.notrival
	ld a, [W_ISLINKBATTLE]
	cp $4
	ld a, b
	call nz, PlayBattleVictoryMusic
	ld hl, TrainerDefeatedText
	call PrintText
	ld a, [W_ISLINKBATTLE]
	cp $4
	ret z
	call ScrollTrainerPicAfterBattle
	ld c, $28
	call DelayFrames
	call PrintEndBattleText
	ld hl, MoneyForWinningText
	call PrintText
	ld de, wPlayerMoney + 2
	ld hl, wd07b
	ld c, $3
	predef_jump AddBCDPredef

MoneyForWinningText: ; 3c6e4 (f:46e4)
	TX_FAR _MoneyForWinningText
	db "@"

TrainerDefeatedText: ; 3c6e9 (f:46e9)
	TX_FAR _TrainerDefeatedText
	db "@"

PlayBattleVictoryMusic: ; 3c6ee (f:46ee)
	push af
	ld a, $ff
	ld [wc0ee], a
	call PlaySoundWaitForCurrent
	ld c, BANK(Music_DefeatedTrainer)
	pop af
	call PlayMusic
	jp Delay3

HandlePlayerMonFainted: ; 3c700 (f:4700)
	ld a, $1
	ld [wccf0], a
	call RemoveFaintedPlayerMon
	call AnyPartyAlive     ; test if any more mons are alive
	ld a, d
	and a
	jp z, HandlePlayerBlackOut
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl] ; is enemy mon's HP 0?
	jr nz, .doUseNextMonDialogue ; if not, jump
; the enemy mon has 0 HP
	call FaintEnemyPokemon
	ld a, [W_ISINBATTLE]
	dec a
	ret z            ; if wild encounter, battle is over
	call AnyEnemyPokemonAliveCheck
	jp z, TrainerBattleVictory
.doUseNextMonDialogue
	call DoUseNextMonDialogue
	ret c ; return if the player ran from battle
	call ChooseNextMon
	jp nz, MainInBattleLoop ; if the enemy mon has more than 0 HP, go back to battle loop
; the enemy mon has 0 HP
	ld a, $1
	ld [wcd6a], a
	call ReplaceFaintedEnemyMon
	jp z, EnemyRan ; if enemy ran from battle rather than sending out another mon, jump
	xor a
	ld [wcd6a], a
	jp MainInBattleLoop

; resets flags, slides mon's pic down, plays cry, and prints fainted message
RemoveFaintedPlayerMon: ; 3c741 (f:4741)
	ld a, [wPlayerMonNumber]
	ld c, a
	ld hl, wPartyGainExpFlags
	ld b, $0
	predef FlagActionPredef ; clear gain exp flag for fainted mon
	ld hl, W_ENEMYBATTSTATUS1
	res 2, [hl]   ; reset "attacking multiple times" flag
	ld a, [wd083]
	bit 7, a      ; skip sound flag (red bar (?))
	jr z, .skipWaitForSound
	ld a, $ff
	ld [wd083], a
	call WaitForSoundToFinish
.skipWaitForSound
	ld hl, wcd05
	ld [hli], a
	ld [hl], a
	ld [wBattleMonStatus], a
	call ReadPlayerMonCurHPAndStatus
	hlCoord 9, 7
	ld bc, $50b
	call ClearScreenArea
	hlCoord 1, 10
	deCoord 1, 11
	call SlideDownFaintedMonPic
	ld a, $1
	ld [wBattleResult], a
	ld a, [wccf0]
	and a
	ret z
	ld a, [wBattleMonSpecies]
	call PlayCry
	ld hl, PlayerMonFaintedText
	jp PrintText

PlayerMonFaintedText: ; 3c796 (f:4796)
	TX_FAR _PlayerMonFaintedText
	db "@"

; asks if you want to use next mon
; stores whether you ran in C flag
DoUseNextMonDialogue: ; 3c79b (f:479b)
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
	ld a, [W_ISINBATTLE]
	and a
	dec a
	ret nz ; return if it's a trainer battle
	ld hl, UseNextMonText
	call PrintText
.displayYesNoBox
	hlCoord 13, 9
	ld bc, $a0e
	ld a, $14 ; yes/no text box
	ld [wd125], a
	call DisplayTextBoxID
	ld a, [wd12e]
	cp $2 ; did the player choose NO?
	jr z, .tryRunning ; if the player chose NO, try running
	and a ; reset carry
	ret
.tryRunning
	ld a, [wCurrentMenuItem]
	and a
	jr z, .displayYesNoBox ; xxx when does this happen?
	ld hl, wPartyMon1Speed
	ld de, wEnemyMonSpeed
	jp TryRunningFromBattle

UseNextMonText: ; 3c7d3 (f:47d3)
	TX_FAR _UseNextMonText
	db "@"

; choose next player mon to send out
; stores whether enemy mon has no HP left in Z flag
ChooseNextMon: ; 3c7d8 (f:47d8)
	ld a, $2
	ld [wd07d], a
	call DisplayPartyMenu
.checkIfMonChosen
	jr nc, .monChosen
.goBackToPartyMenu
	call GoBackToPartyMenu
	jr .checkIfMonChosen
.monChosen
	call HasMonFainted
	jr z, .goBackToPartyMenu ; if mon fainted, you have to choose another
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .asm_3c7fa
	inc a
	ld [wcd6a], a
	call LinkBattleExchangeData
.asm_3c7fa
	xor a
	ld [wcd6a], a
	call ClearSprites
	ld a, [wWhichPokemon]
	ld [wPlayerMonNumber], a
	ld c, a
	ld hl, wPartyGainExpFlags
	ld b, $1
	push bc
	predef FlagActionPredef
	pop bc
	ld hl, wPartyFoughtCurrentEnemyFlags
	predef FlagActionPredef
	call LoadBattleMonFromParty
	call GBPalWhiteOut
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer1
	call GoPAL_SET_CF1C
	call GBPalNormal
	call SendOutMon
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	ret

; called when player is out of usable mons.
; prints approriate lose message, sets carry flag if player blacked out (special case for initial rival fight)
HandlePlayerBlackOut: ; 3c837 (f:4837)
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr z, .notSony1Battle
	ld a, [W_CUROPPONENT]
	cp $c8 + SONY1
	jr nz, .notSony1Battle
	ld hl, wTileMap  ; sony 1 battle
	ld bc, $815
	call ClearScreenArea
	call ScrollTrainerPicAfterBattle
	ld c, $28
	call DelayFrames
	ld hl, Sony1WinText
	call PrintText
	ld a, [W_CURMAP]
	cp OAKS_LAB
	ret z            ; starter battle in oak's lab: don't black out
.notSony1Battle
	ld b, $0
	call GoPAL_SET
	ld hl, PlayerBlackedOutText2
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .noLinkBattle
	ld hl, LinkBattleLostText
.noLinkBattle
	call PrintText
	ld a, [wd732]
	res 5, a
	ld [wd732], a
	call ClearScreen
	scf
	ret

Sony1WinText: ; 3c884 (f:4884)
	TX_FAR _Sony1WinText
	db "@"

PlayerBlackedOutText2: ; 3c889 (f:4889)
	TX_FAR _PlayerBlackedOutText2
	db "@"

LinkBattleLostText: ; 3c88e (f:488e)
	TX_FAR _LinkBattleLostText
	db "@"

; slides pic of fainted mon downwards until it disappears
; bug: when this is called, [H_AUTOBGTRANSFERENABLED] is non-zero, so there is screen tearing
SlideDownFaintedMonPic: ; 3c893 (f:4893)
	ld a, [wd730]
	push af
	set 6, a
	ld [wd730], a
	ld b, 7 ; number of times to slide
.slideStepLoop ; each iteration, the mon is slid down one row
	push bc
	push de
	push hl
	ld b, 6 ; number of rows
.rowLoop
	push bc
	push hl
	push de
	ld bc, $7
	call CopyData
	pop de
	pop hl
	ld bc, -20
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	dec b
	jr nz, .rowLoop
	ld bc, 20
	add hl, bc
	ld de, SevenSpacesText
	call PlaceString
	ld c, 2
	call DelayFrames
	pop hl
	pop de
	pop bc
	dec b
	jr nz, .slideStepLoop
	pop af
	ld [wd730], a
	ret

SevenSpacesText: ; 3c8d7 (f:48d7)
	db "       @"

; slides the player or enemy trainer off screen
; a is the number of tiles to slide it horizontally (always 9 for the player trainer or 8 for the enemy trainer)
; if a is 8, the slide is to the right, else it is to the left
; bug: when this is called, [H_AUTOBGTRANSFERENABLED] is non-zero, so there is screen tearing
SlideTrainerPicOffScreen: ; 3c8df (f:48df)
	ld [$FF8B], a
	ld c, a
.slideStepLoop ; each iteration, the trainer pic is slid one tile left/right
	push bc
	push hl
	ld b, 7 ; number of rows
.rowLoop
	push hl
	ld a, [$FF8B]
	ld c, a
.columnLoop
	ld a, [$FF8B]
	cp 8
	jr z, .slideRight
.slideLeft ; slide player sprite off screen
	ld a, [hld]
	ld [hli], a
	inc hl
	jr .nextColumn
.slideRight ; slide enemy trainer sprite off screen
	ld a, [hli]
	ld [hld], a
	dec hl
.nextColumn
	dec c
	jr nz, .columnLoop
	pop hl
	ld de, 20
	add hl, de
	dec b
	jr nz, .rowLoop
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	dec c
	jr nz, .slideStepLoop
	ret

; send out a trainer's mon
EnemySendOut: ; 3c90e (f:490e)
	ld hl,wPartyGainExpFlags
	xor a
	ld [hl],a
	ld a,[wPlayerMonNumber]
	ld c,a
	ld b,1
	push bc
	predef FlagActionPredef
	ld hl,wPartyFoughtCurrentEnemyFlags
	xor a
	ld [hl],a
	pop bc
	predef FlagActionPredef

; don't change wPartyGainExpFlags or wPartyFoughtCurrentEnemyFlags
EnemySendOutFirstMon: ; 3c92a (f:492a)
	xor a
	ld hl,wd065 ; clear enemy statuses
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld [W_ENEMYDISABLEDMOVE],a
	ld [wccef],a
	ld [wccf3],a
	ld hl,wccf1
	ld [hli],a
	ld [hl],a
	dec a
	ld [wAICount],a
	ld hl,W_PLAYERBATTSTATUS1
	res 5,[hl]
	hlCoord 18, 0
	ld a,8
	call SlideTrainerPicOffScreen
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
	ld a,[W_ISLINKBATTLE]
	cp 4
	jr nz,.next
	ld a,[wcc3e]
	sub 4
	ld [wWhichPokemon],a
	jr .next3
.next
	ld b,$FF
.next2
	inc b
	ld a,[wEnemyMonPartyPos]
	cp b
	jr z,.next2
	ld hl,wEnemyMon1
	ld a,b
	ld [wWhichPokemon],a
	push bc
	ld bc,wEnemyMon2 - wEnemyMon1
	call AddNTimes
	pop bc
	inc hl
	ld a,[hli]
	ld c,a
	ld a,[hl]
	or c
	jr z,.next2
.next3
	ld a,[wWhichPokemon]
	ld hl,wEnemyMon1Level
	ld bc,wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a,[hl]
	ld [W_CURENEMYLVL],a
	ld a,[wWhichPokemon]
	inc a
	ld hl,wEnemyPartyCount
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hl]
	ld [wEnemyMonSpecies2],a
	ld [wcf91],a
	call LoadEnemyMonData
	ld hl,wEnemyMonHP
	ld a,[hli]
	ld [wcce3],a
	ld a,[hl]
	ld [wcce4],a
	ld a,1
	ld [wCurrentMenuItem],a
	ld a,[wd11d]
	dec a
	jr z,.next4
	ld a,[wPartyCount]
	dec a
	jr z,.next4
	ld a,[W_ISLINKBATTLE]
	cp 4
	jr z,.next4
	ld a,[W_OPTIONS]
	bit 6,a
	jr nz,.next4
	ld hl, TrainerAboutToUseText
	call PrintText
	hlCoord 0, 7
	ld bc,$0801
	ld a,$14
	ld [wd125],a
	call DisplayTextBoxID
	ld a,[wCurrentMenuItem]
	and a
	jr nz,.next4
	ld a,2
	ld [wd07d],a
	call DisplayPartyMenu
.next9
	ld a,1
	ld [wCurrentMenuItem],a
	jr c,.next7
	ld hl,wPlayerMonNumber
	ld a,[wWhichPokemon]
	cp [hl]
	jr nz,.next6
	ld hl,AlreadyOutText
	call PrintText
.next8
	call GoBackToPartyMenu
	jr .next9
.next6
	call HasMonFainted
	jr z,.next8
	xor a
	ld [wCurrentMenuItem],a
.next7
	call GBPalWhiteOut
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer1
.next4
	call ClearSprites
	ld hl,wTileMap
	ld bc,$040B
	call ClearScreenArea
	ld b,1
	call GoPAL_SET
	call GBPalNormal
	ld hl,TrainerSentOutText
	call PrintText
	ld a,[wEnemyMonSpecies2]
	ld [wcf91],a
	ld [wd0b5],a
	call GetMonHeader
	ld de,vFrontPic
	call LoadMonFrontSprite
	ld a,$CF
	ld [$FFE1],a
	hlCoord 15, 6
	predef Func_3f073
	ld a,[wEnemyMonSpecies2]
	call PlayCry
	call DrawEnemyHUDAndHPBar
	ld a,[wCurrentMenuItem]
	and a
	ret nz
	xor a
	ld [wPartyGainExpFlags],a
	ld [wPartyFoughtCurrentEnemyFlags],a
	call SaveScreenTilesToBuffer1
	jp SwitchPlayerMon

TrainerAboutToUseText: ; 3ca79 (f:4a79)
	TX_FAR _TrainerAboutToUseText
	db "@"

TrainerSentOutText: ; 3ca7e (f:4a7e)
	TX_FAR _TrainerSentOutText
	db "@"

; tests if the player has any pokemon that are not fainted
; sets d = 0 if all fainted, d != 0 if some mons are still alive
AnyPartyAlive: ; 3ca83 (f:4a83)
	ld a, [wPartyCount]
	ld e, a
	xor a
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1 - 1
.partyMonsLoop
	or [hl]
	inc hl
	or [hl]
	add hl, bc
	dec e
	jr nz, .partyMonsLoop
	ld d, a
	ret

; tests if player mon has fainted
; stores whether mon has fainted in Z flag
HasMonFainted: ; 3ca97 (f:4a97)
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	or [hl]
	ret nz
	ld a, [wd11d]
	and a
	jr nz, .done
	ld hl, NoWillText
	call PrintText
.done
	xor a
	ret

NoWillText: ; 3cab4 (f:4ab4)
	TX_FAR _NoWillText
	db "@"

; try to run from battle (hl = player speed, de = enemy speed)
; stores whether the attempt was successful in carry flag
TryRunningFromBattle: ; 3cab9 (f:4ab9)
	call IsGhostBattle
	jp z, .canEscape ; jump if it's a ghost battle
	ld a, [W_BATTLETYPE]
	cp $2
	jp z, .canEscape ; jump if it's a safari battle
	ld a, [W_ISLINKBATTLE]
	cp $4
	jp z, .canEscape
	ld a, [W_ISINBATTLE]
	dec a
	jr nz, .trainerBattle ; jump if it's a trainer battle
	ld a, [wNumRunAttempts]
	inc a
	ld [wNumRunAttempts], a
	ld a, [hli]
	ld [H_MULTIPLICAND + 1], a
	ld a, [hl]
	ld [H_MULTIPLICAND + 2], a
	ld a, [de]
	ld [$ff8d], a
	inc de
	ld a, [de]
	ld [$ff8e], a
	call LoadScreenTilesFromBuffer1
	ld de, H_MULTIPLICAND + 1
	ld hl, $ff8d
	ld c, $2
	call StringCmp
	jr nc, .canEscape ; jump if player speed greater than enemy speed
	xor a
	ld [H_MULTIPLICAND], a 
	ld a, 32
	ld [H_MULTIPLIER], a
	call Multiply ; multiply player speed by 32
	ld a, [H_PRODUCT + 2]
	ld [H_DIVIDEND], a
	ld a, [H_PRODUCT + 3]
	ld [H_DIVIDEND + 1], a
	ld a, [$ff8d]
	ld b, a
	ld a, [$ff8e]
; divide enemy speed by 4
	srl b
	rr a
	srl b
	rr a
	and a
	jr z, .canEscape ; jump if enemy speed divided by 4, mod 256 is 0
	ld [H_DIVISOR], a ; ((enemy speed / 4) % 256)
	ld b, $2
	call Divide ; divide (player speed * 32) by ((enemy speed / 4) % 256)
	ld a, [H_QUOTIENT + 2]
	and a ; is the quotient greater than 256?
	jr nz, .canEscape ; if so, the player can escape
	ld a, [wNumRunAttempts]
	ld c, a
; add 30 to the quotient for each run attempt
.loop
	dec c
	jr z, .compareWithRandomValue
	ld b, 30
	ld a, [H_QUOTIENT + 3]
	add b
	ld [H_QUOTIENT + 3], a
	jr c, .canEscape
	jr .loop
.compareWithRandomValue
	call BattleRandom
	ld b, a
	ld a, [H_QUOTIENT + 3]
	cp b
	jr nc, .canEscape ; if the random value was less than or equal to the quotient plus 30 times the number of attempts, the player can escape
; can't escape
	ld a, $1
	ld [wcd6a], a
	ld hl, CantEscapeText
	jr .printCantEscapeOrNoRunningText
.trainerBattle
	ld hl, NoRunningText
.printCantEscapeOrNoRunningText
	call PrintText
	ld a, $1
	ld [wd11f], a
	call SaveScreenTilesToBuffer1
	and a ; reset carry
	ret
.canEscape
	ld a, [W_ISLINKBATTLE]
	cp $4
	ld a, $2
	jr nz, .playSound
; link battle
	call SaveScreenTilesToBuffer1
	xor a
	ld [wcd6a], a
	ld a, $f
	ld [wPlayerMoveListIndex], a
	call LinkBattleExchangeData
	call LoadScreenTilesFromBuffer1
	ld a, [wcc3e]
	cp $f
	ld a, $2
	jr z, .playSound
	dec a
.playSound
	ld [wBattleResult], a
	ld a, (SFX_08_44 - SFX_Headers_08) / 3
	call PlaySoundWaitForCurrent
	ld hl, GotAwayText
	call PrintText
	call WaitForSoundToFinish
	call SaveScreenTilesToBuffer1
	scf ; set carry
	ret

CantEscapeText: ; 3cb97 (f:4b97)
	TX_FAR _CantEscapeText
	db "@"

NoRunningText: ; 3cb9c (f:4b9c)
	TX_FAR _NoRunningText
	db "@"

GotAwayText: ; 3cba1 (f:4ba1)
	TX_FAR _GotAwayText
	db "@"

; copies from party data to battle mon data when sending out a new player mon
LoadBattleMonFromParty: ; 3cba6 (f:4ba6)
	ld a, [wWhichPokemon]
	ld bc, $2c
	ld hl, wPartyMon1Species
	call AddNTimes
	ld de, wBattleMonSpecies
	ld bc, $c
	call CopyData
	ld bc, $f
	add hl, bc
	ld de, wBattleMonDVs
	ld bc, $2
	call CopyData
	ld de, wBattleMonPP
	ld bc, $4
	call CopyData
	ld de, wBattleMonLevel
	ld bc, $b
	call CopyData
	ld a, [wBattleMonSpecies2]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, wPartyMonNicks
	ld a, [wPlayerMonNumber]
	call SkipFixedLengthTextEntries
	ld de, wBattleMonNick
	ld bc, $b
	call CopyData
	ld hl, wBattleMonLevel
	ld de, wPlayerMonUnmodifiedLevel ; block of memory used for unmodified stats
	ld bc, $b
	call CopyData
	call ApplyBurnAndParalysisPenaltiesToPlayer
	call ApplyBadgeStatBoosts
	ld a, $7 ; default stat modifier
	ld b, $8
	ld hl, wPlayerMonAttackMod
.statModLoop
	ld [hli], a
	dec b
	jr nz, .statModLoop
	ret

; copies from enemy party data to current enemy mon data when sending out a new enemy mon
LoadEnemyMonFromParty: ; 3cc13 (f:4c13)
	ld a, [wWhichPokemon]
	ld bc, $2c
	ld hl, wEnemyMons
	call AddNTimes
	ld de, wEnemyMonSpecies
	ld bc, $c
	call CopyData
	ld bc, $f
	add hl, bc
	ld de, wEnemyMonDVs
	ld bc, $2
	call CopyData
	ld de, wEnemyMonPP
	ld bc, $4
	call CopyData
	ld de, wEnemyMonLevel
	ld bc, $b
	call CopyData
	ld a, [wEnemyMonSpecies]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, wEnemyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld de, wEnemyMonNick
	ld bc, $b
	call CopyData
	ld hl, wEnemyMonLevel
	ld de, wEnemyMonUnmodifiedLevel ; block of memory used for unmodified stats
	ld bc, $b
	call CopyData
	call ApplyBurnAndParalysisPenaltiesToEnemy
	ld hl, W_MONHBASESTATS
	ld de, wEnemyMonBaseStats
	ld b, $5
.copyBaseStatsLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyBaseStatsLoop
	ld a, $7 ; default stat modifier
	ld b, $8
	ld hl, wEnemyMonStatMods
.statModLoop
	ld [hli], a
	dec b
	jr nz, .statModLoop
	ld a, [wWhichPokemon]
	ld [wEnemyMonPartyPos], a
	ret

SendOutMon: ; 3cc91 (f:4c91)
	callab PrintSendOutMonMessage
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl] ; is enemy mon HP zero?
	jp z, .skipDrawingEnemyHUDAndHPBar; if HP is zero, skip drawing the HUD and HP bar
	call DrawEnemyHUDAndHPBar
.skipDrawingEnemyHUDAndHPBar
	call DrawPlayerHUDAndHPBar
	predef LoadMonBackPic
	xor a
	ld [$ffe1], a
	ld hl, wcc2d
	ld [hli], a
	ld [hl], a
	ld [wcc5b], a
	ld [wd05b], a
	ld [W_PLAYERMOVENUM], a
	ld hl, wccf1
	ld [hli], a
	ld [hl], a
	ld hl, wd060
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [W_PLAYERDISABLEDMOVE], a
	ld [wccee], a
	ld [wccf7], a
	ld b, $1
	call GoPAL_SET
	ld hl, W_ENEMYBATTSTATUS1
	res 5, [hl]
	ld a, $1
	ld [H_WHOSETURN], a
	ld a, POOF_ANIM
	call PlayMoveAnimation
	hlCoord 4, 11
	predef Func_3f073
	ld a, [wcf91]
	call PlayCry
	call PrintEmptyString
	jp SaveScreenTilesToBuffer1

; show 2 stages of the player getting smaller before disappearing
AnimateRetreatingPlayerMon: ; 3ccfa (f:4cfa)
	hlCoord 1, 5
	ld bc, $707
	call ClearScreenArea
	hlCoord 3, 7
	ld bc, $505
	xor a
	ld [wcd6c], a
	ld [H_DOWNARROWBLINKCNT1], a
	predef Func_79aba
	ld c, $4
	call DelayFrames
	call .clearScreenArea
	hlCoord 4, 9
	ld bc, $303
	ld a, $1
	ld [wcd6c], a
	xor a
	ld [H_DOWNARROWBLINKCNT1], a
	predef Func_79aba
	call Delay3
	call .clearScreenArea
	ld a, $4c
	Coorda 5, 11
.clearScreenArea
	hlCoord 1, 5
	ld bc, $707
	jp ClearScreenArea

; reads player's current mon's HP into wBattleMonHP
ReadPlayerMonCurHPAndStatus: ; 3cd43 (f:4d43)
	ld a, [wPlayerMonNumber]
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wBattleMonHP
	ld bc, $4               ; 2 bytes HP, 1 byte unknown (unused?), 1 byte status
	jp CopyData

DrawHUDsAndHPBars: ; 3cd5a (f:4d5a)
	call DrawPlayerHUDAndHPBar
	jp DrawEnemyHUDAndHPBar

DrawPlayerHUDAndHPBar: ; 3cd60 (f:4d60)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	hlCoord 9, 7
	ld bc, $50b
	call ClearScreenArea
	callab PlacePlayerHUDTiles
	hlCoord 18, 9
	ld [hl], $73
	ld de, wBattleMonNick
	hlCoord 10, 7
	call CenterMonName
	call PlaceString
	ld hl, wBattleMonSpecies
	ld de, wcf98
	ld bc, $c
	call CopyData
	ld hl, wBattleMonLevel
	ld de, wcfb9
	ld bc, $b
	call CopyData
	hlCoord 14, 8
	push hl
	inc hl
	ld de, wcf9c
	call PrintStatusConditionNotFainted
	pop hl
	jr nz, .asm_3cdae
	call PrintLevel
.asm_3cdae
	ld a, [wcf98]
	ld [wcf91], a
	hlCoord 10, 9
	predef DrawHP 
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld hl, wcf1d
	call GetBattleHealthBarColor
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl]
	jr z, .asm_3cdd9
	ld a, [wccf6]
	and a
	ret nz
	ld a, [wcf1d]
	cp $2
	jr z, .asm_3cde6
.asm_3cdd9
	ld hl, wd083
	bit 7, [hl]
	ld [hl], $0
	ret z
	xor a
	ld [wc02a], a
	ret
.asm_3cde6
	ld hl, wd083
	set 7, [hl]
	ret

DrawEnemyHUDAndHPBar: ; 3cdec (f:4dec)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld hl, wTileMap
	ld bc, $40c
	call ClearScreenArea
	callab PlaceEnemyHUDTiles
	ld de, wEnemyMonNick
	hlCoord 1, 0
	call CenterMonName
	call PlaceString
	hlCoord 4, 1
	push hl
	inc hl
	ld de, wEnemyMonStatus
	call PrintStatusConditionNotFainted
	pop hl
	jr nz, .skipPrintLevel ; if the mon has a status condition, skip printing the level
	ld a, [wEnemyMonLevel]
	ld [wcfb9], a
	call PrintLevel
.skipPrintLevel
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [H_MULTIPLICAND + 1], a
	ld a, [hld]
	ld [H_MULTIPLICAND + 2], a
	or [hl] ; is current HP zero?
	jr nz, .hpNonzero
; current HP is 0
; set variables for DrawHPBar
	ld c, a
	ld e, a
	ld d, $6
	jp .drawHPBar
.hpNonzero
	xor a
	ld [H_MULTIPLICAND], a
	ld a, 48
	ld [H_MULTIPLIER], a
	call Multiply ; multiply current HP by 48
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [H_DIVISOR], a
	ld a, b
	and a ; is max HP > 255?
	jr z, .doDivide
; if max HP > 255, scale both (current HP * 48) and max HP by dividing by 4 so that max HP fits in one byte
; (it needs to be one byte so it can be used as the divisor for the Divide function)
	ld a, [H_DIVISOR]
	srl b
	rr a
	srl b
	rr a
	ld [H_DIVISOR], a
	ld a, [H_PRODUCT + 2]
	ld b, a
	srl b
	ld a, [H_PRODUCT + 3]
	rr a
	srl b
	rr a
	ld [H_PRODUCT + 3], a
	ld a, b
	ld [H_PRODUCT + 2], a
.doDivide
	ld a, [H_PRODUCT + 2]
	ld [H_DIVIDEND], a
	ld a, [H_PRODUCT + 3]
	ld [H_DIVIDEND + 1], a
	ld a, $2
	ld b, a
	call Divide ; divide (current HP * 48) by max HP
	ld a, [H_QUOTIENT + 3]
; set variables for DrawHPBar
	ld e, a
	ld a, $6
	ld d, a
	ld c, a
.drawHPBar
	xor a
	ld [wListMenuID], a
	hlCoord 2, 2
	call DrawHPBar
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld hl, wcf1e

GetBattleHealthBarColor: ; 3ce90 (f:4e90)
	ld b, [hl]
	call GetHealthBarColor
	ld a, [hl]
	cp b
	ret z
	ld b, $1
	jp GoPAL_SET

; center's mon's name on the battle screen
; if the name is 1 or 2 letters long, it is printed 2 spaces more to the right than usual (i.e. for names longer than 4 letters)
; if the name is 3 or 4 letters long, it is printed 1 space more to the right than usual (i.e. for names longer than 4 letters)
CenterMonName: ; 3ce9c (f:4e9c)
	push de
	inc hl
	inc hl
	ld b, $2
.loop
	inc de
	ld a, [de]
	cp $50
	jr z, .done
	inc de
	ld a, [de]
	cp $50
	jr z, .done
	dec hl
	dec b
	jr nz, .loop
.done
	pop de
	ret

DisplayBattleMenu: ; 3ceb3 (f:4eb3)
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	ld a, [W_BATTLETYPE]
	and a
	jr nz, .nonstandardbattle
	call DrawHUDsAndHPBars
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
.nonstandardbattle
	ld a, [W_BATTLETYPE]
	cp $2 ; safari
	ld a, $b ; safari menu id
	jr nz, .menuselected
	ld a, $1b ; regular menu id
.menuselected
	ld [wd125], a
	call DisplayTextBoxID
	ld a, [W_BATTLETYPE]
	dec a
	jp nz, .handleBattleMenuInput ; handle menu input if it's not the old man tutorial
; the following happens for the old man tutorial
	ld hl, wPlayerName
	ld de, W_GRASSRATE
	ld bc, $b
	call CopyData  ; temporarily save the player name in unused space,
	               ; which is supposed to get overwritten when entering a
	               ; map with wild pokémon. due to an oversight, the data
	               ; may not get overwritten (cinnabar) and the infamous
	               ; missingno. glitch can show up.
	ld hl, .oldManName
	ld de, wPlayerName
	ld bc, $b
	call CopyData
	; the following simulates the keystrokes by drawing menus on screen
	hlCoord 9, 14
	ld [hl], "▶"
	ld c, $50
	call DelayFrames
	ld [hl], $7f
	hlCoord 9, 16
	ld [hl], "▶"
	ld c, $32
	call DelayFrames
	ld [hl], $ec
	ld a, $2 ; select the "ITEM" menu
	jp .upperLeftMenuItemWasNotSelected
.oldManName
	db "OLD MAN@"
.handleBattleMenuInput
	ld a, [wcc2d]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	sub 2 ; check if the cursor is in the left column
	jr c, .leftColumn
; cursor is in the right column
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	jr .rightColumn
.leftColumn ; put cursor in left column of menu
	ld a, [W_BATTLETYPE]
	cp $2
	ld a, " "
	jr z, .safariLeftColumn
; put cursor in left column for normal battle menu (i.e. when it's not a Safari battle)
	Coorda 15, 14 ; clear upper cursor position in right column
	Coorda 15, 16 ; clear lower cursor position in right column
	ld b, $9 ; top menu item X
	jr .leftColumn_WaitForInput
.safariLeftColumn
	Coorda 13, 14
	Coorda 13, 16
	hlCoord 7, 14
	ld de, W_NUMSAFARIBALLS
	ld bc, $102
	call PrintNumber
	ld b, $1 ; top menu item X
.leftColumn_WaitForInput
	ld hl, wTopMenuItemY
	ld a, $e
	ld [hli], a ; wTopMenuItemY
	ld a, b
	ld [hli], a ; wTopMenuItemX
	inc hl
	inc hl
	ld a, $1
	ld [hli], a ; wMaxMenuItem
	ld [hl], D_RIGHT | A_BUTTON ; wMenuWatchedKeys
	call HandleMenuInput
	bit 4, a ; check if right was pressed
	jr nz, .rightColumn
	jr .AButtonPressed ; the A button was pressed
.rightColumn ; put cursor in right column of menu
	ld a, [W_BATTLETYPE]
	cp $2
	ld a, " "
	jr z, .safariRightColumn
; put cursor in right column for normal battle menu (i.e. when it's not a Safari battle)
	Coorda 9, 14 ; clear upper cursor position in left column
	Coorda 9, 16 ; clear lower cursor position in left column
	ld b, $f ; top menu item X
	jr .rightColumn_WaitForInput
.safariRightColumn
	Coorda 1, 14 ; clear upper cursor position in left column
	Coorda 1, 16 ; clear lower cursor position in left column
	hlCoord 7, 14
	ld de, W_NUMSAFARIBALLS
	ld bc, $102
	call PrintNumber
	ld b, $d ; top menu item X
.rightColumn_WaitForInput
	ld hl, wTopMenuItemY
	ld a, $e
	ld [hli], a ; wTopMenuItemY
	ld a, b
	ld [hli], a ; wTopMenuItemX
	inc hl
	inc hl
	ld a, $1
	ld [hli], a ; wMaxMenuItem
	ld a, D_LEFT | A_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	call HandleMenuInput
	bit 5, a ; check if left was pressed
	jr nz, .leftColumn ; if left was pressed, jump
	ld a, [wCurrentMenuItem]
	add $2 ; if we're in the right column, the actual id is +2
	ld [wCurrentMenuItem], a
.AButtonPressed
	call PlaceUnfilledArrowMenuCursor
	ld a, [W_BATTLETYPE]
	cp $2 ; is it a Safari battle?
	ld a, [wCurrentMenuItem]
	ld [wcc2d], a
	jr z, .handleMenuSelection
; not Safari battle
; swap the IDs of the item menu and party menu (this is probably because they swapped the positions of these menu items in first generation English versions)
	cp $1 ; was the item menu selected?
	jr nz, .notItemMenu
; item menu was selected
	inc a ; increment a to 2
	jr .handleMenuSelection
.notItemMenu
	cp $2 ; was the party menu selected?
	jr nz, .handleMenuSelection
; party menu selected
	dec a ; decrement a to 1
.handleMenuSelection
	and a
	jr nz, .upperLeftMenuItemWasNotSelected
; the upper left menu item was selected
	ld a, [W_BATTLETYPE]
	cp $2
	jr z, .throwSafariBallWasSelected
; the "FIGHT" menu was selected
	xor a
	ld [wNumRunAttempts], a
	jp LoadScreenTilesFromBuffer1 ; restore saved screen and return
.throwSafariBallWasSelected
	ld a, SAFARI_BALL
	ld [wcf91], a
	jr UseBagItem

.upperLeftMenuItemWasNotSelected ; a menu item other than the upper left item was selected
	cp $2
	jp nz, PartyMenuOrRockOrRun

; either the bag (normal battle) or bait (safari battle) was selected
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .notLinkBattle

; can't use items in link battles
	ld hl, ItemsCantBeUsedHereText
	call PrintText
	jp DisplayBattleMenu

.notLinkBattle
	call SaveScreenTilesToBuffer2
	ld a, [W_BATTLETYPE]
	cp $2 ; is it a safari battle?
	jr nz, BagWasSelected

; bait was selected
	ld a, SAFARI_BAIT
	ld [wcf91], a
	jr UseBagItem

BagWasSelected:
	call LoadScreenTilesFromBuffer1
	ld a, [W_BATTLETYPE]
	and a ; is it a normal battle?
	jr nz, .next

; normal battle
	call DrawHUDsAndHPBars
.next
	ld a, [W_BATTLETYPE]
	dec a ; is it the old man tutorial?
	jr nz, DisplayPlayerBag ; no, it is a normal battle
	ld hl, OldManItemList
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a
	jr DisplayBagMenu

OldManItemList:
	db 1 ; # items
	db POKE_BALL, 50
	db -1

DisplayPlayerBag:
	; get the pointer to player's bag when in a normal battle
	ld hl, wNumBagItems
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a

DisplayBagMenu:
	xor a
	ld [wcf93], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld a, [wcc2c]
	ld [wCurrentMenuItem], a
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wcc2c], a
	ld a, $0
	ld [wcc37], a
	ld [wMenuItemToSwap], a
	jp c, DisplayBattleMenu ; go back to battle menu if an item was not selected

UseBagItem:
	; either use an item from the bag or use a safari zone item
	ld a, [wcf91]
	ld [wd11e], a
	call GetItemName
	call CopyStringToCF4B ; copy name
	xor a
	ld [wd152], a
	call UseItem
	call LoadHudTilePatterns
	call ClearSprites
	xor a
	ld [wCurrentMenuItem], a
	ld a, [W_BATTLETYPE]
	cp $2 ; is it a safari battle?
	jr z, .checkIfMonCaptured

	ld a, [wcd6a]
	and a ; was the item used successfully?
	jp z, BagWasSelected ; if not, go back to the bag menu

	ld a, [W_PLAYERBATTSTATUS1]
	bit 5, a ; is the player using a multi-turn move like wrap?
	jr z, .checkIfMonCaptured
	ld hl, wPlayerNumAttacksLeft
	dec [hl]
	jr nz, .checkIfMonCaptured
	ld hl, W_PLAYERBATTSTATUS1
	res 5, [hl] ; not using multi-turn move any more

.checkIfMonCaptured
	ld a, [wd11c]
	and a ; was the enemy mon captured with a ball?
	jr nz, .returnAfterCapturingMon

	ld a, [W_BATTLETYPE]
	cp $2 ; is it a safari battle?
	jr z, .returnAfterUsingItem_NoCapture
; not a safari battle
	call LoadScreenTilesFromBuffer1
	call DrawHUDsAndHPBars
	call Delay3
.returnAfterUsingItem_NoCapture

	call GBPalNormal
	and a ; reset carry
	ret

.returnAfterCapturingMon
	call GBPalNormal
	xor a
	ld [wd11c], a
	ld a, $2
	ld [wBattleResult], a
	scf ; set carry
	ret

ItemsCantBeUsedHereText:
	TX_FAR _ItemsCantBeUsedHereText
	db "@"

PartyMenuOrRockOrRun:
	dec a ; was Run selected?
	jp nz, BattleMenu_RunWasSelected
; party menu or rock was selected
	call SaveScreenTilesToBuffer2
	ld a, [W_BATTLETYPE]
	cp $2 ; is it a safari battle?
	jr nz, .partyMenuWasSelected
; safari battle
	ld a, SAFARI_ROCK
	ld [wcf91], a
	jp UseBagItem
.partyMenuWasSelected
	call LoadScreenTilesFromBuffer1
	xor a
	ld [wd07d], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
.checkIfPartyMonWasSelected
	jp nc, .partyMonWasSelected ; if a party mon was selected, jump, else we quit the party menu
.quitPartyMenu
	call ClearSprites
	call GBPalWhiteOut
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer2
	call GoPAL_SET_CF1C
	call GBPalNormal
	jp DisplayBattleMenu
.partyMonDeselected
	hlCoord 11, 11
	ld bc, $81
	ld a, $7f
	call FillMemory
	xor a
	ld [wd07d], a
	call GoBackToPartyMenu
	jr .checkIfPartyMonWasSelected
.partyMonWasSelected
	ld a, $c ; switch/stats/cancel menu
	ld [wd125], a
	call DisplayTextBoxID
	ld hl, wTopMenuItemY
	ld a, $c
	ld [hli], a ; wTopMenuItemY
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, $2
	ld [hli], a ; wMaxMenuItem
	ld a, B_BUTTON | A_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	call HandleMenuInput
	bit 1, a ; was A pressed?
	jr nz, .partyMonDeselected ; if B was pressed, jump
; A was pressed
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	cp $2 ; was Cancel selected?
	jr z, .quitPartyMenu ; if so, quit the party menu entirely
	and a ; was Switch selected?
	jr z, .switchMon ; if so, jump
; Stats was selected
	xor a
	ld [wcc49], a
	ld hl, wPartyMon1
	call ClearSprites
; display the two status screens
	predef StatusScreen
	predef StatusScreen2
; now we need to reload the enemy mon pic
	ld a, [W_ENEMYBATTSTATUS2]
	bit 4, a ; does the enemy mon have a substitute?
	ld hl, AnimationSubstitute
	jr nz, .doEnemyMonAnimation
; enemy mon doesn't have substitute
	ld a, [wccf3]
	and a ; has the enemy mon used Minimise?
	ld hl, AnimationMinimizeMon
	jr nz, .doEnemyMonAnimation
; enemy mon is not minimised
	ld a, [wEnemyMonSpecies]
	ld [wcf91], a
	ld [wd0b5], a
	call GetMonHeader
	ld de, vFrontPic
	call LoadMonFrontSprite
	jr .enemyMonPicReloaded
.doEnemyMonAnimation
	ld b, BANK(AnimationSubstitute) ; BANK(AnimationMinimizeMon)
	call Bankswitch
.enemyMonPicReloaded ; enemy mon pic has been reloaded, so return to the party menu
	jp .partyMenuWasSelected
.switchMon
	ld a, [wPlayerMonNumber]
	ld d, a
	ld a, [wWhichPokemon]
	cp d ; check if the mon to switch to is already out
	jr nz, .notAlreadyOut
; mon is already out
	ld hl, AlreadyOutText
	call PrintText
	jp .partyMonDeselected
.notAlreadyOut
	call HasMonFainted
	jp z, .partyMonDeselected ; can't switch to fainted mon
	ld a, $1
	ld [wcd6a], a
	call GBPalWhiteOut
	call ClearSprites
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer1
	call GoPAL_SET_CF1C
	call GBPalNormal
; fall through to SwitchPlayerMon

SwitchPlayerMon: ; 3d1ba (f:51ba)
	callab RetreatMon
	ld c, $32
	call DelayFrames
	call AnimateRetreatingPlayerMon
	ld a, [wWhichPokemon]
	ld [wPlayerMonNumber], a
	ld c, a
	ld b, $1
	push bc
	ld hl, wPartyGainExpFlags
	predef FlagActionPredef
	pop bc
	ld hl, wPartyFoughtCurrentEnemyFlags
	predef FlagActionPredef
	call LoadBattleMonFromParty
	call SendOutMon
	call SaveScreenTilesToBuffer1
	ld a, $2
	ld [wCurrentMenuItem], a
	and a
	ret

AlreadyOutText: ; 3d1f5 (f:51f5)
	TX_FAR _AlreadyOutText
	db "@"

BattleMenu_RunWasSelected: ; 3d1fa (f:51fa)
	call LoadScreenTilesFromBuffer1
	ld a, $3
	ld [wCurrentMenuItem], a
	ld hl, wBattleMonSpeed
	ld de, wEnemyMonSpeed
	call TryRunningFromBattle
	ld a, $0
	ld [wd11f], a
	ret c
	ld a, [wcd6a]
	and a
	ret nz
	jp DisplayBattleMenu

MoveSelectionMenu: ; 3d219 (f:5219)
	ld a, [wMoveMenuType]
	dec a
	jr z, .mimicmenu
	dec a
	jr z, .relearnmenu
	jr .regularmenu

.loadmoves
	ld de, wd0dc
	ld bc, $4
	call CopyData
	callab Func_39b87
	ret

.writemoves
	ld de, wd0e1
	ld a, [$fff6]
	set 2, a
	ld [$fff6], a
	call PlaceString
	ld a, [$fff6]
	res 2, a
	ld [$fff6], a
	ret

.regularmenu
	call Func_3d3f5
	ret z
	ld hl, wBattleMonMoves
	call .loadmoves
	hlCoord 4, 12
	ld b, $4
	ld c, $e
	di
	call TextBoxBorder
	hlCoord 4, 12
	ld [hl], $7a
	hlCoord 10, 12
	ld [hl], $7e
	ei
	hlCoord 6, 13
	call .writemoves
	ld b, $5
	ld a, $c
	jr .menuset
.mimicmenu
	ld hl, wEnemyMonMoves
	call .loadmoves
	hlCoord 0, 7
	ld b, $4
	ld c, $e
	call TextBoxBorder
	hlCoord 2, 8
	call .writemoves
	ld b, $1
	ld a, $7
	jr .menuset
.relearnmenu
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, $2c
	call AddNTimes
	call .loadmoves
	hlCoord 4, 7
	ld b, $4
	ld c, $e
	call TextBoxBorder
	hlCoord 6, 8
	call .writemoves
	ld b, $5
	ld a, $7
.menuset
	ld hl, wTopMenuItemY
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, [wMoveMenuType]
	cp $1
	jr z, .selectedmoveknown
	ld a, $1
	jr nc, .selectedmoveknown
	ld a, [wPlayerMoveListIndex]
	inc a
.selectedmoveknown
	ld [hli], a
	inc hl ; wTileBehindCursor untouched
	ld a, [wcd6c]
	inc a
	inc a
	ld [hli], a
	ld a, [wMoveMenuType]
	dec a
	ld b, $c1 ; can't use B
	jr z, .matchedkeyspicked
	dec a
	ld b, $c3
	jr z, .matchedkeyspicked
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr z, .matchedkeyspicked
	ld a, [W_FLAGS_D733]
	bit 0, a
	ld b, $c7
	jr z, .matchedkeyspicked
	ld b, $ff
.matchedkeyspicked
	ld a, b
	ld [hli], a
	ld a, [wMoveMenuType]
	cp $1
	jr z, .movelistindex1
	ld a, [wPlayerMoveListIndex]
	inc a
.movelistindex1
	ld [hl], a

Func_3d2fe: ; 3d2fe (f:52fe)
	ld a, [wMoveMenuType]
	and a
	jr z, .battleselect
	dec a
	jr nz, .select
	hlCoord 1, 14
	ld de, WhichTechniqueString
	call PlaceString
	jr .select
.battleselect
	ld a, [W_FLAGS_D733]
	bit 0, a
	jr nz, .select
	call Func_3d4b6
	ld a, [wMenuItemToSwap]
	and a
	jr z, .select
	hlCoord 5, 13
	dec a
	ld bc, $14
	call AddNTimes
	ld [hl], $ec
.select
	ld hl, $fff6
	set 1, [hl]
	call HandleMenuInput
	ld hl, $fff6
	res 1, [hl]
	bit 6, a
	jp nz, Func_3d3c9 ; up
	bit 7, a
	jp nz, Func_3d3dd ; down
	bit 2, a
	jp nz, SwapMovesInMenu ; select
	bit 1, a ; B, but was it reset above?
	push af
	xor a
	ld [wMenuItemToSwap], a
	ld a, [wCurrentMenuItem]
	dec a
	ld [wCurrentMenuItem], a
	ld b, a
	ld a, [wMoveMenuType]
	dec a ; if not mimic
	jr nz, .nob
	pop af
	ret
.nob
	dec a
	ld a, b
	ld [wPlayerMoveListIndex], a
	jr nz, .moveselected
	pop af
	ret
.moveselected
	pop af
	ret nz
	ld hl, wBattleMonPP
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .nopp
	ld a, [W_PLAYERDISABLEDMOVE]
	swap a
	and $f
	dec a
	cp c
	jr z, .disabled
	ld a, [W_PLAYERBATTSTATUS3]
	bit 3, a ; transformed
	jr nz, .dummy ; game freak derp
.dummy
	ld a, [wCurrentMenuItem]
	ld hl, wBattleMonMoves
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wPlayerSelectedMove], a
	xor a
	ret
.disabled
	ld hl, MoveDisabledText
	jr .print
.nopp
	ld hl, MoveNoPPText
.print
	call PrintText
	call LoadScreenTilesFromBuffer1
	jp MoveSelectionMenu

MoveNoPPText: ; 3d3ae (f:53ae)
	TX_FAR _MoveNoPPText
	db "@"

MoveDisabledText: ; 3d3b3 (f:53b3)
	TX_FAR _MoveDisabledText
	db "@"

WhichTechniqueString: ; 3d3b8 (f:53b8)
	db "WHICH TECHNIQUE?@"

Func_3d3c9: ; 3d3c9 (f:53c9)
	ld a, [wCurrentMenuItem]
	and a
	jp nz, Func_3d2fe
	call EraseMenuCursor
	ld a, [wcd6c]
	inc a
	ld [wCurrentMenuItem], a
	jp Func_3d2fe

Func_3d3dd: ; 3d3dd (f:53dd)
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wcd6c]
	inc a
	inc a
	cp b
	jp nz, Func_3d2fe
	call EraseMenuCursor
	ld a, $1
	ld [wCurrentMenuItem], a
	jp Func_3d2fe

Func_3d3f5: ; 3d3f5 (f:53f5)
	ld a, STRUGGLE
	ld [wPlayerSelectedMove], a
	ld a, [W_PLAYERDISABLEDMOVE]
	and a
	ld hl, wBattleMonPP
	jr nz, .asm_3d40e
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	ret nz
	jr .asm_3d423
.asm_3d40e
	swap a
	and $f
	ld b, a
	ld d, $5
	xor a
.asm_3d416
	dec d
	jr z, .asm_3d421
	ld c, [hl]
	inc hl
	dec b
	jr z, .asm_3d416
	or c
	jr .asm_3d416
.asm_3d421
	and a
	ret nz
.asm_3d423
	ld hl, NoMovesLeftText
	call PrintText
	ld c, $3c
	call DelayFrames
	xor a
	ret

NoMovesLeftText: ; 3d430 (f:5430)
	TX_FAR _NoMovesLeftText
	db "@"

SwapMovesInMenu: ; 3d435 (f:5435)
	ld a, [wMenuItemToSwap]
	and a
	jr z, .noMenuItemSelected
	ld hl, wBattleMonMoves
	call .swapBytes ; swap moves
	ld hl, wBattleMonPP
	call .swapBytes ; swap move PP
; update the index of the disabled move if necessary
	ld hl, W_PLAYERDISABLEDMOVE
	ld a, [hl]
	swap a
	and $f
	ld b, a
	ld a, [wCurrentMenuItem]
	cp b
	jr nz, .next
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wMenuItemToSwap]
	swap a
	add b
	ld [hl], a
	jr .swapMovesInPartyMon
.next
	ld a, [wMenuItemToSwap]
	cp b
	jr nz, .swapMovesInPartyMon
	ld a, [hl]
	and $f
	ld b, a
	ld a, [wCurrentMenuItem]
	swap a
	add b
	ld [hl], a
.swapMovesInPartyMon
	ld hl, wPartyMon1Moves
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	push hl
	call .swapBytes ; swap moves
	pop hl
	ld bc, $15
	add hl, bc
	call .swapBytes ; swap move PP
	xor a
	ld [wMenuItemToSwap], a ; deselect the item
	jp MoveSelectionMenu
.swapBytes
	push hl
	ld a, [wMenuItemToSwap]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wCurrentMenuItem]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret
.noMenuItemSelected
	ld a, [wCurrentMenuItem]
	ld [wMenuItemToSwap], a ; select the current menu item for swapping
	jp MoveSelectionMenu

Func_3d4b6: ; 3d4b6 (f:54b6)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	hlCoord 0, 8
	ld b, $3
	ld c, $9
	call TextBoxBorder
	ld a, [W_PLAYERDISABLEDMOVE]
	and a
	jr z, .asm_3d4df
	swap a
	and $f
	ld b, a
	ld a, [wCurrentMenuItem]
	cp b
	jr nz, .asm_3d4df
	hlCoord 1, 10
	ld de, DisabledText
	call PlaceString
	jr .asm_3d54e
.asm_3d4df
	ld hl, wCurrentMenuItem
	dec [hl]
	xor a
	ld [H_WHOSETURN], a
	ld hl, wBattleMonMoves
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wPlayerSelectedMove], a
	ld a, [wPlayerMonNumber]
	ld [wWhichPokemon], a
	ld a, $4
	ld [wcc49], a
	callab GetMaxPP
	ld hl, wCurrentMenuItem
	ld c, [hl]
	inc [hl]
	ld b, $0
	ld hl, wBattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wcd6d], a
	hlCoord 1, 9
	ld de, TypeText
	call PlaceString
	hlCoord 7, 11
	ld [hl], "/"
	hlCoord 5, 9
	ld [hl], "/"
	hlCoord 5, 11
	ld de, wcd6d
	ld bc, $102
	call PrintNumber
	hlCoord 8, 11
	ld de, wd11e
	ld bc, $102
	call PrintNumber
	call GetCurrentMove
	hlCoord 2, 10
	predef Func_27d98
.asm_3d54e
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	jp Delay3

DisabledText: ; 3d555 (f:5555)
IF DEF(_YELLOW)
	db "Disabled!@"
ELSE
	db "disabled!@"
ENDC

TypeText: ; 3d55f (f:555f)
	db "TYPE@"

SelectEnemyMove: ; 3d564 (f:5564)
	ld a, [W_ISLINKBATTLE]
	sub $4
	jr nz, .noLinkBattle
; link battle
	call SaveScreenTilesToBuffer1
	call LinkBattleExchangeData
	call LoadScreenTilesFromBuffer1
	ld a, [wcc3e]
	cp $e
	jp z, .asm_3d601
	cp $d
	jr z, .unableToMove
	cp $4
	ret nc
	ld [wEnemyMoveListIndex], a
	ld c, a
	ld hl, wEnemyMonMoves
	ld b, $0
	add hl, bc
	ld a, [hl]
	jr .done
.noLinkBattle
	ld a, [W_ENEMYBATTSTATUS2]
	and $60     ; need to recharge or using rage
	ret nz
	ld hl, W_ENEMYBATTSTATUS1
	ld a, [hl]
	and $12     ; using multi-turn move or bide
	ret nz
	ld a, [wEnemyMonStatus]
	and SLP | 1 << FRZ ; sleeping or frozen
	ret nz
	ld a, [W_ENEMYBATTSTATUS1]
	and $21      ; using fly/dig or thrash/petal dance
	ret nz
	ld a, [W_PLAYERBATTSTATUS1]
	bit 5, a    ; caught in player's multi-turn move (e.g. wrap)
	jr z, .notCaughtInWrap
.unableToMove
	ld a, $ff
	jr .done
.notCaughtInWrap
	ld hl, wEnemyMonMoves+1 ; 2nd enemy move
	ld a, [hld]
	and a
	jr nz, .atLeastTwoMovesAvailable
	ld a, [W_ENEMYDISABLEDMOVE]
	and a
	ld a, STRUGGLE ; struggle if the only move is disabled
	jr nz, .done
.atLeastTwoMovesAvailable
	ld a, [W_ISINBATTLE]
	dec a
	jr z, .chooseRandomMove ; wild encounter
	callab AIEnemyTrainerChooseMoves
.chooseRandomMove
	push hl
	call BattleRandom
	ld b, $1
	cp $3f ; select move 1 in [0,3e] (63/256 chance)
	jr c, .moveChosen
	inc hl
	inc b
	cp $7f ; select move 1 in [3f,7e] (64/256 chance)
	jr c, .moveChosen
	inc hl
	inc b
	cp $be ; select move 1 in [7f,bd] (63/256 chance)
	jr c, .moveChosen
	inc hl
	inc b ; select move 4 in [be,ff] (66/256 chance)
.moveChosen
	ld a, b
	dec a
	ld [wEnemyMoveListIndex], a
	ld a, [W_ENEMYDISABLEDMOVE]
	swap a
	and $f
	cp b
	ld a, [hl]
	pop hl
	jr z, .chooseRandomMove ; move disabled, try again
	and a
	jr z, .chooseRandomMove ; move non-existant, try again
.done
	ld [wEnemySelectedMove], a
	ret
.asm_3d601
	ld a, STRUGGLE
	jr .done

; this appears to exchange data with the other gameboy during link battles
LinkBattleExchangeData: ; 3d605 (f:5605)
	ld a, $ff
	ld [wcc3e], a
	ld a, [wPlayerMoveListIndex]
	cp $f ; is the player running from battle?
	jr z, .asm_3d630
	ld a, [wcd6a]
	and a
	jr nz, .asm_3d629
	ld a, [wPlayerSelectedMove]
	cp STRUGGLE
	ld b, $e
	jr z, .asm_3d62f
	dec b
	inc a
	jr z, .asm_3d62f
	ld a, [wPlayerMoveListIndex]
	jr .asm_3d630
.asm_3d629
	ld a, [wWhichPokemon]
	add $4
	ld b, a
.asm_3d62f
	ld a, b
.asm_3d630
	ld [wcc42], a
	callab PrintWaitingText
.asm_3d63b
	call Func_22c3
	call DelayFrame
	ld a, [wcc3e]
	inc a
	jr z, .asm_3d63b
	ld b, $a
.asm_3d649
	call DelayFrame
	call Func_22c3
	dec b
	jr nz, .asm_3d649
	ld b, $a
.asm_3d654
	call DelayFrame
	call Func_22ed
	dec b
	jr nz, .asm_3d654
	ret

ExecutePlayerMove: ; 3d65e (f:565e)
	xor a
	ld [H_WHOSETURN], a ; set player's turn
	ld a, [wPlayerSelectedMove]
	inc a
	jp z, Func_3d80a ; for selected move = FF, skip most of player's turn
	xor a
	ld [W_MOVEMISSED], a
	ld [wcced], a
	ld [wccf4], a
	ld a, $a
	ld [wd05b], a
	ld a, [wcd6a]
	and a
	jp nz, Func_3d80a
	call PrintGhostText
	jp z, Func_3d80a
	call CheckPlayerStatusConditions
	jr nz, .asm_3d68a
	jp [hl]
.asm_3d68a
	call GetCurrentMove
	ld hl, W_PLAYERBATTSTATUS1
	bit 4, [hl] ; charging up for attack
	jr nz, asm_3d6a9
	call CheckForDisobedience
	jp z, Func_3d80a

Func_3d69a: ; 3d69a (f:569a)
	ld a, [W_PLAYERMOVEEFFECT]
	cp CHARGE_EFFECT
	jp z, JumpMoveEffect
	cp FLY_EFFECT
	jp z, JumpMoveEffect
	jr asm_3d6b0

; in-battle stuff
asm_3d6a9: ; 3d6a9 (f:56a9)
	ld hl,W_PLAYERBATTSTATUS1
	res 4,[hl] ; reset charging up and invulnerability statuses if mon was charging up for an attack
			   ; being fully paralyzed or hurting oneself in confusion removes charging up status
			   ; resulting in the Pokemon being invulnerable for the whole battle
	res 6,[hl]
asm_3d6b0: ; 3d6b0 (f:56b0)
	call PrintMonName1Text
	ld hl,DecrementPP
	ld de,wPlayerSelectedMove ; pointer to the move just used
	ld b,BANK(DecrementPP)
	call Bankswitch
	ld a,[W_PLAYERMOVEEFFECT] ; effect of the move just used
	ld hl,EffectsArray1
	ld de,1
	call IsInArray
	jp c,JumpMoveEffect ; EffectsArray1 moves skip damage calculation and accuracy tests 
						; unless executed as part of their exclusive effect functions 
	ld a,[W_PLAYERMOVEEFFECT]
	ld hl,EffectsArray5B
	ld de,1
	call IsInArray
	call c,JumpMoveEffect ; execute the effects of EffectsArray5B moves (e.g. Wrap, Thrash) but don't skip anything 
asm_3d6dc: ; 3d6dc (f:56dc)
	ld a,[W_PLAYERMOVEEFFECT]
	ld hl,EffectsArray2
	ld de,1
	call IsInArray 
	jp c,.asm_3d702 ; EffectsArray2 moves (e.g. Seismic Toss and Super Fang) skip damage calculation 
	call CriticalHitTest
	call HandleCounterMove
	jr z,asm_3d705
	call GetDamageVarsForPlayerAttack
	call CalculateDamage
	jp z,asm_3d74b ; for moves with 0 BP, skip any further damage calculation and, for now, skip MoveHitTest
				   ; for these moves, accuracy tests will only occur if they are called as part of the effect itself
	call AdjustDamageForMoveType
	call RandomizeDamage
.asm_3d702
	call MoveHitTest
asm_3d705
	ld a,[W_MOVEMISSED]
	and a
	jr z,asm_3d714
	ld a,[W_PLAYERMOVEEFFECT]
	sub a,7 ; Explosion effect
	jr z,asm_3d71e ; don't play any animation if the move missed, unless it was EXPLODE_EFFECT
	jr asm_3d74b 
asm_3d714
	ld a,[W_PLAYERMOVEEFFECT]
	and a
	ld a,4
	jr z,asm_3d71e
	ld a,5
asm_3d71e 
	push af
	ld a,[W_PLAYERBATTSTATUS2]
	bit 4,a
	ld hl,Func_79747
	ld b,BANK(Func_79747)
	call nz,Bankswitch
	pop af
	ld [wcc5b],a
	ld a,[W_PLAYERMOVENUM]
	call PlayMoveAnimation
	call Func_3eed3
	call DrawPlayerHUDAndHPBar
	ld a,[W_PLAYERBATTSTATUS2]
	bit 4,a
	ld hl,Func_79771
	ld b,BANK(Func_79771)
	call nz,Bankswitch
	jr asm_3d766
asm_3d74b
	ld c,$1E
	call DelayFrames
	ld a,[W_PLAYERMOVEEFFECT]
	cp a,FLY_EFFECT
	jr z,.next5
	cp a,CHARGE_EFFECT
	jr z,.next5
	jr asm_3d766
.next5
	xor a
	ld [wcc5b],a
	ld a,STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
asm_3d766
	ld a,[W_PLAYERMOVEEFFECT]
	cp a,MIRROR_MOVE_EFFECT
	jr nz,.next6
	call MirrorMoveCopyMove
	jp z,Func_3d80a
	xor a
	ld [wcced],a
	jp Func_3d69a ; if Mirror Move was successful go back to damage calculation for copied move
.next6
	cp a,METRONOME_EFFECT
	jr nz,.next7
	call MetronomePickMove
	jp Func_3d69a ; Go back to damage calculation for the move picked by Metronome
.next7
	ld a,[W_PLAYERMOVEEFFECT]
	ld hl,EffectsArray3
	ld de,1
	call IsInArray
	jp c,JumpMoveEffect ; done here after executing effects of EffectsArray3
	ld a,[W_MOVEMISSED]
	and a
	jr z,.next8
	call PrintMoveFailureText
	ld a,[W_PLAYERMOVEEFFECT]
	cp a,EXPLODE_EFFECT ; even if Explosion or Selfdestruct missed, its effect still needs to be activated
	jr z,.next9
	jp Func_3d80a ; otherwise, we're done if the move missed 
.next8
	call ApplyAttackToEnemyPokemon
	call PrintCriticalOHKOText
	callab DisplayEffectiveness
	ld a,1
	ld [wccf4],a
.next9
	ld a,[W_PLAYERMOVEEFFECT]
	ld hl,EffectsArray4
	ld de,1
	call IsInArray
	call c,JumpMoveEffect ; not done after executing effects of EffectsArray4
	ld hl,wEnemyMonHP
	ld a,[hli]
	ld b,[hl]
	or b
	ret z ; don't do anything else if the enemy fainted
	call HandleBuildingRage

	ld hl,W_PLAYERBATTSTATUS1
	bit 2,[hl]
	jr z,.next10
	ld a,[wPlayerNumAttacksLeft]
	dec a
	ld [wPlayerNumAttacksLeft],a
	jp nz,asm_3d714 ; for multi-hit moves, apply attack until PlayerNumAttacksLeft hits 0 or the enemy faints. 
					; damage calculation and accuracy tests only happen for the first hit
	res 2,[hl]
	ld hl,MultiHitText
	call PrintText
	xor a
	ld [W_NUMHITS],a 
.next10
	ld a,[W_PLAYERMOVEEFFECT]
	and a
	jp z,Func_3d80a
	ld hl,EffectsArray5
	ld de,1
	call IsInArray
	call nc,JumpMoveEffect ; move effects not included in EffectsArray5, which are the effects not covered yet.
						   ; the only exception is Rage, whose effect will be executed for a second time (although it's irrelevant)
						   ; includes some side effects and all non-volatile status effects but sleep.
						   ; responsible for executing Twineedle's second effect (poison)
	jp Func_3d80a

MultiHitText: ; 3d805 (f:5805)
	TX_FAR _MultiHitText
	db "@"

Func_3d80a: ; 3d80a (f:580a)
	xor a
	ld [wcd6a],a
	ld b,1
	ret

PrintGhostText: ; 3d811 (f:5811)
; print the ghost battle messages
	call IsGhostBattle
	ret nz
	ld a,[H_WHOSETURN]
	and a
	jr nz,.Ghost
	ld a,[wBattleMonStatus] ; player’s turn
	and a,SLP | (1 << FRZ)
	ret nz
	ld hl,ScaredText
	call PrintText
	xor a
	ret
.Ghost ; ghost’s turn
	ld hl,GetOutText
	call PrintText
	xor a
	ret

ScaredText: ; 3d830 (f:5830)
	TX_FAR _ScaredText
	db "@"

GetOutText: ; 3d835 (f:5835)
	TX_FAR _GetOutText
	db "@"

IsGhostBattle: ; 3d83a (f:583a)
	ld a,[W_ISINBATTLE]
	dec a
	ret nz
	ld a,[W_CURMAP]
	cp a,POKEMONTOWER_1
	jr c,.next
	cp a,LAVENDER_HOUSE_1
	jr nc,.next
	ld b,SILPH_SCOPE
	call IsItemInBag
	ret z
.next
	ld a,1
	and a
	ret

; checks for various status conditions affecting the player mon
; stores whether the mon cannot use a move this turn in Z flag
CheckPlayerStatusConditions: ; 3d854 (f:5854)
	ld hl,wBattleMonStatus
	ld a,[hl]
	and a,SLP ; sleep mask
	jr z,.FrozenCheck

; sleeping
	dec a
	ld [wBattleMonStatus],a ; decrement number of turns left
	and a
	jr z,.WakeUp ; if the number of turns hit 0, wake up
; fast asleep
	xor a
	ld [wcc5b],a
	ld a,SLP_ANIM - 1
	call PlayMoveAnimation
	ld hl,FastAsleepText
	call PrintText
	jr .sleepDone
.WakeUp
	ld hl,WokeUpText
	call PrintText
.sleepDone
	xor a
	ld [wccf1],a
	ld hl,Func_3d80a ; player can't move this turn
	jp .CannotUseMove

.FrozenCheck
	bit FRZ,[hl] ; frozen?
	jr z,.HeldInPlaceCheck
	ld hl,IsFrozenText
	call PrintText
	xor a
	ld [wccf1],a
	ld hl,Func_3d80a ; player can't move this turn
	jp .CannotUseMove

.HeldInPlaceCheck
	ld a,[W_ENEMYBATTSTATUS1]
	bit 5,a ; is enemy using a mult-turn move like wrap?
	jp z,.FlinchedCheck
	ld hl,CantMoveText
	call PrintText
	ld hl,Func_3d80a ; player can't move this turn
	jp .CannotUseMove

.FlinchedCheck
	ld hl,W_PLAYERBATTSTATUS1
	bit 3,[hl]
	jp z,.HyperBeamCheck
	res 3,[hl] ; reset player's flinch status
	ld hl,FlinchedText
	call PrintText
	ld hl,Func_3d80a ; player can't move this turn
	jp .CannotUseMove

.HyperBeamCheck
	ld hl,W_PLAYERBATTSTATUS2
	bit 5,[hl]
	jr z,.AnyMoveDisabledCheck
	res 5,[hl] ; reset player's recharge status
	ld hl,MustRechargeText
	call PrintText
	ld hl,Func_3d80a ; player can't move this turn
	jp .CannotUseMove

.AnyMoveDisabledCheck
	ld hl,W_PLAYERDISABLEDMOVE
	ld a,[hl]
	and a
	jr z,.ConfusedCheck
	dec a
	ld [hl],a
	and a,$F ; did Disable counter hit 0?
	jr nz,.ConfusedCheck
	ld [hl],a
	ld [wccee],a
	ld hl,DisabledNoMoreText
	call PrintText

.ConfusedCheck
	ld a,[W_PLAYERBATTSTATUS1]
	add a ; is player confused?
	jr nc,.TriedToUseDisabledMoveCheck
	ld hl,wd06b
	dec [hl]
	jr nz,.IsConfused
	ld hl,W_PLAYERBATTSTATUS1
	res 7,[hl] ; if confused counter hit 0, reset confusion status
	ld hl,ConfusedNoMoreText
	call PrintText
	jr .TriedToUseDisabledMoveCheck
.IsConfused
	ld hl,IsConfusedText
	call PrintText
	xor a
	ld [wcc5b],a
	ld a,CONF_ANIM - 1
	call PlayMoveAnimation
	call BattleRandom
	cp a,$80 ; 50% chance to hurt itself
	jr c,.TriedToUseDisabledMoveCheck
	ld hl,W_PLAYERBATTSTATUS1
	ld a,[hl]
	and a,$80 ; if mon hurts itself, clear every other status from W_PLAYERBATTSTATUS1
	ld [hl],a
	call HandleSelfConfusionDamage
	jr .MonHurtItselfOrFullyParalysed

.TriedToUseDisabledMoveCheck
	ld a,[wccee]
	and a
	jr z,.ParalysisCheck
	ld hl,wPlayerSelectedMove
	cp [hl]
	jr nz,.ParalysisCheck
	call PrintMoveIsDisabledText
	ld hl,Func_3d80a ; if a disabled move was somehow selected, player can't move this turn
	jp .CannotUseMove

.ParalysisCheck
	ld hl,wBattleMonStatus
	bit PAR,[hl]
	jr z,.BideCheck
	call BattleRandom
	cp a,$3F ; 25% to be fully paralyzed
	jr nc,.BideCheck
	ld hl,FullyParalyzedText
	call PrintText

.MonHurtItselfOrFullyParalysed
	ld hl,W_PLAYERBATTSTATUS1
	ld a,[hl]
	and a,$CC ; clear bide, thrashing, charging up, and multi-turn moves such as warp (redundant, already cleared)
	ld [hl],a
	ld a,[W_PLAYERMOVEEFFECT]
	cp a,FLY_EFFECT
	jr z,.FlyOrChargeEffect
	cp a,CHARGE_EFFECT
	jr z,.FlyOrChargeEffect
	jr .NotFlyOrChargeEffect

.FlyOrChargeEffect
	xor a
	ld [wcc5b],a
	ld a,STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
.NotFlyOrChargeEffect
	ld hl,Func_3d80a
	jp .CannotUseMove ; if using a two-turn move, we need to recharge the first turn

.BideCheck
	ld hl,W_PLAYERBATTSTATUS1
	bit 0,[hl] ; is mon using bide?
	jr z,.ThrashingAboutCheck
	xor a
	ld [W_PLAYERMOVENUM],a
	ld hl,W_DAMAGE
	ld a,[hli]
	ld b,a
	ld c,[hl]
	ld hl,wd075
	ld a,[hl]
	add c ; acumulate damage taken
	ld [hld],a
	ld a,[hl]
	adc b
	ld [hl],a
	ld hl,wPlayerNumAttacksLeft
	dec [hl] ; did Bide counter hit 0?
	jr z,.UnleashEnergy
	ld hl,Func_3d80a
	jp .CannotUseMove ; unless mon unleashes energy, can't move this turn
.UnleashEnergy
	ld hl,W_PLAYERBATTSTATUS1
	res 0,[hl] ; not using bide any more
	ld hl,UnleashedEnergyText
	call PrintText
	ld a,1
	ld [W_PLAYERMOVEPOWER],a
	ld hl,wd075
	ld a,[hld]
	add a
	ld b,a
	ld [wd0d8],a
	ld a,[hl]
	rl a ; double the damage
	ld [W_DAMAGE],a
	or b
	jr nz,.next
	ld a,1
	ld [W_MOVEMISSED],a
.next
	xor a
	ld [hli],a
	ld [hl],a
	ld a,BIDE
	ld [W_PLAYERMOVENUM],a
	ld hl,asm_3d705 ; skip damage calculation, DecrementPP and MoveHitTest
	jp .CannotUseMove

.ThrashingAboutCheck
	bit 1,[hl] ; is mon using thrash or petal dance?
	jr z,.MultiturnMoveCheck
	ld a,THRASH
	ld [W_PLAYERMOVENUM],a
	ld hl,ThrashingAboutText
	call PrintText
	ld hl,wPlayerNumAttacksLeft
	dec [hl] ; did Trashing About counter hit 0?
	ld hl,asm_3d6dc ; skip DecrementPP
	jp nz,.CannotUseMove 
	push hl
	ld hl,W_PLAYERBATTSTATUS1
	res 1,[hl] ; no longer trashing about
	set 7,[hl] ; confused
	call BattleRandom
	and a,3
	inc a
	inc a ; confused for 2-5 turns
	ld [wd06b],a
	pop hl ; skip DecrementPP
	jp .CannotUseMove

.MultiturnMoveCheck
	bit 5,[hl] ; is mon using multi-turn move?
	jp z,.RageCheck
	ld hl,AttackContinuesText
	call PrintText
	ld a,[wPlayerNumAttacksLeft]
	dec a ; did multi-turn move end?
	ld [wPlayerNumAttacksLeft],a
	ld hl,asm_3d714 ; if it didn't, skip damage calculation (deal damage equal to last hit), DecrementPP and MoveHitTest
	jp nz,.CannotUseMove
	jp .CannotUseMove

.RageCheck
	ld a, [W_PLAYERBATTSTATUS2]
	bit 6, a ; is mon using rage?
	jp z, .CanUseMove ; if we made it this far, mon can move normally this turn
	ld a, RAGE
	ld [wd11e], a
	call GetMoveName
	call CopyStringToCF4B
	xor a
	ld [W_PLAYERMOVEEFFECT], a
	ld hl, asm_3d6b0
	jp .CannotUseMove

.CannotUseMove
	xor a
	ret

.CanUseMove
	ld a, $1
	and a
	ret

FastAsleepText: ; 3da3d (f:5a3d)
	TX_FAR _FastAsleepText
	db "@"

WokeUpText: ; 3da42 (f:5a42)
	TX_FAR _WokeUpText
	db "@"

IsFrozenText: ; 3da47 (f:5a47)
	TX_FAR _IsFrozenText
	db "@"

FullyParalyzedText: ; 3da4c (f:5a4c)
	TX_FAR _FullyParalyzedText
	db "@"

FlinchedText: ; 3da51 (f:5a51)
	TX_FAR _FlinchedText
	db "@"

MustRechargeText: ; 3da56 (f:5a56)
	TX_FAR _MustRechargeText
	db "@"

DisabledNoMoreText: ; 3da5b (f:5a5b)
	TX_FAR _DisabledNoMoreText
	db "@"

IsConfusedText: ; 3da60 (f:5a60)
	TX_FAR _IsConfusedText
	db "@"

HurtItselfText: ; 3da65 (f:5a65)
	TX_FAR _HurtItselfText
	db "@"

ConfusedNoMoreText: ; 3da6a (f:5a6a)
	TX_FAR _ConfusedNoMoreText
	db "@"

SavingEnergyText: ; 3da6f (f:5a6f)
	TX_FAR _SavingEnergyText
	db "@"

UnleashedEnergyText: ; 3da74 (f:5a74)
	TX_FAR _UnleashedEnergyText
	db "@"

ThrashingAboutText: ; 3da79 (f:5a79)
	TX_FAR _ThrashingAboutText
	db "@"

AttackContinuesText: ; 3da7e (f:5a7e)
	TX_FAR _AttackContinuesText
	db "@"

CantMoveText: ; 3da83 (f:5a83)
	TX_FAR _CantMoveText
	db "@"

PrintMoveIsDisabledText: ; 3da88 (f:5a88)
	ld hl, wPlayerSelectedMove
	ld de, W_PLAYERBATTSTATUS1
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3da97
	inc hl
	ld de, W_ENEMYBATTSTATUS1
.asm_3da97
	ld a, [de]
	res 4, a
	ld [de], a
	ld a, [hl]
	ld [wd11e], a
	call GetMoveName
	ld hl, MoveIsDisabledText
	jp PrintText

MoveIsDisabledText: ; 3daa8 (f:5aa8)
	TX_FAR _MoveIsDisabledText
	db "@"

HandleSelfConfusionDamage: ; 3daad (f:5aad)
	ld hl, HurtItselfText
	call PrintText
	ld hl, wEnemyMonDefense
	ld a, [hli]
	push af
	ld a, [hld]
	push af
	ld a, [wBattleMonDefense]
	ld [hli], a
	ld a, [wBattleMonDefense + 1]
	ld [hl], a
	ld hl, W_PLAYERMOVEEFFECT
	push hl
	ld a, [hl]
	push af
	xor a
	ld [hli], a
	ld [wCriticalHitOrOHKO], a ; self-inflicted confusion damage can't be a Critical Hit
	ld a, $28 ; 40 base power
	ld [hli], a
	xor a
	ld [hl], a
	call GetDamageVarsForPlayerAttack
	call CalculateDamage ; ignores AdjustDamageForMoveType (type-less damage), RandomizeDamage, and MoveHitTest (always hits)
	pop af
	pop hl
	ld [hl], a
	ld hl, wEnemyMonDefense + 1
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	xor a
	ld [wcc5b], a
	inc a
	ld [H_WHOSETURN], a
	call PlayMoveAnimation
	call DrawPlayerHUDAndHPBar
	xor a
	ld [H_WHOSETURN], a
	jp ApplyDamageToPlayerPokemon

PrintMonName1Text: ; 3daf5 (f:5af5)
	ld hl, MonName1Text
	jp PrintText

MonName1Text: ; 3dafb (f:5afb)
	TX_FAR _MonName1Text
	db $08 ; asm
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVENUM]
	ld hl, wccf1
	jr z, .asm_3db11
	ld a, [W_ENEMYMOVENUM]
	ld hl, wccf2
.asm_3db11
	ld [hl], a
	ld [wd11e], a
	call Func_3db85
	ld a, [wcced]
	and a
	ld hl, Used2Text
	ret nz
	ld a, [wd11e]
	cp DOUBLESLAP
	ld hl, Used2Text
	ret c
	ld hl, Used1Text
	ret

Used1Text: ; 3db2d (f:5b2d)
	TX_FAR _Used1Text
	db $08 ; asm
	jr PrintInsteadText

Used2Text: ; 3db34 (f:5b34)
	TX_FAR _Used2Text
	db $08 ; asm

PrintInsteadText: ; 3db39 (f:5b39)
	ld a, [wcced]
	and a
	jr z, PrintCF4BText
	ld hl, InsteadText
	ret

InsteadText: ; 3db43 (f:5b43)
	TX_FAR _InsteadText
	db $08 ; asm

PrintCF4BText: ; 3db48 (f:5b48)
	ld hl, CF4BText
	ret

CF4BText: ; 3db4c (f:5b4c)
	TX_FAR _CF4BText
	db $08 ; asm
	ld hl, ExclamationPointPointerTable
	ld a, [wd11e]
	add a
	push bc
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

ExclamationPointPointerTable: ; 3db62 (f:5b62)
	dw ExclamationPoint1Text
	dw ExclamationPoint2Text
	dw ExclamationPoint3Text
	dw ExclamationPoint4Text
	dw ExclamationPoint5Text

ExclamationPoint1Text: ; 3db6c (f:5b6c)
	TX_FAR _ExclamationPoint1Text
	db "@"

ExclamationPoint2Text: ; 3db71 (f:5b71)
	TX_FAR _ExclamationPoint2Text
	db "@"

ExclamationPoint3Text: ; 3db76 (f:5b76)
	TX_FAR _ExclamationPoint3Text
	db "@"

ExclamationPoint4Text: ; 3db7b (f:5b7b)
	TX_FAR _ExclamationPoint4Text
	db "@"

ExclamationPoint5Text: ; 3db80 (f:5b80)
	TX_FAR _ExclamationPoint5Text
	db "@"

Func_3db85: ; 3db85 (f:5b85)
	push bc
	ld a, [wd11e] ; move number
	ld c, a
	ld b, $0
	ld hl, UnknownMovesList_3dba3
.asm_3db8f
	ld a, [hli]
	cp $ff
	jr z, .asm_3db9d
	cp c
	jr z, .asm_3db9d
	and a
	jr nz, .asm_3db8f
	inc b
	jr .asm_3db8f
.asm_3db9d
	ld a, b
	ld [wd11e], a
	pop bc
	ret

UnknownMovesList_3dba3: ; 3dba3 (f:5ba3)
	db SWORDS_DANCE, GROWTH
	db $00
	db RECOVER, BIDE, SELFDESTRUCT, AMNESIA
	db $00
	db MEDITATE, AGILITY, TELEPORT, MIMIC, DOUBLE_TEAM, BARRAGE
	db $00
	db POUND, SCRATCH, VICEGRIP, WING_ATTACK, FLY, BIND, SLAM, HORN_ATTACK, BODY_SLAM
	db WRAP, THRASH, TAIL_WHIP, LEER, BITE, GROWL, ROAR, SING, PECK, COUNTER
	db STRENGTH, ABSORB, STRING_SHOT, EARTHQUAKE, FISSURE, DIG, TOXIC, SCREECH, HARDEN
	db MINIMIZE, WITHDRAW, DEFENSE_CURL, METRONOME, LICK, CLAMP, CONSTRICT, POISON_GAS
	db LEECH_LIFE, BUBBLE, FLASH, SPLASH, ACID_ARMOR, FURY_SWIPES, REST, SHARPEN, SLASH, SUBSTITUTE
	db $00
	db $FF ; terminator

PrintMoveFailureText: ; 3dbe2 (f:5be2)
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .playersTurn
	ld de, W_ENEMYMOVEEFFECT
.playersTurn
	ld hl, DoesntAffectMonText
	ld a, [wd05b]
	and $7f
	jr z, .asm_3dc04
	ld hl, AttackMissedText
	ld a, [wCriticalHitOrOHKO]
	cp $ff
	jr nz, .asm_3dc04
	ld hl, UnaffectedText
.asm_3dc04
	push de
	call PrintText
	xor a
	ld [wCriticalHitOrOHKO], a
	pop de
	ld a, [de]
	cp JUMP_KICK_EFFECT
	ret nz

	; if you get here, the mon used jump kick or hi jump kick and missed
	ld hl, W_DAMAGE ; since the move missed, W_DAMAGE will always contain 0 at this point.
					; Thus, recoil damage will always be equal to 1 even if it was intended to be potential damage/8.
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	srl a
	rr b
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .asm_3dc2a
	inc a
	ld [hl], a
.asm_3dc2a
	ld hl, KeptGoingAndCrashedText
	call PrintText
	ld b, $4
	predef Func_48125
	ld a, [H_WHOSETURN]
	and a
	jr nz, .asm_3dc3f
	jp ApplyDamageToPlayerPokemon
.asm_3dc3f
	jp ApplyDamageToEnemyPokemon

AttackMissedText: ; 3dc42 (f:5c42)
	TX_FAR _AttackMissedText
	db "@"

KeptGoingAndCrashedText: ; 3dc47 (f:5c47)
	TX_FAR _KeptGoingAndCrashedText
	db "@"

UnaffectedText: ; 3dc4c (f:5c4c)
	TX_FAR _UnaffectedText
	db "@"

PrintDoesntAffectText: ; 3dc51 (f:5c51)
	ld hl, DoesntAffectMonText
	jp PrintText

DoesntAffectMonText: ; 3dc57 (f:5c57)
	TX_FAR _DoesntAffectMonText
	db "@"

; if there was a critical hit or an OHKO was successful, print the corresponding text
PrintCriticalOHKOText: ; 3dc5c (f:5c5c)
	ld a, [wCriticalHitOrOHKO]
	and a
	jr z, .done ; do nothing if there was no critical hit or successful OHKO
	dec a
	add a
	ld hl, CriticalOHKOTextPointers
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	xor a
	ld [wCriticalHitOrOHKO], a
.done
	ld c, $14
	jp DelayFrames

CriticalOHKOTextPointers: ; 3dc7a (f:5c7a)
	dw CriticalHitText
	dw OHKOText

CriticalHitText: ; 3dc7e (f:5c7e)
	TX_FAR _CriticalHitText
	db "@"

OHKOText: ; 3dc83 (f:5c83)
	TX_FAR _OHKOText
	db "@"

; checks if a traded mon will disobey due to lack of badges
; stores whether the mon will use a move in Z flag
CheckForDisobedience: ; 3dc88 (f:5c88)
	xor a
	ld [wcced], a
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .checkIfMonIsTraded
	ld a, $1
	and a
	ret
; compare the mon's original trainer ID with the player's ID to see if it was traded
.checkIfMonIsTraded
	ld hl, wPartyMon1OTID
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wPlayerMonNumber]
	call AddNTimes
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .monIsTraded
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	jp z, .canUseMove
; it was traded
.monIsTraded
; what level might disobey?
	ld hl, W_OBTAINEDBADGES
	bit 7, [hl]
	ld a, 101
	jr nz, .next
	bit 5, [hl]
	ld a, 70
	jr nz, .next
	bit 3, [hl]
	ld a, 50
	jr nz, .next
	bit 1, [hl]
	ld a, 30
	jr nz, .next
	ld a, 10
.next
	ld b, a
	ld c, a
	ld a, [wBattleMonLevel]
	ld d, a
	add b
	ld b, a
	jr nc, .noCarry
	ld b, $ff ; cap b at $ff
.noCarry
	ld a, c
	cp d
	jp nc, .canUseMove
.loop1
	call BattleRandom
	swap a
	cp b
	jr nc, .loop1
	cp c
	jp c, .canUseMove
.loop2
	call BattleRandom
	cp b
	jr nc, .loop2
	cp c
	jr c, .useRandomMove
	ld a, d
	sub c
	ld b, a
	call BattleRandom
	swap a
	sub b
	jr c, .monNaps
	cp b
	jr nc, .monDoesNothing
	ld hl, WontObeyText
	call PrintText
	call HandleSelfConfusionDamage
	jp .cannotUseMove
.monNaps
	call BattleRandom
	add a
	swap a
	and SLP ; sleep mask
	jr z, .monNaps ; keep trying until we get at least 1 turn of sleep
	ld [wBattleMonStatus], a
	ld hl, BeganToNapText
	jr .printText
.monDoesNothing
	call BattleRandom
	and $3
	ld hl, LoafingAroundText
	and a
	jr z, .printText
	ld hl, WontObeyText
	dec a
	jr z, .printText
	ld hl, TurnedAwayText
	dec a
	jr z, .printText
	ld hl, IgnoredOrdersText
.printText
	call PrintText
	jr .cannotUseMove
.useRandomMove
	ld a, [wBattleMonMoves + 1]
	and a ; is the second move slot empty?
	jr z, .monDoesNothing ; mon will not use move if it only knows one move
	ld a, [wccee]
	and a
	jr nz, .monDoesNothing
	ld a, [wPlayerSelectedMove]
	cp STRUGGLE
	jr z, .monDoesNothing ; mon will not use move if struggling
; check if only one move has remaining PP
	ld hl, wBattleMonPP
	push hl
	ld a, [hli]
	and $3f
	ld b, a
	ld a, [hli]
	and $3f
	add b
	ld b, a
	ld a, [hli]
	and $3f
	add b
	ld b, a
	ld a, [hl]
	and $3f
	add b
	pop hl
	push af
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	and $3f
	ld b, a
	pop af
	cp b
	jr z, .monDoesNothing ; mon will not use move if only one move has remaining PP
	ld a, $1
	ld [wcced], a
	ld a, [wMaxMenuItem]
	ld b, a
	ld a, [wCurrentMenuItem]
	ld c, a
.chooseMove
	call BattleRandom
	and $3
	cp b
	jr nc, .chooseMove ; if the random number is greater than the move count, choose another
	cp c
	jr z, .chooseMove ; if the random number matches the move the player selected, choose another
	ld [wCurrentMenuItem], a
	ld hl, wBattleMonPP
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	and a ; does the move have any PP left?
	jr z, .chooseMove ; if the move has no PP left, choose another
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [wPlayerSelectedMove], a
	call GetCurrentMove
.canUseMove
	ld a, $1
	and a; clear Z flag
	ret
.cannotUseMove
	xor a ; set Z flag
	ret

LoafingAroundText: ; 3ddb6 (f:5db6)
	TX_FAR _LoafingAroundText
	db "@"

BeganToNapText: ; 3ddbb (f:5dbb)
	TX_FAR _BeganToNapText
	db "@"

WontObeyText: ; 3ddc0 (f:5dc0)
	TX_FAR _WontObeyText
	db "@"

TurnedAwayText: ; 3ddc5 (f:5dc5)
	TX_FAR _TurnedAwayText
	db "@"

IgnoredOrdersText: ; 3ddca (f:5dca)
	TX_FAR _IgnoredOrdersText
	db "@"

; sets b, c, d, and e for the CalculateDamage routine in the case of an attack by the player mon
GetDamageVarsForPlayerAttack: ; 3ddcf (f:5dcf)
	xor a
	ld hl, W_DAMAGE ; damage to eventually inflict, initialise to zero
	ldi [hl], a
	ld [hl], a
	ld hl, W_PLAYERMOVEPOWER
	ld a, [hli]
	and a
	ld d, a ; d = move power
	ret z ; return if move power is zero
	ld a, [hl] ; a = [W_PLAYERMOVETYPE]
	cp FIRE ; types >= FIRE are all special
	jr nc, .specialAttack
.physicalAttack
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = enemy defense
	ld a, [W_ENEMYBATTSTATUS3]
	bit 2, a ; check for Reflect
	jr z, .physicalAttackCritCheck
; if the enemy has used Reflect, double the enemy's defense
	sla c
	rl b	
.physicalAttackCritCheck
	ld hl, wBattleMonAttack
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .scaleStats
; in the case of a critical hit, reset the player's attack and the enemy's defense to their base values
	ld c, 3 ; defense stat
	call GetEnemyMonStat
	ld a, [$ff97]
	ld b, a
	ld a, [$ff98]
	ld c, a
	push bc
	ld hl, wPartyMon1Attack
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	pop bc
	jr .scaleStats
.specialAttack
	ld hl, wEnemyMonSpecial
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = enemy special
	ld a, [W_ENEMYBATTSTATUS3]
	bit 1, a ; check for Light Screen
	jr z, .specialAttackCritCheck
; if the enemy has used Light Screen, double the enemy's special
	sla c
	rl b
; reflect and light screen boosts do not cap the stat at 999, so weird things will happen during stats scaling if
; a Pokemon with 512 or more Defense has ued Reflect, or if a Pokemon with 512 or more Special has used Light Screen 	
.specialAttackCritCheck
	ld hl, wBattleMonSpecial
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .scaleStats
; in the case of a critical hit, reset the player's and enemy's specials to their base values
	ld c, 5 ; special stat
	call GetEnemyMonStat
	ld a, [$ff97]
	ld b, a
	ld a, [$ff98]
	ld c, a
	push bc
	ld hl, wPartyMon1Special
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	pop bc
; if either the offensive or defensive stat is too large to store in a byte, scale both stats by dividing them by 4
; this allows values with up to 10 bits (values up to 1023) to be handled
; anything larger will wrap around
.scaleStats
	ld a, [hli]
	ld l, [hl]
	ld h, a ; hl = player's offensive stat
	or b ; is either high byte nonzero?
	jr z, .next ; if not, we don't need to scale
; bc /= 4 (scale enemy's defensive stat)
	srl b
	rr c
	srl b
	rr c
; defensive stat can actually end up as 0, leading to a division by 0 freeze during damage calculation	
; hl /= 4 (scale player's offensive stat)
	srl h
	rr l
	srl h
	rr l
	ld a, l
	or h ; is the player's offensive stat 0?
	jr nz, .next
	inc l ; if the player's offensive stat is 0, bump it up to 1
.next
	ld b, l ; b = player's offensive stat (possibly scaled) (c already contains enemy's defensive stat (possibly scaled))
	ld a, [wBattleMonLevel]
	ld e, a ; e = level
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .done
	sla e ; double level if it was a critical hit
.done
	ld a, 1
	and a
	ret

; sets b, c, d, and e for the CalculateDamage routine in the case of an attack by the enemy mon
GetDamageVarsForEnemyAttack: ; 3de75 (f:5e75)
	ld hl, W_DAMAGE ; damage to eventually inflict, initialise to zero
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, W_ENEMYMOVEPOWER
	ld a, [hli]
	ld d, a ; d = move power
	and a
	ret z ; return if move power is zero
	ld a, [hl] ; a = [W_ENEMYMOVETYPE]
	cp FIRE ; types >= FIRE are all special
	jr nc, .specialAttack
.physicalAttack
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = player defense
	ld a, [W_PLAYERBATTSTATUS3]
	bit 2, a ; check for Reflect
	jr z, .physicalAttackCritCheck
; if the player has used Reflect, double the player's defense
	sla c
	rl b
.physicalAttackCritCheck
	ld hl, wEnemyMonAttack
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .scaleStats
; in the case of a critical hit, reset the player's defense and the enemy's attack to their base values
	ld hl, wPartyMon1Defense
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc
	ld c, 2 ; attack stat
	call GetEnemyMonStat
	ld hl, $ff97
	pop bc
	jr .scaleStats
.specialAttack
	ld hl, wBattleMonSpecial
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [W_PLAYERBATTSTATUS3]
	bit 1, a ; check for Light Screen
	jr z, .specialAttackCritCheck
; if the player has used Light Screen, double the player's special
	sla c
	rl b
; reflect and light screen boosts do not cap the stat at 999, so weird things will happen during stats scaling if
; a Pokemon with 512 or more Defense has ued Reflect, or if a Pokemon with 512 or more Special has used Light Screen 
.specialAttackCritCheck
	ld hl, wEnemyMonSpecial
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .scaleStats
; in the case of a critical hit, reset the player's and enemy's specials to their base values
	ld hl, wPartyMon1Special
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc
	ld c, 5 ; special stat
	call GetEnemyMonStat
	ld hl, $ff97
	pop bc
; if either the offensive or defensive stat is too large to store in a byte, scale both stats by dividing them by 4
; this allows values with up to 10 bits (values up to 1023) to be handled
; anything larger will wrap around
.scaleStats
	ld a, [hli]
	ld l, [hl]
	ld h, a ; hl = enemy's offensive stat
	or b ; is either high byte nonzero?
	jr z, .next ; if not, we don't need to scale
; bc /= 4 (scale player's defensive stat)
	srl b
	rr c
	srl b
	rr c
; defensive stat can actually end up as 0, leading to a division by 0 freeze during damage calculation		
; hl /= 4 (scale enemy's offensive stat)
	srl h
	rr l
	srl h
	rr l
	ld a, l
	or h ; is the enemy's offensive stat 0?
	jr nz, .next
	inc l ; if the enemy's offensive stat is 0, bump it up to 1
.next
	ld b, l ; b = enemy's offensive stat (possibly scaled) (c already contains player's defensive stat (possibly scaled))
	ld a, [wEnemyMonLevel]
	ld e, a
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .done
	sla e ; double level if it was a critical hit
.done
	ld a, $1
	and a
	and a
	ret

; get stat c of enemy mon
; c: stat to get (HP=1,Attack=2,Defense=3,Speed=4,Special=5)
GetEnemyMonStat: ; 3df1c (f:5f1c)
	push de
	push bc
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .asm_3df40
	ld hl, wEnemyMon1Stats
	dec c
	sla c
	ld b, $0
	add hl, bc
	ld a, [wEnemyMonPartyPos]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [hli]
	ld [$ff97], a
	ld a, [hl]
	ld [$ff98], a
	pop bc
	pop de
	ret
.asm_3df40
	ld a, [wEnemyMonLevel]
	ld [W_CURENEMYLVL], a
	ld a, [wEnemyMonSpecies]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, wEnemyMonDVs
	ld de, wcfaf
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop bc
	ld b, $0
	ld hl, wcfa4
	call CalcStat
	pop de
	ret

CalculateDamage: ; 3df65 (f:5f65)
; input:
;	b: attack
;	c: opponent defense
;	d: base power
;	e: level

	ld a, [$fff3] ; whose turn?
	and a
	ld a, [W_PLAYERMOVEEFFECT]
	jr z, .effect
	ld a, [W_ENEMYMOVEEFFECT]
.effect

; EXPLODE_EFFECT halves defense.
	cp a, EXPLODE_EFFECT
	jr nz, .ok
	srl c
	jr nz, .ok
	inc c ; ...with a minimum value of 1 (used as a divisor later on)
.ok

; Multi-hit attacks may or may not have 0 bp.
	cp a, TWO_TO_FIVE_ATTACKS_EFFECT
	jr z, .skipbp
	cp a, $1e
	jr z, .skipbp

; Calculate OHKO damage based on remaining HP.
	cp a, OHKO_EFFECT
	jp z, Func_3e016

; Don't calculate damage for moves that don't do any.
	ld a, d ; base power
	and a
	ret z
.skipbp

	xor a
	ld hl, H_DIVIDEND
	ldi [hl], a
	ldi [hl], a
	ld [hl], a

; Multiply level by 2
	ld a, e ; level
	add a
	jr nc, .nc
	push af
	ld a, 1
	ld [hl], a
	pop af
.nc
	inc hl
	ldi [hl], a

; Divide by 5
	ld a, 5
	ldd [hl], a
	push bc
	ld b, 4
	call Divide
	pop bc

; Add 2
	inc [hl]
	inc [hl]

	inc hl ; multiplier

; Multiply by attack base power
	ld [hl], d
	call Multiply

; Multiply by attack stat
	ld [hl], b
	call Multiply

; Divide by defender's defense stat
	ld [hl], c
	ld b, 4
	call Divide

; Divide by 50
	ld [hl], 50
	ld b, 4
	call Divide

	ld hl, W_DAMAGE
	ld b, [hl]
	ld a, [H_QUOTIENT + 3]
	add b
	ld [H_QUOTIENT + 3], a
	jr nc, .asm_3dfd0

	ld a, [H_QUOTIENT + 2]
	inc a
	ld [H_QUOTIENT + 2], a
	and a
	jr z, .asm_3e004

.asm_3dfd0
	ld a, [H_QUOTIENT]
	ld b, a
	ld a, [H_QUOTIENT + 1]
	or a
	jr nz, .asm_3e004

	ld a, [H_QUOTIENT + 2]
	cp 998 / $100
	jr c, .asm_3dfe8
	cp 998 / $100 + 1
	jr nc, .asm_3e004
	ld a, [H_QUOTIENT + 3]
	cp 998 % $100
	jr nc, .asm_3e004

.asm_3dfe8
	inc hl
	ld a, [H_QUOTIENT + 3]
	ld b, [hl]
	add b
	ld [hld], a

	ld a, [H_QUOTIENT + 2]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .asm_3e004

	ld a, [hl]
	cp 998 / $100
	jr c, .asm_3e00a
	cp 998 / $100 + 1
	jr nc, .asm_3e004
	inc hl
	ld a, [hld]
	cp 998 % $100
	jr c, .asm_3e00a

.asm_3e004
; cap at 997
	ld a, 997 / $100
	ld [hli], a
	ld a, 997 % $100
	ld [hld], a

.asm_3e00a
; add 2
	inc hl
	ld a, [hl]
	add 2
	ld [hld], a
	jr nc, .done
	inc [hl]
	
.done
; minimum damage is 1
	ld a, 1
	and a
	ret

Func_3e016: ; 3e016 (f:6016)
	call JumpMoveEffect
	ld a, [W_MOVEMISSED]
	dec a
	ret


UnusedHighCriticalMoves: ; 3e01e (f:601e)
	db KARATE_CHOP
	db RAZOR_LEAF
	db CRABHAMMER
	db SLASH
	db $FF
; 3e023

; determines if attack is a critical hit
; azure heights claims "the fastest pokémon (who are,not coincidentally,
; among the most popular) tend to CH about 20 to 25% of the time."
CriticalHitTest: ; 3e023 (f:6023)
	xor a
	ld [wCriticalHitOrOHKO], a
	ld a, [H_WHOSETURN]
	and a
	ld a, [wEnemyMonSpecies]
	jr nz, .asm_3e032
	ld a, [wBattleMonSpecies]
.asm_3e032
	ld [wd0b5], a
	call GetMonHeader
	ld a, [W_MONHBASESPEED]
	ld b, a
	srl b                        ; (effective (base speed/2))
	ld a, [H_WHOSETURN]
	and a
	ld hl, W_PLAYERMOVEPOWER
	ld de, W_PLAYERBATTSTATUS2
	jr z, .calcCriticalHitProbability
	ld hl, W_ENEMYMOVEPOWER
	ld de, W_ENEMYBATTSTATUS2
.calcCriticalHitProbability      ; 0x3e04f
	ld a, [hld]                  ; read base power from RAM
	and a
	ret z                        ; do nothing if zero
	dec hl
	ld c, [hl]                   ; read move id
	ld a, [de]
	bit 2, a                     ; test for focus energy
	jr nz, .focusEnergyUsed      ; bug: using focus energy causes a shift to the right instead of left,
	                             ; resulting in 1/4 the usual crit chance
	sla b                        ; (effective (base speed/2)*2)
	jr nc, .noFocusEnergyUsed
	ld b, $ff                    ; cap at 255/256
	jr .noFocusEnergyUsed
.focusEnergyUsed
	srl b
.noFocusEnergyUsed
	ld hl, HighCriticalMoves     ; table of high critical hit moves
.Loop
	ld a, [hli]                  ; read move from move table
	cp c                         ; does it match the move about to be used?
	jr z, .HighCritical          ; if so, the move about to be used is a high critical hit ratio move
	inc a                        ; move on to the next move, FF terminates loop
	jr nz, .Loop                 ; check the next move in HighCriticalMoves
	srl b                        ; /2 for regular move (effective (base speed / 2))
	jr .SkipHighCritical         ; continue as a normal move
.HighCritical
	sla b                        ; *2 for high critical hit moves
	jr nc, .noCarry
	ld b, $ff                    ; cap at 255/256
.noCarry
	sla b                        ; *4 for high critical move (effective (base speed/2)*8))
	jr nc, .SkipHighCritical
	ld b, $ff
.SkipHighCritical
	call BattleRandom            ; generates a random value, in "a"
	rlc a
	rlc a
	rlc a
	cp b                         ; check a against calculated crit rate
	ret nc                       ; no critical hit if no borrow
	ld a, $1
	ld [wCriticalHitOrOHKO], a   ; set critical hit flag
	ret

; high critical hit moves
HighCriticalMoves: ; 3e08e (f:608e)
	db KARATE_CHOP
	db RAZOR_LEAF
	db CRABHAMMER
	db SLASH
	db $FF


; function to determine if Counter hits and if so, how much damage it does
HandleCounterMove: ; 3e093 (f:6093)
; The variables checked by Counter are updated whenever the cursor points to a new move in the battle selection menu. 
; This is irrelevant for the opponent's side outside of link battles, since the move selection is controlled by the AI. 
; However, in the scenario where the player switches out and the opponent uses Counter, 
; the outcome may be affected by the player's actions in the move selection menu prior to switching the Pokemon.
; This might also lead to desync glitches in link battles.

	ld a,[H_WHOSETURN] ; whose turn
	and a
; player's turn
	ld hl,wEnemySelectedMove
	ld de,W_ENEMYMOVEPOWER
	ld a,[wPlayerSelectedMove]
	jr z,.next
; enemy's turn
	ld hl,wPlayerSelectedMove
	ld de,W_PLAYERMOVEPOWER
	ld a,[wEnemySelectedMove]
.next
	cp a,COUNTER
	ret nz ; return if not using Counter
	ld a,$01
	ld [W_MOVEMISSED],a ; initialize the move missed variable to true (it is set to false below if the move hits)
	ld a,[hl]
	cp a,COUNTER
	ret z ; miss if the opponent's last selected move is Counter.
	ld a,[de]
	and a
	ret z ; miss if the opponent's last selected move's Base Power is 0.
; check if the move the target last selected was Normal or Fighting type
	inc de
	ld a,[de]
	and a ; normal type
	jr z,.counterableType
	cp a,FIGHTING
	jr z,.counterableType
; if the move wasn't Normal or Fighting type, miss
	xor a
	ret
.counterableType
	ld hl,W_DAMAGE
	ld a,[hli]
	or [hl]
	ret z ; If we made it here, Counter still misses if the last move used in battle did no damage to its target.
		  ; W_DAMAGE is shared by both players, so Counter may strike back damage dealt by the Counter user itself 
		  ; if the conditions meet, even though 99% of the times damage will come from the target.
; if it did damage, double it
	ld a,[hl]
	add a
	ldd [hl],a
	ld a,[hl]
	adc a
	ld [hl],a
	jr nc,.noCarry
; damage is capped at 0xFFFF
	ld a,$ff
	ld [hli],a
	ld [hl],a
.noCarry
	xor a
	ld [W_MOVEMISSED],a
	call MoveHitTest ; do the normal move hit test in addition to Counter's special rules
	xor a
	ret

ApplyAttackToEnemyPokemon: ; 3e0df (f:60df)
	ld a,[W_PLAYERMOVEEFFECT]
	cp a,OHKO_EFFECT
	jr z,ApplyDamageToEnemyPokemon
	cp a,SUPER_FANG_EFFECT
	jr z,.superFangEffect
	cp a,SPECIAL_DAMAGE_EFFECT
	jr z,.specialDamage
	ld a,[W_PLAYERMOVEPOWER]
	and a
	jp z,ApplyAttackToEnemyPokemonDone ; no attack to apply if base power is 0
	jr ApplyDamageToEnemyPokemon
.superFangEffect
; set the damage to half the target's HP
	ld hl,wEnemyMonHP
	ld de,W_DAMAGE
	ld a,[hli]
	srl a
	ld [de],a
	inc de
	ld b,a
	ld a,[hl]
	rr a
	ld [de],a
	or b
	jr nz,ApplyDamageToEnemyPokemon
; make sure Super Fang's damage is always at least 1
	ld a,$01
	ld [de],a
	jr ApplyDamageToEnemyPokemon
.specialDamage
	ld hl,wBattleMonLevel
	ld a,[hl]
	ld b,a ; Seismic Toss deals damage equal to the user's level
	ld a,[W_PLAYERMOVENUM]
	cp a,SEISMIC_TOSS 
	jr z,.storeDamage
	cp a,NIGHT_SHADE
	jr z,.storeDamage
	ld b,SONICBOOM_DAMAGE ; 20
	cp a,SONICBOOM
	jr z,.storeDamage
	ld b,DRAGON_RAGE_DAMAGE ; 40
	cp a,DRAGON_RAGE
	jr z,.storeDamage
; Psywave
	ld a,[hl]
	ld b,a
	srl a
	add b
	ld b,a ; b = level * 1.5
; loop until a random number in the range [1, b) is found
.loop
	call BattleRandom
	and a
	jr z,.loop
	cp b
	jr nc,.loop
	ld b,a
.storeDamage ; store damage value at b
	ld hl,W_DAMAGE
	xor a
	ld [hli],a
	ld a,b
	ld [hl],a

ApplyDamageToEnemyPokemon: ; 3e142 (f:6142)
	ld hl,W_DAMAGE
	ld a,[hli]
	ld b,a
	ld a,[hl]
	or b
	jr z,ApplyAttackToEnemyPokemonDone ; we're done if damage is 0
	ld a,[W_ENEMYBATTSTATUS2]
	bit 4,a ; does the enemy have a substitute?
	jp nz,AttackSubstitute
; subtract the damage from the pokemon's current HP
; also, save the current HP at wHPBarOldHP
	ld a,[hld]
	ld b,a
	ld a,[wEnemyMonHP + 1]
	ld [wHPBarOldHP],a
	sub b
	ld [wEnemyMonHP + 1],a
	ld a,[hl]
	ld b,a
	ld a,[wEnemyMonHP]
	ld [wHPBarOldHP+1],a
	sbc b
	ld [wEnemyMonHP],a
	jr nc,.animateHpBar
; if more damage was done than the current HP, zero the HP and set the damage (W_DAMAGE)
; equal to how much HP the pokemon had before the attack
	ld a,[wHPBarOldHP+1]
	ld [hli],a
	ld a,[wHPBarOldHP]
	ld [hl],a
	xor a
	ld hl,wEnemyMonHP
	ld [hli],a
	ld [hl],a
.animateHpBar
	ld hl,wEnemyMonMaxHP
	ld a,[hli]
	ld [wHPBarMaxHP+1],a
	ld a,[hl]
	ld [wHPBarMaxHP],a
	ld hl,wEnemyMonHP
	ld a,[hli]
	ld [wHPBarNewHP+1],a
	ld a,[hl]
	ld [wHPBarNewHP],a
	hlCoord 2, 2
	xor a
	ld [wListMenuID],a
	predef UpdateHPBar2 ; animate the HP bar shortening
ApplyAttackToEnemyPokemonDone: ; 3e19d (f:619d)
	jp DrawHUDsAndHPBars

ApplyAttackToPlayerPokemon: ; 3e1a0 (f:61a0)
	ld a,[W_ENEMYMOVEEFFECT]
	cp a,OHKO_EFFECT
	jr z,ApplyDamageToPlayerPokemon
	cp a,SUPER_FANG_EFFECT
	jr z,.superFangEffect
	cp a,SPECIAL_DAMAGE_EFFECT
	jr z,.specialDamage
	ld a,[W_ENEMYMOVEPOWER]
	and a
	jp z,ApplyAttackToPlayerPokemonDone
	jr ApplyDamageToPlayerPokemon
.superFangEffect
; set the damage to half the target's HP
	ld hl,wBattleMonHP
	ld de,W_DAMAGE
	ld a,[hli]
	srl a
	ld [de],a
	inc de
	ld b,a
	ld a,[hl]
	rr a
	ld [de],a
	or b
	jr nz,ApplyDamageToPlayerPokemon
; make sure Super Fang's damage is always at least 1
	ld a,$01
	ld [de],a
	jr ApplyDamageToPlayerPokemon
.specialDamage
	ld hl,wEnemyMonLevel
	ld a,[hl]
	ld b,a
	ld a,[W_ENEMYMOVENUM]
	cp a,SEISMIC_TOSS
	jr z,.storeDamage
	cp a,NIGHT_SHADE
	jr z,.storeDamage
	ld b,SONICBOOM_DAMAGE
	cp a,SONICBOOM
	jr z,.storeDamage
	ld b,DRAGON_RAGE_DAMAGE
	cp a,DRAGON_RAGE
	jr z,.storeDamage
; Psywave
	ld a,[hl]
	ld b,a
	srl a
	add b
	ld b,a ; b = attacker's level * 1.5
; loop until a random number in the range [0, b) is found
; this differs from the range when the player attacks, which is [1, b)
; it's possible for the enemy to do 0 damage with Psywave, but the player always does at least 1 damage
.loop
	call BattleRandom
	cp b
	jr nc,.loop
	ld b,a
.storeDamage
	ld hl,W_DAMAGE
	xor a
	ld [hli],a
	ld a,b
	ld [hl],a

ApplyDamageToPlayerPokemon: ; 3e200 (f:6200)
	ld hl,W_DAMAGE
	ld a,[hli]
	ld b,a
	ld a,[hl]
	or b
	jr z,ApplyAttackToPlayerPokemonDone ; we're done if damage is 0
	ld a,[W_PLAYERBATTSTATUS2]
	bit 4,a ; does the player have a substitute?
	jp nz,AttackSubstitute
; subtract the damage from the pokemon's current HP
; also, save the current HP at wHPBarOldHP and the new HP at wHPBarNewHP
	ld a,[hld]
	ld b,a
	ld a,[wBattleMonHP + 1]
	ld [wHPBarOldHP],a
	sub b
	ld [wBattleMonHP + 1],a
	ld [wHPBarNewHP],a
	ld b,[hl]
	ld a,[wBattleMonHP]
	ld [wHPBarOldHP+1],a
	sbc b
	ld [wBattleMonHP],a
	ld [wHPBarNewHP+1],a
	jr nc,.animateHpBar
; if more damage was done than the current HP, zero the HP and set the damage (W_DAMAGE)
; equal to how much HP the pokemon had before the attack
	ld a,[wHPBarOldHP+1]
	ld [hli],a
	ld a,[wHPBarOldHP]
	ld [hl],a
	xor a
	ld hl,wBattleMonHP
	ld [hli],a
	ld [hl],a
	ld hl,wHPBarNewHP
	ld [hli],a
	ld [hl],a
.animateHpBar
	ld hl,wBattleMonMaxHP
	ld a,[hli]
	ld [wHPBarMaxHP+1],a
	ld a,[hl]
	ld [wHPBarMaxHP],a
	hlCoord 10, 9
	ld a,$01
	ld [wListMenuID],a
	predef UpdateHPBar2 ; animate the HP bar shortening
ApplyAttackToPlayerPokemonDone
	jp DrawHUDsAndHPBars

AttackSubstitute: ; 3e25e (f:625e)
; Unlike the two ApplyAttackToPokemon functions, Attack Substitute is shared by player and enemy.
; Self-confusion damage as well as Hi-Jump Kick and Jump Kick recoil cause a momentary turn swap before being applied.
; If the user has a Substitute up and would take damage because of that, damage will be applied to the other player's Substitute.
; Normal recoil such as from Double-Edge isn't affected by this glitch, because this function is never called in that case.

	ld hl,SubstituteTookDamageText
	call PrintText
; values for player turn
	ld de,wEnemySubstituteHP
	ld bc,W_ENEMYBATTSTATUS2
	ld a,[H_WHOSETURN]
	and a
	jr z,.applyDamageToSubstitute
; values for enemy turn
	ld de,wPlayerSubstituteHP
	ld bc,W_PLAYERBATTSTATUS2
.applyDamageToSubstitute
	ld hl,W_DAMAGE
	ld a,[hli]
	and a
	jr nz,.substituteBroke ; damage > 0xFF always breaks substitutes
; subtract damage from HP of substitute
	ld a,[de]
	sub [hl]
	ld [de],a
	ret nc
.substituteBroke
; If the target's Substitute breaks, W_DAMAGE isn't updated with the amount of HP the Substitute had before being attacked.
	ld h,b
	ld l,c
	res 4,[hl] ; unset the substitute bit
	ld hl,SubstituteBrokeText
	call PrintText
; flip whose turn it is for the next function call
	ld a,[H_WHOSETURN]
	xor a,$01
	ld [H_WHOSETURN],a
	callab Func_79747 ; animate the substitute breaking
; flip the turn back to the way it was
	ld a,[H_WHOSETURN]
	xor a,$01
	ld [H_WHOSETURN],a
	ld hl,W_PLAYERMOVEEFFECT ; value for player's turn
	and a
	jr z,.nullifyEffect
	ld hl,W_ENEMYMOVEEFFECT ; value for enemy's turn
.nullifyEffect
	xor a
	ld [hl],a ; zero the effect of the attacker's move
	jp DrawHUDsAndHPBars

SubstituteTookDamageText: ; 3e2ac (f:62ac)
	TX_FAR _SubstituteTookDamageText
	db "@"

SubstituteBrokeText: ; 3e2b1 (f:62b1)
	TX_FAR _SubstituteBrokeText
	db "@"

; this function raises the attack modifier of a pokemon using Rage when that pokemon is attacked
HandleBuildingRage: ; 3e2b6 (f:62b6)
; values for the player turn
	ld hl,W_ENEMYBATTSTATUS2
	ld de,wEnemyMonStatMods
	ld bc,W_ENEMYMOVENUM
	ld a,[H_WHOSETURN]
	and a
	jr z,.next
; values for the enemy turn
	ld hl,W_PLAYERBATTSTATUS2
	ld de,wPlayerMonStatMods
	ld bc,W_PLAYERMOVENUM
.next
	bit 6,[hl] ; is the pokemon being attacked under the effect of Rage?
	ret z ; return if not
	ld a,[de]
	cp a,$0d ; maximum stat modifier value
	ret z ; return if attack modifier is already maxed
	ld a,[H_WHOSETURN]
	xor a,$01 ; flip turn for the stat modifier raising function
	ld [H_WHOSETURN],a
; change the target pokemon's move to $00 and the effect to the one
; that causes the attack modifier to go up one stage
	ld h,b
	ld l,c
	ld [hl],$00 ; null move number
	inc hl
	ld [hl],ATTACK_UP1_EFFECT
	push hl
	ld hl,BuildingRageText
	call PrintText
	call StatModifierUpEffect ; stat modifier raising function
	pop hl
	xor a
	ldd [hl],a ; null move effect
	ld a,RAGE
	ld [hl],a ; restore the target pokemon's move number to Rage
	ld a,[H_WHOSETURN]
	xor a,$01 ; flip turn back to the way it was
	ld [H_WHOSETURN],a
	ret

BuildingRageText: ; 3e2f8 (f:62f8)
	TX_FAR _BuildingRageText
	db "@"

; copy last move for Mirror Move
; sets zero flag on failure and unsets zero flag on success
MirrorMoveCopyMove: ; 3e2fd (f:62fd)
; Mirror Move makes use of ccf1 and ccf2 addresses, which are mainly used to print the "[Pokemon] used [Move]" text.
; Both are set to 0 whenever a new Pokemon is sent out
; ccf1 is also set to 0 whenever the player is fast asleep or frozen solid.
; ccf2 is also set to 0 whenever the enemy is fast asleep or frozen solid.

	ld a,[H_WHOSETURN]
	and a
; values for player turn
	ld a,[wccf2]
	ld hl,wPlayerSelectedMove
	ld de,W_PLAYERMOVENUM
	jr z,.next
; values for enemy turn
	ld a,[wccf1]
	ld de,W_ENEMYMOVENUM
	ld hl,wEnemySelectedMove
.next
	ld [hl],a
	cp a,MIRROR_MOVE ; did the target Pokemon last use Mirror Move, and miss?
	jr z,.mirrorMoveFailed
	and a ; null move?
	jr nz,ReloadMoveData
.mirrorMoveFailed
	ld hl,MirrorMoveFailedText
	call PrintText
	xor a
	ret

MirrorMoveFailedText: ; 3e324 (f:6324)
	TX_FAR _MirrorMoveFailedText
	db "@"

; function used to reload move data for moves like Mirror Move and Metronome
ReloadMoveData: ; 3e329 (f:6329)
	ld [wd11e],a
	dec a
	ld hl,Moves
	ld bc,$0006
	call AddNTimes
	ld a,BANK(Moves)
	call FarCopyData ; copy the move's stats
	call IncrementMovePP
; the follow two function calls are used to reload the move name
	call GetMoveName
	call CopyStringToCF4B
	ld a,$01
	and a
	ret

; function that picks a random move for metronome
MetronomePickMove: ; 3e348 (f:6348)
	xor a
	ld [wcc5b],a
	ld a,METRONOME
	call PlayMoveAnimation ; play Metronome's animation
; values for player turn
	ld de,W_PLAYERMOVENUM
	ld hl,wPlayerSelectedMove
	ld a,[H_WHOSETURN]
	and a
	jr z,.pickMoveLoop
; values for enemy turn
	ld de,W_ENEMYMOVENUM
	ld hl,wEnemySelectedMove
; loop to pick a random number in the range [1, $a5) to be the move used by Metronome
.pickMoveLoop
	call BattleRandom
	and a
	jr z,.pickMoveLoop
	cp a,NUM_ATTACKS + 1 ; max normal move number + 1 (this is Struggle's move number)
	jr nc,.pickMoveLoop
	cp a,METRONOME
	jr z,.pickMoveLoop
	ld [hl],a
	jr ReloadMoveData

; this function increments the current move's PP
; it's used to prevent moves that run another move within the same turn
; (like Mirror Move and Metronome) from losing 2 PP
IncrementMovePP: ; 3e373 (f:6373)
	ld a,[H_WHOSETURN]
	and a
; values for player turn
	ld hl,wBattleMonPP
	ld de,wPartyMon1PP
	ld a,[wPlayerMoveListIndex]
	jr z,.next
; values for enemy turn
	ld hl,wEnemyMonPP
	ld de,wEnemyMon1PP
	ld a,[wEnemyMoveListIndex]
.next
	ld b,$00
	ld c,a
	add hl,bc
	inc [hl] ; increment PP in the currently battling pokemon memory location
	ld h,d
	ld l,e
	add hl,bc
	ld a,[H_WHOSETURN]
	and a
	ld a,[wPlayerMonNumber] ; value for player turn
	jr z,.next2
	ld a,[wEnemyMonPartyPos] ; value for enemy turn
.next2
	ld bc,wEnemyMon2 - wEnemyMon1
	call AddNTimes
	inc [hl] ; increment PP in the party memory location
	ret

; function to adjust the base damage of an attack to account for type effectiveness
AdjustDamageForMoveType: ; 3e3a5 (f:63a5)
; values for player turn
	ld hl,wBattleMonType
	ld a,[hli]
	ld b,a    ; b = type 1 of attacker
	ld c,[hl] ; c = type 2 of attacker
	ld hl,wEnemyMonType
	ld a,[hli]
	ld d,a    ; d = type 1 of defender
	ld e,[hl] ; e = type 2 of defender
	ld a,[W_PLAYERMOVETYPE]
	ld [wd11e],a
	ld a,[H_WHOSETURN]
	and a
	jr z,.next
; values for enemy turn
	ld hl,wEnemyMonType
	ld a,[hli]
	ld b,a    ; b = type 1 of attacker
	ld c,[hl] ; c = type 2 of attacker
	ld hl,wBattleMonType
	ld a,[hli]
	ld d,a    ; d = type 1 of defender
	ld e,[hl] ; e = type 2 of defender
	ld a,[W_ENEMYMOVETYPE]
	ld [wd11e],a
.next
	ld a,[wd11e] ; move type
	cp b ; does the move type match type 1 of the attacker?
	jr z,.sameTypeAttackBonus
	cp c ; does the move type match type 2 of the attacker?
	jr z,.sameTypeAttackBonus
	jr .skipSameTypeAttackBonus
.sameTypeAttackBonus
; if the move type matches one of the attacker's types
	ld hl,W_DAMAGE + 1
	ld a,[hld]
	ld h,[hl]
	ld l,a    ; hl = damage
	ld b,h
	ld c,l    ; bc = damage
	srl b
	rr c      ; bc = floor(0.5 * damage)
	add hl,bc ; hl = floor(1.5 * damage)
; store damage
	ld a,h
	ld [W_DAMAGE],a
	ld a,l
	ld [W_DAMAGE + 1],a
	ld hl,wd05b
	set 7,[hl]
.skipSameTypeAttackBonus
	ld a,[wd11e]
	ld b,a ; b = move type
	ld hl,TypeEffects
.loop
	ld a,[hli] ; a = "attacking type" of the current type pair
	cp a,$ff
	jr z,.done
	cp b ; does move type match "attacking type"?
	jr nz,.nextTypePair
	ld a,[hl] ; a = "defending type" of the current type pair
	cp d ; does type 1 of defender match "defending type"?
	jr z,.matchingPairFound
	cp e ; does type 2 of defender match "defending type"?
	jr z,.matchingPairFound
	jr .nextTypePair
.matchingPairFound
; if the move type matches the "attacking type" and one of the defender's types matches the "defending type"
	push hl
	push bc
	inc hl
	ld a,[wd05b]
	and a,$80
	ld b,a
	ld a,[hl] ; a = damage multiplier
	ld [H_MULTIPLIER],a
	add b
	ld [wd05b],a
	xor a
	ld [H_MULTIPLICAND],a
	ld hl,W_DAMAGE
	ld a,[hli]
	ld [H_MULTIPLICAND + 1],a
	ld a,[hld]
	ld [H_MULTIPLICAND + 2],a
	call Multiply
	ld a,10
	ld [H_DIVISOR],a
	ld b,$04
	call Divide
	ld a,[H_QUOTIENT + 2]
	ld [hli],a
	ld b,a
	ld a,[H_QUOTIENT + 3]
	ld [hl],a
	or b ; is damage 0?
	jr nz,.skipTypeImmunity
.typeImmunity
; if damage is 0, make the move miss
; this only occurs if a move that would do 2 or 3 damage is 0.25x effective against the target
	inc a
	ld [W_MOVEMISSED],a
.skipTypeImmunity
	pop bc
	pop hl
.nextTypePair
	inc hl
	inc hl
	jp .loop
.done
	ret

; function to tell how effective the type of an enemy attack is on the player's current pokemon
; this doesn't take into account the effects that dual types can have
; (e.g. 4x weakness / resistance, weaknesses and resistances canceling)
; the result is stored in [wd11e]
; ($05 is not very effective, $10 is neutral, $14 is super effective)
; as far is can tell, this is only used once in some AI code to help decide which move to use
AIGetTypeEffectiveness: ; 3e449 (f:6449)
	ld a,[W_ENEMYMOVETYPE]
	ld d,a                 ; d = type of enemy move
	ld hl,wBattleMonType
	ld b,[hl]              ; b = type 1 of player's pokemon
	inc hl
	ld c,[hl]              ; c = type 2 of player's pokemon
	ld a,$10
	ld [wd11e],a           ; initialize [wd11e] to neutral effectiveness
	ld hl,TypeEffects
.loop
	ld a,[hli]
	cp a,$ff
	ret z
	cp d                   ; match the type of the move
	jr nz,.nextTypePair1
	ld a,[hli]
	cp b                   ; match with type 1 of pokemon
	jr z,.done
	cp c                   ; or match with type 2 of pokemon
	jr z,.done
	jr .nextTypePair2
.nextTypePair1
	inc hl
.nextTypePair2
	inc hl
	jr .loop
.done
	ld a,[hl]
	ld [wd11e],a           ; store damage multiplier
	ret

INCLUDE "data/type_effects.asm"

; some tests that need to pass for a move to hit
MoveHitTest: ; 3e56b (f:656b)
; player's turn
	ld hl,W_ENEMYBATTSTATUS1
	ld de,W_PLAYERMOVEEFFECT
	ld bc,wEnemyMonStatus
	ld a,[H_WHOSETURN]
	and a
	jr z,.dreamEaterCheck
; enemy's turn
	ld hl,W_PLAYERBATTSTATUS1
	ld de,W_ENEMYMOVEEFFECT
	ld bc,wBattleMonStatus
.dreamEaterCheck
	ld a,[de]
	cp a,DREAM_EATER_EFFECT
	jr nz,.swiftCheck
	ld a,[bc]
	and a,$07 ; is the target pokemon sleeping?
	jp z,.moveMissed
.swiftCheck
	ld a,[de]
	cp a,SWIFT_EFFECT
	ret z ; Swift never misses (interestingly, Azure Heights lists this is a myth, but it appears to be true)
	call CheckTargetSubstitute ; substitute check (note that this overwrites a)
	jr z,.checkForDigOrFlyStatus
; this code is buggy. it's supposed to prevent HP draining moves from working on substitutes.
; since $7b79 overwrites a with either $00 or $01, it never works.
	cp a,DRAIN_HP_EFFECT
	jp z,.moveMissed
	cp a,DREAM_EATER_EFFECT
	jp z,.moveMissed
.checkForDigOrFlyStatus
	bit 6,[hl]
	jp nz,.moveMissed
	ld a,[H_WHOSETURN]
	and a
	jr nz,.enemyTurn
.playerTurn
; this checks if the move effect is disallowed by mist
	ld a,[W_PLAYERMOVEEFFECT]
	cp a,ATTACK_DOWN1_EFFECT
	jr c,.skipEnemyMistCheck
	cp a,BIDE_EFFECT
	jr c,.enemyMistCheck
	cp a,$3a
	jr c,.skipEnemyMistCheck
	cp a,POISON_EFFECT
	jr c,.enemyMistCheck
	jr .skipEnemyMistCheck
.enemyMistCheck
; if move effect is from $12 to $19 inclusive or $3a to $41 inclusive
; i.e. the following moves
; GROWL, TAIL WHIP, LEER, STRING SHOT, SAND-ATTACK, SMOKESCREEN, KINESIS,
; FLASH, CONVERSION, HAZE*, SCREECH, LIGHT SCREEN*, REFLECT*
; the moves that are marked with an asterisk are not affected since this
; function is not called when those moves are used
; XXX are there are any others like those three?
	ld a,[W_ENEMYBATTSTATUS2]
	bit 1,a ; is mon protected by mist?
	jp nz,.moveMissed
.skipEnemyMistCheck
	ld a,[W_PLAYERBATTSTATUS2]
	bit 0,a ; is the player using X Accuracy?
	ret nz ; if so, always hit regardless of accuracy/evasion
	jr .calcHitChance
.enemyTurn
	ld a,[W_ENEMYMOVEEFFECT]
	cp a,ATTACK_DOWN1_EFFECT
	jr c,.skipPlayerMistCheck
	cp a,BIDE_EFFECT
	jr c,.playerMistCheck
	cp a,$3a
	jr c,.skipPlayerMistCheck
	cp a,POISON_EFFECT
	jr c,.playerMistCheck
	jr .skipPlayerMistCheck
.playerMistCheck
; similar to enemy mist check
	ld a,[W_PLAYERBATTSTATUS2]
	bit 1,a ; is mon protected by mist?
	jp nz,.moveMissed
.skipPlayerMistCheck
	ld a,[W_ENEMYBATTSTATUS2]
	bit 0,a ; is the enemy using X Accuracy?
	ret nz ; if so, always hit regardless of accuracy/evasion
.calcHitChance
	call CalcHitChance ; scale the move accuracy according to attacker's accuracy and target's evasion
	ld a,[W_PLAYERMOVEACCURACY]
	ld b,a
	ld a,[H_WHOSETURN]
	and a
	jr z,.doAccuracyCheck
	ld a,[W_ENEMYMOVEACCURACY]
	ld b,a
.doAccuracyCheck
; if the random number generated is greater than or equal to the scaled accuracy, the move misses
; note that this means that even the highest accuracy is still just a 255/256 chance, not 100%
	call BattleRandom
	cp b
	jr nc,.moveMissed
	ret
.moveMissed
	xor a
	ld hl,W_DAMAGE ; zero the damage
	ld [hli],a
	ld [hl],a
	inc a
	ld [W_MOVEMISSED],a
	ld a,[H_WHOSETURN]
	and a
	jr z,.playerTurn2
.enemyTurn2
	ld hl,W_ENEMYBATTSTATUS1
	res 5,[hl] ; end multi-turn attack e.g. wrap
	ret
.playerTurn2
	ld hl,W_PLAYERBATTSTATUS1
	res 5,[hl] ; end multi-turn attack e.g. wrap
	ret

; values for player turn
CalcHitChance: ; 3e624 (f:6624)
	ld hl,W_PLAYERMOVEACCURACY
	ld a,[H_WHOSETURN]
	and a
	ld a,[wPlayerMonAccuracyMod]
	ld b,a
	ld a,[wEnemyMonEvasionMod]
	ld c,a
	jr z,.next
; values for enemy turn
	ld hl,W_ENEMYMOVEACCURACY
	ld a,[wEnemyMonAccuracyMod]
	ld b,a
	ld a,[wPlayerMonEvasionMod]
	ld c,a
.next
	ld a,$0e
	sub c
	ld c,a ; c = 14 - EVASIONMOD (this "reflects" the value over 7, so that an increase in the target's evasion decreases the hit chance instead of increasing the hit chance)
; zero the high bytes of the multiplicand
	xor a
	ld [H_MULTIPLICAND],a
	ld [H_MULTIPLICAND + 1],a
	ld a,[hl]
	ld [H_MULTIPLICAND + 2],a ; set multiplicand to move accuracy
	push hl
	ld d,$02 ; loop has two iterations
; loop to do the calculations, the first iteration multiplies by the accuracy ratio and the second iteration multiplies by the evasion ratio
.loop
	push bc
	ld hl, StatModifierRatios  ; $76cb ; stat modifier ratios
	dec b
	sla b
	ld c,b
	ld b,$00
	add hl,bc ; hl = address of stat modifier ratio
	pop bc
	ld a,[hli]
	ld [H_MULTIPLIER],a ; set multiplier to the numerator of the ratio
	call Multiply
	ld a,[hl]
	ld [H_DIVISOR],a ; set divisor to the the denominator of the ratio (the dividend is the product of the previous multiplication)
	ld b,$04 ; number of bytes in the dividend
	call Divide
	ld a,[H_QUOTIENT + 3]
	ld b,a
	ld a,[H_QUOTIENT + 2]
	or b
	jp nz,.nextCalculation
; make sure the result is always at least one
	ld [H_QUOTIENT + 2],a
	ld a,$01
	ld [H_QUOTIENT + 3],a
.nextCalculation
	ld b,c
	dec d
	jr nz,.loop
	ld a,[H_QUOTIENT + 2]
	and a ; is the calculated hit chance over 0xFF?
	ld a,[H_QUOTIENT + 3]
	jr z,.storeAccuracy
; if calculated hit chance over 0xFF
	ld a,$ff ; set the hit chance to 0xFF
.storeAccuracy
	pop hl
	ld [hl],a ; store the hit chance in the move accuracy variable
	ret

; multiplies damage by a random percentage from ~85% to 100%
RandomizeDamage: ; 3e687 (f:6687)
	ld hl, W_DAMAGE
	ld a, [hli]
	and a
	jr nz, .DamageGreaterThanOne
	ld a, [hl]
	cp 2
	ret c ; return if damage is equal to 0 or 1
.DamageGreaterThanOne
	xor a
	ld [H_MULTIPLICAND], a
	dec hl
	ld a, [hli]
	ld [H_MULTIPLICAND + 1], a
	ld a, [hl]
	ld [H_MULTIPLICAND + 2], a
; loop until a random number greater than or equal to 217 is generated
.loop
	call BattleRandom
	rrca
	cp 217
	jr c, .loop
	ld [H_MULTIPLIER], a
	call Multiply ; multiply damage by the random number, which is in the range [217, 255]
	ld a, 255
	ld [H_DIVISOR], a
	ld b, $4
	call Divide ; divide the result by 255
; store the modified damage
	ld a, [H_QUOTIENT + 2]
	ld hl, W_DAMAGE
	ld [hli], a
	ld a, [H_QUOTIENT + 3]
	ld [hl], a
	ret

ExecuteEnemyMove: ; 3e6bc (f:66bc)
	ld a, [wEnemySelectedMove]
	inc a
	jp z, Func_3e88c
	call PrintGhostText
	jp z, Func_3e88c
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .asm_3e6dc
	ld b, $1
	ld a, [wcc3e]
	cp $e
	jr z, .asm_3e6dc
	cp $4
	ret nc
.asm_3e6dc
	ld hl, wccd5
	inc [hl]
	xor a
	ld [W_MOVEMISSED], a
	ld [wccf4], a
	ld a, $a
	ld [wd05b], a
	call CheckEnemyStatusConditions
	jr nz, .canUseMove
	jp [hl]
.canUseMove
	ld hl, W_ENEMYBATTSTATUS1
	bit 4, [hl] ; is the enemy charging up for attack?
	jr nz, asm_3e70b ; if so, jump
	call GetCurrentMove

Func_3e6fc: ; 3e6fc (f:66fc)
	ld a, [W_ENEMYMOVEEFFECT]
	cp CHARGE_EFFECT
	jp z, JumpMoveEffect
	cp FLY_EFFECT
	jp z, JumpMoveEffect
	jr asm_3e72b
asm_3e70b: ; 3e70b (f:670b)
	ld hl, W_ENEMYBATTSTATUS1
	res 4, [hl] ; no longer charging up for attack
	res 6, [hl] ; no longer invulnerable to typical attacks
	ld a, [W_ENEMYMOVENUM]
	ld [wd0b5], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [W_LISTTYPE], a
	call GetName
	ld de, wcd6d
	call CopyStringToCF4B
asm_3e72b: ; 3e72b (f:672b)
	xor a
	ld [wcced], a
	call PrintMonName1Text
	ld a, [W_ENEMYMOVEEFFECT]
	ld hl, EffectsArray1
	ld de, $1
	call IsInArray
	jp c, JumpMoveEffect
	ld a, [W_ENEMYMOVEEFFECT]
	ld hl, EffectsArray5B
	ld de, $1
	call IsInArray
	call c, JumpMoveEffect
asm_3e750: ; 3e750 (f:6750)
	call SwapPlayerAndEnemyLevels
	ld a, [W_ENEMYMOVEEFFECT]
	ld hl, EffectsArray2
	ld de, $1
	call IsInArray
	jp c, Func_3e77f
	call CriticalHitTest
	call HandleCounterMove
	jr z, asm_3e782
	call SwapPlayerAndEnemyLevels
	call GetDamageVarsForEnemyAttack
	call SwapPlayerAndEnemyLevels
	call CalculateDamage
	jp z, Func_3e7d1
	call AdjustDamageForMoveType
	call RandomizeDamage

Func_3e77f: ; 3e77f (f:677f)
	call MoveHitTest
asm_3e782: ; 3e782 (f:6782)
	ld a, [W_MOVEMISSED]
	and a
	jr z, .asm_3e791
	ld a, [W_ENEMYMOVEEFFECT]
	cp EXPLODE_EFFECT
	jr z, asm_3e7a0
	jr Func_3e7d1
.asm_3e791
	call SwapPlayerAndEnemyLevels

Func_3e794: ; 3e794 (f:6794)
	ld a, [W_ENEMYMOVEEFFECT]
	and a
	ld a, $1
	jr z, asm_3e7a4
	ld a, $2
	jr asm_3e7a4
asm_3e7a0: ; 3e7a0 (f:67a0)
	call SwapPlayerAndEnemyLevels
	xor a
asm_3e7a4: ; 3e7a4 (f:67a4)
	push af
	ld a, [W_ENEMYBATTSTATUS2]
	bit 4, a ; does mon have a substitute?
	ld hl, Func_79747
	ld b, BANK(Func_79747)
	call nz, Bankswitch
	pop af
	ld [wcc5b], a
	ld a, [W_ENEMYMOVENUM]
	call PlayMoveAnimation
	call Func_3eed3
	call DrawEnemyHUDAndHPBar
	ld a, [W_ENEMYBATTSTATUS2]
	bit 4, a ; does mon have a substitute?
	ld hl, Func_79771
	ld b, BANK(Func_79771)
	call nz, Bankswitch ; slide the substitute's sprite out
	jr asm_3e7ef

Func_3e7d1: ; 3e7d1 (f:67d1)
	call SwapPlayerAndEnemyLevels
	ld c, $1e
	call DelayFrames
	ld a, [W_ENEMYMOVEEFFECT]
	cp FLY_EFFECT
	jr z, .asm_3e7e6
	cp CHARGE_EFFECT
	jr z, .asm_3e7e6
	jr asm_3e7ef
.asm_3e7e6
	xor a
	ld [wcc5b], a
	ld a,STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
asm_3e7ef: ; 3e7ef (f:67ef)
	ld a, [W_ENEMYMOVEEFFECT]
	cp MIRROR_MOVE_EFFECT
	jr nz, .notMirrorMoveEffect
	call MirrorMoveCopyMove
	jp z, Func_3e88c
	jp Func_3e6fc
.notMirrorMoveEffect
	cp METRONOME_EFFECT
	jr nz, .notMetronomeEffect
	call MetronomePickMove
	jp Func_3e6fc
.notMetronomeEffect
	ld a, [W_ENEMYMOVEEFFECT]
	ld hl, EffectsArray3
	ld de, $1
	call IsInArray
	jp c, JumpMoveEffect
	ld a, [W_MOVEMISSED]
	and a
	jr z, .asm_3e82b
	call PrintMoveFailureText
	ld a, [W_ENEMYMOVEEFFECT]
	cp EXPLODE_EFFECT
	jr z, .asm_3e83e
	jp Func_3e88c
.asm_3e82b
	call ApplyAttackToPlayerPokemon
	call PrintCriticalOHKOText
	callab DisplayEffectiveness
	ld a, 1
	ld [wccf4], a
.asm_3e83e
	ld a, [W_ENEMYMOVEEFFECT]
	ld hl, EffectsArray4
	ld de, $1
	call IsInArray
	call c, JumpMoveEffect
	ld hl, wBattleMonHP
	ld a, [hli]
	ld b, [hl]
	or b
	ret z
	call HandleBuildingRage
	ld hl, W_ENEMYBATTSTATUS1
	bit 2, [hl] ; is mon hitting multiple times? (example: double kick)
	jr z, .asm_3e873
	push hl
	ld hl, wEnemyNumAttacksLeft
	dec [hl]
	pop hl
	jp nz, Func_3e794
	res 2, [hl] ; mon is no longer hitting multiple times
	ld hl, HitXTimesText
	call PrintText
	xor a
	ld [wcd05], a
.asm_3e873
	ld a, [W_ENEMYMOVEEFFECT]
	and a
	jr z, Func_3e88c
	ld hl, EffectsArray5
	ld de, $1
	call IsInArray
	call nc, JumpMoveEffect
	jr Func_3e88c

HitXTimesText: ; 3e887 (f:6887)
	TX_FAR _HitXTimesText
	db "@"

Func_3e88c: ; 3e88c (f:688c)
	ld b, $1
	ret

; checks for various status conditions affecting the enemy mon
; stores whether the mon cannot use a move this turn in Z flag
CheckEnemyStatusConditions: ; 3e88f (f:688f)
	ld hl, wEnemyMonStatus
	ld a, [hl]
	and SLP ; sleep mask
	jr z, .checkIfFrozen
	dec a ; decrement number of turns left
	ld [wEnemyMonStatus], a
	and a
	jr z, .wokeUp ; if the number of turns hit 0, wake up
	ld hl, FastAsleepText
	call PrintText
	xor a
	ld [wcc5b], a
	ld a,SLP_ANIM
	call PlayMoveAnimation
	jr .next1
.wokeUp
	ld hl, WokeUpText
	call PrintText
.next1
	xor a
	ld [wccf2], a
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfFrozen
	bit FRZ, [hl]
	jr z, .checkIfTrapped
	ld hl, IsFrozenText
	call PrintText
	xor a
	ld [wccf2], a
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfTrapped
	ld a, [W_PLAYERBATTSTATUS1]
	bit 5, a ; is the player using a multi-turn attack like warp
	jp z, .checkIfFlinched
	ld hl, CantMoveText
	call PrintText
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfFlinched
	ld hl, W_ENEMYBATTSTATUS1
	bit 3, [hl] ; check if enemy mon flinched
	jp z, .checkIfMustRecharge
	res 3, [hl]
	ld hl, FlinchedText
	call PrintText
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfMustRecharge
	ld hl, W_ENEMYBATTSTATUS2
	bit 5, [hl] ; check if enemy mon has to recharge after using a move
	jr z, .checkIfAnyMoveDisabled
	res 5, [hl]
	ld hl, MustRechargeText
	call PrintText
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfAnyMoveDisabled
	ld hl, W_ENEMYDISABLEDMOVE
	ld a, [hl]
	and a
	jr z, .checkIfConfused
	dec a
	ld [hl], a
	and $f
	jr nz, .checkIfConfused
	ld [hl], a
	ld [wccef], a
	ld hl, DisabledNoMoreText
	call PrintText
.checkIfConfused
	ld a, [W_ENEMYBATTSTATUS1]
	add a ; check if enemy mon is confused
	jp nc, .checkIfTriedToUseDisabledMove
	ld hl, wd070
	dec [hl]
	jr nz, .isConfused
	ld hl, W_ENEMYBATTSTATUS1
	res 7, [hl]
	ld hl, ConfusedNoMoreText
	call PrintText
	jp .checkIfTriedToUseDisabledMove
.isConfused
	ld hl, IsConfusedText
	call PrintText
	xor a
	ld [wcc5b], a
	ld a,CONF_ANIM
	call PlayMoveAnimation
	call BattleRandom
	cp $80
	jr c, .checkIfTriedToUseDisabledMove
	ld hl, W_ENEMYBATTSTATUS1
	ld a, [hl]
	and $80
	ld [hl], a
	ld hl, HurtItselfText
	call PrintText
	ld hl, wBattleMonDefense
	ld a, [hli]
	push af
	ld a, [hld]
	push af
	ld a, [wEnemyMonDefense]
	ld [hli], a
	ld a, [wEnemyMonDefense + 1]
	ld [hl], a
	ld hl, W_ENEMYMOVEEFFECT
	push hl
	ld a, [hl]
	push af
	xor a
	ld [hli], a
	ld [wCriticalHitOrOHKO], a
	ld a, $28
	ld [hli], a
	xor a
	ld [hl], a
	call GetDamageVarsForEnemyAttack
	call CalculateDamage
	pop af
	pop hl
	ld [hl], a
	ld hl, wBattleMonDefense + 1
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	xor a
	ld [wcc5b], a
	ld [H_WHOSETURN], a
	ld a, POUND
	call PlayMoveAnimation
	ld a, $1
	ld [H_WHOSETURN], a
	call ApplyDamageToEnemyPokemon
	jr .monHurtItselfOrFullyParalysed
.checkIfTriedToUseDisabledMove
	ld a, [wccef]
	and a
	jr z, .checkIfParalysed
	ld hl, wEnemySelectedMove
	cp [hl]
	jr nz, .checkIfParalysed
	call PrintMoveIsDisabledText
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfParalysed
	ld hl, wEnemyMonStatus
	bit PAR, [hl]
	jr z, .checkIfUsingBide
	call BattleRandom
	cp $3f
	jr nc, .checkIfUsingBide
	ld hl, FullyParalyzedText
	call PrintText
.monHurtItselfOrFullyParalysed
	ld hl, W_ENEMYBATTSTATUS1
	ld a, [hl]
	and $cc ; clear bide, thrashing, charging up, and multi-turn moves such as warp
	ld [hl], a
	ld a, [W_ENEMYMOVEEFFECT]
	cp FLY_EFFECT
	jr z, .flyOrChargeEffect
	cp CHARGE_EFFECT
	jr z, .flyOrChargeEffect
	jr .notFlyOrChargeEffect
.flyOrChargeEffect
	xor a
	ld [wcc5b], a
	ld a, STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
.notFlyOrChargeEffect
	ld hl, Func_3e88c
	jp .cannotUseMove
.checkIfUsingBide
	ld hl, W_ENEMYBATTSTATUS1
	bit 0, [hl] ; is mon using bide?
	jr z, .checkIfThrashingAbout
	xor a
	ld [W_ENEMYMOVENUM], a
	ld hl, W_DAMAGE
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wcd06
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, wEnemyNumAttacksLeft
	dec [hl]
	jr z, .unleashEnergy
	ld hl, Func_3e88c
	jp .cannotUseMove
.unleashEnergy
	ld hl, W_ENEMYBATTSTATUS1
	res 0, [hl] ; not using bide any more
	ld hl, UnleashedEnergyText
	call PrintText
	ld a, $1
	ld [W_ENEMYMOVEPOWER], a
	ld hl, wcd06
	ld a, [hld]
	add a
	ld b, a
	ld [wd0d8], a
	ld a, [hl]
	rl a
	ld [W_DAMAGE], a
	or b
	jr nz, .next2
	ld a, $1
	ld [W_MOVEMISSED], a
.next2
	xor a
	ld [hli], a
	ld [hl], a
	ld a, BIDE
	ld [W_ENEMYMOVENUM], a
	call SwapPlayerAndEnemyLevels
	ld hl, asm_3e782
	jp .cannotUseMove
.checkIfThrashingAbout
	bit 1, [hl] ; is mon using thrash or petal dance?
	jr z, .checkIfUsingMultiturnMove
	ld a, THRASH
	ld [W_ENEMYMOVENUM], a
	ld hl, ThrashingAboutText
	call PrintText
	ld hl, wEnemyNumAttacksLeft
	dec [hl]
	ld hl, asm_3e750
	jp nz, .cannotUseMove
	push hl
	ld hl, W_ENEMYBATTSTATUS1
	res 1, [hl] ; mon is no longer using thrash or petal dance
	set 7, [hl] ; mon is now confused
	call BattleRandom
	and $3
	inc a
	inc a
	ld [wd070], a
	pop hl
	jp .cannotUseMove
.checkIfUsingMultiturnMove
	bit 5, [hl] ; is mon using multi-turn move?
	jp z, .checkIfUsingRage
	ld hl, AttackContinuesText
	call PrintText
	ld hl, wEnemyNumAttacksLeft
	dec [hl]
	ld hl, Func_3e794
	jp nz, .cannotUseMove
	jp .cannotUseMove
.checkIfUsingRage
	ld a, [W_ENEMYBATTSTATUS2]
	bit 6, a ; is mon using rage?
	jp z, .canUseMove
	ld a, RAGE
	ld [wd11e], a
	call GetMoveName
	call CopyStringToCF4B
	xor a
	ld [W_ENEMYMOVEEFFECT], a
	ld hl, asm_3e72b
	jp .cannotUseMove
.cannotUseMove
	xor a ; set Z flag
	ret
.canUseMove
	ld a, $1
	and a ; clear Z flag
	ret

GetCurrentMove: ; 3eabe (f:6abe)
	ld a, [H_WHOSETURN]
	and a
	jp z, .player
	ld de, W_ENEMYMOVENUM
	ld a, [wEnemySelectedMove]
	jr .selected
.player
	ld de, W_PLAYERMOVENUM
	ld a, [W_FLAGS_D733]
	bit 0, a
	ld a, [wccd9]
	jr nz, .selected
	ld a, [wPlayerSelectedMove]
.selected
	ld [wd0b5], a
	dec a
	ld hl, Moves
	ld bc, $6
	call AddNTimes
	ld a, BANK(Moves)
	call FarCopyData

	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [W_LISTTYPE], a
	call GetName
	ld de, wcd6d
	jp CopyStringToCF4B

LoadEnemyMonData: ; 3eb01 (f:6b01)
	ld a, [W_ISLINKBATTLE]
	cp $4
	jp z, LoadEnemyMonFromParty
	ld a, [wEnemyMonSpecies2]
	ld [wEnemyMonSpecies], a
	ld [wd0b5], a
	call GetMonHeader
	ld a, [W_ENEMYBATTSTATUS3]
	bit 3, a ; is enemy mon transformed?
	ld hl, wcceb ; copied DVs from when it used Transform
	ld a, [hli]
	ld b, [hl]
	jr nz, .storeDVs
	ld a, [W_ISINBATTLE]
	cp $2 ; is it a trainer battle?
; fixed DVs for trainer mon
	ld a, $98
	ld b, $88
	jr z, .storeDVs
; random DVs for wild mon
	call BattleRandom
	ld b, a
	call BattleRandom
.storeDVs
	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], b
	ld de, wEnemyMonLevel
	ld a, [W_CURENEMYLVL]
	ld [de], a
	inc de
	ld b, $0
	ld hl, wEnemyMonHP
	push hl
	call CalcStats
	pop hl
	ld a, [W_ISINBATTLE]
	cp $2 ; is it a trainer battle?
	jr z, .copyHPAndStatusFromPartyData
	ld a, [W_ENEMYBATTSTATUS3]
	bit 3, a ; is enemy mon transformed?
	jr nz, .copyTypes ; if transformed, jump
; if it's a wild mon and not transformed, init the current HP to max HP and the status to 0
	ld a, [wEnemyMonMaxHP]
	ld [hli], a
	ld a, [wEnemyMonMaxHP+1]
	ld [hli], a
	xor a
	inc hl
	ld [hl], a ; init status to 0
	jr .copyTypes
; if it's a trainer mon, copy the HP and status from the enemy party data
.copyHPAndStatusFromPartyData
	ld hl, wEnemyMon1HP
	ld a, [wWhichPokemon]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [hli]
	ld [wEnemyMonHP], a
	ld a, [hli]
	ld [wEnemyMonHP + 1], a
	ld a, [wWhichPokemon]
	ld [wEnemyMonPartyPos], a
	inc hl
	ld a, [hl]
	ld [wEnemyMonStatus], a
	jr .copyTypes
.copyTypes
	ld hl, W_MONHTYPES
	ld de, wEnemyMonType
	ld a, [hli]            ; copy type 1
	ld [de], a
	inc de
	ld a, [hli]            ; copy type 2
	ld [de], a
	inc de
	ld a, [hli]            ; copy catch rate
	ld [de], a
	inc de
	ld a, [W_ISINBATTLE]
	cp $2 ; is it a trainer battle?
	jr nz, .copyStandardMoves
; if it's a trainer battle, copy moves from enemy party data
	ld hl, wEnemyMon1Moves
	ld a, [wWhichPokemon]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld bc, NUM_MOVES
	call CopyData
	jr .loadMovePPs
.copyStandardMoves
; for a wild mon, first copy default moves from the mon header
	ld hl, W_MONHMOVES
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	dec de
	dec de
	dec de
	xor a
	ld [wHPBarMaxHP], a
	predef WriteMonMoves ; get moves based on current level
.loadMovePPs
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonSpecial + 1
	predef LoadMovePPs
	ld hl, W_MONHBASESTATS
	ld de, wEnemyMonBaseStats
	ld b, $5
.copyBaseStatsLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyBaseStatsLoop
	ld hl, W_MONHCATCHRATE
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]     ; base exp
	ld [de], a
	ld a, [wEnemyMonSpecies2]
	ld [wd11e], a
	call GetMonName
	ld hl, wcd6d
	ld de, wEnemyMonNick
	ld bc, $b
	call CopyData
	ld a, [wEnemyMonSpecies2]
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexSeen
	predef FlagActionPredef ; mark this mon as seen in the pokedex
	ld hl, wEnemyMonLevel
	ld de, wEnemyMonUnmodifiedLevel
	ld bc, $b
	call CopyData
	ld a, $7 ; default stat mod
	ld b, $8 ; number of stat mods
	ld hl, wEnemyMonStatMods
.statModLoop
	ld [hli], a
	dec b
	jr nz, .statModLoop
	ret

; calls BattleTransition to show the battle transition animation and initializes some battle variables
DoBattleTransitionAndInitBattleVariables: ; 3ec32 (f:6c32)
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .next
; link battle
	xor a
	ld [wMenuJoypadPollCount], a
	callab DisplayLinkBattleVersusTextBox
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	call ClearScreen
.next
	call DelayFrame
	predef BattleTransition
	callab LoadHudAndHpBarAndStatusTilePatterns
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	call ClearScreen
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld [hWY], a
	ld [rWY], a
	ld [hTilesetType], a
	ld hl, wd060
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [W_PLAYERDISABLEDMOVE], a
	ret

; swaps the level values of the BattleMon and EnemyMon structs
SwapPlayerAndEnemyLevels: ; 3ec81 (f:6c81)
	push bc
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wEnemyMonLevel]
	ld [wBattleMonLevel], a
	ld a, b
	ld [wEnemyMonLevel], a
	pop bc
	ret

; loads either red back pic or old man back pic
; also writes OAM data and loads tile patterns for the Red or Old Man back sprite's head
; (for use when scrolling the player sprite and enemy's silhouettes on screen)
LoadPlayerBackPic: ; 3ec92 (f:6c92)
	ld a, [W_BATTLETYPE]
	dec a ; is it the old man tutorial?
	ld de, RedPicBack
	jr nz, .next
	ld de, OldManPic
.next
	ld a, BANK(RedPicBack)
	call UncompressSpriteFromDE
	predef ScaleSpriteByTwo
	ld hl, wOAMBuffer
	xor a
	ld [$FF8B], a ; initial tile number
	ld b, $7 ; 7 columns
	ld e, $a0 ; X for the left-most column
.loop ; each loop iteration writes 3 OAM entries in a vertical column
	ld c, $3 ; 3 tiles per column
	ld d, $38 ; Y for the top of each column
.innerLoop ; each loop iteration writes 1 OAM entry in the column
	ld [hl], d ; OAM Y
	inc hl
	ld [hl], e ; OAM X
	ld a, $8 ; height of tile
	add d ; increase Y by height of tile
	ld d, a
	inc hl
	ld a, [$FF8B]
	ld [hli], a ; OAM tile number
	inc a ; increment tile number
	ld [$FF8B], a
	inc hl
	dec c
	jr nz, .innerLoop
	ld a, [$FF8B]
	add $4 ; increase tile number by 4
	ld [$FF8B], a
	ld a, $8 ; width of tile
	add e ; increase X by width of tile
	ld e, a
	dec b
	jr nz, .loop
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers
	ld a, $a
	ld [$0], a
	xor a
	ld [$4000], a
	ld hl, vSprites
	ld de, S_SPRITEBUFFER1
	ld a, [H_LOADEDROMBANK]
	ld b, a
	ld c, 7 * 7
	call CopyVideoData
	xor a
	ld [$0], a
	ld a, $31
	ld [$ffe1], a
	hlCoord 1, 5
	predef_jump Func_3f0c6

Func_3ed02: ; 3ed02 (f:6d02)
	callab Func_39680
	ld hl, Func_396a7
	ld b, BANK(Func_396a7)
	jp Bankswitch

ScrollTrainerPicAfterBattle: ; 3ed12 (f:6d12)
	ld hl, _ScrollTrainerPicAfterBattle
	ld b, BANK(_ScrollTrainerPicAfterBattle)
	jp Bankswitch

ApplyBurnAndParalysisPenaltiesToPlayer: ; 3ed1a (f:6d1a)
	ld a, $1
	jr ApplyBurnAndParalysisPenalties

ApplyBurnAndParalysisPenaltiesToEnemy: ; 3ed1e (f:6d1e)
	xor a

ApplyBurnAndParalysisPenalties: ; 3ed1f (f:6d1f)
	ld [H_WHOSETURN], a
	call QuarterSpeedDueToParalysis
	jp HalveAttackDueToBurn

QuarterSpeedDueToParalysis: ; 3ed27 (f:6d27)
	ld a, [H_WHOSETURN]
	and a
	jr z, .playerTurn
.enemyTurn ; quarter the player's speed
	ld a, [wBattleMonStatus]
	and 1 << PAR
	ret z ; return if player not paralysed
	ld hl, wBattleMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .storePlayerSpeed
	ld b, 1 ; give the player a minimum of at least one speed point
.storePlayerSpeed
	ld [hl], b
	ret
.playerTurn ; quarter the enemy's speed
	ld a, [wEnemyMonStatus]
	and 1 << PAR
	ret z ; return if enemy not paralysed
	ld hl, wEnemyMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .storeEnemySpeed
	ld b, 1 ; give the enemy a minimum of at least one speed point
.storeEnemySpeed
	ld [hl], b
	ret

HalveAttackDueToBurn: ; 3ed64 (f:6d64)
	ld a, [H_WHOSETURN]
	and a
	jr z, .playerTurn
.enemyTurn ; halve the player's attack
	ld a, [wBattleMonStatus]
	and 1 << BRN
	ret z ; return if player not burnt
	ld hl, wBattleMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .storePlayerAttack
	ld b, 1 ; give the player a minimum of at least one attack point
.storePlayerAttack
	ld [hl], b
	ret
.playerTurn ; halve the enemy's attack
	ld a, [wEnemyMonStatus]
	and 1 << BRN
	ret z ; return if enemy not burnt
	ld hl, wEnemyMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .storeEnemyAttack
	ld b, 1 ; give the enemy a minimum of at least one attack point
.storeEnemyAttack
	ld [hl], b
	ret

CalculateModifiedStats: ; 3ed99 (f:6d99)
	ld c, 0
.loop
	call CalculateModifiedStat
	inc c
	ld a, c
	cp 4
	jr nz, .loop
	ret

; calculate modified stat for stat c (0 = attack, 1 = defense, 2 = speed, 3 = special)
CalculateModifiedStat: ; 3eda5 (f:6da5)
	push bc
	push bc
	ld a, [wd11e]
	and a
	ld a, c
	ld hl, wBattleMonAttack
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wPlayerMonAttackMod
	jr z, .next
	ld hl, wEnemyMonAttack
	ld de, wEnemyMonUnmodifiedAttack
	ld bc, wEnemyMonStatMods
.next
	add c
	ld c, a
	jr nc, .noCarry1
	inc b
.noCarry1
	ld a, [bc]
	pop bc
	ld b, a
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .noCarry2
	inc d
.noCarry2
	pop bc
	push hl
	ld hl, StatModifierRatios
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	xor a
	ld [H_MULTIPLICAND], a
	ld a, [de]
	ld [H_MULTIPLICAND + 1], a
	inc de
	ld a, [de]
	ld [H_MULTIPLICAND + 2], a
	ld a, [hli]
	ld [H_MULTIPLIER], a
	call Multiply
	ld a, [hl]
	ld [H_DIVISOR], a
	ld b, $4
	call Divide
	pop hl
	ld a, [H_DIVIDEND + 3]
	sub 999 % $100
	ld a, [H_DIVIDEND + 2]
	sbc 999 / $100
	jp c, .storeNewStatValue
; cap the stat at 999
	ld a, 999 / $100
	ld [H_DIVIDEND + 2], a
	ld a, 999 % $100
	ld [H_DIVIDEND + 3], a
.storeNewStatValue
	ld a, [H_DIVIDEND + 2]
	ld [hli], a
	ld b, a
	ld a, [H_DIVIDEND + 3]
	ld [hl], a
	or b
	jr nz, .done
	inc [hl] ; if the stat is 0, bump it up to 1
.done
	pop bc
	ret

ApplyBadgeStatBoosts: ; 3ee19 (f:6e19)
	ld a, [W_ISLINKBATTLE]
	cp $4
	ret z ; return if link battle
	ld a, [W_OBTAINEDBADGES]
	ld b, a
	ld hl, wBattleMonAttack
	ld c, $4
; the boost is applied for badges whose bit position is even
; the order of boosts matches the order they are laid out in RAM
; Boulder (bit 0) - attack
; Thunder (bit 2) - defense
; Soul (bit 4) - speed
; Volcano (bit 6) - special
.loop
	srl b
	call c, .applyBoostToStat
	inc hl
	inc hl
	srl b
	dec c
	jr nz, .loop
	ret

; multiply stat at hl by 1.125
; cap stat at 999
.applyBoostToStat
	ld a, [hli]
	ld d, a
	ld e, [hl]
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hli], a
	ld a, [hld]
	sub 999 % $100
	ld a, [hl]
	sbc 999 / $100
	ret c
	ld a, 999 / $100
	ld [hli], a
	ld a, 999 % $100
	ld [hld], a
	ret

LoadHudAndHpBarAndStatusTilePatterns: ; 3ee58 (f:6e58)
	call LoadHpBarAndStatusTilePatterns

LoadHudTilePatterns: ; 3ee5b (f:6e5b)
	ld a, [rLCDC]
	add a ; is LCD disabled?
	jr c, .lcdEnabled
.lcdDisabled
	ld hl, BattleHudTiles1
	ld de, vChars2 + $6d0
	ld bc, $18
	ld a, BANK(BattleHudTiles1)
	call FarCopyDataDouble
	ld hl, BattleHudTiles2
	ld de, vChars2 + $730
	ld bc, $30
	ld a, BANK(BattleHudTiles2)
	jp FarCopyDataDouble
.lcdEnabled
	ld de, BattleHudTiles1
	ld hl, vChars2 + $6d0
	ld bc, (BANK(BattleHudTiles1) << 8) + $03
	call CopyVideoDataDouble
	ld de, BattleHudTiles2
	ld hl, vChars2 + $730
	ld bc, (BANK(BattleHudTiles2) << 8) + $06
	jp CopyVideoDataDouble

PrintEmptyString: ; 3ee94 (f:6e94)
	ld hl, .emptyString
	jp PrintText
.emptyString
	db "@"


BattleRandom:
; Link battles use a shared PRNG.

	ld a, [W_ISLINKBATTLE]
	cp $4
	jp nz, Random

	push hl
	push bc
	ld a, [wccde]
	ld c, a
	ld b, 0
	ld hl, wd148
	add hl, bc
	inc a
	ld [wccde], a
	cp 9
	ld a, [hl]
	pop bc
	pop hl
	ret c

	push hl
	push bc
	push af

	xor a
	ld [wccde], a

	ld hl, wd148
	ld b, 9
.loop
	ld a, [hl]
	ld c, a
	add a
	add a
	add c
	inc a
	ld [hli], a
	dec b
	jr nz, .loop

	pop af
	pop bc
	pop hl
	ret


Func_3eed3: ; 3eed3 (f:6ed3)
	ld a, [H_WHOSETURN]
	and a
	ld hl, wEnemyMonType1 ; wcfea (aliases: wEnemyMonType)
	ld de, W_ENEMYBATTSTATUS1
	ld a, [W_PLAYERMOVENUM]
	jr z, .asm_3eeea
	ld hl, wBattleMonType1 ; wd019 (aliases: wBattleMonType)
	ld de, W_ENEMYBATTSTATUS1
	ld a, [W_ENEMYMOVENUM]
.asm_3eeea
	cp SELFDESTRUCT
	jr z, .asm_3eef1
	cp EXPLOSION
	ret nz
.asm_3eef1
	ld a, [de]
	bit 6, a ; fly/dig
	ret nz
	ld a, [hli]
	cp GHOST
	ret z
	ld a, [hl]
	cp GHOST
	ret z
	ld a, [W_MOVEMISSED]
	and a
	ret nz
	ld a, MEGA_PUNCH
	ld [wcc5b], a

PlayMoveAnimation: ; 3ef07 (f:6f07)
	ld [W_ANIMATIONID],a
	call Delay3
	predef_jump MoveAnimation

InitBattle: ; 3ef12 (f:6f12)
	ld a, [W_CUROPPONENT]
	and a
	jr z, asm_3ef23

InitOpponent: ; 3ef18 (f:6f18)
	ld a, [W_CUROPPONENT]
	ld [wcf91], a
	ld [wEnemyMonSpecies2], a
	jr asm_3ef3d
asm_3ef23: ; 3ef23 (f:6f23)
	ld a, [wd732]
	bit 1, a
	jr z, .asm_3ef2f
	ld a, [hJoyHeld]
	bit 1, a ; B button pressed?
	ret nz
.asm_3ef2f
	ld a, [wNumberOfNoRandomBattleStepsLeft]
	and a
	ret nz
	callab Func_13870
	ret nz
asm_3ef3d: ; 3ef3d (f:6f3d)
	ld a, [wMapPalOffset]
	push af
	ld hl, wd358
	ld a, [hl]
	push af
	res 1, [hl]
	callab Func_525af
	ld a, [wEnemyMonSpecies2]
	sub $c8
	jp c, InitWildBattle
	ld [W_TRAINERCLASS], a
	call GetTrainerInformation
	callab ReadTrainer
	call DoBattleTransitionAndInitBattleVariables
	call _LoadTrainerPic
	xor a
	ld [wEnemyMonSpecies2], a
	ld [$ffe1], a
	dec a
	ld [wAICount], a
	hlCoord 12, 0
	predef Func_3f0c6
	ld a, $ff
	ld [wEnemyMonPartyPos], a
	ld a, $2
	ld [W_ISINBATTLE], a
	jp InitBattle_Common

InitWildBattle: ; 3ef8b (f:6f8b)
	ld a, $1
	ld [W_ISINBATTLE], a
	call LoadEnemyMonData
	call DoBattleTransitionAndInitBattleVariables
	ld a, [W_CUROPPONENT]
	cp MAROWAK
	jr z, .isGhost
	call IsGhostBattle
	jr nz, .isNoGhost
.isGhost
	ld hl, W_MONHSPRITEDIM
	ld a, $66
	ld [hli], a   ; write sprite dimensions
	ld bc, GhostPic
	ld a, c
	ld [hli], a   ; write front sprite pointer
	ld [hl], b
	ld hl, wEnemyMonNick  ; set name to "GHOST"
	ld a, "G"
	ld [hli], a
	ld a, "H"
	ld [hli], a
	ld a, "O"
	ld [hli], a
	ld a, "S"
	ld [hli], a
	ld a, "T"
	ld [hli], a
	ld [hl], "@"
	ld a, [wcf91]
	push af
	ld a, MON_GHOST
	ld [wcf91], a
	ld de, vFrontPic
	call LoadMonFrontSprite ; load ghost sprite
	pop af
	ld [wcf91], a
	jr .spriteLoaded
.isNoGhost
	ld de, vFrontPic
	call LoadMonFrontSprite ; load mon sprite
.spriteLoaded
	xor a
	ld [W_TRAINERCLASS], a
	ld [$ffe1], a
	hlCoord 12, 0
	predef Func_3f0c6

; common code that executes after init battle code specific to trainer or wild battles
InitBattle_Common: ; 3efeb (f:6feb)
	ld b, $0
	call GoPAL_SET
	call SlidePlayerAndEnemySilhouettesOnScreen
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld hl, .emptyString
	call PrintText
	call SaveScreenTilesToBuffer1
	call ClearScreen
	ld a, $98
	ld [$ffbd], a
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	ld a, $9c
	ld [$ffbd], a
	call LoadScreenTilesFromBuffer1
	hlCoord 9, 7
	ld bc, $50a
	call ClearScreenArea
	hlCoord 1, 0
	ld bc, $40a
	call ClearScreenArea
	call ClearSprites
	ld a, [W_ISINBATTLE]
	dec a ; is it a wild battle?
	call z, DrawEnemyHUDAndHPBar ; draw enemy HUD and HP bar if it's a wild battle
	call StartBattle
	callab EndOfBattle
	pop af
	ld [wd358], a
	pop af
	ld [wMapPalOffset], a
	ld a, [wd0d4]
	ld [hTilesetType], a
	scf
	ret
.emptyString
	db "@"

_LoadTrainerPic: ; 3f04b (f:704b)
; wd033-wd034 contain pointer to pic
	ld a, [wd033]
	ld e, a
	ld a, [wd034]
	ld d, a ; de contains pointer to trainer pic
	ld a, [W_ISLINKBATTLE]
	and a
	ld a, Bank(TrainerPics) ; this is where all the trainer pics are (not counting Red's)
	jr z, .loadSprite
	ld a, Bank(RedPicFront)
.loadSprite
	call UncompressSpriteFromDE
	ld de, vFrontPic
	ld a, $77
	ld c, a
	jp LoadUncompressedSpriteData

Func_3f069: ; 3f069 (f:7069)
	xor a
	ld [wc0f1], a
	ld [wc0f2], a
	jp PlaySound

Func_3f073: ; 3f073 (f:7073)
	ld a, [wPredefRegisters]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [$ffe1]
	ld [H_DOWNARROWBLINKCNT1], a
	ld b, $4c
	ld a, [W_ISINBATTLE]
	and a
	jr z, .asm_3f0bc
	add b
	ld [hl], a
	call Delay3
	ld bc, -41
	add hl, bc
	ld a, $1
	ld [wcd6c], a
	ld bc, $303
	predef Func_79aba
	ld c, $4
	call DelayFrames
	ld bc, -41
	add hl, bc
	xor a
	ld [wcd6c], a
	ld bc, $505
	predef Func_79aba
	ld c, $5
	call DelayFrames
	ld bc, -41
	jr .asm_3f0bf
.asm_3f0bc
	ld bc, -123
.asm_3f0bf
	add hl, bc
	ld a, [H_DOWNARROWBLINKCNT1]
	add $31
	jr asm_3f0d0

Func_3f0c6: ; 3f0c6 (f:70c6)
	ld a, [wPredefRegisters]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [$ffe1]
asm_3f0d0: ; 3f0d0 (f:70d0)
	ld bc, $707
	ld de, $14
	push af
	ld a, [W_SPRITEFLIPPED]
	and a
	jr nz, .asm_3f0ed
	pop af
.asm_3f0de
	push bc
	push hl
.asm_3f0e0
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .asm_3f0e0
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .asm_3f0de
	ret
.asm_3f0ed
	push bc
	ld b, $0
	dec c
	add hl, bc
	pop bc
	pop af
.asm_3f0f4
	push bc
	push hl
.asm_3f0f6
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .asm_3f0f6
	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .asm_3f0f4
	ret

LoadMonBackPic:
; Assumes the monster's attributes have
; been loaded with GetMonHeader.
	ld a, [wBattleMonSpecies2]
	ld [wcf91], a
	hlCoord 1, 5
	ld b, $7
	ld c, $8
	call ClearScreenArea
	ld hl,  W_MONHBACKSPRITE - W_MONHEADER
	call UncompressMonSprite
	predef ScaleSpriteByTwo
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers ; combine the two buffers to a single 2bpp sprite
	ld hl, vSprites
	ld de, vBackPic
	ld c, (2*SPRITEBUFFERSIZE)/16 ; count of 16-byte chunks to be copied
	ld a, [H_LOADEDROMBANK]
	ld b, a
	jp CopyVideoData

JumpMoveEffect: ; 3f132 (f:7132)
	call _JumpMoveEffect
	ld b, $1
	ret

_JumpMoveEffect: ; 3f138 (f:7138)
	ld a, [$fff3]  ;whose turn?
	and a
	ld a, [W_PLAYERMOVEEFFECT]
	jr z, .next1
	ld a, [W_ENEMYMOVEEFFECT]
.next1
	dec a         ;subtract 1, there is no special effect for 00
	add a         ;x2, 16bit pointers
	ld hl, MoveEffectPointerTable
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]       ;jump to special effect handler

MoveEffectPointerTable: ; 3f150 (f:7150)
	 dw SleepEffect               ; unused effect
	 dw PoisonEffect              ; POISON_SIDE_EFFECT1
	 dw DrainHPEffect             ; DRAIN_HP_EFFECT
	 dw FreezeBurnParalyzeEffect  ; BURN_SIDE_EFFECT1
	 dw FreezeBurnParalyzeEffect  ; FREEZE_SIDE_EFFECT
	 dw FreezeBurnParalyzeEffect  ; PARALYZE_SIDE_EFFECT1
	 dw ExplodeEffect             ; EXPLODE_EFFECT
	 dw DrainHPEffect             ; DREAM_EATER_EFFECT
	 dw $0000                     ; MIRROR_MOVE_EFFECT
	 dw StatModifierUpEffect      ; ATTACK_UP1_EFFECT
	 dw StatModifierUpEffect      ; DEFENSE_UP1_EFFECT
	 dw StatModifierUpEffect      ; SPEED_UP1_EFFECT
	 dw StatModifierUpEffect      ; SPECIAL_UP1_EFFECT
	 dw StatModifierUpEffect      ; ACCURACY_UP1_EFFECT
	 dw StatModifierUpEffect      ; EVASION_UP1_EFFECT
	 dw PayDayEffect              ; PAY_DAY_EFFECT
	 dw $0000                     ; SWIFT_EFFECT
	 dw StatModifierDownEffect    ; ATTACK_DOWN1_EFFECT
	 dw StatModifierDownEffect    ; DEFENSE_DOWN1_EFFECT
	 dw StatModifierDownEffect    ; SPEED_DOWN1_EFFECT
	 dw StatModifierDownEffect    ; SPECIAL_DOWN1_EFFECT
	 dw StatModifierDownEffect    ; ACCURACY_DOWN1_EFFECT
	 dw StatModifierDownEffect    ; EVASION_DOWN1_EFFECT
	 dw ConversionEffect          ; CONVERSION_EFFECT
	 dw HazeEffect                ; HAZE_EFFECT
	 dw BideEffect                ; BIDE_EFFECT
	 dw ThrashPetalDanceEffect    ; THRASH_PETAL_DANCE_EFFECT
	 dw SwitchAndTeleportEffect   ; SWITCH_AND_TELEPORT_EFFECT
	 dw TwoToFiveAttacksEffect    ; TWO_TO_FIVE_ATTACKS_EFFECT
	 dw TwoToFiveAttacksEffect    ; unused effect
	 dw FlichSideEffect           ; FLINCH_SIDE_EFFECT1
	 dw SleepEffect               ; SLEEP_EFFECT
	 dw PoisonEffect              ; POISON_SIDE_EFFECT2
	 dw FreezeBurnParalyzeEffect  ; BURN_SIDE_EFFECT2
	 dw FreezeBurnParalyzeEffect  ; unused effect
	 dw FreezeBurnParalyzeEffect  ; PARALYZE_SIDE_EFFECT2
	 dw FlichSideEffect           ; FLINCH_SIDE_EFFECT2
	 dw OneHitKOEffect            ; OHKO_EFFECT
	 dw ChargeEffect              ; CHARGE_EFFECT
	 dw $0000                     ; SUPER_FANG_EFFECT
	 dw $0000                     ; SPECIAL_DAMAGE_EFFECT
	 dw TrappingEffect            ; TRAPPING_EFFECT
	 dw ChargeEffect              ; FLY_EFFECT
	 dw TwoToFiveAttacksEffect    ; ATTACK_TWICE_EFFECT
	 dw $0000                     ; JUMP_KICK_EFFECT
	 dw MistEffect                ; MIST_EFFECT
	 dw FocusEnergyEffect         ; FOCUS_ENERGY_EFFECT
	 dw RecoilEffect              ; RECOIL_EFFECT
	 dw ConfusionEffect           ; CONFUSION_EFFECT
	 dw StatModifierUpEffect      ; ATTACK_UP2_EFFECT
	 dw StatModifierUpEffect      ; DEFENSE_UP2_EFFECT
	 dw StatModifierUpEffect      ; SPEED_UP2_EFFECT
	 dw StatModifierUpEffect      ; SPECIAL_UP2_EFFECT
	 dw StatModifierUpEffect      ; ACCURACY_UP2_EFFECT
	 dw StatModifierUpEffect      ; EVASION_UP2_EFFECT
	 dw HealEffect                ; HEAL_EFFECT
	 dw TransformEffect           ; TRANSFORM_EFFECT
	 dw StatModifierDownEffect    ; ATTACK_DOWN2_EFFECT
	 dw StatModifierDownEffect    ; DEFENSE_DOWN2_EFFECT
	 dw StatModifierDownEffect    ; SPEED_DOWN2_EFFECT
	 dw StatModifierDownEffect    ; SPECIAL_DOWN2_EFFECT
	 dw StatModifierDownEffect    ; ACCURACY_DOWN2_EFFECT
	 dw StatModifierDownEffect    ; EVASION_DOWN2_EFFECT
	 dw ReflectLightScreenEffect  ; LIGHT_SCREEN_EFFECT
	 dw ReflectLightScreenEffect  ; REFLECT_EFFECT
	 dw PoisonEffect              ; POISON_EFFECT
	 dw ParalyzeEffect            ; PARALYZE_EFFECT
	 dw StatModifierDownEffect    ; ATTACK_DOWN_SIDE_EFFECT
	 dw StatModifierDownEffect    ; DEFENSE_DOWN_SIDE_EFFECT
	 dw StatModifierDownEffect    ; SPEED_DOWN_SIDE_EFFECT
	 dw StatModifierDownEffect    ; SPECIAL_DOWN_SIDE_EFFECT
	 dw StatModifierDownEffect    ; unused effect
	 dw StatModifierDownEffect    ; unused effect
	 dw StatModifierDownEffect    ; unused effect
	 dw StatModifierDownEffect    ; unused effect
	 dw ConfusionSideEffect       ; CONFUSION_SIDE_EFFECT
	 dw TwoToFiveAttacksEffect    ; TWINEEDLE_EFFECT
	 dw $0000                     ; unused effect
	 dw SubstituteEffect          ; SUBSTITUTE_EFFECT
	 dw HyperBeamEffect           ; HYPER_BEAM_EFFECT
	 dw RageEffect                ; RAGE_EFFECT
	 dw MimicEffect               ; MIMIC_EFFECT
	 dw $0000                     ; METRONOME_EFFECT
	 dw LeechSeedEffect           ; LEECH_SEED_EFFECT
	 dw SplashEffect              ; SPLASH_EFFECT
	 dw DisableEffect             ; DISABLE_EFFECT

SleepEffect: ; 3f1fc (f:71fc)
	ld de, wEnemyMonStatus
	ld bc, W_ENEMYBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jp z, .asm_3f20e
	ld de, wBattleMonStatus
	ld bc, W_PLAYERBATTSTATUS2

.asm_3f20e
	ld a, [bc]
	bit 5, a ; does the target need to recharge? (hyper beam)
	res 5, a ; target no longer needs to recharge
	ld [bc], a
	jr nz, .asm_3f231 ; if the target had to recharge, all hit tests will be skipped
					  ; including the event where the target already has another status
	ld a, [de]
	ld b, a
	and $7
	jr z, .asm_3f222 ; can't affect a mon that is already asleep
	ld hl, AlreadyAsleepText
	jp PrintText
.asm_3f222
	ld a, b
	and a
	jr nz, .asm_3f242 ; can't affect a mon that is already statused
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	ld a, [W_MOVEMISSED]
	and a
	jr nz, .asm_3f242
.asm_3f231
; set target's sleep counter to a random number between 1 and 7
	call BattleRandom
	and $7 
	jr z, .asm_3f231
	ld [de], a
	call Func_3fb89
	ld hl, FellAsleepText
	jp PrintText
.asm_3f242
	jp PrintDidntAffectText

FellAsleepText: ; 3f245 (f:7245)
	TX_FAR _FellAsleepText
	db "@"

AlreadyAsleepText: ; 3f24a (f:724a)
	TX_FAR _AlreadyAsleepText
	db "@"

PoisonEffect: ; 3f24f (f:724f)
	ld hl, wEnemyMonStatus
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f260
	ld hl, wBattleMonStatus
	ld de, W_ENEMYMOVEEFFECT
.asm_3f260
	call CheckTargetSubstitute
	jr nz, .asm_3f2d3 ; can't posion a substitute target
	ld a, [hli]
	ld b, a
	and a
	jr nz, .asm_3f2d3 ; miss if target is already statused
	ld a, [hli]
	cp $3 ; can't posion a poison-type target
	jr z, .asm_3f2d3
	ld a, [hld]
	cp $3 ; can't posion a poison-type target
	jr z, .asm_3f2d3
	ld a, [de]
	cp POISON_SIDE_EFFECT1
	ld b, $34 ; ~20% chance of poisoning
	jr z, .asm_3f290
	cp POISON_SIDE_EFFECT2
	ld b, $67 ; ~40% chance of poisoning
	jr z, .asm_3f290
	push hl
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	pop hl
	ld a, [W_MOVEMISSED]
	and a
	jr nz, .asm_3f2d7
	jr .asm_3f295
.asm_3f290
	call BattleRandom 
	cp b ; was side effect successful?
	ret nc
.asm_3f295
	dec hl
	set 3, [hl] ; mon is now poisoned
	push de
	dec de
	ld a, [H_WHOSETURN]
	and a
	ld b, ANIM_C7
	ld hl, W_PLAYERBATTSTATUS3
	ld a, [de]
	ld de, W_PLAYERTOXICCOUNTER
	jr nz, .asm_3f2b0
	ld b, ANIM_A9
	ld hl, W_ENEMYBATTSTATUS3
	ld de, W_ENEMYTOXICCOUNTER
.asm_3f2b0
	cp TOXIC
	jr nz, .asm_3f2bd ; done if move is not Toxic
	set 0, [hl] ; else set Toxic battstatus
	xor a
	ld [de], a
	ld hl, BadlyPoisonedText
	jr .asm_3f2c0
.asm_3f2bd
	ld hl, PoisonedText
.asm_3f2c0
	pop de
	ld a, [de]
	cp POISON_EFFECT
	jr z, .asm_3f2cd
	ld a, b
	call Func_3fb96
	jp PrintText
.asm_3f2cd
	call Func_3fb89
	jp PrintText
.asm_3f2d3
	ld a, [de]
	cp POISON_EFFECT
	ret nz
.asm_3f2d7
	ld c, $32
	call DelayFrames
	jp PrintDidntAffectText

PoisonedText: ; 3f2df (f:72df)
	TX_FAR _PoisonedText
	db "@"

BadlyPoisonedText: ; 3f2e4 (f:72e4)
	TX_FAR _BadlyPoisonedText
	db "@"

DrainHPEffect: ; 3f2e9 (f:72e9)
	ld hl, DrainHPEffect_
	ld b, BANK(DrainHPEffect_)
	jp Bankswitch

ExplodeEffect: ; 3f2f1 (f:72f1)
	ld hl, wBattleMonHP
	ld de, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f302
	ld hl, wEnemyMonHP
	ld de, W_ENEMYBATTSTATUS2
.asm_3f302
	xor a
	ld [hli], a ; set the mon's HP to 0
	ld [hli], a
	inc hl
	ld [hl], a ; set mon's status to 0
	ld a, [de]
	res 7, a ; clear mon's leech seed status
	ld [de], a
	ret

FreezeBurnParalyzeEffect: ; 3f30c (f:730c)
	xor a
	ld [wcc5b], a
	call CheckTargetSubstitute ; test bit 4 of d063/d068 flags [target has substitute flag]
	ret nz ; return if they have a substitute, can't effect them
	ld a, [$fff3]  
	and a
	jp nz, opponentAttacker
	ld a, [wEnemyMonStatus]
	and a
	jp nz, CheckDefrost ; can't inflict status if opponent is already statused
	ld a, [W_PLAYERMOVETYPE]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b ; do target type 1 and move type match?
	ret z  ; return if they match (an ice move can't freeze an ice-type, body slam can't paralyze a normal-type, etc.)
	ld a, [wEnemyMonType2]
	cp b ; do target type 2 and move type match?
	ret z  ; return if they match
	ld a, [W_PLAYERMOVEEFFECT]
	cp a, 7 ; 10% status effects are 04, 05, 06 so 07 will set carry for those
	ld b, $1a ; 0x1A/0x100 or 26/256 = 10.2%~ chance
	jr c, .next1 ; branch ahead if this is a 10% chance effect..
	ld b, $4d ; else use 0x4D/0x100 or 77/256 = 30.1%~ chance
	sub a, $1e ; subtract $1E to map to equivalent 10% chance effects
.next1
	push af     
	call BattleRandom ; get random 8bit value for probability test
	cp b
	pop bc     
	ret nc ; do nothing if random value is >= 1A or 4D [no status applied]
	ld a, b ; what type of effect is this?
	cp a, BURN_SIDE_EFFECT1
	jr z, .burn
	cp a, FREEZE_SIDE_EFFECT
	jr z, .freeze
; .paralyze	
	ld a, 1 << PAR
	ld [wEnemyMonStatus], a
	call QuarterSpeedDueToParalysis ; quarter speed of affected mon
	ld a, ANIM_A9
	call Func_3fbb9 ; play animation
	jp PrintMayNotAttackText ; print paralysis text
.burn
	ld a, 1 << BRN
	ld [wEnemyMonStatus], a
	call HalveAttackDueToBurn ; halve attack of affected mon
	ld a, ANIM_A9
	call Func_3fbb9 ; animation
	ld hl, BurnedText
	jp PrintText
.freeze
	call Func_3f9cf ; resets hyper beam (recharge) condition from both players
	ld a, 1 << FRZ
	ld [wEnemyMonStatus], a
	ld a, ANIM_A9
	call Func_3fbb9 ; animation
	ld hl, FrozenText
	jp PrintText
opponentAttacker: ; 3f382 (f:7382)
	ld a, [wBattleMonStatus] ; mostly same as above with addresses swapped for opponent
	and a
	jp nz, CheckDefrost
	ld a, [W_ENEMYMOVETYPE]
	ld b, a
	ld a, [wBattleMonType1]
	cp b
	ret z
	ld a, [wBattleMonType2]
	cp b
	ret z
	ld a, [W_ENEMYMOVEEFFECT]
	cp a, 7
	ld b, $1a
	jr c, .next1
	ld b, $4d
	sub a, $1e
.next1
	push af
	call BattleRandom
	cp b
	pop bc
	ret nc
	ld a, b
	cp a, BURN_SIDE_EFFECT1
	jr z, .burn
	cp a, FREEZE_SIDE_EFFECT
	jr z, .freeze
	ld a, 1 << PAR
	ld [wBattleMonStatus], a
	call QuarterSpeedDueToParalysis
	jp PrintMayNotAttackText
.burn
	ld a, 1 << BRN
	ld [wBattleMonStatus], a
	call HalveAttackDueToBurn
	ld hl, BurnedText
	jp PrintText
.freeze
; hyper beam bits aren't reseted for opponent's side
	ld a, 1 << FRZ
	ld [wBattleMonStatus], a
	ld hl, FrozenText
	jp PrintText

BurnedText: ; 3f3d8 (f:73d8)
	TX_FAR _BurnedText
	db "@"

FrozenText: ; 3f3dd (f:73dd)
	TX_FAR _FrozenText
	db "@"

CheckDefrost: ; 3f3e2 (f:73e2)
; any fire-type move that has a chance inflict burn (all but Fire Spin) will defrost a frozen target
	and a, 1 << FRZ	; are they frozen?
	ret z ; return if so
	ld a, [$fff3]	
	and a
	jr nz, .opponent
	;player [attacker]
	ld a, [W_PLAYERMOVETYPE]
	sub a, FIRE
	ret nz ; return if type of move used isn't fire
	ld [wEnemyMonStatus], a	; set opponent status to 00 ["defrost" a frozen monster]
	ld hl, wEnemyMon1Status
	ld a, [wEnemyMonPartyPos]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hl], a ; clear status in roster
	ld hl, FireDefrostedText
	jr .common
.opponent
	ld a, [W_ENEMYMOVETYPE]	; same as above with addresses swapped
	sub a, FIRE
	ret nz
	ld [wBattleMonStatus], a
	ld hl, wPartyMon1Status
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	xor a
	ld [hl], a
	ld hl, FireDefrostedText
.common
	jp PrintText

FireDefrostedText: ; 3f423 (f:7423)
	TX_FAR _FireDefrostedText
	db "@"

StatModifierUpEffect: ; 3f428 (f:7428)
	ld hl, wPlayerMonStatMods
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f439
	ld hl, wEnemyMonStatMods
	ld de, W_ENEMYMOVEEFFECT
.asm_3f439
	ld a, [de]
	sub $a
	cp $8
	jr c, .asm_3f442
	sub $28 ; map +2 effects to equivalent +1 effect
.asm_3f442
	ld c, a
	ld b, $0
	add hl, bc
	ld b, [hl]
	inc b ; increment corresponding stat mod
	ld a, $d
	cp b ; can't raise stat past +6 ($d or 13)
	jp c, Func_3f522
	ld a, [de]
	cp $12 ; is it a +2 effect?
	jr c, .asm_3f45a
	inc b ; if so, increment stat mod again
	ld a, $d
	cp b ; unless it's already +6
	jr nc, .asm_3f45a
	ld b, a
.asm_3f45a
	ld [hl], b
	ld a, c
	cp $4
	jr nc, asm_3f4ca ; jump if mod affected is evasion/accuracy
	push hl
	ld hl, wBattleMonAttack + 1
	ld de, wcd12
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f472
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
.asm_3f472
	push bc
	sla c
	ld b, $0
	add hl, bc ; hl = modified stat
	ld a, c
	add e
	ld e, a
	jr nc, .asm_3f47e
	inc d ; de = unmodified (original) stat
.asm_3f47e
	pop bc
	ld a, [hld]
	sub $e7 ; check if stat is already 999
	jr nz, .asm_3f48a
	ld a, [hl]
	sbc $3
	jp z, Func_3f520
.asm_3f48a ; recalculate affected stat
		   ; paralysis and burn penalties, as well as badge boosts are ignored
	push hl
	push bc
	ld hl, StatModifierRatios
	dec b
	sla b
	ld c, b
	ld b, $0
	add hl, bc
	pop bc
	xor a
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld a, [de]
	ld [$ff97], a
	inc de
	ld a, [de]
	ld [$ff98], a
	ld a, [hli]
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	call Multiply
	ld a, [hl]
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld b, $4
	call Divide
	pop hl
; cap at 999	
	ld a, [$ff98]
	sub $e7
	ld a, [$ff97]
	sbc $3
	jp c, Func_3f4c3
	ld a, 999 / $100
	ld [$ff97], a
	ld a, 999 % $100
	ld [$ff98], a

Func_3f4c3: ; 3f4c3 (f:74c3)
	ld a, [$ff97]
	ld [hli], a
	ld a, [$ff98]
	ld [hl], a
	pop hl
asm_3f4ca: ; 3f4ca (f:74ca)
	ld b, c
	inc b
	call Func_3f688
	ld hl, W_PLAYERBATTSTATUS2
	ld de, W_PLAYERMOVENUM
	ld bc, wccf7
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f4e6
	ld hl, W_ENEMYBATTSTATUS2
	ld de, W_ENEMYMOVENUM
	ld bc, wccf3
.asm_3f4e6
	ld a, [de]
	cp MINIMIZE
	jr nz, .asm_3f4f9
	bit 4, [hl] ; substitute
	push af
	push bc
	ld hl, Func_79747
	ld b, BANK(Func_79747)
	push de
	call nz, Bankswitch ; play Minimize animation unless there's Substitute involved
	pop de
.asm_3f4f9
	call Func_3fba8
	ld a, [de]
	cp MINIMIZE
	jr nz, .asm_3f50e
	pop bc
	ld a, $1
	ld [bc], a
	ld hl, Func_79771
	ld b, BANK(Func_79771)
	pop af
	call nz, Bankswitch
.asm_3f50e
	ld a, [H_WHOSETURN]
	and a
	call z, ApplyBadgeStatBoosts ; whenever the player uses a stat-up move, badge boosts get reapplied again to every stat,
								 ; even to those not affected by the stat-up move (will be boosted further)
	ld hl, MonsStatsRoseText
	call PrintText

; these shouldn't be here	
	call QuarterSpeedDueToParalysis ; apply speed penalty to the player whose turn is not, if it's paralyzed
	jp HalveAttackDueToBurn ; apply attack penalty to the player whose turn is not, if it's burned

Func_3f520: ; 3f520 (f:7520)
	pop hl
	dec [hl]

Func_3f522: ; 3f522 (f:7522)
	ld hl, NothingHappenedText
	jp PrintText

MonsStatsRoseText: ; 3f528 (f:7528)
	TX_FAR _MonsStatsRoseText
	db $08 ; asm
	ld hl, GreatlyRoseText
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVEEFFECT]
	jr z, .asm_3f53b
	ld a, [W_ENEMYMOVEEFFECT]
.asm_3f53b
	cp ATTACK_DOWN1_EFFECT
	ret nc
	ld hl, RoseText
	ret

GreatlyRoseText: ; 3f542 (f:7542)
	db $0a
	TX_FAR _GreatlyRoseText

RoseText: ; 3f547 (f:7547)
	TX_FAR _RoseText
	db "@"

StatModifierDownEffect: ; 3f54c (f:754c)
	ld hl, wEnemyMonStatMods
	ld de, W_PLAYERMOVEEFFECT
	ld bc, W_ENEMYBATTSTATUS1
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f572
	ld hl, wPlayerMonStatMods
	ld de, W_ENEMYMOVEEFFECT
	ld bc, W_PLAYERBATTSTATUS1
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr z, .asm_3f572
	call BattleRandom
	cp $40 ; 1/4 chance to miss by wildmon
	jp c, Func_3f65a
.asm_3f572
	call CheckTargetSubstitute ; can't hit through substitute
	jp nz, Func_3f65a
	ld a, [de]
	cp ATTACK_DOWN_SIDE_EFFECT
	jr c, .asm_3f58a
	call BattleRandom
	cp $55 ; 85/256 chance for side effects
	jp nc, Func_3f650
	ld a, [de]
	sub ATTACK_DOWN_SIDE_EFFECT ; map each stat to 0-3
	jr .asm_3f5a9
.asm_3f58a ; non-side effects only
	push hl
	push de
	push bc
	call MoveHitTest ; apply accuracy tests
	pop bc
	pop de
	pop hl
	ld a, [W_MOVEMISSED]
	and a
	jp nz, Func_3f65a
	ld a, [bc]
	bit 6, a ; fly/dig
	jp nz, Func_3f65a
	ld a, [de]
	sub $12
	cp $8
	jr c, .asm_3f5a9
	sub $28 ; map +2 effects to corresponding +1 effect
.asm_3f5a9
	ld c, a
	ld b, $0
	add hl, bc
	ld b, [hl]
	dec b ; dec corresponding stat mod
	jp z, Func_3f650 ; if stat mod is 1 (-6), can't lower anymore
	ld a, [de]
	cp $24
	jr c, .asm_3f5bf
	cp $44
	jr nc, .asm_3f5bf
	dec b ; stat down 2 effects only (dec mod again)
	jr nz, .asm_3f5bf
	inc b ; increment mod to 1 (-6) if it would become 0 (-7)
.asm_3f5bf
	ld [hl], b ; save modified mod 
	ld a, c
	cp $4 
	jr nc, asm_3f62c ; jump for evasion/accuracy
	push hl
	push de
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f5d8
	ld hl, wBattleMonAttack + 1
	ld de, wcd12
.asm_3f5d8
	push bc
	sla c
	ld b, $0
	add hl, bc ; hl = modified stat
	ld a, c
	add e
	ld e, a
	jr nc, .asm_3f5e4
	inc d ; de = unmodified stat
.asm_3f5e4
	pop bc
	ld a, [hld]
	sub $1 ; can't lower stat below 1 (-6)
	jr nz, .asm_3f5ef
	ld a, [hl]
	and a
	jp z, Func_3f64d
.asm_3f5ef
; recalculate affected stat
; paralysis and burn penalties, as well as badge boosts are ignored
	push hl
	push bc
	ld hl, StatModifierRatios
	dec b
	sla b
	ld c, b
	ld b, $0
	add hl, bc
	pop bc
	xor a
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld a, [de]
	ld [$ff97], a
	inc de
	ld a, [de]
	ld [$ff98], a
	ld a, [hli]
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	call Multiply
	ld a, [hl]
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld b, $4
	call Divide
	pop hl
	ld a, [$ff98]
	ld b, a
	ld a, [$ff97]
	or b
	jp nz, Func_3f624
	ld [$ff97], a
	ld a, $1
	ld [$ff98], a

Func_3f624: ; 3f624 (f:7624)
	ld a, [$ff97]
	ld [hli], a
	ld a, [$ff98]
	ld [hl], a
	pop de
	pop hl
asm_3f62c: ; 3f62c (f:762c)
	ld b, c
	inc b
	push de
	call Func_3f688
	pop de
	ld a, [de]
	cp $44
	jr nc, .asm_3f63b
	call Func_3fb89
.asm_3f63b
	ld a, [H_WHOSETURN]
	and a
	call nz, ApplyBadgeStatBoosts ; whenever the player uses a stat-down move, badge boosts get reapplied again to every stat,
								  ; even to those not affected by the stat-up move (will be boosted further)
	ld hl, MonsStatsFellText
	call PrintText
	
; These where probably added given that a stat-down move affecting speed or attack will override 
; the stat penalties from paralysis and burn respectively.
; But they are always called regardless of the stat affected by the stat-down move.  	
	call QuarterSpeedDueToParalysis
	jp HalveAttackDueToBurn

Func_3f64d: ; 3f64d (f:764d)
	pop de
	pop hl
	inc [hl]

Func_3f650: ; 3f650 (f:7650)
	ld a, [de]
	cp ATTACK_DOWN_SIDE_EFFECT
	ret nc
	ld hl, NothingHappenedText
	jp PrintText

Func_3f65a: ; 3f65a (f:765a)
	ld a, [de]
	cp $44
	ret nc
	jp Func_3fb4e

MonsStatsFellText: ; 3f661 (f:7661)
	TX_FAR _MonsStatsFellText
	db $08 ; asm
	ld hl, FellText
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVEEFFECT]
	jr z, .asm_3f674
	ld a, [W_ENEMYMOVEEFFECT]
.asm_3f674
	cp $1a
	ret c
	cp $44
	ret nc
	ld hl, GreatlyFellText
	ret

GreatlyFellText: ; 3f67e (f:767e)
	db $0a
	TX_FAR _GreatlyFellText

FellText: ; 3f683 (f:7683)
	TX_FAR _FellText
	db "@"

Func_3f688: ; 3f688 (f:7688)
	ld hl, StatsTextStrings
	ld c, $50
.asm_3f68d
	dec b
	jr z, .asm_3f696
.asm_3f690
	ld a, [hli]
	cp c
	jr z, .asm_3f68d
	jr .asm_3f690
.asm_3f696
	ld de, wcf4b
	ld bc, $a
	jp CopyData

StatsTextStrings: ; 3f69f (f:769f)
	db "ATTACK@"
	db "DEFENSE@"
	db "SPEED@"
	db "SPECIAL@"
	db "ACCURACY@"
	db "EVADE@"

StatModifierRatios: ; 3f6cb (f:76cb)
; first byte is numerator, second byte is denominator
	db 25, 100  ; 0.25
	db 28, 100  ; 0.28
	db 33, 100  ; 0.33
	db 40, 100  ; 0.40
	db 50, 100  ; 0.50
	db 66, 100  ; 0.66
	db  1,   1  ; 1.00
	db 15,  10  ; 1.50
	db  2,   1  ; 2.00
	db 25,  10  ; 2.50
	db  3,   1  ; 3.00
	db 35,  10  ; 3.50
	db  4,   1  ; 4.00

BideEffect: ; 3f6e5 (f:76e5)
	ld hl, W_PLAYERBATTSTATUS1
	ld de, W_NUMHITS
	ld bc, wPlayerNumAttacksLeft
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f6fc
	ld hl, W_ENEMYBATTSTATUS1
	ld de, wcd05
	ld bc, wEnemyNumAttacksLeft
.asm_3f6fc
	set 0, [hl] ; mon is now using bide
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [W_PLAYERMOVEEFFECT], a
	ld [W_ENEMYMOVEEFFECT], a
	call BattleRandom
	and $1
	inc a
	inc a
	ld [bc], a ; set Bide counter to 2 or 3 at random
	ld a, [H_WHOSETURN]
	add XSTATITEM_ANIM
	jp Func_3fb96

ThrashPetalDanceEffect: ; 3f717 (f:7717)
	ld hl, W_PLAYERBATTSTATUS1
	ld de, wPlayerNumAttacksLeft
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f728
	ld hl, W_ENEMYBATTSTATUS1
	ld de, wEnemyNumAttacksLeft
.asm_3f728
	set 1, [hl] ; mon is now using thrash/petal dance
	call BattleRandom
	and $1 
	inc a
	inc a
	ld [de], a ; set thrash/petal dance counter to 2 or 3 at random
	ld a, [H_WHOSETURN]
	add ANIM_B0
	jp Func_3fb96

SwitchAndTeleportEffect: ; 3f739 (f:7739)
	ld a, [H_WHOSETURN]
	and a
	jr nz, .asm_3f791
	ld a, [W_ISINBATTLE]
	dec a
	jr nz, .asm_3f77e
	ld a, [W_CURENEMYLVL]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .asm_3f76e
	add b
	ld c, a
	inc c
.asm_3f751
	call BattleRandom
	cp c
	jr nc, .asm_3f751
	srl b
	srl b
	cp b
	jr nc, .asm_3f76e
	ld c, $32
	call DelayFrames
	ld a, [W_PLAYERMOVENUM]
	cp TELEPORT
	jp nz, PrintDidntAffectText
	jp PrintButItFailedText_
.asm_3f76e
	call ReadPlayerMonCurHPAndStatus
	xor a
	ld [wcc5b], a
	inc a
	ld [wEscapedFromBattle], a
	ld a, [W_PLAYERMOVENUM]
	jr .asm_3f7e4
.asm_3f77e
	ld c, $32
	call DelayFrames
	ld hl, IsUnaffectedText
	ld a, [W_PLAYERMOVENUM]
	cp TELEPORT
	jp nz, PrintText
	jp PrintButItFailedText_
.asm_3f791
	ld a, [W_ISINBATTLE]
	dec a
	jr nz, .asm_3f7d1
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [W_CURENEMYLVL]
	cp b
	jr nc, .asm_3f7c1
	add b
	ld c, a
	inc c
.asm_3f7a4
	call BattleRandom
	cp c
	jr nc, .asm_3f7a4
	srl b
	srl b
	cp b
	jr nc, .asm_3f7c1
	ld c, $32
	call DelayFrames
	ld a, [W_ENEMYMOVENUM]
	cp TELEPORT
	jp nz, PrintDidntAffectText
	jp PrintButItFailedText_
.asm_3f7c1
	call ReadPlayerMonCurHPAndStatus
	xor a
	ld [wcc5b], a
	inc a
	ld [wEscapedFromBattle], a
	ld a, [W_ENEMYMOVENUM]
	jr .asm_3f7e4
.asm_3f7d1
	ld c, $32
	call DelayFrames
	ld hl, IsUnaffectedText
	ld a, [W_ENEMYMOVENUM]
	cp TELEPORT
	jp nz, PrintText
	jp Func_3fb4e
.asm_3f7e4
	push af
	call Func_3fbb9
	ld c, $14
	call DelayFrames
	pop af
	ld hl, RanFromBattleText
	cp TELEPORT
	jr z, .asm_3f7ff
	ld hl, RanAwayScaredText
	cp ROAR
	jr z, .asm_3f7ff
	ld hl, WasBlownAwayText
.asm_3f7ff
	jp PrintText

RanFromBattleText: ; 3f802 (f:7802)
	TX_FAR _RanFromBattleText
	db "@"

RanAwayScaredText: ; 3f807 (f:7807)
	TX_FAR _RanAwayScaredText
	db "@"

WasBlownAwayText: ; 3f80c (f:780c)
	TX_FAR _WasBlownAwayText
	db "@"

TwoToFiveAttacksEffect: ; 3f811 (f:7811)
	ld hl, W_PLAYERBATTSTATUS1
	ld de, wPlayerNumAttacksLeft
	ld bc, W_NUMHITS
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f828
	ld hl, W_ENEMYBATTSTATUS1
	ld de, wEnemyNumAttacksLeft
	ld bc, wcd05
.asm_3f828
	bit 2, [hl] ; is mon attacking multiple times?
	ret nz
	set 2, [hl] ; mon is now attacking multiple times
	ld hl, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f838
	ld hl, W_ENEMYMOVEEFFECT
.asm_3f838
	ld a, [hl]
	cp TWINEEDLE_EFFECT
	jr z, .asm_3f856
	cp ATTACK_TWICE_EFFECT
	ld a, $2
	jr z, .asm_3f853
	call BattleRandom
	and $3
	cp $2
	jr c, .asm_3f851
	call BattleRandom
	and $3
.asm_3f851
	inc a
	inc a
.asm_3f853
	ld [de], a
	ld [bc], a
	ret
.asm_3f856
	ld a, $2
	ld [hl], a
	jr .asm_3f853

FlichSideEffect: ; 3f85b (f:785b)
	call CheckTargetSubstitute
	ret nz
	ld hl, W_ENEMYBATTSTATUS1
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f870
	ld hl, W_PLAYERBATTSTATUS1
	ld de, W_ENEMYMOVEEFFECT
.asm_3f870
	ld a, [de]
	cp FLINCH_SIDE_EFFECT1
	ld b, $1a ; ~10% chance of flinch
	jr z, .asm_3f879
	ld b, $4d ; ~30% chance of flinch
.asm_3f879
	call BattleRandom
	cp b
	ret nc
	set 3, [hl] ; set mon's status to flinching
	call Func_3f9cf
	ret

OneHitKOEffect: ; 3f884 (f:7884)
	ld hl, OneHitKOEffect_
	ld b, BANK(OneHitKOEffect_)
	jp Bankswitch

ChargeEffect: ; 3f88c (f:788c)
	ld hl, W_PLAYERBATTSTATUS1
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	ld b, XSTATITEM_ANIM
	jr z, .asm_3f8a1
	ld hl, W_ENEMYBATTSTATUS1
	ld de, W_ENEMYMOVEEFFECT
	ld b, ANIM_AF
.asm_3f8a1
	set 4, [hl]
	ld a, [de]
	dec de ; de contains enemy or player MOVENUM
	cp FLY_EFFECT
	jr nz, .asm_3f8ad
	set 6, [hl] ; mon is now invulnerable to typical attacks (fly/dig)
	ld b, TELEPORT
.asm_3f8ad
	ld a, [de]
	cp DIG
	jr nz, .asm_3f8b6
	set 6, [hl] ; mon is now invulnerable to typical attacks (fly/dig)
	ld b, ANIM_C0
.asm_3f8b6
	xor a
	ld [wcc5b], a
	ld a, b
	call Func_3fbb9
	ld a, [de]
	ld [wWhichTrade], a
	ld hl, ChargeMoveEffectText
	jp PrintText

ChargeMoveEffectText: ; 3f8c8 (f:78c8)
	TX_FAR _ChargeMoveEffectText
	db $08 ; asm
	ld a, [wWhichTrade]
	cp RAZOR_WIND
	ld hl, MadeWhirlwindText
	jr z, .asm_3f8f8
	cp SOLARBEAM
	ld hl, TookInSunlightText
	jr z, .asm_3f8f8
	cp SKULL_BASH
	ld hl, LoweredItsHeadText
	jr z, .asm_3f8f8
	cp SKY_ATTACK
	ld hl, SkyAttackGlowingText
	jr z, .asm_3f8f8
	cp FLY
	ld hl, FlewUpHighText
	jr z, .asm_3f8f8
	cp DIG
	ld hl, DugAHoleText
.asm_3f8f8
	ret

MadeWhirlwindText: ; 3f8f9 (f:78f9)
	TX_FAR _MadeWhirlwindText
	db "@"

TookInSunlightText: ; 3f8fe (f:78fe)
	TX_FAR _TookInSunlightText
	db "@"

LoweredItsHeadText: ; 3f903 (f:7903)
	TX_FAR _LoweredItsHeadText
	db "@"

SkyAttackGlowingText: ; 3f908 (f:7908)
	TX_FAR _SkyAttackGlowingText
	db "@"

FlewUpHighText: ; 3f90d (f:790d)
	TX_FAR _FlewUpHighText
	db "@"

DugAHoleText: ; 3f912 (f:7912)
	TX_FAR _DugAHoleText
	db "@"

TrappingEffect: ; 3f917 (f:7917)
	ld hl, W_PLAYERBATTSTATUS1
	ld de, wPlayerNumAttacksLeft
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f928
	ld hl, W_ENEMYBATTSTATUS1
	ld de, wEnemyNumAttacksLeft
.asm_3f928
	bit 5, [hl]
	ret nz
	call Func_3f9cf
	set 5, [hl]
	call BattleRandom
	and $3
	cp $2
	jr c, .asm_3f93e
	call BattleRandom
	and $3
.asm_3f93e
	inc a
	ld [de], a
	ret

MistEffect: ; 3f941 (f:7941)
	ld hl, MistEffect_
	ld b, BANK(MistEffect_)
	jp Bankswitch

FocusEnergyEffect: ; 3f949 (f:7949)
	ld hl, FocusEnergyEffect_
	ld b, BANK(FocusEnergyEffect_)
	jp Bankswitch

RecoilEffect: ; 3f951 (f:7951)
	ld hl, RecoilEffect_
	ld b, BANK(RecoilEffect_)
	jp Bankswitch

ConfusionSideEffect: ; 3f959 (f:7959)
	call BattleRandom
	cp $19
	ret nc
	jr Func_3f96f

ConfusionEffect: ; 3f961 (f:7961)
	call CheckTargetSubstitute
	jr nz, Func_3f9a6
	call MoveHitTest
	ld a, [W_MOVEMISSED]
	and a
	jr nz, Func_3f9a6

Func_3f96f: ; 3f96f (f:796f)
	ld a, [H_WHOSETURN]
	and a
	ld hl, W_ENEMYBATTSTATUS1
	ld bc, wd070
	ld a, [W_PLAYERMOVEEFFECT]
	jr z, .asm_3f986
	ld hl, W_PLAYERBATTSTATUS1
	ld bc, wd06b
	ld a, [W_ENEMYMOVEEFFECT]
.asm_3f986
	bit 7, [hl] ; is mon confused?
	jr nz, Func_3f9a6
	set 7, [hl] ; mon is now confused
	push af
	call BattleRandom
	and $3
	inc a
	inc a
	ld [bc], a
	pop af
	cp CONFUSION_SIDE_EFFECT
	call nz, Func_3fb89
	ld hl, BecameConfusedText
	jp PrintText

BecameConfusedText: ; 3f9a1 (f:79a1)
	TX_FAR _BecameConfusedText
	db "@"

Func_3f9a6: ; 3f9a6 (f:79a6)
	cp CONFUSION_SIDE_EFFECT
	ret z
	ld c, $32
	call DelayFrames
	jp Func_3fb4e

ParalyzeEffect: ; 3f9b1 (f:79b1)
	ld hl, ParalyzeEffect_
	ld b, BANK(ParalyzeEffect_)
	jp Bankswitch

SubstituteEffect: ; 3f9b9 (f:79b9)
	ld hl, SubstituteEffectHandler
	ld b, BANK(SubstituteEffectHandler)
	jp Bankswitch

HyperBeamEffect: ; 3f9c1 (f:79c1)
	ld hl, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f9cc
	ld hl, W_ENEMYBATTSTATUS2
.asm_3f9cc
	set 5, [hl] ; mon now needs to recharge
	ret

Func_3f9cf: ; 3f9cf (f:79cf)
	push hl
	ld hl, W_ENEMYBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3f9db
	ld hl, W_PLAYERBATTSTATUS2
.asm_3f9db
	res 5, [hl] ; mon no longer needs to recharge
	pop hl
	ret

RageEffect: ; 3f9df (f:79df)
	ld hl, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .player
	ld hl, W_ENEMYBATTSTATUS2
.player
	set 6, [hl] ; mon is now in "rage" mode
	ret

MimicEffect: ; 3f9ed (f:79ed)
	ld c, $32
	call DelayFrames
	call MoveHitTest
	ld a, [W_MOVEMISSED]
	and a
	jr nz, .asm_3fa74
	ld a, [H_WHOSETURN]
	and a
	ld hl, wBattleMonMoves
	ld a, [W_PLAYERBATTSTATUS1]
	jr nz, .asm_3fa13
	ld a, [W_ISLINKBATTLE]
	cp $4
	jr nz, .asm_3fa3a
	ld hl, wEnemyMonMoves
	ld a, [W_ENEMYBATTSTATUS1]
.asm_3fa13
	bit 6, a
	jr nz, .asm_3fa74
.asm_3fa17
	push hl
	call BattleRandom
	and $3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_3fa17
	ld d, a
	ld a, [H_WHOSETURN]
	and a
	ld hl, wBattleMonMoves
	ld a, [wPlayerMoveListIndex]
	jr z, .asm_3fa5f
	ld hl, wEnemyMonMoves
	ld a, [wEnemyMoveListIndex]
	jr .asm_3fa5f
.asm_3fa3a
	ld a, [W_ENEMYBATTSTATUS1]
	bit 6, a
	jr nz, .asm_3fa74
	ld a, [wCurrentMenuItem]
	push af
	ld a, $1
	ld [wMoveMenuType], a
	call MoveSelectionMenu
	call LoadScreenTilesFromBuffer1
	ld hl, wEnemyMonMoves
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld d, [hl]
	pop af
	ld hl, wBattleMonMoves
.asm_3fa5f
	ld c, a
	ld b, $0
	add hl, bc
	ld a, d
	ld [hl], a
	ld [wd11e], a
	call GetMoveName
	call Func_3fba8
	ld hl, MimicLearnedMoveText
	jp PrintText
.asm_3fa74
	jp PrintButItFailedText_

MimicLearnedMoveText: ; 3fa77 (f:7a77)
	TX_FAR _MimicLearnedMoveText
	db "@"

LeechSeedEffect: ; 3fa7c (f:7a7c)
	ld hl, LeechSeedEffect_
	ld b, BANK(LeechSeedEffect_)
	jp Bankswitch

SplashEffect: ; 3fa84 (f:7a84)
	call Func_3fba8
	jp PrintNoEffectText

DisableEffect: ; 3fa8a (f:7a8a)
	call MoveHitTest
	ld a, [W_MOVEMISSED]
	and a
	jr nz, .asm_3fb06
	ld de, W_ENEMYDISABLEDMOVE
	ld hl, wEnemyMonMoves
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_3faa4
	ld de, W_PLAYERDISABLEDMOVE
	ld hl, wBattleMonMoves
.asm_3faa4
	ld a, [de]
	and a
	jr nz, .asm_3fb06
.asm_3faa8
	push hl
	call BattleRandom
	and $3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_3faa8
	ld [wd11e], a
	push hl
	ld a, [H_WHOSETURN]
	and a
	ld hl, wBattleMonPP
	jr nz, .asm_3facf
	ld a, [W_ISLINKBATTLE]
	cp $4
	pop hl
	jr nz, .asm_3fae1
	push hl
	ld hl, wEnemyMonPP
.asm_3facf
	push hl
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	pop hl
	jr z, .asm_3fb05
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .asm_3faa8
.asm_3fae1
	call BattleRandom
	and $7
	inc a
	inc c
	swap c
	add c
	ld [de], a
	call Func_3fb89
	ld hl, wccee
	ld a, [H_WHOSETURN]
	and a
	jr nz, .asm_3faf8
	inc hl
.asm_3faf8
	ld a, [wd11e]
	ld [hl], a
	call GetMoveName
	ld hl, MoveWasDisabledText
	jp PrintText
.asm_3fb05
	pop hl
.asm_3fb06
	jp PrintButItFailedText_

MoveWasDisabledText: ; 3fb09 (f:7b09)
	TX_FAR _MoveWasDisabledText
	db "@"

PayDayEffect: ; 3fb0e (f:7b0e)
	ld hl, PayDayEffect_
	ld b, BANK(PayDayEffect_)
	jp Bankswitch

ConversionEffect: ; 3fb16 (f:7b16)
	ld hl, ConversionEffect_
	ld b, BANK(ConversionEffect_)
	jp Bankswitch

HazeEffect: ; 3fb1e (f:7b1e)
	ld hl, HazeEffect_
	ld b, BANK(HazeEffect_)
	jp Bankswitch

HealEffect: ; 3fb26 (f:7b26)
	ld hl, HealEffect_
	ld b, BANK(HealEffect_)
	jp Bankswitch

TransformEffect: ; 3fb2e (f:7b2e)
	ld hl, TransformEffect_
	ld b, BANK(TransformEffect_)
	jp Bankswitch

ReflectLightScreenEffect: ; 3fb36 (f:7b36)
	ld hl, ReflectLightScreenEffect_
	ld b, BANK(ReflectLightScreenEffect_)
	jp Bankswitch

NothingHappenedText: ; 3fb3e (f:7b3e)
	TX_FAR _NothingHappenedText
	db "@"

PrintNoEffectText: ; 3fb43 (f:7b43)
	ld hl, NoEffectText
	jp PrintText

NoEffectText: ; 3fb49 (f:7b49)
	TX_FAR _NoEffectText
	db "@"

Func_3fb4e: ; 3fb4e (f:7b4e)
	ld a, [wccf4]
	and a
	ret nz

PrintButItFailedText_: ; 3fb53 (f:7b53)
	ld hl, ButItFailedText
	jp PrintText

ButItFailedText: ; 3fb59 (f:7b59)
	TX_FAR _ButItFailedText
	db "@"

PrintDidntAffectText: ; 3fb5e (f:7b5e)
	ld hl, DidntAffectText
	jp PrintText

DidntAffectText: ; 3fb64 (f:7b64)
	TX_FAR _DidntAffectText
	db "@"

IsUnaffectedText: ; 3fb69 (f:7b69)
	TX_FAR _IsUnaffectedText
	db "@"

PrintMayNotAttackText: ; 3fb6e (f:7b6e)
	ld hl, ParalyzedMayNotAttackText
	jp PrintText

ParalyzedMayNotAttackText: ; 3fb74 (f:7b74)
	TX_FAR _ParalyzedMayNotAttackText
	db "@"

CheckTargetSubstitute: ; 3fb79 (f:7b79)
	push hl
	ld hl, W_ENEMYBATTSTATUS2
	ld a, [$fff3]   ;whose turn?
	and a
	jr z, .next1
	ld hl, W_PLAYERBATTSTATUS2
.next1
	bit 4, [hl]         ;test bit 4 in d063/d068 flags
	pop hl
	ret

Func_3fb89: ; 3fb89 (f:7b89)
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVENUM]
	jr z, .asm_3fb94
	ld a, [W_ENEMYMOVENUM]
.asm_3fb94
	and a
	ret z

Func_3fb96: ; 3fb96 (f:7b96)
	ld [W_ANIMATIONID], a
	ld a, [H_WHOSETURN]
	and a
	ld a, $6
	jr z, .asm_3fba2
	ld a, $3
.asm_3fba2
	ld [wcc5b], a
	jp Func_3fbbc

Func_3fba8: ; 3fba8 (f:7ba8)
	xor a
	ld [wcc5b], a
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVENUM]
	jr z, .asm_3fbb7
	ld a, [W_ENEMYMOVENUM]
.asm_3fbb7
	and a
	ret z

Func_3fbb9: ; 3fbb9 (f:7bb9)
	ld [W_ANIMATIONID], a

Func_3fbbc: ; 3fbbc (f:7bbc)
	push hl
	push de
	push bc
	predef MoveAnimation
	pop bc
	pop de
	pop hl
	ret
