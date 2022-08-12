BattleCore:

INCLUDE "data/battle/residual_effects_1.asm"
INCLUDE "data/battle/set_damage_effects.asm"
INCLUDE "data/battle/residual_effects_2.asm"
INCLUDE "data/battle/always_happen_effects.asm"
INCLUDE "data/battle/special_effects.asm"

SlidePlayerAndEnemySilhouettesOnScreen:
	call LoadPlayerBackPic
	ld a, MESSAGE_BOX ; the usual text box at the bottom of the screen
	ld [wTextBoxID], a
	call DisplayTextBoxID
	hlcoord 1, 5
	lb bc, 3, 7
	call ClearScreenArea
	call DisableLCD
	call LoadFontTilePatterns
	call LoadHudAndHpBarAndStatusTilePatterns
	ld hl, vBGMap0
	ld bc, $400
.clearBackgroundLoop
	ld a, " "
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .clearBackgroundLoop
; copy the work RAM tile map to VRAM
	hlcoord 0, 0
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
	ldh [hWY], a
	ldh [rWY], a
	xor a
	ldh [hTileAnimations], a
	ldh [hSCY], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld b, $70
	ld c, $90
	ld a, c
	ldh [hSCX], a
	call DelayFrame
	ld a, %11100100 ; inverted palette for silhouette effect
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
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
	ldh [hSCX], a
	dec c
	dec c
	jr nz, .slideSilhouettesLoop
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, $31
	ldh [hStartTileID], a
	hlcoord 1, 5
	predef CopyUncompressedPicToTilemap
	xor a
	ldh [hWY], a
	ldh [rWY], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	call HideSprites
	jpfar PrintBeginningBattleText

; when a battle is starting, silhouettes of the player's pic and the enemy's pic are slid onto the screen
; the lower of the player's pic (his body) is part of the background, but his head is a sprite
; the reason for this is that it shares Y coordinates with the lower part of the enemy pic, so background scrolling wouldn't work for both pics
; instead, the enemy pic is part of the background and uses the scroll register, while the player's head is a sprite and is slid by changing its X coordinates in a loop
SlidePlayerHeadLeft:
	push bc
	ld hl, wShadowOAMSprite00XCoord
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

SetScrollXForSlidingPlayerBodyLeft:
	ldh a, [rLY]
	cp l
	jr nz, SetScrollXForSlidingPlayerBodyLeft
	ld a, h
	ldh [rSCX], a
.loop
	ldh a, [rLY]
	cp h
	jr z, .loop
	ret

StartBattle:
	xor a
	ld [wPartyGainExpFlags], a
	ld [wPartyFoughtCurrentEnemyFlags], a
	ld [wActionResultOrTookBattleTurn], a
	inc a
	ld [wFirstMonsNotOutYet], a
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
	ld [wSerialExchangeNybbleReceiveData], a
	ld a, [wIsInBattle]
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
	ld a, [wBattleType]
	and a ; is it a normal battle?
	jp z, .playerSendOutFirstMon ; if so, send out player mon
; safari zone battle
.displaySafariZoneBattleMenu
	call DisplayBattleMenu
	ret c ; return if the player ran from battle
	ld a, [wActionResultOrTookBattleTurn]
	and a ; was the item used successfully?
	jr z, .displaySafariZoneBattleMenu ; if not, display the menu again; XXX does this ever jump?
	ld a, [wNumSafariBalls]
	and a
	jr nz, .notOutOfSafariBalls
	call LoadScreenTilesFromBuffer1
	ld hl, .outOfSafariBallsText
	jp PrintText
.notOutOfSafariBalls
	callfar PrintSafariZoneBattleText
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
	text_far _OutOfSafariBallsText
	text_end

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
	hlcoord 1, 5
	ld a, $9
	call SlideTrainerPicOffScreen
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_SET
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
EnemyRan:
	call LoadScreenTilesFromBuffer1
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ld hl, WildRanText
	jr nz, .printText
; link battle
	xor a
	ld [wBattleResult], a
	ld hl, EnemyRanText
.printText
	call PrintText
	ld a, SFX_RUN
	call PlaySoundWaitForCurrent
	xor a
	ldh [hWhoseTurn], a
	jpfar AnimationSlideEnemyMonOff

WildRanText:
	text_far _WildRanText
	text_end

EnemyRanText:
	text_far _EnemyRanText
	text_end

MainInBattleLoop:
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
	ld [wFirstMonsNotOutYet], a
	ld a, [wPlayerBattleStatus2]
	and (1 << NEEDS_TO_RECHARGE) | (1 << USING_RAGE) ; check if the player is using Rage or needs to recharge
	jr nz, .selectEnemyMove
; the player is not using Rage and doesn't need to recharge
	ld hl, wEnemyBattleStatus1
	res FLINCHED, [hl] ; reset flinch bit
	ld hl, wPlayerBattleStatus1
	res FLINCHED, [hl] ; reset flinch bit
	ld a, [hl]
	and (1 << THRASHING_ABOUT) | (1 << CHARGING_UP) ; check if the player is thrashing about or charging for an attack
	jr nz, .selectEnemyMove ; if so, jump
; the player is neither thrashing about nor charging for an attack
	call DisplayBattleMenu ; show battle menu
	ret c ; return if player ran from battle
	ld a, [wEscapedFromBattle]
	and a
	ret nz ; return if pokedoll was used to escape from battle
	ld a, [wBattleMonStatus]
	and (1 << FRZ) | SLP_MASK
	jr nz, .selectEnemyMove ; if so, jump
	ld a, [wPlayerBattleStatus1]
	and (1 << STORING_ENERGY) | (1 << USING_TRAPPING_MOVE) ; check player is using Bide or using a multi-turn attack like wrap
	jr nz, .selectEnemyMove ; if so, jump
	ld a, [wEnemyBattleStatus1]
	bit USING_TRAPPING_MOVE, a ; check if enemy is using a multi-turn attack like wrap
	jr z, .selectPlayerMove ; if not, jump
; enemy is using a multi-turn attack like wrap, so player is trapped and cannot execute a move
	ld a, $ff
	ld [wPlayerSelectedMove], a
	jr .selectEnemyMove
.selectPlayerMove
	ld a, [wActionResultOrTookBattleTurn]
	and a ; has the player already used the turn (e.g. by using an item, trying to run or switching pokemon)
	jr nz, .selectEnemyMove
	ld [wMoveMenuType], a
	inc a
	ld [wAnimationID], a
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
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .noLinkBattle
; link battle
	ld a, [wSerialExchangeNybbleReceiveData]
	cp LINKBATTLE_RUN
	jp z, EnemyRan
	cp LINKBATTLE_STRUGGLE
	jr z, .noLinkBattle
	cp LINKBATTLE_NO_ACTION
	jr z, .noLinkBattle
	sub 4
	jr c, .noLinkBattle
; the link battle enemy has switched mons
	ld a, [wPlayerBattleStatus1]
	bit USING_TRAPPING_MOVE, a ; check if using multi-turn move like Wrap
	jr z, .specialMoveNotUsed
	ld a, [wPlayerMoveListIndex]
	ld hl, wBattleMonMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp METRONOME ; a MIRROR MOVE check is missing, might lead to a desync in link battles
	             ; when combined with multi-turn moves
	jr nz, .specialMoveNotUsed
	ld [wPlayerSelectedMove], a
.specialMoveNotUsed
	callfar SwitchEnemyMon
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
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .invertOutcome
	call BattleRandom
	cp 50 percent + 1
	jr c, .playerMovesFirst
	jr .enemyMovesFirst
.invertOutcome
	call BattleRandom
	cp 50 percent + 1
	jr c, .enemyMovesFirst
	jr .playerMovesFirst
.enemyMovesFirst
	ld a, $1
	ldh [hWhoseTurn], a
	callfar TrainerAI
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
	ldh [hWhoseTurn], a
	callfar TrainerAI
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

HandlePoisonBurnLeechSeed:
	ld hl, wBattleMonHP
	ld de, wBattleMonStatus
	ldh a, [hWhoseTurn]
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
	ld [wAnimationType], a
	ld a, BURN_PSN_ANIM
	call PlayMoveAnimation   ; play burn/poison animation
	pop hl
	call HandlePoisonBurnLeechSeed_DecreaseOwnHP
.notBurnedOrPoisoned
	ld de, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .playersTurn2
	ld de, wEnemyBattleStatus2
.playersTurn2
	ld a, [de]
	add a
	jr nc, .notLeechSeeded
	push hl
	ldh a, [hWhoseTurn]
	push af
	xor $1
	ldh [hWhoseTurn], a
	xor a
	ld [wAnimationType], a
	ld a, ABSORB
	call PlayMoveAnimation ; play leech seed animation (from opposing mon)
	pop af
	ldh [hWhoseTurn], a
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
	ld c, 20
	call DelayFrames
	xor a
	ret

HurtByPoisonText:
	text_far _HurtByPoisonText
	text_end

HurtByBurnText:
	text_far _HurtByBurnText
	text_end

HurtByLeechSeedText:
	text_far _HurtByLeechSeedText
	text_end

; decreases the mon's current HP by 1/16 of the Max HP (multiplied by number of toxic ticks if active)
; note that the toxic ticks are considered even if the damage is not poison (hence the Leech Seed glitch)
; hl: HP pointer
; bc (out): total damage
HandlePoisonBurnLeechSeed_DecreaseOwnHP:
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
	ld hl, wPlayerBattleStatus3
	ld de, wPlayerToxicCounter
	ldh a, [hWhoseTurn]
	and a
	jr z, .playersTurn
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyToxicCounter
.playersTurn
	bit BADLY_POISONED, [hl]
	jr z, .noToxic
	ld a, [de]    ; increment toxic counter
	inc a
	ld [de], a
	ld hl, 0
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
; bc isn't updated if HP subtracted was capped to prevent overkill
HandlePoisonBurnLeechSeed_IncreaseEnemyHP:
	push hl
	ld hl, wEnemyMonMaxHP
	ldh a, [hWhoseTurn]
	and a
	jr z, .playersTurn
	ld hl, wBattleMonMaxHP
.playersTurn
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld de, wBattleMonHP - wBattleMonMaxHP
	add hl, de           ; skip back from max hp to current hp
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
	ldh a, [hWhoseTurn]
	xor $1
	ldh [hWhoseTurn], a
	call UpdateCurMonHPBar
	ldh a, [hWhoseTurn]
	xor $1
	ldh [hWhoseTurn], a
	pop hl
	ret

UpdateCurMonHPBar:
	hlcoord 10, 9    ; tile pointer to player HP bar
	ldh a, [hWhoseTurn]
	and a
	ld a, $1
	jr z, .playersTurn
	hlcoord 2, 2    ; tile pointer to enemy HP bar
	xor a
.playersTurn
	push bc
	ld [wHPBarType], a
	predef UpdateHPBar2
	pop bc
	ret

CheckNumAttacksLeft:
	ld a, [wPlayerNumAttacksLeft]
	and a
	jr nz, .checkEnemy
; player has 0 attacks left
	ld hl, wPlayerBattleStatus1
	res USING_TRAPPING_MOVE, [hl] ; player not using multi-turn attack like wrap any more
.checkEnemy
	ld a, [wEnemyNumAttacksLeft]
	and a
	ret nz
; enemy has 0 attacks left
	ld hl, wEnemyBattleStatus1
	res USING_TRAPPING_MOVE, [hl] ; enemy not using multi-turn attack like wrap any more
	ret

HandleEnemyMonFainted:
	xor a
	ld [wInHandlePlayerMonFainted], a
	call FaintEnemyPokemon
	call AnyPartyAlive
	ld a, d
	and a
	jp z, HandlePlayerBlackOut ; if no party mons are alive, the player blacks out
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl] ; is battle mon HP zero?
	call nz, DrawPlayerHUDAndHPBar ; if battle mon HP is not zero, draw player HD and HP bar
	ld a, [wIsInBattle]
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
	ld [wActionResultOrTookBattleTurn], a
	call ReplaceFaintedEnemyMon
	jp z, EnemyRan
	xor a
	ld [wActionResultOrTookBattleTurn], a
	jp MainInBattleLoop

FaintEnemyPokemon:
	call ReadPlayerMonCurHPAndStatus
	ld a, [wIsInBattle]
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
	ld hl, wPlayerBattleStatus1
	res ATTACKING_MULTIPLE_TIMES, [hl]
; Bug. This only zeroes the high byte of the player's accumulated damage,
; setting the accumulated damage to itself mod 256 instead of 0 as was probably
; intended. That alone is problematic, but this mistake has another more severe
; effect. This function's counterpart for when the player mon faints,
; RemoveFaintedPlayerMon, zeroes both the high byte and the low byte. In a link
; battle, the other player's Game Boy will call that function in response to
; the enemy mon (the player mon from the other side's perspective) fainting,
; and the states of the two Game Boys will go out of sync unless the damage
; was congruent to 0 modulo 256.
	xor a
	ld [wPlayerBideAccumulatedDamage], a
	ld hl, wEnemyStatsToDouble ; clear enemy statuses
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wEnemyDisabledMove], a
	ld [wEnemyDisabledMoveNumber], a
	ld [wEnemyMonMinimized], a
	ld hl, wPlayerUsedMove
	ld [hli], a
	ld [hl], a
	hlcoord 12, 5
	decoord 12, 6
	call SlideDownFaintedMonPic
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearScreenArea
	ld a, [wIsInBattle]
	dec a
	jr z, .wild_win
	xor a
	ld [wFrequencyModifier], a
	ld [wTempoModifier], a
	ld a, SFX_FAINT_FALL
	call PlaySoundWaitForCurrent
.sfxwait
	ld a, [wChannelSoundIDs + CHAN5]
	cp SFX_FAINT_FALL
	jr z, .sfxwait
	ld a, SFX_FAINT_THUD
	call PlaySound
	call WaitForSoundToFinish
	jr .sfxplayed
.wild_win
	call EndLowHealthAlarm
	ld a, MUSIC_DEFEATED_WILD_MON
	call PlayBattleVictoryMusic
.sfxplayed
; bug: win sfx is played for wild battles before checking for player mon HP
; this can lead to odd scenarios where both player and enemy faint, as the win sfx plays yet the player never won the battle
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl]
	jr nz, .playermonnotfaint
	ld a, [wInHandlePlayerMonFainted]
	and a ; was this called by HandlePlayerMonFainted?
	jr nz, .playermonnotfaint ; if so, don't call RemoveFaintedPlayerMon twice
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
	ld b, EXP_ALL
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
	ld [wBoostExpByExpAll], a
	callfar GainExperience
	pop af
	ret z ; return if no exp all

; the player has exp all
; now, set the gain exp flag for every party member
; half of the total stat exp and normal exp will divided evenly amongst every party member
	ld a, $1
	ld [wBoostExpByExpAll], a
	ld a, [wPartyCount]
	ld b, 0
.gainExpFlagsLoop
	scf
	rl b
	dec a
	jr nz, .gainExpFlagsLoop
	ld a, b
	ld [wPartyGainExpFlags], a
	jpfar GainExperience

EnemyMonFaintedText:
	text_far _EnemyMonFaintedText
	text_end

EndLowHealthAlarm:
; This function is called when the player has the won the battle. It turns off
; the low health alarm and prevents it from reactivating until the next battle.
	xor a
	ld [wLowHealthAlarm], a ; turn off low health alarm
	ld [wChannelSoundIDs + CHAN5], a
	inc a
	ld [wLowHealthAlarmDisabled], a ; prevent it from reactivating
	ret

AnyEnemyPokemonAliveCheck:
	ld a, [wEnemyPartyCount]
	ld b, a
	xor a
	ld hl, wEnemyMon1HP
	ld de, wEnemyMon2 - wEnemyMon1
.nextPokemon
	or [hl]
	inc hl
	or [hl]
	dec hl
	add hl, de
	dec b
	jr nz, .nextPokemon
	and a
	ret

; stores whether enemy ran in Z flag
ReplaceFaintedEnemyMon:
	ld hl, wEnemyHPBarColor
	ld e, $30
	call GetBattleHealthBarColor
	callfar DrawEnemyPokeballs
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle
; link battle
	call LinkBattleExchangeData
	ld a, [wSerialExchangeNybbleReceiveData]
	cp LINKBATTLE_RUN
	ret z
	call LoadScreenTilesFromBuffer1
.notLinkBattle
	call EnemySendOut
	xor a
	ld [wEnemyMoveNum], a
	ld [wActionResultOrTookBattleTurn], a
	ld [wAILayer2Encouragement], a
	inc a ; reset Z flag
	ret

TrainerBattleVictory:
	call EndLowHealthAlarm
	ld b, MUSIC_DEFEATED_GYM_LEADER
	ld a, [wGymLeaderNo]
	and a
	jr nz, .gymleader
	ld b, MUSIC_DEFEATED_TRAINER
.gymleader
	ld a, [wTrainerClass]
	cp RIVAL3 ; final battle against rival
	jr nz, .notrival
	ld b, MUSIC_DEFEATED_GYM_LEADER
	ld hl, wFlags_D733
	set 1, [hl]
.notrival
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ld a, b
	call nz, PlayBattleVictoryMusic
	ld hl, TrainerDefeatedText
	call PrintText
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	call ScrollTrainerPicAfterBattle
	ld c, 40
	call DelayFrames
	call PrintEndBattleText
; win money
	ld hl, MoneyForWinningText
	call PrintText
	ld de, wPlayerMoney + 2
	ld hl, wAmountMoneyWon + 2
	ld c, $3
	predef_jump AddBCDPredef

MoneyForWinningText:
	text_far _MoneyForWinningText
	text_end

TrainerDefeatedText:
	text_far _TrainerDefeatedText
	text_end

PlayBattleVictoryMusic:
	push af
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySoundWaitForCurrent
	ld c, BANK(Music_DefeatedTrainer)
	pop af
	call PlayMusic
	jp Delay3

HandlePlayerMonFainted:
	ld a, 1
	ld [wInHandlePlayerMonFainted], a
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
	ld a, [wIsInBattle]
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
	ld [wActionResultOrTookBattleTurn], a
	call ReplaceFaintedEnemyMon
	jp z, EnemyRan ; if enemy ran from battle rather than sending out another mon, jump
	xor a
	ld [wActionResultOrTookBattleTurn], a
	jp MainInBattleLoop

; resets flags, slides mon's pic down, plays cry, and prints fainted message
RemoveFaintedPlayerMon:
	ld a, [wPlayerMonNumber]
	ld c, a
	ld hl, wPartyGainExpFlags
	ld b, FLAG_RESET
	predef FlagActionPredef ; clear gain exp flag for fainted mon
	ld hl, wEnemyBattleStatus1
	res 2, [hl]   ; reset "attacking multiple times" flag
	ld a, [wLowHealthAlarm]
	bit 7, a      ; skip sound flag (red bar (?))
	jr z, .skipWaitForSound
	ld a, $ff
	ld [wLowHealthAlarm], a ;disable low health alarm
	call WaitForSoundToFinish
.skipWaitForSound
; a is 0, so this zeroes the enemy's accumulated damage.
	ld hl, wEnemyBideAccumulatedDamage
	ld [hli], a
	ld [hl], a
	ld [wBattleMonStatus], a
	call ReadPlayerMonCurHPAndStatus
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearScreenArea
	hlcoord 1, 10
	decoord 1, 11
	call SlideDownFaintedMonPic
	ld a, $1
	ld [wBattleResult], a

; When the player mon and enemy mon faint at the same time and the fact that the
; enemy mon has fainted is detected first (e.g. when the player mon knocks out
; the enemy mon using a move with recoil and faints due to the recoil), don't
; play the player mon's cry or show the "[player mon] fainted!" message.
	ld a, [wInHandlePlayerMonFainted]
	and a ; was this called by HandleEnemyMonFainted?
	ret z ; if so, return

	ld a, [wBattleMonSpecies]
	call PlayCry
	ld hl, PlayerMonFaintedText
	jp PrintText

PlayerMonFaintedText:
	text_far _PlayerMonFaintedText
	text_end

; asks if you want to use next mon
; stores whether you ran in C flag
DoUseNextMonDialogue:
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
	ld a, [wIsInBattle]
	and a
	dec a
	ret nz ; return if it's a trainer battle
	ld hl, UseNextMonText
	call PrintText
.displayYesNoBox
	hlcoord 13, 9
	lb bc, 10, 14
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wMenuExitMethod]
	cp CHOSE_SECOND_ITEM ; did the player choose NO?
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

UseNextMonText:
	text_far _UseNextMonText
	text_end

; choose next player mon to send out
; stores whether enemy mon has no HP left in Z flag
ChooseNextMon:
	ld a, BATTLE_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call DisplayPartyMenu
.checkIfMonChosen
	jr nc, .monChosen
.goBackToPartyMenu
	call GoBackToPartyMenu
	jr .checkIfMonChosen
.monChosen
	call HasMonFainted
	jr z, .goBackToPartyMenu ; if mon fainted, you have to choose another
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle
	inc a ; 1
	ld [wActionResultOrTookBattleTurn], a
	call LinkBattleExchangeData
.notLinkBattle
	xor a
	ld [wActionResultOrTookBattleTurn], a
	call ClearSprites
	ld a, [wWhichPokemon]
	ld [wPlayerMonNumber], a
	ld c, a
	ld hl, wPartyGainExpFlags
	ld b, FLAG_SET
	push bc
	predef FlagActionPredef
	pop bc
	ld hl, wPartyFoughtCurrentEnemyFlags
	predef FlagActionPredef
	call LoadBattleMonFromParty
	call GBPalWhiteOut
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer1
	call RunDefaultPaletteCommand
	call GBPalNormal
	call SendOutMon
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	ret

; called when player is out of usable mons.
; prints appropriate lose message, sets carry flag if player blacked out (special case for initial rival fight)
HandlePlayerBlackOut:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .notRival1Battle
	ld a, [wCurOpponent]
	cp OPP_RIVAL1
	jr nz, .notRival1Battle
	hlcoord 0, 0  ; rival 1 battle
	lb bc, 8, 21
	call ClearScreenArea
	call ScrollTrainerPicAfterBattle
	ld c, 40
	call DelayFrames
	ld hl, Rival1WinText
	call PrintText
	ld a, [wCurMap]
	cp OAKS_LAB
	ret z            ; starter battle in oak's lab: don't black out
.notRival1Battle
	ld b, SET_PAL_BATTLE_BLACK
	call RunPaletteCommand
	ld hl, PlayerBlackedOutText2
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
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

Rival1WinText:
	text_far _Rival1WinText
	text_end

PlayerBlackedOutText2:
	text_far _PlayerBlackedOutText2
	text_end

LinkBattleLostText:
	text_far _LinkBattleLostText
	text_end

; slides pic of fainted mon downwards until it disappears
; bug: when this is called, [hAutoBGTransferEnabled] is non-zero, so there is screen tearing
SlideDownFaintedMonPic:
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
	ld bc, -SCREEN_WIDTH
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
	ld bc, SCREEN_WIDTH
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

SevenSpacesText:
	db "       @"

; slides the player or enemy trainer off screen
; a is the number of tiles to slide it horizontally (always 9 for the player trainer or 8 for the enemy trainer)
; if a is 8, the slide is to the right, else it is to the left
; bug: when this is called, [hAutoBGTransferEnabled] is non-zero, so there is screen tearing
SlideTrainerPicOffScreen:
	ldh [hSlideAmount], a
	ld c, a
.slideStepLoop ; each iteration, the trainer pic is slid one tile left/right
	push bc
	push hl
	ld b, 7 ; number of rows
.rowLoop
	push hl
	ldh a, [hSlideAmount]
	ld c, a
.columnLoop
	ldh a, [hSlideAmount]
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
EnemySendOut:
	ld hl, wPartyGainExpFlags
	xor a
	ld [hl], a
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, FLAG_SET
	push bc
	predef FlagActionPredef
	ld hl, wPartyFoughtCurrentEnemyFlags
	xor a
	ld [hl], a
	pop bc
	predef FlagActionPredef

; don't change wPartyGainExpFlags or wPartyFoughtCurrentEnemyFlags
EnemySendOutFirstMon:
	xor a
	ld hl, wEnemyStatsToDouble ; clear enemy statuses
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wEnemyDisabledMove], a
	ld [wEnemyDisabledMoveNumber], a
	ld [wEnemyMonMinimized], a
	ld hl, wPlayerUsedMove
	ld [hli], a
	ld [hl], a
	dec a
	ld [wAICount], a
	ld hl, wPlayerBattleStatus1
	res 5, [hl]
	hlcoord 18, 0
	ld a, 8
	call SlideTrainerPicOffScreen
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .next
	ld a, [wSerialExchangeNybbleReceiveData]
	sub 4
	ld [wWhichPokemon], a
	jr .next3
.next
	ld b, $ff
.next2
	inc b
	ld a, [wEnemyMonPartyPos]
	cp b
	jr z, .next2
	ld hl, wEnemyMon1
	ld a, b
	ld [wWhichPokemon], a
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	pop bc
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hl]
	or c
	jr z, .next2
.next3
	ld a, [wWhichPokemon]
	ld hl, wEnemyMon1Level
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [hl]
	ld [wCurEnemyLVL], a
	ld a, [wWhichPokemon]
	inc a
	ld hl, wEnemyPartyCount
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wEnemyMonSpecies2], a
	ld [wcf91], a
	call LoadEnemyMonData
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wLastSwitchInEnemyMonHP], a
	ld a, [hl]
	ld [wLastSwitchInEnemyMonHP + 1], a
	ld a, 1
	ld [wCurrentMenuItem], a
	ld a, [wFirstMonsNotOutYet]
	dec a
	jr z, .next4
	ld a, [wPartyCount]
	dec a
	jr z, .next4
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .next4
	ld a, [wOptions]
	bit BIT_BATTLE_SHIFT, a
	jr nz, .next4
	ld hl, TrainerAboutToUseText
	call PrintText
	hlcoord 0, 7
	lb bc, 8, 1
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .next4
	ld a, BATTLE_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call DisplayPartyMenu
.next9
	ld a, 1
	ld [wCurrentMenuItem], a
	jr c, .next7
	ld hl, wPlayerMonNumber
	ld a, [wWhichPokemon]
	cp [hl]
	jr nz, .next6
	ld hl, AlreadyOutText
	call PrintText
.next8
	call GoBackToPartyMenu
	jr .next9
.next6
	call HasMonFainted
	jr z, .next8
	xor a
	ld [wCurrentMenuItem], a
.next7
	call GBPalWhiteOut
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer1
.next4
	call ClearSprites
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearScreenArea
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	call GBPalNormal
	ld hl, TrainerSentOutText
	call PrintText
	ld a, [wEnemyMonSpecies2]
	ld [wcf91], a
	ld [wd0b5], a
	call GetMonHeader
	ld de, vFrontPic
	call LoadMonFrontSprite
	ld a, -$31
	ldh [hStartTileID], a
	hlcoord 15, 6
	predef AnimateSendingOutMon
	ld a, [wEnemyMonSpecies2]
	call PlayCry
	call DrawEnemyHUDAndHPBar
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	xor a
	ld [wPartyGainExpFlags], a
	ld [wPartyFoughtCurrentEnemyFlags], a
	call SaveScreenTilesToBuffer1
	jp SwitchPlayerMon

TrainerAboutToUseText:
	text_far _TrainerAboutToUseText
	text_end

TrainerSentOutText:
	text_far _TrainerSentOutText
	text_end

; tests if the player has any pokemon that are not fainted
; sets d = 0 if all fainted, d != 0 if some mons are still alive
AnyPartyAlive::
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
HasMonFainted:
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	or [hl]
	ret nz
	ld a, [wFirstMonsNotOutYet]
	and a
	jr nz, .done
	ld hl, NoWillText
	call PrintText
.done
	xor a
	ret

NoWillText:
	text_far _NoWillText
	text_end

; try to run from battle (hl = player speed, de = enemy speed)
; stores whether the attempt was successful in carry flag
TryRunningFromBattle:
	call IsGhostBattle
	jp z, .canEscape ; jump if it's a ghost battle
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	jp z, .canEscape ; jump if it's a safari battle
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp z, .canEscape
	ld a, [wIsInBattle]
	dec a
	jr nz, .trainerBattle ; jump if it's a trainer battle
	ld a, [wNumRunAttempts]
	inc a
	ld [wNumRunAttempts], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, [de]
	ldh [hEnemySpeed], a
	inc de
	ld a, [de]
	ldh [hEnemySpeed + 1], a
	call LoadScreenTilesFromBuffer1
	ld de, hMultiplicand + 1
	ld hl, hEnemySpeed
	ld c, 2
	call StringCmp
	jr nc, .canEscape ; jump if player speed greater than enemy speed
	xor a
	ldh [hMultiplicand], a
	ld a, 32
	ldh [hMultiplier], a
	call Multiply ; multiply player speed by 32
	ldh a, [hProduct + 2]
	ldh [hDividend], a
	ldh a, [hProduct + 3]
	ldh [hDividend + 1], a
	ldh a, [hEnemySpeed]
	ld b, a
	ldh a, [hEnemySpeed + 1]
; divide enemy speed by 4
	srl b
	rr a
	srl b
	rr a
	and a
	jr z, .canEscape ; jump if enemy speed divided by 4, mod 256 is 0
	ldh [hDivisor], a ; ((enemy speed / 4) % 256)
	ld b, $2
	call Divide ; divide (player speed * 32) by ((enemy speed / 4) % 256)
	ldh a, [hQuotient + 2]
	and a ; is the quotient greater than 256?
	jr nz, .canEscape ; if so, the player can escape
	ld a, [wNumRunAttempts]
	ld c, a
; add 30 to the quotient for each run attempt
.loop
	dec c
	jr z, .compareWithRandomValue
	ld b, 30
	ldh a, [hQuotient + 3]
	add b
	ldh [hQuotient + 3], a
	jr c, .canEscape
	jr .loop
.compareWithRandomValue
	call BattleRandom
	ld b, a
	ldh a, [hQuotient + 3]
	cp b
	jr nc, .canEscape ; if the random value was less than or equal to the quotient
	                  ; plus 30 times the number of attempts, the player can escape
; can't escape
	ld a, $1
	ld [wActionResultOrTookBattleTurn], a ; you lose your turn when you can't escape
	ld hl, CantEscapeText
	jr .printCantEscapeOrNoRunningText
.trainerBattle
	ld hl, NoRunningText
.printCantEscapeOrNoRunningText
	call PrintText
	ld a, 1
	ld [wForcePlayerToChooseMon], a
	call SaveScreenTilesToBuffer1
	and a ; reset carry
	ret
.canEscape
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ld a, $2
	jr nz, .playSound
; link battle
	call SaveScreenTilesToBuffer1
	xor a
	ld [wActionResultOrTookBattleTurn], a
	ld a, LINKBATTLE_RUN
	ld [wPlayerMoveListIndex], a
	call LinkBattleExchangeData
	call LoadScreenTilesFromBuffer1
	ld a, [wSerialExchangeNybbleReceiveData]
	cp LINKBATTLE_RUN
	ld a, $2
	jr z, .playSound
	dec a
.playSound
	ld [wBattleResult], a
	ld a, SFX_RUN
	call PlaySoundWaitForCurrent
	ld hl, GotAwayText
	call PrintText
	call WaitForSoundToFinish
	call SaveScreenTilesToBuffer1
	scf ; set carry
	ret

CantEscapeText:
	text_far _CantEscapeText
	text_end

NoRunningText:
	text_far _NoRunningText
	text_end

GotAwayText:
	text_far _GotAwayText
	text_end

; copies from party data to battle mon data when sending out a new player mon
LoadBattleMonFromParty:
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	ld hl, wPartyMon1Species
	call AddNTimes
	ld de, wBattleMonSpecies
	ld bc, wBattleMonDVs - wBattleMonSpecies
	call CopyData
	ld bc, wPartyMon1DVs - wPartyMon1OTID
	add hl, bc
	ld de, wBattleMonDVs
	ld bc, wPartyMon1PP - wPartyMon1DVs
	call CopyData
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	call CopyData
	ld de, wBattleMonLevel
	ld bc, wBattleMonPP - wBattleMonLevel
	call CopyData
	ld a, [wBattleMonSpecies2]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, wPartyMonNicks
	ld a, [wPlayerMonNumber]
	call SkipFixedLengthTextEntries
	ld de, wBattleMonNick
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wBattleMonLevel
	ld de, wPlayerMonUnmodifiedLevel ; block of memory used for unmodified stats
	ld bc, 1 + NUM_STATS * 2
	call CopyData
	call ApplyBurnAndParalysisPenaltiesToPlayer
	call ApplyBadgeStatBoosts
	ld a, $7 ; default stat modifier
	ld b, NUM_STAT_MODS
	ld hl, wPlayerMonAttackMod
.statModLoop
	ld [hli], a
	dec b
	jr nz, .statModLoop
	ret

; copies from enemy party data to current enemy mon data when sending out a new enemy mon
LoadEnemyMonFromParty:
	ld a, [wWhichPokemon]
	ld bc, wEnemyMon2 - wEnemyMon1
	ld hl, wEnemyMons
	call AddNTimes
	ld de, wEnemyMonSpecies
	ld bc, wEnemyMonDVs - wEnemyMonSpecies
	call CopyData
	ld bc, wEnemyMon1DVs - wEnemyMon1OTID
	add hl, bc
	ld de, wEnemyMonDVs
	ld bc, wEnemyMon1PP - wEnemyMon1DVs
	call CopyData
	ld de, wEnemyMonPP
	ld bc, NUM_MOVES
	call CopyData
	ld de, wEnemyMonLevel
	ld bc, wEnemyMonPP - wEnemyMonLevel
	call CopyData
	ld a, [wEnemyMonSpecies]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, wEnemyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld de, wEnemyMonNick
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wEnemyMonLevel
	ld de, wEnemyMonUnmodifiedLevel ; block of memory used for unmodified stats
	ld bc, 1 + NUM_STATS * 2
	call CopyData
	call ApplyBurnAndParalysisPenaltiesToEnemy
	ld hl, wMonHBaseStats
	ld de, wEnemyMonBaseStats
	ld b, NUM_STATS
.copyBaseStatsLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyBaseStatsLoop
	ld a, $7 ; default stat modifier
	ld b, NUM_STAT_MODS
	ld hl, wEnemyMonStatMods
.statModLoop
	ld [hli], a
	dec b
	jr nz, .statModLoop
	ld a, [wWhichPokemon]
	ld [wEnemyMonPartyPos], a
	ret

SendOutMon:
	callfar PrintSendOutMonMessage
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl] ; is enemy mon HP zero?
	jp z, .skipDrawingEnemyHUDAndHPBar ; if HP is zero, skip drawing the HUD and HP bar
	call DrawEnemyHUDAndHPBar
.skipDrawingEnemyHUDAndHPBar
	call DrawPlayerHUDAndHPBar
	predef LoadMonBackPic
	xor a
	ldh [hStartTileID], a
	ld hl, wBattleAndStartSavedMenuItem
	ld [hli], a
	ld [hl], a
	ld [wBoostExpByExpAll], a
	ld [wDamageMultipliers], a
	ld [wPlayerMoveNum], a
	ld hl, wPlayerUsedMove
	ld [hli], a
	ld [hl], a
	ld hl, wPlayerStatsToDouble
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wPlayerDisabledMove], a
	ld [wPlayerDisabledMoveNumber], a
	ld [wPlayerMonMinimized], a
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	ld hl, wEnemyBattleStatus1
	res USING_TRAPPING_MOVE, [hl]
	ld a, $1
	ldh [hWhoseTurn], a
	ld a, POOF_ANIM
	call PlayMoveAnimation
	hlcoord 4, 11
	predef AnimateSendingOutMon
	ld a, [wcf91]
	call PlayCry
	call PrintEmptyString
	jp SaveScreenTilesToBuffer1

; show 2 stages of the player mon getting smaller before disappearing
AnimateRetreatingPlayerMon:
	hlcoord 1, 5
	lb bc, 7, 7
	call ClearScreenArea
	hlcoord 3, 7
	lb bc, 5, 5
	xor a
	ld [wDownscaledMonSize], a
	ldh [hBaseTileID], a
	predef CopyDownscaledMonTiles
	ld c, 4
	call DelayFrames
	call .clearScreenArea
	hlcoord 4, 9
	lb bc, 3, 3
	ld a, 1
	ld [wDownscaledMonSize], a
	xor a
	ldh [hBaseTileID], a
	predef CopyDownscaledMonTiles
	call Delay3
	call .clearScreenArea
	ld a, $4c
	ldcoord_a 5, 11
.clearScreenArea
	hlcoord 1, 5
	lb bc, 7, 7
	jp ClearScreenArea

; reads player's current mon's HP into wBattleMonHP
ReadPlayerMonCurHPAndStatus:
	ld a, [wPlayerMonNumber]
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wBattleMonHP
	ld bc, $4               ; 2 bytes HP, 1 byte unknown (unused?), 1 byte status
	jp CopyData

DrawHUDsAndHPBars:
	call DrawPlayerHUDAndHPBar
	jp DrawEnemyHUDAndHPBar

DrawPlayerHUDAndHPBar:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearScreenArea
	callfar PlacePlayerHUDTiles
	hlcoord 18, 9
	ld [hl], $73
	ld de, wBattleMonNick
	hlcoord 10, 7
	call CenterMonName
	call PlaceString
	ld hl, wBattleMonSpecies
	ld de, wLoadedMon
	ld bc, wBattleMonDVs - wBattleMonSpecies
	call CopyData
	ld hl, wBattleMonLevel
	ld de, wLoadedMonLevel
	ld bc, wBattleMonPP - wBattleMonLevel
	call CopyData
	hlcoord 14, 8
	push hl
	inc hl
	ld de, wLoadedMonStatus
	call PrintStatusConditionNotFainted
	pop hl
	jr nz, .doNotPrintLevel
	call PrintLevel
.doNotPrintLevel
	ld a, [wLoadedMonSpecies]
	ld [wcf91], a
	hlcoord 10, 9
	predef DrawHP
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld hl, wPlayerHPBarColor
	call GetBattleHealthBarColor
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl]
	jr z, .fainted
	ld a, [wLowHealthAlarmDisabled]
	and a ; has the alarm been disabled because the player has already won?
	ret nz ; if so, return
	ld a, [wPlayerHPBarColor]
	cp HP_BAR_RED
	jr z, .setLowHealthAlarm
.fainted
	ld hl, wLowHealthAlarm
	bit 7, [hl] ;low health alarm enabled?
	ld [hl], $0
	ret z
	xor a
	ld [wChannelSoundIDs + CHAN5], a
	ret
.setLowHealthAlarm
	ld hl, wLowHealthAlarm
	set 7, [hl] ;enable low health alarm
	ret

DrawEnemyHUDAndHPBar:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 0
	lb bc, 4, 12
	call ClearScreenArea
	callfar PlaceEnemyHUDTiles
	ld de, wEnemyMonNick
	hlcoord 1, 0
	call CenterMonName
	call PlaceString
	hlcoord 4, 1
	push hl
	inc hl
	ld de, wEnemyMonStatus
	call PrintStatusConditionNotFainted
	pop hl
	jr nz, .skipPrintLevel ; if the mon has a status condition, skip printing the level
	ld a, [wEnemyMonLevel]
	ld [wLoadedMonLevel], a
	call PrintLevel
.skipPrintLevel
	ld hl, wEnemyMonHP
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hld]
	ldh [hMultiplicand + 2], a
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
	ldh [hMultiplicand], a
	ld a, 48
	ldh [hMultiplier], a
	call Multiply ; multiply current HP by 48
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ldh [hDivisor], a
	ld a, b
	and a ; is max HP > 255?
	jr z, .doDivide
; if max HP > 255, scale both (current HP * 48) and max HP by dividing by 4 so that max HP fits in one byte
; (it needs to be one byte so it can be used as the divisor for the Divide function)
	ldh a, [hDivisor]
	srl b
	rr a
	srl b
	rr a
	ldh [hDivisor], a
	ldh a, [hProduct + 2]
	ld b, a
	srl b
	ldh a, [hProduct + 3]
	rr a
	srl b
	rr a
	ldh [hProduct + 3], a
	ld a, b
	ldh [hProduct + 2], a
.doDivide
	ldh a, [hProduct + 2]
	ldh [hDividend], a
	ldh a, [hProduct + 3]
	ldh [hDividend + 1], a
	ld a, $2
	ld b, a
	call Divide ; divide (current HP * 48) by max HP
	ldh a, [hQuotient + 3]
; set variables for DrawHPBar
	ld e, a
	ld a, $6
	ld d, a
	ld c, a
.drawHPBar
	xor a
	ld [wHPBarType], a
	hlcoord 2, 2
	call DrawHPBar
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld hl, wEnemyHPBarColor

GetBattleHealthBarColor:
	ld b, [hl]
	call GetHealthBarColor
	ld a, [hl]
	cp b
	ret z
	ld b, SET_PAL_BATTLE
	jp RunPaletteCommand

; center's mon's name on the battle screen
; if the name is 1 or 2 letters long, it is printed 2 spaces more to the right than usual
; (i.e. for names longer than 4 letters)
; if the name is 3 or 4 letters long, it is printed 1 space more to the right than usual
; (i.e. for names longer than 4 letters)
CenterMonName:
	push de
	inc hl
	inc hl
	ld b, $2
.loop
	inc de
	ld a, [de]
	cp "@"
	jr z, .done
	inc de
	ld a, [de]
	cp "@"
	jr z, .done
	dec hl
	dec b
	jr nz, .loop
.done
	pop de
	ret

DisplayBattleMenu::
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	ld a, [wBattleType]
	and a
	jr nz, .nonstandardbattle
	call DrawHUDsAndHPBars
	call PrintEmptyString
	call SaveScreenTilesToBuffer1
.nonstandardbattle
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	ld a, BATTLE_MENU_TEMPLATE
	jr nz, .menuselected
	ld a, SAFARI_BATTLE_MENU_TEMPLATE
.menuselected
	ld [wTextBoxID], a
	call DisplayTextBoxID
 ; handle menu input if it's not the old man tutorial
	ld a, [wBattleType]
	dec a
	jp nz, .handleBattleMenuInput
; the following happens for the old man tutorial
	; Temporarily save the player name in wLinkEnemyTrainerName.
	; Since wLinkEnemyTrainerName == wGrassRate, this affects wild encounters.
	; The wGrassRate byte and following wGrassMons buffer are supposed
	; to get overwritten when entering a map with wild Pokémon,
	; but an oversight prevents this in Cinnabar and Route 21,
	; so the infamous MissingNo. glitch can show up.
	ld hl, wPlayerName
	ld de, wLinkEnemyTrainerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, .oldManName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
; the following simulates the keystrokes by drawing menus on screen
	hlcoord 9, 14
	ld [hl], "▶"
	ld c, 80
	call DelayFrames
	ld [hl], " "
	hlcoord 9, 16
	ld [hl], "▶"
	ld c, 50
	call DelayFrames
	ld [hl], "▷"
	ld a, $2 ; select the "ITEM" menu
	jp .upperLeftMenuItemWasNotSelected
.oldManName
	db "OLD MAN@"
.handleBattleMenuInput
	ld a, [wBattleAndStartSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	sub 2 ; check if the cursor is in the left column
	jr c, .leftColumn
; cursor is in the right column
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	jr .rightColumn
.leftColumn ; put cursor in left column of menu
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	ld a, " "
	jr z, .safariLeftColumn
; put cursor in left column for normal battle menu (i.e. when it's not a Safari battle)
	ldcoord_a 15, 14 ; clear upper cursor position in right column
	ldcoord_a 15, 16 ; clear lower cursor position in right column
	ld b, $9 ; top menu item X
	jr .leftColumn_WaitForInput
.safariLeftColumn
	ldcoord_a 13, 14
	ldcoord_a 13, 16
	hlcoord 7, 14
	ld de, wNumSafariBalls
	lb bc, 1, 2
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
	bit BIT_D_RIGHT, a
	jr nz, .rightColumn
	jr .AButtonPressed ; the A button was pressed
.rightColumn ; put cursor in right column of menu
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	ld a, " "
	jr z, .safariRightColumn
; put cursor in right column for normal battle menu (i.e. when it's not a Safari battle)
	ldcoord_a 9, 14 ; clear upper cursor position in left column
	ldcoord_a 9, 16 ; clear lower cursor position in left column
	ld b, $f ; top menu item X
	jr .rightColumn_WaitForInput
.safariRightColumn
	ldcoord_a 1, 14 ; clear upper cursor position in left column
	ldcoord_a 1, 16 ; clear lower cursor position in left column
	hlcoord 7, 14
	ld de, wNumSafariBalls
	lb bc, 1, 2
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
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	ld a, [wCurrentMenuItem]
	ld [wBattleAndStartSavedMenuItem], a
	jr z, .handleMenuSelection
; not Safari battle
; swap the IDs of the item menu and party menu (this is probably because they swapped the positions
; of these menu items in first generation English versions)
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
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
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
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle

; can't use items in link battles
	ld hl, ItemsCantBeUsedHereText
	call PrintText
	jp DisplayBattleMenu

.notLinkBattle
	call SaveScreenTilesToBuffer2
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	jr nz, BagWasSelected

; bait was selected
	ld a, SAFARI_BAIT
	ld [wcf91], a
	jr UseBagItem

BagWasSelected:
	call LoadScreenTilesFromBuffer1
	ld a, [wBattleType]
	and a ; is it a normal battle?
	jr nz, .next

; normal battle
	call DrawHUDsAndHPBars
.next
	ld a, [wBattleType]
	dec a ; is it the old man tutorial?
	jr nz, DisplayPlayerBag ; no, it is a normal battle
	ld hl, OldManItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	jr DisplayBagMenu

OldManItemList:
	db 1 ; # items
	db POKE_BALL, 50
	db -1 ; end

DisplayPlayerBag:
	; get the pointer to player's bag when in a normal battle
	ld hl, wNumBagItems
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a

DisplayBagMenu:
	xor a
	ld [wPrintItemPrices], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld a, [wBagSavedMenuItem]
	ld [wCurrentMenuItem], a
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wBagSavedMenuItem], a
	ld a, $0
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wMenuItemToSwap], a
	jp c, DisplayBattleMenu ; go back to battle menu if an item was not selected

UseBagItem:
	; either use an item from the bag or use a safari zone item
	ld a, [wcf91]
	ld [wd11e], a
	call GetItemName
	call CopyToStringBuffer
	xor a
	ld [wPseudoItemID], a
	call UseItem
	call LoadHudTilePatterns
	call ClearSprites
	xor a
	ld [wCurrentMenuItem], a
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	jr z, .checkIfMonCaptured

	ld a, [wActionResultOrTookBattleTurn]
	and a ; was the item used successfully?
	jp z, BagWasSelected ; if not, go back to the bag menu

	ld a, [wPlayerBattleStatus1]
	bit USING_TRAPPING_MOVE, a ; is the player using a multi-turn move like wrap?
	jr z, .checkIfMonCaptured
	ld hl, wPlayerNumAttacksLeft
	dec [hl]
	jr nz, .checkIfMonCaptured
	ld hl, wPlayerBattleStatus1
	res USING_TRAPPING_MOVE, [hl] ; not using multi-turn move any more

.checkIfMonCaptured
	ld a, [wCapturedMonSpecies]
	and a ; was the enemy mon captured with a ball?
	jr nz, .returnAfterCapturingMon

	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
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
	ld [wCapturedMonSpecies], a
	ld a, $2
	ld [wBattleResult], a
	scf ; set carry
	ret

ItemsCantBeUsedHereText:
	text_far _ItemsCantBeUsedHereText
	text_end

PartyMenuOrRockOrRun:
	dec a ; was Run selected?
	jp nz, BattleMenu_RunWasSelected
; party menu or rock was selected
	call SaveScreenTilesToBuffer2
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	jr nz, .partyMenuWasSelected
; safari battle
	ld a, SAFARI_ROCK
	ld [wcf91], a
	jp UseBagItem
.partyMenuWasSelected
	call LoadScreenTilesFromBuffer1
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
.checkIfPartyMonWasSelected
	jp nc, .partyMonWasSelected ; if a party mon was selected, jump, else we quit the party menu
.quitPartyMenu
	call ClearSprites
	call GBPalWhiteOut
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer2
	call RunDefaultPaletteCommand
	call GBPalNormal
	jp DisplayBattleMenu
.partyMonDeselected
	hlcoord 11, 11
	ld bc, 6 * SCREEN_WIDTH + 9
	ld a, " "
	call FillMemory
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call GoBackToPartyMenu
	jr .checkIfPartyMonWasSelected
.partyMonWasSelected
	ld a, SWITCH_STATS_CANCEL_MENU_TEMPLATE
	ld [wTextBoxID], a
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
	bit BIT_B_BUTTON, a
	jr nz, .partyMonDeselected ; if B was pressed, jump
; A was pressed
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	cp $2 ; was Cancel selected?
	jr z, .quitPartyMenu ; if so, quit the party menu entirely
	and a ; was Switch selected?
	jr z, .switchMon ; if so, jump
; Stats was selected
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld hl, wPartyMon1
	call ClearSprites
; display the two status screens
	predef StatusScreen
	predef StatusScreen2
; now we need to reload the enemy mon pic
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does the enemy mon have a substitute?
	ld hl, AnimationSubstitute
	jr nz, .doEnemyMonAnimation
; enemy mon doesn't have substitute
	ld a, [wEnemyMonMinimized]
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
	ld [wActionResultOrTookBattleTurn], a
	call GBPalWhiteOut
	call ClearSprites
	call LoadHudTilePatterns
	call LoadScreenTilesFromBuffer1
	call RunDefaultPaletteCommand
	call GBPalNormal
; fall through to SwitchPlayerMon

SwitchPlayerMon:
	callfar RetreatMon
	ld c, 50
	call DelayFrames
	call AnimateRetreatingPlayerMon
	ld a, [wWhichPokemon]
	ld [wPlayerMonNumber], a
	ld c, a
	ld b, FLAG_SET
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

AlreadyOutText:
	text_far _AlreadyOutText
	text_end

BattleMenu_RunWasSelected:
	call LoadScreenTilesFromBuffer1
	ld a, $3
	ld [wCurrentMenuItem], a
	ld hl, wBattleMonSpeed
	ld de, wEnemyMonSpeed
	call TryRunningFromBattle
	ld a, 0
	ld [wForcePlayerToChooseMon], a
	ret c
	ld a, [wActionResultOrTookBattleTurn]
	and a
	ret nz ; return if the player couldn't escape
	jp DisplayBattleMenu

MoveSelectionMenu:
	ld a, [wMoveMenuType]
	dec a
	jr z, .mimicmenu
	dec a
	jr z, .relearnmenu
	jr .regularmenu

.loadmoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString
	ret

.writemoves
	ld de, wMovesString
	ldh a, [hUILayoutFlags]
	set 2, a
	ldh [hUILayoutFlags], a
	call PlaceString
	ldh a, [hUILayoutFlags]
	res 2, a
	ldh [hUILayoutFlags], a
	ret

.regularmenu
	call AnyMoveToSelect
	ret z
	ld hl, wBattleMonMoves
	call .loadmoves
	hlcoord 4, 12
	ld b, 4
	ld c, 14
	di ; out of pure coincidence, it is possible for vblank to occur between the di and ei
	   ; so it is necessary to put the di ei block to not cause tearing
	call TextBoxBorder
	hlcoord 4, 12
	ld [hl], $7a
	hlcoord 10, 12
	ld [hl], $7e
	ei
	hlcoord 6, 13
	call .writemoves
	ld b, $5
	ld a, $c
	jr .menuset
.mimicmenu
	ld hl, wEnemyMonMoves
	call .loadmoves
	hlcoord 0, 7
	ld b, 4
	ld c, 14
	call TextBoxBorder
	hlcoord 2, 8
	call .writemoves
	ld b, $1
	ld a, $7
	jr .menuset
.relearnmenu
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	call .loadmoves
	hlcoord 4, 7
	ld b, 4
	ld c, 14
	call TextBoxBorder
	hlcoord 6, 8
	call .writemoves
	ld b, $5
	ld a, $7
.menuset
	ld hl, wTopMenuItemY
	ld [hli], a ; wTopMenuItemY
	ld a, b
	ld [hli], a ; wTopMenuItemX
	ld a, [wMoveMenuType]
	cp $1
	jr z, .selectedmoveknown
	ld a, $1
	jr nc, .selectedmoveknown
	ld a, [wPlayerMoveListIndex]
	inc a
.selectedmoveknown
	ld [hli], a ; wCurrentMenuItem
	inc hl ; wTileBehindCursor untouched
	ld a, [wNumMovesMinusOne]
	inc a
	inc a
	ld [hli], a ; wMaxMenuItem
	ld a, [wMoveMenuType]
	dec a
	ld b, D_UP | D_DOWN | A_BUTTON
	jr z, .matchedkeyspicked
	dec a
	ld b, D_UP | D_DOWN | A_BUTTON | B_BUTTON
	jr z, .matchedkeyspicked
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .matchedkeyspicked
	ld a, [wFlags_D733]
	bit BIT_TEST_BATTLE, a
	ld b, D_UP | D_DOWN | A_BUTTON | B_BUTTON | SELECT
	jr z, .matchedkeyspicked
	ld b, $ff
.matchedkeyspicked
	ld a, b
	ld [hli], a ; wMenuWatchedKeys
	ld a, [wMoveMenuType]
	cp $1
	jr z, .movelistindex1
	ld a, [wPlayerMoveListIndex]
	inc a
.movelistindex1
	ld [hl], a
; fallthrough

SelectMenuItem:
	ld a, [wMoveMenuType]
	and a
	jr z, .battleselect
	dec a
	jr nz, .select
	hlcoord 1, 14
	ld de, WhichTechniqueString
	call PlaceString
	jr .select
.battleselect
	ld a, [wFlags_D733]
	bit BIT_TEST_BATTLE, a
	jr nz, .select
	call PrintMenuItem
	ld a, [wMenuItemToSwap]
	and a
	jr z, .select
	hlcoord 5, 13
	dec a
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▷"
.select
	ld hl, hUILayoutFlags
	set 1, [hl]
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res 1, [hl]
	bit BIT_D_UP, a
	jp nz, SelectMenuItem_CursorUp
	bit BIT_D_DOWN, a
	jp nz, SelectMenuItem_CursorDown
	bit BIT_SELECT, a
	jp nz, SwapMovesInMenu
	bit BIT_B_BUTTON, a
	push af
	xor a
	ld [wMenuItemToSwap], a
	ld a, [wCurrentMenuItem]
	dec a
	ld [wCurrentMenuItem], a
	ld b, a
	ld a, [wMoveMenuType]
	dec a ; if not mimic
	jr nz, .notB
	pop af
	ret
.notB
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
	jr z, .noPP
	ld a, [wPlayerDisabledMove]
	swap a
	and $f
	dec a
	cp c
	jr z, .disabled
	ld a, [wPlayerBattleStatus3]
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
.noPP
	ld hl, MoveNoPPText
.print
	call PrintText
	call LoadScreenTilesFromBuffer1
	jp MoveSelectionMenu

MoveNoPPText:
	text_far _MoveNoPPText
	text_end

MoveDisabledText:
	text_far _MoveDisabledText
	text_end

WhichTechniqueString:
	db "WHICH TECHNIQUE?@"

SelectMenuItem_CursorUp:
	ld a, [wCurrentMenuItem]
	and a
	jp nz, SelectMenuItem
	call EraseMenuCursor
	ld a, [wNumMovesMinusOne]
	inc a
	ld [wCurrentMenuItem], a
	jp SelectMenuItem

SelectMenuItem_CursorDown:
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wNumMovesMinusOne]
	inc a
	inc a
	cp b
	jp nz, SelectMenuItem
	call EraseMenuCursor
	ld a, $1
	ld [wCurrentMenuItem], a
	jp SelectMenuItem

AnyMoveToSelect:
; return z and Struggle as the selected move if all moves have 0 PP and/or are disabled
	ld a, STRUGGLE
	ld [wPlayerSelectedMove], a
	ld a, [wPlayerDisabledMove]
	and a
	ld hl, wBattleMonPP
	jr nz, .handleDisabledMove
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	and $3f
	ret nz
	jr .noMovesLeft
.handleDisabledMove
	swap a
	and $f ; get disabled move
	ld b, a
	ld d, NUM_MOVES + 1
	xor a
.handleDisabledMovePPLoop
	dec d
	jr z, .allMovesChecked
	ld c, [hl] ; get move PP
	inc hl
	dec b ; is this the disabled move?
	jr z, .handleDisabledMovePPLoop ; if so, ignore its PP value
	or c
	jr .handleDisabledMovePPLoop
.allMovesChecked
	and a ; any PP left?
	ret nz ; return if a move has PP left
.noMovesLeft
	ld hl, NoMovesLeftText
	call PrintText
	ld c, 60
	call DelayFrames
	xor a
	ret

NoMovesLeftText:
	text_far _NoMovesLeftText
	text_end

SwapMovesInMenu:
	ld a, [wMenuItemToSwap]
	and a
	jr z, .noMenuItemSelected
	ld hl, wBattleMonMoves
	call .swapBytes ; swap moves
	ld hl, wBattleMonPP
	call .swapBytes ; swap move PP
; update the index of the disabled move if necessary
	ld hl, wPlayerDisabledMove
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
	ld bc, wPartyMon1PP - wPartyMon1Moves
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

PrintMenuItem:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 8
	ld b, 3
	ld c, 9
	call TextBoxBorder
	ld a, [wPlayerDisabledMove]
	and a
	jr z, .notDisabled
	swap a
	and $f
	ld b, a
	ld a, [wCurrentMenuItem]
	cp b
	jr nz, .notDisabled
	hlcoord 1, 10
	ld de, DisabledText
	call PlaceString
	jr .moveDisabled
.notDisabled
	ld hl, wCurrentMenuItem
	dec [hl]
	xor a
	ldh [hWhoseTurn], a
	ld hl, wBattleMonMoves
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0 ; which item in the menu is the cursor pointing to? (0-3)
	add hl, bc ; point to the item (move) in memory
	ld a, [hl]
	ld [wPlayerSelectedMove], a ; update wPlayerSelectedMove even if the move
	                            ; isn't actually selected (just pointed to by the cursor)
	ld a, [wPlayerMonNumber]
	ld [wWhichPokemon], a
	ld a, BATTLE_MON_DATA
	ld [wMonDataLocation], a
	callfar GetMaxPP
	ld hl, wCurrentMenuItem
	ld c, [hl]
	inc [hl]
	ld b, $0
	ld hl, wBattleMonPP
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wcd6d], a
; print TYPE/<type> and <curPP>/<maxPP>
	hlcoord 1, 9
	ld de, TypeText
	call PlaceString
	hlcoord 7, 11
	ld [hl], "/"
	hlcoord 5, 9
	ld [hl], "/"
	hlcoord 5, 11
	ld de, wcd6d
	lb bc, 1, 2
	call PrintNumber
	hlcoord 8, 11
	ld de, wMaxPP
	lb bc, 1, 2
	call PrintNumber
	call GetCurrentMove
	hlcoord 2, 10
	predef PrintMoveType
.moveDisabled
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

DisabledText:
	db "disabled!@"

TypeText:
	db "TYPE@"

SelectEnemyMove:
	ld a, [wLinkState]
	sub LINK_STATE_BATTLING
	jr nz, .noLinkBattle
; link battle
	call SaveScreenTilesToBuffer1
	call LinkBattleExchangeData
	call LoadScreenTilesFromBuffer1
	ld a, [wSerialExchangeNybbleReceiveData]
	cp LINKBATTLE_STRUGGLE
	jp z, .linkedOpponentUsedStruggle
	cp LINKBATTLE_NO_ACTION
	jr z, .unableToSelectMove
	cp 4
	ret nc
	ld [wEnemyMoveListIndex], a
	ld c, a
	ld hl, wEnemyMonMoves
	ld b, 0
	add hl, bc
	ld a, [hl]
	jr .done
.noLinkBattle
	ld a, [wEnemyBattleStatus2]
	and (1 << NEEDS_TO_RECHARGE) | (1 << USING_RAGE) ; need to recharge or using rage
	ret nz
	ld hl, wEnemyBattleStatus1
	ld a, [hl]
	and (1 << CHARGING_UP) | (1 << THRASHING_ABOUT) ; using a charging move or thrash/petal dance
	ret nz
	ld a, [wEnemyMonStatus]
	and (1 << FRZ) | SLP_MASK
	ret nz
	ld a, [wEnemyBattleStatus1]
	and (1 << USING_TRAPPING_MOVE) | (1 << STORING_ENERGY) ; using a trapping move like wrap or bide
	ret nz
	ld a, [wPlayerBattleStatus1]
	bit USING_TRAPPING_MOVE, a ; caught in player's trapping move (e.g. wrap)
	jr z, .canSelectMove
.unableToSelectMove
	ld a, $ff
	jr .done
.canSelectMove
	ld hl, wEnemyMonMoves+1 ; 2nd enemy move
	ld a, [hld]
	and a
	jr nz, .atLeastTwoMovesAvailable
	ld a, [wEnemyDisabledMove]
	and a
	ld a, STRUGGLE ; struggle if the only move is disabled
	jr nz, .done
.atLeastTwoMovesAvailable
	ld a, [wIsInBattle]
	dec a
	jr z, .chooseRandomMove ; wild encounter
	callfar AIEnemyTrainerChooseMoves
.chooseRandomMove
	push hl
	call BattleRandom
	ld b, 1 ; 25% chance to select move 1
	cp 25 percent
	jr c, .moveChosen
	inc hl
	inc b ; 25% chance to select move 2
	cp 50 percent
	jr c, .moveChosen
	inc hl
	inc b ; 25% chance to select move 3
	cp 75 percent - 1
	jr c, .moveChosen
	inc hl
	inc b ; 25% chance to select move 4
.moveChosen
	ld a, b
	dec a
	ld [wEnemyMoveListIndex], a
	ld a, [wEnemyDisabledMove]
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
.linkedOpponentUsedStruggle
	ld a, STRUGGLE
	jr .done

; this appears to exchange data with the other gameboy during link battles
LinkBattleExchangeData:
	ld a, $ff
	ld [wSerialExchangeNybbleReceiveData], a
	ld a, [wPlayerMoveListIndex]
	cp LINKBATTLE_RUN ; is the player running from battle?
	jr z, .doExchange
	ld a, [wActionResultOrTookBattleTurn]
	and a ; is the player switching in another mon?
	jr nz, .switching
; the player used a move
	ld a, [wPlayerSelectedMove]
	cp STRUGGLE
	ld b, LINKBATTLE_STRUGGLE
	jr z, .next
	dec b ; LINKBATTLE_NO_ACTION
	inc a ; does move equal -1 (i.e. no action)?
	jr z, .next
	ld a, [wPlayerMoveListIndex]
	jr .doExchange
.switching
	ld a, [wWhichPokemon]
	add 4
	ld b, a
.next
	ld a, b
.doExchange
	ld [wSerialExchangeNybbleSendData], a
	vc_hook Wireless_start_exchange
	callfar PrintWaitingText
.syncLoop1
	call Serial_ExchangeNybble
	call DelayFrame
	ld a, [wSerialExchangeNybbleReceiveData]
	inc a
	jr z, .syncLoop1
	vc_hook Wireless_end_exchange
	vc_patch Wireless_net_delay_1
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ld b, 26
ELSE
	ld b, 10
ENDC
	vc_patch_end
.syncLoop2
	call DelayFrame
	call Serial_ExchangeNybble
	dec b
	jr nz, .syncLoop2
	vc_hook Wireless_start_send_zero_bytes
	vc_patch Wireless_net_delay_2
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ld b, 26
ELSE
	ld b, 10
ENDC
	vc_patch_end
.syncLoop3
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .syncLoop3
	vc_hook Wireless_end_send_zero_bytes
	ret

ExecutePlayerMove:
	xor a
	ldh [hWhoseTurn], a ; set player's turn
	ld a, [wPlayerSelectedMove]
	inc a
	jp z, ExecutePlayerMoveDone ; for selected move = FF, skip most of player's turn
	xor a
	ld [wMoveMissed], a
	ld [wMonIsDisobedient], a
	ld [wMoveDidntMiss], a
	ld a, $a
	ld [wDamageMultipliers], a
	ld a, [wActionResultOrTookBattleTurn]
	and a ; has the player already used the turn (e.g. by using an item, trying to run or switching pokemon)
	jp nz, ExecutePlayerMoveDone
	call PrintGhostText
	jp z, ExecutePlayerMoveDone
	call CheckPlayerStatusConditions
	jr nz, .playerHasNoSpecialCondition
	jp hl
.playerHasNoSpecialCondition
	call GetCurrentMove
	ld hl, wPlayerBattleStatus1
	bit CHARGING_UP, [hl] ; charging up for attack
	jr nz, PlayerCanExecuteChargingMove
	call CheckForDisobedience
	jp z, ExecutePlayerMoveDone

CheckIfPlayerNeedsToChargeUp:
	ld a, [wPlayerMoveEffect]
	cp CHARGE_EFFECT
	jp z, JumpMoveEffect
	cp FLY_EFFECT
	jp z, JumpMoveEffect
	jr PlayerCanExecuteMove

; in-battle stuff
PlayerCanExecuteChargingMove:
	ld hl, wPlayerBattleStatus1
	res CHARGING_UP, [hl] ; reset charging up and invulnerability statuses if mon was charging up for an attack
	                    ; being fully paralyzed or hurting oneself in confusion removes charging up status
	                    ; resulting in the Pokemon being invulnerable for the whole battle
	res INVULNERABLE, [hl]
PlayerCanExecuteMove:
	call PrintMonName1Text
	ld hl, DecrementPP
	ld de, wPlayerSelectedMove ; pointer to the move just used
	ld b, BANK(DecrementPP)
	call Bankswitch
	ld a, [wPlayerMoveEffect] ; effect of the move just used
	ld hl, ResidualEffects1
	ld de, 1
	call IsInArray
	jp c, JumpMoveEffect ; ResidualEffects1 moves skip damage calculation and accuracy tests
	                    ; unless executed as part of their exclusive effect functions
	ld a, [wPlayerMoveEffect]
	ld hl, SpecialEffectsCont
	ld de, 1
	call IsInArray
	call c, JumpMoveEffect ; execute the effects of SpecialEffectsCont moves (e.g. Wrap, Thrash) but don't skip anything
PlayerCalcMoveDamage:
	ld a, [wPlayerMoveEffect]
	ld hl, SetDamageEffects
	ld de, 1
	call IsInArray
	jp c, .moveHitTest ; SetDamageEffects moves (e.g. Seismic Toss and Super Fang) skip damage calculation
	call CriticalHitTest
	call HandleCounterMove
	jr z, handleIfPlayerMoveMissed
	call GetDamageVarsForPlayerAttack
	call CalculateDamage
	jp z, playerCheckIfFlyOrChargeEffect ; for moves with 0 BP, skip any further damage calculation and, for now, skip MoveHitTest
	               ; for these moves, accuracy tests will only occur if they are called as part of the effect itself
	call AdjustDamageForMoveType
	call RandomizeDamage
.moveHitTest
	call MoveHitTest
handleIfPlayerMoveMissed:
	ld a, [wMoveMissed]
	and a
	jr z, getPlayerAnimationType
	ld a, [wPlayerMoveEffect]
	sub EXPLODE_EFFECT
	jr z, playPlayerMoveAnimation ; don't play any animation if the move missed, unless it was EXPLODE_EFFECT
	jr playerCheckIfFlyOrChargeEffect
getPlayerAnimationType:
	ld a, [wPlayerMoveEffect]
	and a
	ld a, 4 ; move has no effect other than dealing damage
	jr z, playPlayerMoveAnimation
	ld a, 5 ; move has effect
playPlayerMoveAnimation:
	push af
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	ld hl, HideSubstituteShowMonAnim
	ld b, BANK(HideSubstituteShowMonAnim)
	call nz, Bankswitch
	pop af
	ld [wAnimationType], a
	ld a, [wPlayerMoveNum]
	call PlayMoveAnimation
	call HandleExplodingAnimation
	call DrawPlayerHUDAndHPBar
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	ld hl, ReshowSubstituteAnim
	ld b, BANK(ReshowSubstituteAnim)
	call nz, Bankswitch
	jr MirrorMoveCheck
playerCheckIfFlyOrChargeEffect:
	ld c, 30
	call DelayFrames
	ld a, [wPlayerMoveEffect]
	cp FLY_EFFECT
	jr z, .playAnim
	cp CHARGE_EFFECT
	jr z, .playAnim
	jr MirrorMoveCheck
.playAnim
	xor a
	ld [wAnimationType], a
	ld a, STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
MirrorMoveCheck:
	ld a, [wPlayerMoveEffect]
	cp MIRROR_MOVE_EFFECT
	jr nz, .metronomeCheck
	call MirrorMoveCopyMove
	jp z, ExecutePlayerMoveDone
	xor a
	ld [wMonIsDisobedient], a
	jp CheckIfPlayerNeedsToChargeUp ; if Mirror Move was successful go back to damage calculation for copied move
.metronomeCheck
	cp METRONOME_EFFECT
	jr nz, .next
	call MetronomePickMove
	jp CheckIfPlayerNeedsToChargeUp ; Go back to damage calculation for the move picked by Metronome
.next
	ld a, [wPlayerMoveEffect]
	ld hl, ResidualEffects2
	ld de, 1
	call IsInArray
	jp c, JumpMoveEffect ; done here after executing effects of ResidualEffects2
	ld a, [wMoveMissed]
	and a
	jr z, .moveDidNotMiss
	call PrintMoveFailureText
	ld a, [wPlayerMoveEffect]
	cp EXPLODE_EFFECT ; even if Explosion or Selfdestruct missed, its effect still needs to be activated
	jr z, .notDone
	jp ExecutePlayerMoveDone ; otherwise, we're done if the move missed
.moveDidNotMiss
	call ApplyAttackToEnemyPokemon
	call PrintCriticalOHKOText
	callfar DisplayEffectiveness
	ld a, 1
	ld [wMoveDidntMiss], a
.notDone
	ld a, [wPlayerMoveEffect]
	ld hl, AlwaysHappenSideEffects
	ld de, 1
	call IsInArray
	call c, JumpMoveEffect ; not done after executing effects of AlwaysHappenSideEffects
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld b, [hl]
	or b
	ret z ; don't do anything else if the enemy fainted
	call HandleBuildingRage

	ld hl, wPlayerBattleStatus1
	bit ATTACKING_MULTIPLE_TIMES, [hl]
	jr z, .executeOtherEffects
	ld a, [wPlayerNumAttacksLeft]
	dec a
	ld [wPlayerNumAttacksLeft], a
	jp nz, getPlayerAnimationType ; for multi-hit moves, apply attack until PlayerNumAttacksLeft hits 0 or the enemy faints.
	                             ; damage calculation and accuracy tests only happen for the first hit
	res ATTACKING_MULTIPLE_TIMES, [hl] ; clear attacking multiple times status when all attacks are over
	ld hl, MultiHitText
	call PrintText
	xor a
	ld [wPlayerNumHits], a
.executeOtherEffects
	ld a, [wPlayerMoveEffect]
	and a
	jp z, ExecutePlayerMoveDone
	ld hl, SpecialEffects
	ld de, 1
	call IsInArray
	call nc, JumpMoveEffect ; move effects not included in SpecialEffects or in either of the ResidualEffect arrays,
	; which are the effects not covered yet. Rage effect will be executed for a second time (though it's irrelevant).
	; Includes side effects that only need to be called if the target didn't faint.
	; Responsible for executing Twineedle's second side effect (poison).
	jp ExecutePlayerMoveDone

MultiHitText:
	text_far _MultiHitText
	text_end

ExecutePlayerMoveDone:
	xor a
	ld [wActionResultOrTookBattleTurn], a
	ld b, 1
	ret

PrintGhostText:
; print the ghost battle messages
	call IsGhostBattle
	ret nz
	ldh a, [hWhoseTurn]
	and a
	jr nz, .Ghost
	ld a, [wBattleMonStatus] ; player's turn
	and (1 << FRZ) | SLP_MASK
	ret nz
	ld hl, ScaredText
	call PrintText
	xor a
	ret
.Ghost ; ghost's turn
	ld hl, GetOutText
	call PrintText
	xor a
	ret

ScaredText:
	text_far _ScaredText
	text_end

GetOutText:
	text_far _GetOutText
	text_end

IsGhostBattle:
	ld a, [wIsInBattle]
	dec a
	ret nz
	ld a, [wCurMap]
	cp POKEMON_TOWER_1F
	jr c, .next
	cp POKEMON_TOWER_7F + 1
	jr nc, .next
	ld b, SILPH_SCOPE
	call IsItemInBag
	ret z
.next
	ld a, 1
	and a
	ret

; checks for various status conditions affecting the player mon
; stores whether the mon cannot use a move this turn in Z flag
CheckPlayerStatusConditions:
	ld hl, wBattleMonStatus
	ld a, [hl]
	and SLP_MASK
	jr z, .FrozenCheck
; sleeping
	dec a
	ld [wBattleMonStatus], a ; decrement number of turns left
	and a
	jr z, .WakeUp ; if the number of turns hit 0, wake up
; fast asleep
	xor a
	ld [wAnimationType], a
	ld a, SLP_ANIM - 1
	call PlayMoveAnimation
	ld hl, FastAsleepText
	call PrintText
	jr .sleepDone
.WakeUp
	ld hl, WokeUpText
	call PrintText
.sleepDone
	xor a
	ld [wPlayerUsedMove], a
	ld hl, ExecutePlayerMoveDone ; player can't move this turn
	jp .returnToHL

.FrozenCheck
	bit FRZ, [hl] ; frozen?
	jr z, .HeldInPlaceCheck
	ld hl, IsFrozenText
	call PrintText
	xor a
	ld [wPlayerUsedMove], a
	ld hl, ExecutePlayerMoveDone ; player can't move this turn
	jp .returnToHL

.HeldInPlaceCheck
	ld a, [wEnemyBattleStatus1]
	bit USING_TRAPPING_MOVE, a ; is enemy using a multi-turn move like wrap?
	jp z, .FlinchedCheck
	ld hl, CantMoveText
	call PrintText
	ld hl, ExecutePlayerMoveDone ; player can't move this turn
	jp .returnToHL

.FlinchedCheck
	ld hl, wPlayerBattleStatus1
	bit FLINCHED, [hl]
	jp z, .HyperBeamCheck
	res FLINCHED, [hl] ; reset player's flinch status
	ld hl, FlinchedText
	call PrintText
	ld hl, ExecutePlayerMoveDone ; player can't move this turn
	jp .returnToHL

.HyperBeamCheck
	ld hl, wPlayerBattleStatus2
	bit NEEDS_TO_RECHARGE, [hl]
	jr z, .AnyMoveDisabledCheck
	res NEEDS_TO_RECHARGE, [hl] ; reset player's recharge status
	ld hl, MustRechargeText
	call PrintText
	ld hl, ExecutePlayerMoveDone ; player can't move this turn
	jp .returnToHL

.AnyMoveDisabledCheck
	ld hl, wPlayerDisabledMove
	ld a, [hl]
	and a
	jr z, .ConfusedCheck
	dec a
	ld [hl], a
	and $f ; did Disable counter hit 0?
	jr nz, .ConfusedCheck
	ld [hl], a
	ld [wPlayerDisabledMoveNumber], a
	ld hl, DisabledNoMoreText
	call PrintText

.ConfusedCheck
	ld a, [wPlayerBattleStatus1]
	add a ; is player confused?
	jr nc, .TriedToUseDisabledMoveCheck
	ld hl, wPlayerConfusedCounter
	dec [hl]
	jr nz, .IsConfused
	ld hl, wPlayerBattleStatus1
	res CONFUSED, [hl] ; if confused counter hit 0, reset confusion status
	ld hl, ConfusedNoMoreText
	call PrintText
	jr .TriedToUseDisabledMoveCheck
.IsConfused
	ld hl, IsConfusedText
	call PrintText
	xor a
	ld [wAnimationType], a
	ld a, CONF_ANIM - 1
	call PlayMoveAnimation
	call BattleRandom
	cp 50 percent + 1 ; chance to hurt itself
	jr c, .TriedToUseDisabledMoveCheck
	ld hl, wPlayerBattleStatus1
	ld a, [hl]
	and 1 << CONFUSED ; if mon hurts itself, clear every other status from wPlayerBattleStatus1
	ld [hl], a
	call HandleSelfConfusionDamage
	jr .MonHurtItselfOrFullyParalysed

.TriedToUseDisabledMoveCheck
; prevents a disabled move that was selected before being disabled from being used
	ld a, [wPlayerDisabledMoveNumber]
	and a
	jr z, .ParalysisCheck
	ld hl, wPlayerSelectedMove
	cp [hl]
	jr nz, .ParalysisCheck
	call PrintMoveIsDisabledText
	ld hl, ExecutePlayerMoveDone ; if a disabled move was somehow selected, player can't move this turn
	jp .returnToHL

.ParalysisCheck
	ld hl, wBattleMonStatus
	bit PAR, [hl]
	jr z, .BideCheck
	call BattleRandom
	cp $3F ; 25% to be fully paralyzed
	jr nc, .BideCheck
	ld hl, FullyParalyzedText
	call PrintText

.MonHurtItselfOrFullyParalysed
	ld hl, wPlayerBattleStatus1
	ld a, [hl]
	; clear bide, thrashing, charging up, and trapping moves such as warp (already cleared for confusion damage)
	and ~((1 << STORING_ENERGY) | (1 << THRASHING_ABOUT) | (1 << CHARGING_UP) | (1 << USING_TRAPPING_MOVE))
	ld [hl], a
	ld a, [wPlayerMoveEffect]
	cp FLY_EFFECT
	jr z, .FlyOrChargeEffect
	cp CHARGE_EFFECT
	jr z, .FlyOrChargeEffect
	jr .NotFlyOrChargeEffect

.FlyOrChargeEffect
	xor a
	ld [wAnimationType], a
	ld a, STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
.NotFlyOrChargeEffect
	ld hl, ExecutePlayerMoveDone
	jp .returnToHL ; if using a two-turn move, we need to recharge the first turn

.BideCheck
	ld hl, wPlayerBattleStatus1
	bit STORING_ENERGY, [hl] ; is mon using bide?
	jr z, .ThrashingAboutCheck
	xor a
	ld [wPlayerMoveNum], a
	ld hl, wDamage
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerBideAccumulatedDamage + 1
	ld a, [hl]
	add c ; accumulate damage taken
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, wPlayerNumAttacksLeft
	dec [hl] ; did Bide counter hit 0?
	jr z, .UnleashEnergy
	ld hl, ExecutePlayerMoveDone
	jp .returnToHL ; unless mon unleashes energy, can't move this turn
.UnleashEnergy
	ld hl, wPlayerBattleStatus1
	res STORING_ENERGY, [hl] ; not using bide any more
	ld hl, UnleashedEnergyText
	call PrintText
	ld a, 1
	ld [wPlayerMovePower], a
	ld hl, wPlayerBideAccumulatedDamage + 1
	ld a, [hld]
	add a
	ld b, a
	ld [wDamage + 1], a
	ld a, [hl]
	rl a ; double the damage
	ld [wDamage], a
	or b
	jr nz, .next
	ld a, 1
	ld [wMoveMissed], a
.next
	xor a
	ld [hli], a
	ld [hl], a
	ld a, BIDE
	ld [wPlayerMoveNum], a
	ld hl, handleIfPlayerMoveMissed ; skip damage calculation, DecrementPP and MoveHitTest
	jp .returnToHL

.ThrashingAboutCheck
	bit THRASHING_ABOUT, [hl] ; is mon using thrash or petal dance?
	jr z, .MultiturnMoveCheck
	ld a, THRASH
	ld [wPlayerMoveNum], a
	ld hl, ThrashingAboutText
	call PrintText
	ld hl, wPlayerNumAttacksLeft
	dec [hl] ; did Thrashing About counter hit 0?
	ld hl, PlayerCalcMoveDamage ; skip DecrementPP
	jp nz, .returnToHL
	push hl
	ld hl, wPlayerBattleStatus1
	res THRASHING_ABOUT, [hl] ; no longer thrashing about
	set CONFUSED, [hl] ; confused
	call BattleRandom
	and 3
	inc a
	inc a ; confused for 2-5 turns
	ld [wPlayerConfusedCounter], a
	pop hl ; skip DecrementPP
	jp .returnToHL

.MultiturnMoveCheck
	bit USING_TRAPPING_MOVE, [hl] ; is mon using multi-turn move?
	jp z, .RageCheck
	ld hl, AttackContinuesText
	call PrintText
	ld a, [wPlayerNumAttacksLeft]
	dec a ; did multi-turn move end?
	ld [wPlayerNumAttacksLeft], a
	ld hl, getPlayerAnimationType ; if it didn't, skip damage calculation (deal damage equal to last hit),
	                ; DecrementPP and MoveHitTest
	jp nz, .returnToHL
	jp .returnToHL

.RageCheck
	ld a, [wPlayerBattleStatus2]
	bit USING_RAGE, a ; is mon using rage?
	jp z, .checkPlayerStatusConditionsDone ; if we made it this far, mon can move normally this turn
	ld a, RAGE
	ld [wd11e], a
	call GetMoveName
	call CopyToStringBuffer
	xor a
	ld [wPlayerMoveEffect], a
	ld hl, PlayerCanExecuteMove
	jp .returnToHL

.returnToHL
	xor a
	ret

.checkPlayerStatusConditionsDone
	ld a, $1
	and a
	ret

FastAsleepText:
	text_far _FastAsleepText
	text_end

WokeUpText:
	text_far _WokeUpText
	text_end

IsFrozenText:
	text_far _IsFrozenText
	text_end

FullyParalyzedText:
	text_far _FullyParalyzedText
	text_end

FlinchedText:
	text_far _FlinchedText
	text_end

MustRechargeText:
	text_far _MustRechargeText
	text_end

DisabledNoMoreText:
	text_far _DisabledNoMoreText
	text_end

IsConfusedText:
	text_far _IsConfusedText
	text_end

HurtItselfText:
	text_far _HurtItselfText
	text_end

ConfusedNoMoreText:
	text_far _ConfusedNoMoreText
	text_end

SavingEnergyText:
	text_far _SavingEnergyText
	text_end

UnleashedEnergyText:
	text_far _UnleashedEnergyText
	text_end

ThrashingAboutText:
	text_far _ThrashingAboutText
	text_end

AttackContinuesText:
	text_far _AttackContinuesText
	text_end

CantMoveText:
	text_far _CantMoveText
	text_end

PrintMoveIsDisabledText:
	ld hl, wPlayerSelectedMove
	ld de, wPlayerBattleStatus1
	ldh a, [hWhoseTurn]
	and a
	jr z, .removeChargingUp
	inc hl
	ld de, wEnemyBattleStatus1
.removeChargingUp
	ld a, [de]
	res CHARGING_UP, a ; end the pokemon's
	ld [de], a
	ld a, [hl]
	ld [wd11e], a
	call GetMoveName
	ld hl, MoveIsDisabledText
	jp PrintText

MoveIsDisabledText:
	text_far _MoveIsDisabledText
	text_end

HandleSelfConfusionDamage:
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
	ld hl, wPlayerMoveEffect
	push hl
	ld a, [hl]
	push af
	xor a
	ld [hli], a
	ld [wCriticalHitOrOHKO], a ; self-inflicted confusion damage can't be a Critical Hit
	ld a, 40 ; 40 base power
	ld [hli], a
	xor a
	ld [hl], a
	call GetDamageVarsForPlayerAttack
	call CalculateDamage ; ignores AdjustDamageForMoveType (type-less damage), RandomizeDamage,
	                     ; and MoveHitTest (always hits)
	pop af
	pop hl
	ld [hl], a
	ld hl, wEnemyMonDefense + 1
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	xor a
	ld [wAnimationType], a
	inc a
	ldh [hWhoseTurn], a
	call PlayMoveAnimation
	call DrawPlayerHUDAndHPBar
	xor a
	ldh [hWhoseTurn], a
	jp ApplyDamageToPlayerPokemon

PrintMonName1Text:
	ld hl, MonName1Text
	jp PrintText

; this function wastes time calling DetermineExclamationPointTextNum
; and choosing between Used1Text and Used2Text, even though
; those text strings are identical and both continue at PrintInsteadText
; this likely had to do with Japanese grammar that got translated,
; but the functionality didn't get removed
MonName1Text:
	text_far _MonName1Text
	text_asm
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wPlayerUsedMove
	jr z, .playerTurn
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyUsedMove
.playerTurn
	ld [hl], a
	ld [wd11e], a
	call DetermineExclamationPointTextNum
	ld a, [wMonIsDisobedient]
	and a
	ld hl, Used2Text
	ret nz
	ld a, [wd11e]
	cp 3
	ld hl, Used2Text
	ret c
	ld hl, Used1Text
	ret

Used1Text:
	text_far _Used1Text
	text_asm
	jr PrintInsteadText

Used2Text:
	text_far _Used2Text
	text_asm
	; fall through

PrintInsteadText:
	ld a, [wMonIsDisobedient]
	and a
	jr z, PrintMoveName
	ld hl, InsteadText
	ret

InsteadText:
	text_far _InsteadText
	text_asm
	; fall through

PrintMoveName:
	ld hl, _PrintMoveName
	ret

_PrintMoveName:
	text_far _MoveNameText
	text_asm
	ld hl, ExclamationPointPointerTable
	ld a, [wd11e] ; exclamation point num
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

ExclamationPointPointerTable:
	dw ExclamationPoint1Text
	dw ExclamationPoint2Text
	dw ExclamationPoint3Text
	dw ExclamationPoint4Text
	dw ExclamationPoint5Text

ExclamationPoint1Text:
	text_far _ExclamationPoint1Text
	text_end

ExclamationPoint2Text:
	text_far _ExclamationPoint2Text
	text_end

ExclamationPoint3Text:
	text_far _ExclamationPoint3Text
	text_end

ExclamationPoint4Text:
	text_far _ExclamationPoint4Text
	text_end

ExclamationPoint5Text:
	text_far _ExclamationPoint5Text
	text_end

; this function does nothing useful
; if the move being used is in set [1-4] from ExclamationPointMoveSets,
; use ExclamationPoint[1-4]Text
; otherwise, use ExclamationPoint5Text
; but all five text strings are identical
; this likely had to do with Japanese grammar that got translated,
; but the functionality didn't get removed
DetermineExclamationPointTextNum:
	push bc
	ld a, [wd11e] ; move ID
	ld c, a
	ld b, $0
	ld hl, ExclamationPointMoveSets
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp c
	jr z, .done
	and a
	jr nz, .loop
	inc b
	jr .loop
.done
	ld a, b
	ld [wd11e], a ; exclamation point num
	pop bc
	ret

INCLUDE "data/moves/grammar.asm"

PrintMoveFailureText:
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .playersTurn
	ld de, wEnemyMoveEffect
.playersTurn
	ld hl, DoesntAffectMonText
	ld a, [wDamageMultipliers]
	and $7f
	jr z, .gotTextToPrint
	ld hl, AttackMissedText
	ld a, [wCriticalHitOrOHKO]
	cp $ff
	jr nz, .gotTextToPrint
	ld hl, UnaffectedText
.gotTextToPrint
	push de
	call PrintText
	xor a
	ld [wCriticalHitOrOHKO], a
	pop de
	ld a, [de]
	cp JUMP_KICK_EFFECT
	ret nz

	; if you get here, the mon used jump kick or hi jump kick and missed
	ld hl, wDamage ; since the move missed, wDamage will always contain 0 at this point.
	                ; Thus, recoil damage will always be equal to 1
	                ; even if it was intended to be potential damage/8.
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
	jr nz, .applyRecoil
	inc a
	ld [hl], a
.applyRecoil
	ld hl, KeptGoingAndCrashedText
	call PrintText
	ld b, $4
	predef PredefShakeScreenHorizontally
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
	jp ApplyDamageToPlayerPokemon
.enemyTurn
	jp ApplyDamageToEnemyPokemon

AttackMissedText:
	text_far _AttackMissedText
	text_end

KeptGoingAndCrashedText:
	text_far _KeptGoingAndCrashedText
	text_end

UnaffectedText:
	text_far _UnaffectedText
	text_end

PrintDoesntAffectText:
	ld hl, DoesntAffectMonText
	jp PrintText

DoesntAffectMonText:
	text_far _DoesntAffectMonText
	text_end

; if there was a critical hit or an OHKO was successful, print the corresponding text
PrintCriticalOHKOText:
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
	ld c, 20
	jp DelayFrames

CriticalOHKOTextPointers:
	dw CriticalHitText
	dw OHKOText

CriticalHitText:
	text_far _CriticalHitText
	text_end

OHKOText:
	text_far _OHKOText
	text_end

; checks if a traded mon will disobey due to lack of badges
; stores whether the mon will use a move in Z flag
CheckForDisobedience:
	xor a
	ld [wMonIsDisobedient], a
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
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
	ld hl, wObtainedBadges
	bit BIT_EARTHBADGE, [hl]
	ld a, 101
	jr nz, .next
	bit BIT_MARSHBADGE, [hl]
	ld a, 70
	jr nz, .next
	bit BIT_RAINBOWBADGE, [hl]
	ld a, 50
	jr nz, .next
	bit BIT_CASCADEBADGE, [hl]
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
	and SLP_MASK
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
	ld a, [wPlayerDisabledMoveNumber]
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
	ld [wMonIsDisobedient], a
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
	and a ; clear Z flag
	ret
.cannotUseMove
	xor a ; set Z flag
	ret

LoafingAroundText:
	text_far _LoafingAroundText
	text_end

BeganToNapText:
	text_far _BeganToNapText
	text_end

WontObeyText:
	text_far _WontObeyText
	text_end

TurnedAwayText:
	text_far _TurnedAwayText
	text_end

IgnoredOrdersText:
	text_far _IgnoredOrdersText
	text_end

; sets b, c, d, and e for the CalculateDamage routine in the case of an attack by the player mon
GetDamageVarsForPlayerAttack:
	xor a
	ld hl, wDamage ; damage to eventually inflict, initialise to zero
	ldi [hl], a
	ld [hl], a
	ld hl, wPlayerMovePower
	ld a, [hli]
	and a
	ld d, a ; d = move power
	ret z ; return if move power is zero
	ld a, [hl] ; a = [wPlayerMoveType]
	cp SPECIAL ; types >= SPECIAL are all special
	jr nc, .specialAttack
.physicalAttack
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = enemy defense
	ld a, [wEnemyBattleStatus3]
	bit HAS_REFLECT_UP, a ; check for Reflect
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
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
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
	ld a, [wEnemyBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a ; check for Light Screen
	jr z, .specialAttackCritCheck
; if the enemy has used Light Screen, double the enemy's special
	sla c
	rl b
; reflect and light screen boosts do not cap the stat at MAX_STAT_VALUE, so weird things will happen during stats scaling
; if a Pokemon with 512 or more Defense has used Reflect, or if a Pokemon with 512 or more Special has used Light Screen
.specialAttackCritCheck
	ld hl, wBattleMonSpecial
	ld a, [wCriticalHitOrOHKO]
	and a ; check for critical hit
	jr z, .scaleStats
; in the case of a critical hit, reset the player's and enemy's specials to their base values
	ld c, 5 ; special stat
	call GetEnemyMonStat
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
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
	ld b, l ; b = player's offensive stat (possibly scaled)
	        ; (c already contains enemy's defensive stat (possibly scaled))
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
GetDamageVarsForEnemyAttack:
	ld hl, wDamage ; damage to eventually inflict, initialise to zero
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wEnemyMovePower
	ld a, [hli]
	ld d, a ; d = move power
	and a
	ret z ; return if move power is zero
	ld a, [hl] ; a = [wEnemyMoveType]
	cp SPECIAL ; types >= SPECIAL are all special
	jr nc, .specialAttack
.physicalAttack
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl] ; bc = player defense
	ld a, [wPlayerBattleStatus3]
	bit HAS_REFLECT_UP, a ; check for Reflect
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
	ld hl, hProduct + 2
	pop bc
	jr .scaleStats
.specialAttack
	ld hl, wBattleMonSpecial
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [wPlayerBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a ; check for Light Screen
	jr z, .specialAttackCritCheck
; if the player has used Light Screen, double the player's special
	sla c
	rl b
; reflect and light screen boosts do not cap the stat at MAX_STAT_VALUE, so weird things will happen during stats scaling
; if a Pokemon with 512 or more Defense has used Reflect, or if a Pokemon with 512 or more Special has used Light Screen
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
	ld hl, hProduct + 2
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
	ld b, l ; b = enemy's offensive stat (possibly scaled)
	        ; (c already contains player's defensive stat (possibly scaled))
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
GetEnemyMonStat:
	push de
	push bc
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle
	ld hl, wEnemyMon1Stats
	dec c
	sla c
	ld b, $0
	add hl, bc
	ld a, [wEnemyMonPartyPos]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	pop bc
	pop de
	ret
.notLinkBattle
	ld a, [wEnemyMonLevel]
	ld [wCurEnemyLVL], a
	ld a, [wEnemyMonSpecies]
	ld [wd0b5], a
	call GetMonHeader
	ld hl, wEnemyMonDVs
	ld de, wLoadedMonSpeedExp
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop bc
	ld b, $0
	ld hl, wLoadedMonSpeedExp - $b ; this base address makes CalcStat look in [wLoadedMonSpeedExp] for DVs
	call CalcStat
	pop de
	ret

CalculateDamage:
; input:
;   b: attack
;   c: opponent defense
;   d: base power
;   e: level

	ldh a, [hWhoseTurn] ; whose turn?
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .effect
	ld a, [wEnemyMoveEffect]
.effect

; EXPLODE_EFFECT halves defense.
	cp EXPLODE_EFFECT
	jr nz, .ok
	srl c
	jr nz, .ok
	inc c ; ...with a minimum value of 1 (used as a divisor later on)
.ok

; Multi-hit attacks may or may not have 0 bp.
	cp TWO_TO_FIVE_ATTACKS_EFFECT
	jr z, .skipbp
	cp $1e
	jr z, .skipbp

; Calculate OHKO damage based on remaining HP.
	cp OHKO_EFFECT
	jp z, JumpToOHKOMoveEffect

; Don't calculate damage for moves that don't do any.
	ld a, d ; base power
	and a
	ret z
.skipbp

	xor a
	ld hl, hDividend
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

; Update wCurDamage.
; Capped at MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE: 999 - 2 = 997.
	ld hl, wDamage
	ld b, [hl]
	ldh a, [hQuotient + 3]
	add b
	ldh [hQuotient + 3], a
	jr nc, .dont_cap_1

	ldh a, [hQuotient + 2]
	inc a
	ldh [hQuotient + 2], a
	and a
	jr z, .cap

.dont_cap_1
	ldh a, [hQuotient]
	ld b, a
	ldh a, [hQuotient + 1]
	or a
	jr nz, .cap

	ldh a, [hQuotient + 2]
	cp HIGH(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_2

	cp HIGH(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .cap

	ldh a, [hQuotient + 3]
	cp LOW(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE + 1)
	jr nc, .cap

.dont_cap_2
	inc hl

	ldh a, [hQuotient + 3]
	ld b, [hl]
	add b
	ld [hld], a

	ldh a, [hQuotient + 2]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .cap

	ld a, [hl]
	cp HIGH(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

	cp HIGH(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .cap

	inc hl
	ld a, [hld]
	cp LOW(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

.cap
	ld a, HIGH(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE)
	ld [hli], a
	ld a, LOW(MAX_NEUTRAL_DAMAGE - MIN_NEUTRAL_DAMAGE)
	ld [hld], a

.dont_cap_3
; Add back MIN_NEUTRAL_DAMAGE (capping at 999).
	inc hl
	ld a, [hl]
	add MIN_NEUTRAL_DAMAGE
	ld [hld], a
	jr nc, .dont_floor
	inc [hl]
.dont_floor

; Returns nz and nc.
	ld a, 1
	and a
	ret

JumpToOHKOMoveEffect:
	call JumpMoveEffect
	ld a, [wMoveMissed]
	dec a
	ret

INCLUDE "data/battle/unused_critical_hit_moves.asm"

; determines if attack is a critical hit
; Azure Heights claims "the fastest pokémon (who are, not coincidentally,
; among the most popular) tend to CH about 20 to 25% of the time."
CriticalHitTest:
	xor a
	ld [wCriticalHitOrOHKO], a
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr nz, .handleEnemy
	ld a, [wBattleMonSpecies]
.handleEnemy
	ld [wd0b5], a
	call GetMonHeader
	ld a, [wMonHBaseSpeed]
	ld b, a
	srl b                        ; (effective (base speed/2))
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMovePower
	ld de, wPlayerBattleStatus2
	jr z, .calcCriticalHitProbability
	ld hl, wEnemyMovePower
	ld de, wEnemyBattleStatus2
.calcCriticalHitProbability
	ld a, [hld]                  ; read base power from RAM
	and a
	ret z                        ; do nothing if zero
	dec hl
	ld c, [hl]                   ; read move id
	ld a, [de]
	bit GETTING_PUMPED, a        ; test for focus energy
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

INCLUDE "data/battle/critical_hit_moves.asm"

; function to determine if Counter hits and if so, how much damage it does
HandleCounterMove:
; The variables checked by Counter are updated whenever the cursor points to a new move in the battle selection menu.
; This is irrelevant for the opponent's side outside of link battles, since the move selection is controlled by the AI.
; However, in the scenario where the player switches out and the opponent uses Counter,
; the outcome may be affected by the player's actions in the move selection menu prior to switching the Pokemon.
; This might also lead to desync glitches in link battles.

	ldh a, [hWhoseTurn] ; whose turn
	and a
; player's turn
	ld hl, wEnemySelectedMove
	ld de, wEnemyMovePower
	ld a, [wPlayerSelectedMove]
	jr z, .next
; enemy's turn
	ld hl, wPlayerSelectedMove
	ld de, wPlayerMovePower
	ld a, [wEnemySelectedMove]
.next
	cp COUNTER
	ret nz ; return if not using Counter
	ld a, $01
	ld [wMoveMissed], a ; initialize the move missed variable to true (it is set to false below if the move hits)
	ld a, [hl]
	cp COUNTER
	ret z ; miss if the opponent's last selected move is Counter.
	ld a, [de]
	and a
	ret z ; miss if the opponent's last selected move's Base Power is 0.
; check if the move the target last selected was Normal or Fighting type
	inc de
	ld a, [de]
	and a ; normal type
	jr z, .counterableType
	cp FIGHTING
	jr z, .counterableType
; if the move wasn't Normal or Fighting type, miss
	xor a
	ret
.counterableType
	ld hl, wDamage
	ld a, [hli]
	or [hl]
	ret z ; If we made it here, Counter still misses if the last move used in battle did no damage to its target.
	      ; wDamage is shared by both players, so Counter may strike back damage dealt by the Counter user itself
	      ; if the conditions meet, even though 99% of the times damage will come from the target.
; if it did damage, double it
	ld a, [hl]
	add a
	ldd [hl], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .noCarry
; damage is capped at 0xFFFF
	ld a, $ff
	ld [hli], a
	ld [hl], a
.noCarry
	xor a
	ld [wMoveMissed], a
	call MoveHitTest ; do the normal move hit test in addition to Counter's special rules
	xor a
	ret

ApplyAttackToEnemyPokemon:
	ld a, [wPlayerMoveEffect]
	cp OHKO_EFFECT
	jr z, ApplyDamageToEnemyPokemon
	cp SUPER_FANG_EFFECT
	jr z, .superFangEffect
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .specialDamage
	ld a, [wPlayerMovePower]
	and a
	jp z, ApplyAttackToEnemyPokemonDone ; no attack to apply if base power is 0
	jr ApplyDamageToEnemyPokemon
.superFangEffect
; set the damage to half the target's HP
	ld hl, wEnemyMonHP
	ld de, wDamage
	ld a, [hli]
	srl a
	ld [de], a
	inc de
	ld b, a
	ld a, [hl]
	rr a
	ld [de], a
	or b
	jr nz, ApplyDamageToEnemyPokemon
; make sure Super Fang's damage is always at least 1
	ld a, $01
	ld [de], a
	jr ApplyDamageToEnemyPokemon
.specialDamage
	ld hl, wBattleMonLevel
	ld a, [hl]
	ld b, a ; Seismic Toss deals damage equal to the user's level
	ld a, [wPlayerMoveNum]
	cp SEISMIC_TOSS
	jr z, .storeDamage
	cp NIGHT_SHADE
	jr z, .storeDamage
	ld b, SONICBOOM_DAMAGE ; 20
	cp SONICBOOM
	jr z, .storeDamage
	ld b, DRAGON_RAGE_DAMAGE ; 40
	cp DRAGON_RAGE
	jr z, .storeDamage
; Psywave
	ld a, [hl]
	ld b, a
	srl a
	add b
	ld b, a ; b = level * 1.5
; loop until a random number in the range [1, b) is found
.loop
	call BattleRandom
	and a
	jr z, .loop
	cp b
	jr nc, .loop
	ld b, a
.storeDamage ; store damage value at b
	ld hl, wDamage
	xor a
	ld [hli], a
	ld a, b
	ld [hl], a

ApplyDamageToEnemyPokemon:
	ld hl, wDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, ApplyAttackToEnemyPokemonDone ; we're done if damage is 0
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does the enemy have a substitute?
	jp nz, AttackSubstitute
; subtract the damage from the pokemon's current HP
; also, save the current HP at wHPBarOldHP
	ld a, [hld]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	ld [wHPBarOldHP], a
	sub b
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [wEnemyMonHP]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [wEnemyMonHP], a
	jr nc, .animateHpBar
; if more damage was done than the current HP, zero the HP and set the damage (wDamage)
; equal to how much HP the pokemon had before the attack
	ld a, [wHPBarOldHP+1]
	ld [hli], a
	ld a, [wHPBarOldHP]
	ld [hl], a
	xor a
	ld hl, wEnemyMonHP
	ld [hli], a
	ld [hl], a
.animateHpBar
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wHPBarNewHP+1], a
	ld a, [hl]
	ld [wHPBarNewHP], a
	hlcoord 2, 2
	xor a
	ld [wHPBarType], a
	predef UpdateHPBar2 ; animate the HP bar shortening
ApplyAttackToEnemyPokemonDone:
	jp DrawHUDsAndHPBars

ApplyAttackToPlayerPokemon:
	ld a, [wEnemyMoveEffect]
	cp OHKO_EFFECT
	jr z, ApplyDamageToPlayerPokemon
	cp SUPER_FANG_EFFECT
	jr z, .superFangEffect
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .specialDamage
	ld a, [wEnemyMovePower]
	and a
	jp z, ApplyAttackToPlayerPokemonDone
	jr ApplyDamageToPlayerPokemon
.superFangEffect
; set the damage to half the target's HP
	ld hl, wBattleMonHP
	ld de, wDamage
	ld a, [hli]
	srl a
	ld [de], a
	inc de
	ld b, a
	ld a, [hl]
	rr a
	ld [de], a
	or b
	jr nz, ApplyDamageToPlayerPokemon
; make sure Super Fang's damage is always at least 1
	ld a, $01
	ld [de], a
	jr ApplyDamageToPlayerPokemon
.specialDamage
	ld hl, wEnemyMonLevel
	ld a, [hl]
	ld b, a
	ld a, [wEnemyMoveNum]
	cp SEISMIC_TOSS
	jr z, .storeDamage
	cp NIGHT_SHADE
	jr z, .storeDamage
	ld b, SONICBOOM_DAMAGE
	cp SONICBOOM
	jr z, .storeDamage
	ld b, DRAGON_RAGE_DAMAGE
	cp DRAGON_RAGE
	jr z, .storeDamage
; Psywave
	ld a, [hl]
	ld b, a
	srl a
	add b
	ld b, a ; b = attacker's level * 1.5
; loop until a random number in the range [0, b) is found
; this differs from the range when the player attacks, which is [1, b)
; it's possible for the enemy to do 0 damage with Psywave, but the player always does at least 1 damage
.loop
	call BattleRandom
	cp b
	jr nc, .loop
	ld b, a
.storeDamage
	ld hl, wDamage
	xor a
	ld [hli], a
	ld a, b
	ld [hl], a

ApplyDamageToPlayerPokemon:
	ld hl, wDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, ApplyAttackToPlayerPokemonDone ; we're done if damage is 0
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does the player have a substitute?
	jp nz, AttackSubstitute
; subtract the damage from the pokemon's current HP
; also, save the current HP at wHPBarOldHP and the new HP at wHPBarNewHP
	ld a, [hld]
	ld b, a
	ld a, [wBattleMonHP + 1]
	ld [wHPBarOldHP], a
	sub b
	ld [wBattleMonHP + 1], a
	ld [wHPBarNewHP], a
	ld b, [hl]
	ld a, [wBattleMonHP]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [wBattleMonHP], a
	ld [wHPBarNewHP+1], a
	jr nc, .animateHpBar
; if more damage was done than the current HP, zero the HP and set the damage (wDamage)
; equal to how much HP the pokemon had before the attack
	ld a, [wHPBarOldHP+1]
	ld [hli], a
	ld a, [wHPBarOldHP]
	ld [hl], a
	xor a
	ld hl, wBattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, wHPBarNewHP
	ld [hli], a
	ld [hl], a
.animateHpBar
	ld hl, wBattleMonMaxHP
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	hlcoord 10, 9
	ld a, $01
	ld [wHPBarType], a
	predef UpdateHPBar2 ; animate the HP bar shortening
ApplyAttackToPlayerPokemonDone:
	jp DrawHUDsAndHPBars

AttackSubstitute:
; Unlike the two ApplyAttackToPokemon functions, Attack Substitute is shared by player and enemy.
; Self-confusion damage as well as Hi-Jump Kick and Jump Kick recoil cause a momentary turn swap before being applied.
; If the user has a Substitute up and would take damage because of that,
; damage will be applied to the other player's Substitute.
; Normal recoil such as from Double-Edge isn't affected by this glitch,
; because this function is never called in that case.

	ld hl, SubstituteTookDamageText
	call PrintText
; values for player turn
	ld de, wEnemySubstituteHP
	ld bc, wEnemyBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .applyDamageToSubstitute
; values for enemy turn
	ld de, wPlayerSubstituteHP
	ld bc, wPlayerBattleStatus2
.applyDamageToSubstitute
	ld hl, wDamage
	ld a, [hli]
	and a
	jr nz, .substituteBroke ; damage > 0xFF always breaks substitutes
; subtract damage from HP of substitute
	ld a, [de]
	sub [hl]
	ld [de], a
	ret nc
.substituteBroke
; If the target's Substitute breaks, wDamage isn't updated with the amount of HP
; the Substitute had before being attacked.
	ld h, b
	ld l, c
	res HAS_SUBSTITUTE_UP, [hl] ; unset the substitute bit
	ld hl, SubstituteBrokeText
	call PrintText
; flip whose turn it is for the next function call
	ldh a, [hWhoseTurn]
	xor $01
	ldh [hWhoseTurn], a
	callfar HideSubstituteShowMonAnim ; animate the substitute breaking
; flip the turn back to the way it was
	ldh a, [hWhoseTurn]
	xor $01
	ldh [hWhoseTurn], a
	ld hl, wPlayerMoveEffect ; value for player's turn
	and a
	jr z, .nullifyEffect
	ld hl, wEnemyMoveEffect ; value for enemy's turn
.nullifyEffect
	xor a
	ld [hl], a ; zero the effect of the attacker's move
	jp DrawHUDsAndHPBars

SubstituteTookDamageText:
	text_far _SubstituteTookDamageText
	text_end

SubstituteBrokeText:
	text_far _SubstituteBrokeText
	text_end

; this function raises the attack modifier of a pokemon using Rage when that pokemon is attacked
HandleBuildingRage:
; values for the player turn
	ld hl, wEnemyBattleStatus2
	ld de, wEnemyMonStatMods
	ld bc, wEnemyMoveNum
	ldh a, [hWhoseTurn]
	and a
	jr z, .next
; values for the enemy turn
	ld hl, wPlayerBattleStatus2
	ld de, wPlayerMonStatMods
	ld bc, wPlayerMoveNum
.next
	bit USING_RAGE, [hl] ; is the pokemon being attacked under the effect of Rage?
	ret z ; return if not
	ld a, [de]
	cp $0d ; maximum stat modifier value
	ret z ; return if attack modifier is already maxed
	ldh a, [hWhoseTurn]
	xor $01 ; flip turn for the stat modifier raising function
	ldh [hWhoseTurn], a
; temporarily change the target pokemon's move to $00 and the effect to the one
; that causes the attack modifier to go up one stage
	ld h, b
	ld l, c
	ld [hl], $00 ; null move number
	inc hl
	ld [hl], ATTACK_UP1_EFFECT
	push hl
	ld hl, BuildingRageText
	call PrintText
	call StatModifierUpEffect ; stat modifier raising function
	pop hl
	xor a
	ldd [hl], a ; null move effect
	ld a, RAGE
	ld [hl], a ; restore the target pokemon's move number to Rage
	ldh a, [hWhoseTurn]
	xor $01 ; flip turn back to the way it was
	ldh [hWhoseTurn], a
	ret

BuildingRageText:
	text_far _BuildingRageText
	text_end

; copy last move for Mirror Move
; sets zero flag on failure and unsets zero flag on success
MirrorMoveCopyMove:
; Mirror Move makes use of wPlayerUsedMove and wEnemyUsedMove,
; which are mainly used to print the "[Pokemon] used [Move]" text.
; Both are set to 0 whenever a new Pokemon is sent out
; wPlayerUsedMove is also set to 0 whenever the player is fast asleep or frozen solid.
; wEnemyUsedMove is also set to 0 whenever the enemy is fast asleep or frozen solid.

	ldh a, [hWhoseTurn]
	and a
; values for player turn
	ld a, [wEnemyUsedMove]
	ld hl, wPlayerSelectedMove
	ld de, wPlayerMoveNum
	jr z, .next
; values for enemy turn
	ld a, [wPlayerUsedMove]
	ld de, wEnemyMoveNum
	ld hl, wEnemySelectedMove
.next
	ld [hl], a
	cp MIRROR_MOVE ; did the target Pokemon last use Mirror Move, and miss?
	jr z, .mirrorMoveFailed
	and a ; has the target selected any move yet?
	jr nz, ReloadMoveData
.mirrorMoveFailed
	ld hl, MirrorMoveFailedText
	call PrintText
	xor a
	ret

MirrorMoveFailedText:
	text_far _MirrorMoveFailedText
	text_end

; function used to reload move data for moves like Mirror Move and Metronome
ReloadMoveData:
	ld [wd11e], a
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call FarCopyData ; copy the move's stats
	call IncrementMovePP
; the follow two function calls are used to reload the move name
	call GetMoveName
	call CopyToStringBuffer
	ld a, $01
	and a
	ret

; function that picks a random move for metronome
MetronomePickMove:
	xor a
	ld [wAnimationType], a
	ld a, METRONOME
	call PlayMoveAnimation ; play Metronome's animation
; values for player turn
	ld de, wPlayerMoveNum
	ld hl, wPlayerSelectedMove
	ldh a, [hWhoseTurn]
	and a
	jr z, .pickMoveLoop
; values for enemy turn
	ld de, wEnemyMoveNum
	ld hl, wEnemySelectedMove
; loop to pick a random number in the range of valid moves used by Metronome
.pickMoveLoop
	call BattleRandom
	and a
	jr z, .pickMoveLoop
	cp STRUGGLE
	assert NUM_ATTACKS == STRUGGLE ; random numbers greater than STRUGGLE are not moves
	jr nc, .pickMoveLoop
	cp METRONOME
	jr z, .pickMoveLoop
	ld [hl], a
	jr ReloadMoveData

; this function increments the current move's PP
; it's used to prevent moves that run another move within the same turn
; (like Mirror Move and Metronome) from losing 2 PP
IncrementMovePP:
	ldh a, [hWhoseTurn]
	and a
; values for player turn
	ld hl, wBattleMonPP
	ld de, wPartyMon1PP
	ld a, [wPlayerMoveListIndex]
	jr z, .next
; values for enemy turn
	ld hl, wEnemyMonPP
	ld de, wEnemyMon1PP
	ld a, [wEnemyMoveListIndex]
.next
	ld b, $00
	ld c, a
	add hl, bc
	inc [hl] ; increment PP in the currently battling pokemon memory location
	ld h, d
	ld l, e
	add hl, bc
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMonNumber] ; value for player turn
	jr z, .updatePP
	ld a, [wEnemyMonPartyPos] ; value for enemy turn
.updatePP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	inc [hl] ; increment PP in the party memory location
	ret

; function to adjust the base damage of an attack to account for type effectiveness
AdjustDamageForMoveType:
; values for player turn
	ld hl, wBattleMonType
	ld a, [hli]
	ld b, a    ; b = type 1 of attacker
	ld c, [hl] ; c = type 2 of attacker
	ld hl, wEnemyMonType
	ld a, [hli]
	ld d, a    ; d = type 1 of defender
	ld e, [hl] ; e = type 2 of defender
	ld a, [wPlayerMoveType]
	ld [wMoveType], a
	ldh a, [hWhoseTurn]
	and a
	jr z, .next
; values for enemy turn
	ld hl, wEnemyMonType
	ld a, [hli]
	ld b, a    ; b = type 1 of attacker
	ld c, [hl] ; c = type 2 of attacker
	ld hl, wBattleMonType
	ld a, [hli]
	ld d, a    ; d = type 1 of defender
	ld e, [hl] ; e = type 2 of defender
	ld a, [wEnemyMoveType]
	ld [wMoveType], a
.next
	ld a, [wMoveType]
	cp b ; does the move type match type 1 of the attacker?
	jr z, .sameTypeAttackBonus
	cp c ; does the move type match type 2 of the attacker?
	jr z, .sameTypeAttackBonus
	jr .skipSameTypeAttackBonus
.sameTypeAttackBonus
; if the move type matches one of the attacker's types
	ld hl, wDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a    ; hl = damage
	ld b, h
	ld c, l    ; bc = damage
	srl b
	rr c      ; bc = floor(0.5 * damage)
	add hl, bc ; hl = floor(1.5 * damage)
; store damage
	ld a, h
	ld [wDamage], a
	ld a, l
	ld [wDamage + 1], a
	ld hl, wDamageMultipliers
	set 7, [hl]
.skipSameTypeAttackBonus
	ld a, [wMoveType]
	ld b, a
	ld hl, TypeEffects
.loop
	ld a, [hli] ; a = "attacking type" of the current type pair
	cp $ff
	jr z, .done
	cp b ; does move type match "attacking type"?
	jr nz, .nextTypePair
	ld a, [hl] ; a = "defending type" of the current type pair
	cp d ; does type 1 of defender match "defending type"?
	jr z, .matchingPairFound
	cp e ; does type 2 of defender match "defending type"?
	jr z, .matchingPairFound
	jr .nextTypePair
.matchingPairFound
; if the move type matches the "attacking type" and one of the defender's types matches the "defending type"
	push hl
	push bc
	inc hl
	ld a, [wDamageMultipliers]
	and $80
	ld b, a
	ld a, [hl] ; a = damage multiplier
	ldh [hMultiplier], a
	add b
	ld [wDamageMultipliers], a
	xor a
	ldh [hMultiplicand], a
	ld hl, wDamage
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hld]
	ldh [hMultiplicand + 2], a
	call Multiply
	ld a, 10
	ldh [hDivisor], a
	ld b, $04
	call Divide
	ldh a, [hQuotient + 2]
	ld [hli], a
	ld b, a
	ldh a, [hQuotient + 3]
	ld [hl], a
	or b ; is damage 0?
	jr nz, .skipTypeImmunity
.typeImmunity
; if damage is 0, make the move miss
; this only occurs if a move that would do 2 or 3 damage is 0.25x effective against the target
	inc a
	ld [wMoveMissed], a
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
; the result is stored in [wTypeEffectiveness]
; ($05 is not very effective, $10 is neutral, $14 is super effective)
; as far is can tell, this is only used once in some AI code to help decide which move to use
AIGetTypeEffectiveness:
	ld a, [wEnemyMoveType]
	ld d, a                    ; d = type of enemy move
	ld hl, wBattleMonType
	ld b, [hl]                 ; b = type 1 of player's pokemon
	inc hl
	ld c, [hl]                 ; c = type 2 of player's pokemon
	ld a, $10
	ld [wTypeEffectiveness], a ; initialize to neutral effectiveness
	ld hl, TypeEffects
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp d                      ; match the type of the move
	jr nz, .nextTypePair1
	ld a, [hli]
	cp b                      ; match with type 1 of pokemon
	jr z, .done
	cp c                      ; or match with type 2 of pokemon
	jr z, .done
	jr .nextTypePair2
.nextTypePair1
	inc hl
.nextTypePair2
	inc hl
	jr .loop
.done
	ld a, [hl]
	ld [wTypeEffectiveness], a ; store damage multiplier
	ret

INCLUDE "data/types/type_matchups.asm"

; some tests that need to pass for a move to hit
MoveHitTest:
; player's turn
	ld hl, wEnemyBattleStatus1
	ld de, wPlayerMoveEffect
	ld bc, wEnemyMonStatus
	ldh a, [hWhoseTurn]
	and a
	jr z, .dreamEaterCheck
; enemy's turn
	ld hl, wPlayerBattleStatus1
	ld de, wEnemyMoveEffect
	ld bc, wBattleMonStatus
.dreamEaterCheck
	ld a, [de]
	cp DREAM_EATER_EFFECT
	jr nz, .swiftCheck
	ld a, [bc]
	and SLP_MASK
	jp z, .moveMissed
.swiftCheck
	ld a, [de]
	cp SWIFT_EFFECT
	ret z ; Swift never misses (this was fixed from the Japanese versions)
	call CheckTargetSubstitute ; substitute check (note that this overwrites a)
	jr z, .checkForDigOrFlyStatus
; The fix for Swift broke this code. It's supposed to prevent HP draining moves from working on Substitutes.
; Since CheckTargetSubstitute overwrites a with either $00 or $01, it never works.
	cp DRAIN_HP_EFFECT
	jp z, .moveMissed
	cp DREAM_EATER_EFFECT
	jp z, .moveMissed
.checkForDigOrFlyStatus
	bit INVULNERABLE, [hl]
	jp nz, .moveMissed
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
.playerTurn
; this checks if the move effect is disallowed by mist
	ld a, [wPlayerMoveEffect]
	cp ATTACK_DOWN1_EFFECT
	jr c, .skipEnemyMistCheck
	cp HAZE_EFFECT + 1
	jr c, .enemyMistCheck
	cp ATTACK_DOWN2_EFFECT
	jr c, .skipEnemyMistCheck
	cp REFLECT_EFFECT + 1
	jr c, .enemyMistCheck
	jr .skipEnemyMistCheck
.enemyMistCheck
; if move effect is from $12 to $19 inclusive or $3a to $41 inclusive
; i.e. the following moves
; GROWL, TAIL WHIP, LEER, STRING SHOT, SAND-ATTACK, SMOKESCREEN, KINESIS,
; FLASH, CONVERSION*, HAZE*, SCREECH, LIGHT SCREEN*, REFLECT*
; the moves that are marked with an asterisk are not affected since this
; function is not called when those moves are used
	ld a, [wEnemyBattleStatus2]
	bit PROTECTED_BY_MIST, a ; is mon protected by mist?
	jp nz, .moveMissed
.skipEnemyMistCheck
	ld a, [wPlayerBattleStatus2]
	bit USING_X_ACCURACY, a ; is the player using X Accuracy?
	ret nz ; if so, always hit regardless of accuracy/evasion
	jr .calcHitChance
.enemyTurn
	ld a, [wEnemyMoveEffect]
	cp ATTACK_DOWN1_EFFECT
	jr c, .skipPlayerMistCheck
	cp HAZE_EFFECT + 1
	jr c, .playerMistCheck
	cp ATTACK_DOWN2_EFFECT
	jr c, .skipPlayerMistCheck
	cp REFLECT_EFFECT + 1
	jr c, .playerMistCheck
	jr .skipPlayerMistCheck
.playerMistCheck
; similar to enemy mist check
	ld a, [wPlayerBattleStatus2]
	bit PROTECTED_BY_MIST, a ; is mon protected by mist?
	jp nz, .moveMissed
.skipPlayerMistCheck
	ld a, [wEnemyBattleStatus2]
	bit USING_X_ACCURACY, a ; is the enemy using X Accuracy?
	ret nz ; if so, always hit regardless of accuracy/evasion
.calcHitChance
	call CalcHitChance ; scale the move accuracy according to attacker's accuracy and target's evasion
	ld a, [wPlayerMoveAccuracy]
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	jr z, .doAccuracyCheck
	ld a, [wEnemyMoveAccuracy]
	ld b, a
.doAccuracyCheck
; if the random number generated is greater than or equal to the scaled accuracy, the move misses
; note that this means that even the highest accuracy is still just a 255/256 chance, not 100%
	call BattleRandom
	cp b
	jr nc, .moveMissed
	ret
.moveMissed
	xor a
	ld hl, wDamage ; zero the damage
	ld [hli], a
	ld [hl], a
	inc a
	ld [wMoveMissed], a
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn2
.enemyTurn2
	ld hl, wEnemyBattleStatus1
	res USING_TRAPPING_MOVE, [hl] ; end multi-turn attack e.g. wrap
	ret
.playerTurn2
	ld hl, wPlayerBattleStatus1
	res USING_TRAPPING_MOVE, [hl] ; end multi-turn attack e.g. wrap
	ret

; values for player turn
CalcHitChance:
	ld hl, wPlayerMoveAccuracy
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMonAccuracyMod]
	ld b, a
	ld a, [wEnemyMonEvasionMod]
	ld c, a
	jr z, .next
; values for enemy turn
	ld hl, wEnemyMoveAccuracy
	ld a, [wEnemyMonAccuracyMod]
	ld b, a
	ld a, [wPlayerMonEvasionMod]
	ld c, a
.next
	ld a, $0e
	sub c
	ld c, a ; c = 14 - EVASIONMOD (this "reflects" the value over 7, so that an increase in the target's evasion
	       ; decreases the hit chance instead of increasing the hit chance)
; zero the high bytes of the multiplicand
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a ; set multiplicand to move accuracy
	push hl
	ld d, $02 ; loop has two iterations
; loop to do the calculations, the first iteration multiplies by the accuracy ratio and
; the second iteration multiplies by the evasion ratio
.loop
	push bc
	ld hl, StatModifierRatios  ; stat modifier ratios
	dec b
	sla b
	ld c, b
	ld b, $00
	add hl, bc ; hl = address of stat modifier ratio
	pop bc
	ld a, [hli]
	ldh [hMultiplier], a ; set multiplier to the numerator of the ratio
	call Multiply
	ld a, [hl]
	ldh [hDivisor], a ; set divisor to the the denominator of the ratio
	                 ; (the dividend is the product of the previous multiplication)
	ld b, $04 ; number of bytes in the dividend
	call Divide
	ldh a, [hQuotient + 3]
	ld b, a
	ldh a, [hQuotient + 2]
	or b
	jp nz, .nextCalculation
; make sure the result is always at least one
	ldh [hQuotient + 2], a
	ld a, $01
	ldh [hQuotient + 3], a
.nextCalculation
	ld b, c
	dec d
	jr nz, .loop
	ldh a, [hQuotient + 2]
	and a ; is the calculated hit chance over 0xFF?
	ldh a, [hQuotient + 3]
	jr z, .storeAccuracy
; if calculated hit chance over 0xFF
	ld a, $ff ; set the hit chance to 0xFF
.storeAccuracy
	pop hl
	ld [hl], a ; store the hit chance in the move accuracy variable
	ret

; multiplies damage by a random percentage from ~85% to 100%
RandomizeDamage:
	ld hl, wDamage
	ld a, [hli]
	and a
	jr nz, .DamageGreaterThanOne
	ld a, [hl]
	cp 2
	ret c ; return if damage is equal to 0 or 1
.DamageGreaterThanOne
	xor a
	ldh [hMultiplicand], a
	dec hl
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
; loop until a random number greater than or equal to 217 is generated
.loop
	call BattleRandom
	rrca
	cp 217
	jr c, .loop
	ldh [hMultiplier], a
	call Multiply ; multiply damage by the random number, which is in the range [217, 255]
	ld a, 255
	ldh [hDivisor], a
	ld b, $4
	call Divide ; divide the result by 255
; store the modified damage
	ldh a, [hQuotient + 2]
	ld hl, wDamage
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

; for more detailed commentary, see equivalent function for player side (ExecutePlayerMove)
ExecuteEnemyMove:
	ld a, [wEnemySelectedMove]
	inc a
	jp z, ExecuteEnemyMoveDone
	call PrintGhostText
	jp z, ExecuteEnemyMoveDone
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .executeEnemyMove
	ld b, $1
	ld a, [wSerialExchangeNybbleReceiveData]
	cp LINKBATTLE_STRUGGLE
	jr z, .executeEnemyMove
	cp 4
	ret nc
.executeEnemyMove
	ld hl, wAILayer2Encouragement
	inc [hl]
	xor a
	ld [wMoveMissed], a
	ld [wMoveDidntMiss], a
	ld a, $a
	ld [wDamageMultipliers], a
	call CheckEnemyStatusConditions
	jr nz, .enemyHasNoSpecialConditions
	jp hl
.enemyHasNoSpecialConditions
	ld hl, wEnemyBattleStatus1
	bit CHARGING_UP, [hl] ; is the enemy charging up for attack?
	jr nz, EnemyCanExecuteChargingMove ; if so, jump
	call GetCurrentMove

CheckIfEnemyNeedsToChargeUp:
	ld a, [wEnemyMoveEffect]
	cp CHARGE_EFFECT
	jp z, JumpMoveEffect
	cp FLY_EFFECT
	jp z, JumpMoveEffect
	jr EnemyCanExecuteMove
EnemyCanExecuteChargingMove:
	ld hl, wEnemyBattleStatus1
	res CHARGING_UP, [hl] ; no longer charging up for attack
	res INVULNERABLE, [hl] ; no longer invulnerable to typical attacks
	ld a, [wEnemyMoveNum]
	ld [wd0b5], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [wNameListType], a
	call GetName
	ld de, wcd6d
	call CopyToStringBuffer
EnemyCanExecuteMove:
	xor a
	ld [wMonIsDisobedient], a
	call PrintMonName1Text
	ld a, [wEnemyMoveEffect]
	ld hl, ResidualEffects1
	ld de, $1
	call IsInArray
	jp c, JumpMoveEffect
	ld a, [wEnemyMoveEffect]
	ld hl, SpecialEffectsCont
	ld de, $1
	call IsInArray
	call c, JumpMoveEffect
EnemyCalcMoveDamage:
	call SwapPlayerAndEnemyLevels
	ld a, [wEnemyMoveEffect]
	ld hl, SetDamageEffects
	ld de, $1
	call IsInArray
	jp c, EnemyMoveHitTest
	call CriticalHitTest
	call HandleCounterMove
	jr z, handleIfEnemyMoveMissed
	call SwapPlayerAndEnemyLevels
	call GetDamageVarsForEnemyAttack
	call SwapPlayerAndEnemyLevels
	call CalculateDamage
	jp z, EnemyCheckIfFlyOrChargeEffect
	call AdjustDamageForMoveType
	call RandomizeDamage

EnemyMoveHitTest:
	call MoveHitTest
handleIfEnemyMoveMissed:
	ld a, [wMoveMissed]
	and a
	jr z, .moveDidNotMiss
	ld a, [wEnemyMoveEffect]
	cp EXPLODE_EFFECT
	jr z, handleExplosionMiss
	jr EnemyCheckIfFlyOrChargeEffect
.moveDidNotMiss
	call SwapPlayerAndEnemyLevels

GetEnemyAnimationType:
	ld a, [wEnemyMoveEffect]
	and a
	ld a, $1
	jr z, playEnemyMoveAnimation
	ld a, $2
	jr playEnemyMoveAnimation
handleExplosionMiss:
	call SwapPlayerAndEnemyLevels
	xor a
playEnemyMoveAnimation:
	push af
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does mon have a substitute?
	ld hl, HideSubstituteShowMonAnim
	ld b, BANK(HideSubstituteShowMonAnim)
	call nz, Bankswitch
	pop af
	ld [wAnimationType], a
	ld a, [wEnemyMoveNum]
	call PlayMoveAnimation
	call HandleExplodingAnimation
	call DrawEnemyHUDAndHPBar
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does mon have a substitute?
	ld hl, ReshowSubstituteAnim
	ld b, BANK(ReshowSubstituteAnim)
	call nz, Bankswitch ; slide the substitute's sprite out
	jr EnemyCheckIfMirrorMoveEffect

EnemyCheckIfFlyOrChargeEffect:
	call SwapPlayerAndEnemyLevels
	ld c, 30
	call DelayFrames
	ld a, [wEnemyMoveEffect]
	cp FLY_EFFECT
	jr z, .playAnim
	cp CHARGE_EFFECT
	jr z, .playAnim
	jr EnemyCheckIfMirrorMoveEffect
.playAnim
	xor a
	ld [wAnimationType], a
	ld a, STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
EnemyCheckIfMirrorMoveEffect:
	ld a, [wEnemyMoveEffect]
	cp MIRROR_MOVE_EFFECT
	jr nz, .notMirrorMoveEffect
	call MirrorMoveCopyMove
	jp z, ExecuteEnemyMoveDone
	jp CheckIfEnemyNeedsToChargeUp
.notMirrorMoveEffect
	cp METRONOME_EFFECT
	jr nz, .notMetronomeEffect
	call MetronomePickMove
	jp CheckIfEnemyNeedsToChargeUp
.notMetronomeEffect
	ld a, [wEnemyMoveEffect]
	ld hl, ResidualEffects2
	ld de, $1
	call IsInArray
	jp c, JumpMoveEffect
	ld a, [wMoveMissed]
	and a
	jr z, .moveDidNotMiss
	call PrintMoveFailureText
	ld a, [wEnemyMoveEffect]
	cp EXPLODE_EFFECT
	jr z, .handleExplosionMiss
	jp ExecuteEnemyMoveDone
.moveDidNotMiss
	call ApplyAttackToPlayerPokemon
	call PrintCriticalOHKOText
	callfar DisplayEffectiveness
	ld a, 1
	ld [wMoveDidntMiss], a
.handleExplosionMiss
	ld a, [wEnemyMoveEffect]
	ld hl, AlwaysHappenSideEffects
	ld de, $1
	call IsInArray
	call c, JumpMoveEffect
	ld hl, wBattleMonHP
	ld a, [hli]
	ld b, [hl]
	or b
	ret z
	call HandleBuildingRage
	ld hl, wEnemyBattleStatus1
	bit ATTACKING_MULTIPLE_TIMES, [hl] ; is mon hitting multiple times? (example: double kick)
	jr z, .notMultiHitMove
	push hl
	ld hl, wEnemyNumAttacksLeft
	dec [hl]
	pop hl
	jp nz, GetEnemyAnimationType
	res ATTACKING_MULTIPLE_TIMES, [hl] ; mon is no longer hitting multiple times
	ld hl, HitXTimesText
	call PrintText
	xor a
	ld [wEnemyNumHits], a
.notMultiHitMove
	ld a, [wEnemyMoveEffect]
	and a
	jr z, ExecuteEnemyMoveDone
	ld hl, SpecialEffects
	ld de, $1
	call IsInArray
	call nc, JumpMoveEffect
	jr ExecuteEnemyMoveDone

HitXTimesText:
	text_far _HitXTimesText
	text_end

ExecuteEnemyMoveDone:
	ld b, $1
	ret

; checks for various status conditions affecting the enemy mon
; stores whether the mon cannot use a move this turn in Z flag
CheckEnemyStatusConditions:
	ld hl, wEnemyMonStatus
	ld a, [hl]
	and SLP_MASK
	jr z, .checkIfFrozen
	dec a ; decrement number of turns left
	ld [wEnemyMonStatus], a
	and a
	jr z, .wokeUp ; if the number of turns hit 0, wake up
	ld hl, FastAsleepText
	call PrintText
	xor a
	ld [wAnimationType], a
	ld a, SLP_ANIM
	call PlayMoveAnimation
	jr .sleepDone
.wokeUp
	ld hl, WokeUpText
	call PrintText
.sleepDone
	xor a
	ld [wEnemyUsedMove], a
	ld hl, ExecuteEnemyMoveDone ; enemy can't move this turn
	jp .enemyReturnToHL
.checkIfFrozen
	bit FRZ, [hl]
	jr z, .checkIfTrapped
	ld hl, IsFrozenText
	call PrintText
	xor a
	ld [wEnemyUsedMove], a
	ld hl, ExecuteEnemyMoveDone ; enemy can't move this turn
	jp .enemyReturnToHL
.checkIfTrapped
	ld a, [wPlayerBattleStatus1]
	bit USING_TRAPPING_MOVE, a ; is the player using a multi-turn attack like warp
	jp z, .checkIfFlinched
	ld hl, CantMoveText
	call PrintText
	ld hl, ExecuteEnemyMoveDone ; enemy can't move this turn
	jp .enemyReturnToHL
.checkIfFlinched
	ld hl, wEnemyBattleStatus1
	bit FLINCHED, [hl] ; check if enemy mon flinched
	jp z, .checkIfMustRecharge
	res FLINCHED, [hl]
	ld hl, FlinchedText
	call PrintText
	ld hl, ExecuteEnemyMoveDone ; enemy can't move this turn
	jp .enemyReturnToHL
.checkIfMustRecharge
	ld hl, wEnemyBattleStatus2
	bit NEEDS_TO_RECHARGE, [hl] ; check if enemy mon has to recharge after using a move
	jr z, .checkIfAnyMoveDisabled
	res NEEDS_TO_RECHARGE, [hl]
	ld hl, MustRechargeText
	call PrintText
	ld hl, ExecuteEnemyMoveDone ; enemy can't move this turn
	jp .enemyReturnToHL
.checkIfAnyMoveDisabled
	ld hl, wEnemyDisabledMove
	ld a, [hl]
	and a
	jr z, .checkIfConfused
	dec a ; decrement disable counter
	ld [hl], a
	and $f ; did disable counter hit 0?
	jr nz, .checkIfConfused
	ld [hl], a
	ld [wEnemyDisabledMoveNumber], a
	ld hl, DisabledNoMoreText
	call PrintText
.checkIfConfused
	ld a, [wEnemyBattleStatus1]
	add a ; check if enemy mon is confused
	jp nc, .checkIfTriedToUseDisabledMove
	ld hl, wEnemyConfusedCounter
	dec [hl]
	jr nz, .isConfused
	ld hl, wEnemyBattleStatus1
	res CONFUSED, [hl] ; if confused counter hit 0, reset confusion status
	ld hl, ConfusedNoMoreText
	call PrintText
	jp .checkIfTriedToUseDisabledMove
.isConfused
	ld hl, IsConfusedText
	call PrintText
	xor a
	ld [wAnimationType], a
	ld a, CONF_ANIM
	call PlayMoveAnimation
	call BattleRandom
	cp $80
	jr c, .checkIfTriedToUseDisabledMove
	ld hl, wEnemyBattleStatus1
	ld a, [hl]
	and 1 << CONFUSED ; if mon hurts itself, clear every other status from wEnemyBattleStatus1
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
	ld hl, wEnemyMoveEffect
	push hl
	ld a, [hl]
	push af
	xor a
	ld [hli], a
	ld [wCriticalHitOrOHKO], a
	ld a, 40
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
	ld [wAnimationType], a
	ldh [hWhoseTurn], a
	ld a, POUND
	call PlayMoveAnimation
	ld a, $1
	ldh [hWhoseTurn], a
	call ApplyDamageToEnemyPokemon
	jr .monHurtItselfOrFullyParalysed
.checkIfTriedToUseDisabledMove
; prevents a disabled move that was selected before being disabled from being used
	ld a, [wEnemyDisabledMoveNumber]
	and a
	jr z, .checkIfParalysed
	ld hl, wEnemySelectedMove
	cp [hl]
	jr nz, .checkIfParalysed
	call PrintMoveIsDisabledText
	ld hl, ExecuteEnemyMoveDone ; if a disabled move was somehow selected, player can't move this turn
	jp .enemyReturnToHL
.checkIfParalysed
	ld hl, wEnemyMonStatus
	bit PAR, [hl]
	jr z, .checkIfUsingBide
	call BattleRandom
	cp 25 percent ; chance to be fully paralysed
	jr nc, .checkIfUsingBide
	ld hl, FullyParalyzedText
	call PrintText
.monHurtItselfOrFullyParalysed
	ld hl, wEnemyBattleStatus1
	ld a, [hl]
	; clear bide, thrashing about, charging up, and multi-turn moves such as warp
	and ~((1 << STORING_ENERGY) | (1 << THRASHING_ABOUT) | (1 << CHARGING_UP) | (1 << USING_TRAPPING_MOVE))
	ld [hl], a
	ld a, [wEnemyMoveEffect]
	cp FLY_EFFECT
	jr z, .flyOrChargeEffect
	cp CHARGE_EFFECT
	jr z, .flyOrChargeEffect
	jr .notFlyOrChargeEffect
.flyOrChargeEffect
	xor a
	ld [wAnimationType], a
	ld a, STATUS_AFFECTED_ANIM
	call PlayMoveAnimation
.notFlyOrChargeEffect
	ld hl, ExecuteEnemyMoveDone
	jp .enemyReturnToHL ; if using a two-turn move, enemy needs to recharge the first turn
.checkIfUsingBide
	ld hl, wEnemyBattleStatus1
	bit STORING_ENERGY, [hl] ; is mon using bide?
	jr z, .checkIfThrashingAbout
	xor a
	ld [wEnemyMoveNum], a
	ld hl, wDamage
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyBideAccumulatedDamage + 1
	ld a, [hl]
	add c ; accumulate damage taken
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, wEnemyNumAttacksLeft
	dec [hl] ; did Bide counter hit 0?
	jr z, .unleashEnergy
	ld hl, ExecuteEnemyMoveDone
	jp .enemyReturnToHL ; unless mon unleashes energy, can't move this turn
.unleashEnergy
	ld hl, wEnemyBattleStatus1
	res STORING_ENERGY, [hl] ; not using bide any more
	ld hl, UnleashedEnergyText
	call PrintText
	ld a, $1
	ld [wEnemyMovePower], a
	ld hl, wEnemyBideAccumulatedDamage + 1
	ld a, [hld]
	add a
	ld b, a
	ld [wDamage + 1], a
	ld a, [hl]
	rl a ; double the damage
	ld [wDamage], a
	or b
	jr nz, .next
	ld a, $1
	ld [wMoveMissed], a
.next
	xor a
	ld [hli], a
	ld [hl], a
	ld a, BIDE
	ld [wEnemyMoveNum], a
	call SwapPlayerAndEnemyLevels
	ld hl, handleIfEnemyMoveMissed ; skip damage calculation, DecrementPP and MoveHitTest
	jp .enemyReturnToHL
.checkIfThrashingAbout
	bit THRASHING_ABOUT, [hl] ; is mon using thrash or petal dance?
	jr z, .checkIfUsingMultiturnMove
	ld a, THRASH
	ld [wEnemyMoveNum], a
	ld hl, ThrashingAboutText
	call PrintText
	ld hl, wEnemyNumAttacksLeft
	dec [hl] ; did Thrashing About counter hit 0?
	ld hl, EnemyCalcMoveDamage ; skip DecrementPP
	jp nz, .enemyReturnToHL
	push hl
	ld hl, wEnemyBattleStatus1
	res THRASHING_ABOUT, [hl] ; mon is no longer using thrash or petal dance
	set CONFUSED, [hl] ; mon is now confused
	call BattleRandom
	and $3
	inc a
	inc a ; confused for 2-5 turns
	ld [wEnemyConfusedCounter], a
	pop hl ; skip DecrementPP
	jp .enemyReturnToHL
.checkIfUsingMultiturnMove
	bit USING_TRAPPING_MOVE, [hl] ; is mon using multi-turn move?
	jp z, .checkIfUsingRage
	ld hl, AttackContinuesText
	call PrintText
	ld hl, wEnemyNumAttacksLeft
	dec [hl] ; did multi-turn move end?
	ld hl, GetEnemyAnimationType ; if it didn't, skip damage calculation (deal damage equal to last hit),
	                             ; DecrementPP and MoveHitTest
	jp nz, .enemyReturnToHL
	jp .enemyReturnToHL
.checkIfUsingRage
	ld a, [wEnemyBattleStatus2]
	bit USING_RAGE, a ; is mon using rage?
	jp z, .checkEnemyStatusConditionsDone ; if we made it this far, mon can move normally this turn
	ld a, RAGE
	ld [wd11e], a
	call GetMoveName
	call CopyToStringBuffer
	xor a
	ld [wEnemyMoveEffect], a
	ld hl, EnemyCanExecuteMove
	jp .enemyReturnToHL
.enemyReturnToHL
	xor a ; set Z flag
	ret
.checkEnemyStatusConditionsDone
	ld a, $1
	and a ; clear Z flag
	ret

GetCurrentMove:
	ldh a, [hWhoseTurn]
	and a
	jp z, .player
	ld de, wEnemyMoveNum
	ld a, [wEnemySelectedMove]
	jr .selected
.player
	ld de, wPlayerMoveNum
	ld a, [wFlags_D733]
	bit BIT_TEST_BATTLE, a
	ld a, [wTestBattlePlayerSelectedMove]
	jr nz, .selected
	ld a, [wPlayerSelectedMove]
.selected
	ld [wd0b5], a
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call FarCopyData

	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [wNameListType], a
	call GetName
	ld de, wcd6d
	jp CopyToStringBuffer

LoadEnemyMonData:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp z, LoadEnemyMonFromParty
	ld a, [wEnemyMonSpecies2]
	ld [wEnemyMonSpecies], a
	ld [wd0b5], a
	call GetMonHeader
	ld a, [wEnemyBattleStatus3]
	bit TRANSFORMED, a ; is enemy mon transformed?
	ld hl, wTransformedEnemyMonOriginalDVs ; original DVs before transforming
	ld a, [hli]
	ld b, [hl]
	jr nz, .storeDVs
	ld a, [wIsInBattle]
	cp $2 ; is it a trainer battle?
; fixed DVs for trainer mon
	ld a, ATKDEFDV_TRAINER
	ld b, SPDSPCDV_TRAINER
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
	ld a, [wCurEnemyLVL]
	ld [de], a
	inc de
	ld b, $0
	ld hl, wEnemyMonHP
	push hl
	call CalcStats
	pop hl
	ld a, [wIsInBattle]
	cp $2 ; is it a trainer battle?
	jr z, .copyHPAndStatusFromPartyData
	ld a, [wEnemyBattleStatus3]
	bit TRANSFORMED, a ; is enemy mon transformed?
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
	ld hl, wMonHTypes
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
	ld a, [wIsInBattle]
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
	ld hl, wMonHMoves
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
	ld [wLearningMovesFromDayCare], a
	predef WriteMonMoves ; get moves based on current level
.loadMovePPs
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonPP - 1
	predef LoadMovePPs
	ld hl, wMonHBaseStats
	ld de, wEnemyMonBaseStats
	ld b, NUM_STATS
.copyBaseStatsLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyBaseStatsLoop
	ld hl, wMonHCatchRate
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
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wEnemyMonSpecies2]
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_SET
	ld hl, wPokedexSeen
	predef FlagActionPredef ; mark this mon as seen in the pokedex
	ld hl, wEnemyMonLevel
	ld de, wEnemyMonUnmodifiedLevel
	ld bc, 1 + NUM_STATS * 2
	call CopyData
	ld a, $7 ; default stat mod
	ld b, NUM_STAT_MODS ; number of stat mods
	ld hl, wEnemyMonStatMods
.statModLoop
	ld [hli], a
	dec b
	jr nz, .statModLoop
	ret

; calls BattleTransition to show the battle transition animation and initializes some battle variables
DoBattleTransitionAndInitBattleVariables:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .next
; link battle
	xor a
	ld [wMenuJoypadPollCount], a
	callfar DisplayLinkBattleVersusTextBox
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	call ClearScreen
.next
	call DelayFrame
	predef BattleTransition
	callfar LoadHudAndHpBarAndStatusTilePatterns
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	call ClearScreen
	xor a
	ldh [hAutoBGTransferEnabled], a
	ldh [hWY], a
	ldh [rWY], a
	ldh [hTileAnimations], a
	ld hl, wPlayerStatsToDouble
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wPlayerDisabledMove], a
	ret

; swaps the level values of the BattleMon and EnemyMon structs
SwapPlayerAndEnemyLevels:
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
LoadPlayerBackPic:
	ld a, [wBattleType]
	dec a ; is it the old man tutorial?
	ld de, RedPicBack
	jr nz, .next
	ld de, OldManPicBack
.next
	ld a, BANK(RedPicBack)
	ASSERT BANK(RedPicBack) == BANK(OldManPicBack)
	call UncompressSpriteFromDE
	predef ScaleSpriteByTwo
	ld hl, wShadowOAM
	xor a
	ldh [hOAMTile], a ; initial tile number
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
	ldh a, [hOAMTile]
	ld [hli], a ; OAM tile number
	inc a ; increment tile number
	ldh [hOAMTile], a
	inc hl
	dec c
	jr nz, .innerLoop
	ldh a, [hOAMTile]
	add $4 ; increase tile number by 4
	ldh [hOAMTile], a
	ld a, $8 ; width of tile
	add e ; increase X by width of tile
	ld e, a
	dec b
	jr nz, .loop
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers
	ld a, $a
	ld [MBC1SRamEnable], a
	xor a
	ld [MBC1SRamBank], a
	ld hl, vSprites
	ld de, sSpriteBuffer1
	ldh a, [hLoadedROMBank]
	ld b, a
	ld c, 7 * 7
	call CopyVideoData
	xor a
	ld [MBC1SRamEnable], a
	ld a, $31
	ldh [hStartTileID], a
	hlcoord 1, 5
	predef_jump CopyUncompressedPicToTilemap

; does nothing since no stats are ever selected (barring glitches)
DoubleOrHalveSelectedStats:
	callfar DoubleSelectedStats
	jpfar HalveSelectedStats

ScrollTrainerPicAfterBattle:
	jpfar _ScrollTrainerPicAfterBattle

ApplyBurnAndParalysisPenaltiesToPlayer:
	ld a, $1
	jr ApplyBurnAndParalysisPenalties

ApplyBurnAndParalysisPenaltiesToEnemy:
	xor a

ApplyBurnAndParalysisPenalties:
	ldh [hWhoseTurn], a
	call QuarterSpeedDueToParalysis
	jp HalveAttackDueToBurn

QuarterSpeedDueToParalysis:
	ldh a, [hWhoseTurn]
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

HalveAttackDueToBurn:
	ldh a, [hWhoseTurn]
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

CalculateModifiedStats:
	ld c, 0
.loop
	call CalculateModifiedStat
	inc c
	ld a, c
	cp NUM_STATS - 1
	jr nz, .loop
	ret

; calculate modified stat for stat c (0 = attack, 1 = defense, 2 = speed, 3 = special)
CalculateModifiedStat:
	push bc
	push bc
	ld a, [wCalculateWhoseStats]
	and a
	ld a, c
	ld hl, wBattleMonAttack
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wPlayerMonStatMods
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
	ldh [hMultiplicand], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	ld a, [hl]
	ldh [hDivisor], a
	ld b, $4
	call Divide
	pop hl
	ldh a, [hDividend + 3]
	sub LOW(MAX_STAT_VALUE)
	ldh a, [hDividend + 2]
	sbc HIGH(MAX_STAT_VALUE)
	jp c, .storeNewStatValue
; cap the stat at MAX_STAT_VALUE (999)
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hDividend + 2], a
	ld a, LOW(MAX_STAT_VALUE)
	ldh [hDividend + 3], a
.storeNewStatValue
	ldh a, [hDividend + 2]
	ld [hli], a
	ld b, a
	ldh a, [hDividend + 3]
	ld [hl], a
	or b
	jr nz, .done
	inc [hl] ; if the stat is 0, bump it up to 1
.done
	pop bc
	ret

ApplyBadgeStatBoosts:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
	ld a, [wObtainedBadges]
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
; cap stat at MAX_STAT_VALUE
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
	sub LOW(MAX_STAT_VALUE)
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	ret c
	ld a, HIGH(MAX_STAT_VALUE)
	ld [hli], a
	ld a, LOW(MAX_STAT_VALUE)
	ld [hld], a
	ret

LoadHudAndHpBarAndStatusTilePatterns:
	call LoadHpBarAndStatusTilePatterns

LoadHudTilePatterns:
	ldh a, [rLCDC]
	add a ; is LCD disabled?
	jr c, .lcdEnabled
.lcdDisabled
	ld hl, BattleHudTiles1
	ld de, vChars2 tile $6d
	ld bc, BattleHudTiles1End - BattleHudTiles1
	ld a, BANK(BattleHudTiles1)
	call FarCopyDataDouble
	ld hl, BattleHudTiles2
	ld de, vChars2 tile $73
	ld bc, BattleHudTiles3End - BattleHudTiles2
	ld a, BANK(BattleHudTiles2)
	jp FarCopyDataDouble
.lcdEnabled
	ld de, BattleHudTiles1
	ld hl, vChars2 tile $6d
	lb bc, BANK(BattleHudTiles1), (BattleHudTiles1End - BattleHudTiles1) / $8
	call CopyVideoDataDouble
	ld de, BattleHudTiles2
	ld hl, vChars2 tile $73
	lb bc, BANK(BattleHudTiles2), (BattleHudTiles3End - BattleHudTiles2) / $8
	jp CopyVideoDataDouble

PrintEmptyString:
	ld hl, .emptyString
	jp PrintText

.emptyString
	db "@"


BattleRandom:
; Link battles use a shared PRNG.

	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp nz, Random

	push hl
	push bc
	ld a, [wLinkBattleRandomNumberListIndex]
	ld c, a
	ld b, 0
	ld hl, wLinkBattleRandomNumberList
	add hl, bc
	inc a
	ld [wLinkBattleRandomNumberListIndex], a
	cp 9
	ld a, [hl]
	pop bc
	pop hl
	vc_hook Unknown_BattleRandom_ret_c
	vc_patch BattleRandom_ret
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ret
ELSE
	ret c
ENDC
	vc_patch_end

; if we picked the last seed, we need to recalculate the nine seeds
	push hl
	push bc
	push af

; point to seed 0 so we pick the first number the next time
	xor a
	ld [wLinkBattleRandomNumberListIndex], a

	ld hl, wLinkBattleRandomNumberList
	ld b, 9
.loop
	ld a, [hl]
	ld c, a
; multiply by 5
	add a
	add a
	add c
; add 1
	inc a
	ld [hli], a
	dec b
	jr nz, .loop

	pop af
	pop bc
	pop hl
	ret


HandleExplodingAnimation:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	ld de, wEnemyBattleStatus1
	ld a, [wPlayerMoveNum]
	jr z, .player
	ld hl, wBattleMonType1
	ld de, wEnemyBattleStatus1
	ld a, [wEnemyMoveNum]
.player
	cp SELFDESTRUCT
	jr z, .isExplodingMove
	cp EXPLOSION
	ret nz
.isExplodingMove
	ld a, [de]
	bit INVULNERABLE, a ; fly/dig
	ret nz
	ld a, [hli]
	cp GHOST
	ret z
	ld a, [hl]
	cp GHOST
	ret z
	ld a, [wMoveMissed]
	and a
	ret nz
	ld a, 5
	ld [wAnimationType], a

PlayMoveAnimation:
	ld [wAnimationID], a
	vc_hook_red Reduce_move_anim_flashing_Confusion
	call Delay3
	vc_hook_red Reduce_move_anim_flashing_Psychic
	predef_jump MoveAnimation

InitBattle::
	ld a, [wCurOpponent]
	and a
	jr z, DetermineWildOpponent

InitOpponent:
	ld a, [wCurOpponent]
	ld [wcf91], a
	ld [wEnemyMonSpecies2], a
	jr InitBattleCommon

DetermineWildOpponent:
	ld a, [wd732]
	bit 1, a
	jr z, .notDebug
	ldh a, [hJoyHeld]
	bit BIT_B_BUTTON, a
	ret nz
.notDebug
	ld a, [wNumberOfNoRandomBattleStepsLeft]
	and a
	ret nz
	callfar TryDoWildEncounter
	ret nz
InitBattleCommon:
	ld a, [wMapPalOffset]
	push af
	ld hl, wLetterPrintingDelayFlags
	ld a, [hl]
	push af
	res 1, [hl]
	callfar InitBattleVariables
	ld a, [wEnemyMonSpecies2]
	sub OPP_ID_OFFSET
	jp c, InitWildBattle
	ld [wTrainerClass], a
	call GetTrainerInformation
	callfar ReadTrainer
	call DoBattleTransitionAndInitBattleVariables
	call _LoadTrainerPic
	xor a
	ld [wEnemyMonSpecies2], a
	ldh [hStartTileID], a
	dec a
	ld [wAICount], a
	hlcoord 12, 0
	predef CopyUncompressedPicToTilemap
	ld a, $ff
	ld [wEnemyMonPartyPos], a
	ld a, $2
	ld [wIsInBattle], a
	jp _InitBattleCommon

InitWildBattle:
	ld a, $1
	ld [wIsInBattle], a
	call LoadEnemyMonData
	call DoBattleTransitionAndInitBattleVariables
	ld a, [wCurOpponent]
	cp RESTLESS_SOUL
	jr z, .isGhost
	call IsGhostBattle
	jr nz, .isNoGhost
.isGhost
	ld hl, wMonHSpriteDim
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
	ld [wTrainerClass], a
	ldh [hStartTileID], a
	hlcoord 12, 0
	predef CopyUncompressedPicToTilemap

; common code that executes after init battle code specific to trainer or wild battles
_InitBattleCommon:
	ld b, SET_PAL_BATTLE_BLACK
	call RunPaletteCommand
	call SlidePlayerAndEnemySilhouettesOnScreen
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, .emptyString
	call PrintText
	call SaveScreenTilesToBuffer1
	call ClearScreen
	ld a, $98
	ldh [hAutoBGTransferDest + 1], a
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	ld a, $9c
	ldh [hAutoBGTransferDest + 1], a
	call LoadScreenTilesFromBuffer1
	hlcoord 9, 7
	lb bc, 5, 10
	call ClearScreenArea
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearScreenArea
	call ClearSprites
	ld a, [wIsInBattle]
	dec a ; is it a wild battle?
	call z, DrawEnemyHUDAndHPBar ; draw enemy HUD and HP bar if it's a wild battle
	call StartBattle
	callfar EndOfBattle
	pop af
	ld [wLetterPrintingDelayFlags], a
	pop af
	ld [wMapPalOffset], a
	ld a, [wSavedTileAnimations]
	ldh [hTileAnimations], a
	scf
	ret
.emptyString
	db "@"

_LoadTrainerPic:
; wd033-wd034 contain pointer to pic
	ld a, [wTrainerPicPointer]
	ld e, a
	ld a, [wTrainerPicPointer + 1]
	ld d, a ; de contains pointer to trainer pic
	ld a, [wLinkState]
	and a
	ld a, BANK("Pics 6") ; this is where all the trainer pics are (not counting Red's)
	jr z, .loadSprite
	ld a, BANK(RedPicFront)
.loadSprite
	call UncompressSpriteFromDE
	ld de, vFrontPic
	ld a, $77
	ld c, a
	jp LoadUncompressedSpriteData

; unreferenced
ResetCryModifiers:
	xor a
	ld [wFrequencyModifier], a
	ld [wTempoModifier], a
	jp PlaySound

; animates the mon "growing" out of the pokeball
AnimateSendingOutMon:
	ld a, [wPredefHL]
	ld h, a
	ld a, [wPredefHL + 1]
	ld l, a
	ldh a, [hStartTileID]
	ldh [hBaseTileID], a
	ld b, $4c
	ld a, [wIsInBattle]
	and a
	jr z, .notInBattle
	add b
	ld [hl], a
	call Delay3
	ld bc, -(SCREEN_WIDTH * 2 + 1)
	add hl, bc
	ld a, 1
	ld [wDownscaledMonSize], a
	lb bc, 3, 3
	predef CopyDownscaledMonTiles
	ld c, 4
	call DelayFrames
	ld bc, -(SCREEN_WIDTH * 2 + 1)
	add hl, bc
	xor a
	ld [wDownscaledMonSize], a
	lb bc, 5, 5
	predef CopyDownscaledMonTiles
	ld c, 5
	call DelayFrames
	ld bc, -(SCREEN_WIDTH * 2 + 1)
	jr .next
.notInBattle
	ld bc, -(SCREEN_WIDTH * 6 + 3)
.next
	add hl, bc
	ldh a, [hBaseTileID]
	add $31
	jr CopyUncompressedPicToHL

CopyUncompressedPicToTilemap:
	ld a, [wPredefHL]
	ld h, a
	ld a, [wPredefHL + 1]
	ld l, a
	ldh a, [hStartTileID]
CopyUncompressedPicToHL::
	lb bc, 7, 7
	ld de, SCREEN_WIDTH
	push af
	ld a, [wSpriteFlipped]
	and a
	jr nz, .flipped
	pop af
.loop
	push bc
	push hl
.innerLoop
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .innerLoop
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .loop
	ret

.flipped
	push bc
	ld b, 0
	dec c
	add hl, bc
	pop bc
	pop af
.flippedLoop
	push bc
	push hl
.flippedInnerLoop
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .flippedInnerLoop
	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .flippedLoop
	ret

LoadMonBackPic:
; Assumes the monster's attributes have
; been loaded with GetMonHeader.
	ld a, [wBattleMonSpecies2]
	ld [wcf91], a
	hlcoord 1, 5
	ld b, 7
	ld c, 8
	call ClearScreenArea
	ld hl,  wMonHBackSprite - wMonHeader
	call UncompressMonSprite
	predef ScaleSpriteByTwo
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers ; combine the two buffers to a single 2bpp sprite
	ld hl, vSprites
	ld de, vBackPic
	ld c, (2*SPRITEBUFFERSIZE)/16 ; count of 16-byte chunks to be copied
	ldh a, [hLoadedROMBank]
	ld b, a
	jp CopyVideoData
