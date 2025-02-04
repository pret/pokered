; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves:
	ld a, 10
	ld hl, wBuffer ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
	
;;;;;;;;;; shinpokerednote: ADDED: make a backup buffer
	push hl
	ld a, $ff
	inc hl
	ld [hli], a	;backup 1
	ld [hli], a	;backup 2
	ld [hli], a	;backup 3
	ld [hl], a	;backup 4
	pop hl
;;;;;;;;;;

	ld a, [wEnemyDisabledMove] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, wBuffer
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
;;;;;;;;;; PureRGBnote: ADDED: champ arena always uses 1, 2, 3, 4 move choice modifier functions for all opponents.
	ld a, [wCurMap]
	cp CHAMP_ARENA
	ld hl, ChampArenaGenericMoveChoices 
	jr z, .readTrainerClassData
;;;;;;;;;;
	ld hl, TrainerClassMoveChoiceModifications
	ld a, [wTrainerClass]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jp z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries_backupfirst
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp hl         ; execute modification function
.loopFindMinimumEntries_backupfirst	;shinpokerednote: ADDED: make a backup of the scores
	ld hl, wBuffer  ; temp move selection array
	ld de, wBuffer + NUM_MOVES  ;backup buffer
	ld bc, NUM_MOVES
	rst _CopyData
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .loopUndoPartialIteration
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	ld a, [de]
	and a
	jr nz, .moveExisting
	ld [hl], a
.moveExisting
	ld a, [hl]
	dec a
	jr z, .slotWithMinimalValue
	xor a
	ld [hli], a     ; disable move slot
	jr .next
.slotWithMinimalValue
	ld a, [de]
	ld [hli], a     ; enable move slot
.next
	inc de
	dec c
	jr nz, .filterMinimalEntries
	ld hl, wBuffer    ; use created temporary array as move set
	jr .done
.useOriginalMoveSet
	ld hl, wEnemyMonMoves    ; use original move set
.done
;;;;;;;;;; PureRGBnote: clear these values at the end of an AI cycle, they only apply when the player has switched or healed in a turn
	xor a
	ld [wAIMoveSpamAvoider], a
	ld [wAITargetMonStatus], a
;;;;;;;;;;
	ret

AIMoveChoiceModificationFunctionPointers:
	dw AIMoveChoiceModification1
	dw AIMoveChoiceModification2
	dw AIMoveChoiceModification3
	dw AIMoveChoiceModification4

; PureRGBnote: CHANGED: AKA the "Dont do stupid things no player would ever do" AI subroutine, many new default AI restrictions added
; discourages moves that cause no damage but only a status ailment if player's mon already has one, or if they're immune to it
; discourages moves that after being used once won't do anything when used again (mist, leech seed, etc.)
; discourages moves that will fail due to the current enemy pokemon's state (recover at full health, one hit ko moves on faster pkmn)
AIMoveChoiceModification1:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveNum]
	cp MIRROR_MOVE
	call z, CheckRemapMirrorMove ; we will treat mirror move as the move it will use if selected
	ld a, [wPlayerBattleStatus1]
	bit INVULNERABLE, a
	jp nz, .playerSemiInvulnerable
.notSemiInvulnerable
	ld a, [wEnemyMoveEffect]
	cp DREAM_EATER_EFFECT
	jp z, .checkAsleep
	cp OHKO_EFFECT
	jr z, .ohko
	cp FIREWALL_EFFECT
	jp z, .firewall
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	push hl
	push de
	push bc
	jp .discourageStatBoostingMoveWhenMaxedOut
.notStatBoostingMove
	ld a, [wEnemyMoveEffect]
	ld hl, PotentiallyPointlessMoveEffectsJumpTable
	ld de, 3
	call IsInArray
	jr nc, .notInArray
	inc hl
	hl_deref
	call hl_caller
	pop bc
	pop de
	pop hl
	jr c, .discourage
	jr .nextMove
.notInArray
	ld a, [wEnemyMoveEffect]
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jp nc, .nextMove
.checkStatusImmunity
	call CheckStatusImmunity
	jr c, .discourage
.notImmune
	ld a, [wAITargetMonStatus] ; set to the pokemon's current status before it gets healed or before it switches out
	and a
	jr nz, .discourage ; if the AI thinks the player has a status, they should avoid using status moves 
					   ; even if the player heals the status or switches out that turn
	ld a, [wAIMoveSpamAvoider] ; set if we switched or healed this turn
	cp 2 ; set to 2 if we switched
	jr z, .nextMove ; if the AI thinks the player DOESNT have a status before they switch, we should avoid discouraging status moves
	ld a, [wBattleMonStatus]
	and a
	jr z, .nextMove ; no need to discourage status moves if the player doesn't have a status
.discourage
	ld a, [hl]
	add 5 ; heavily discourage move
	ld [hl], a
	jp .nextMove
.ohko
	call WillOHKOMoveAlwaysFail
	jp nc, .nextMove
	jr .discourage
.playerSemiInvulnerable
	ld a, [wEnemyMoveNum]
	cp SWIFT
	jp z, .notSemiInvulnerable ; swift will hit even invulnerable opponents so don't discourage
	call CheckAIMoveIsPriority
	jr c, .discourage ; discourage priority moves if player is invulnerable due to fly/dig
	jp .notSemiInvulnerable
.checkAsleep
	push hl
	push bc
	ld b, NORMAL
	call CheckTypeMatchesB
	jr c, .sleepDiscourage
	ld a, [wAITargetMonStatus]
	and SLP_MASK
	jp nz, .sleepNextMove ; if we just healed sleep or switched out a sleeping pokemon, 
	       ; the AI shouldn't predict this perfectly when deciding whether to use dream eater
	ld a, [wBattleMonStatus]
	and SLP_MASK
	jp nz, .sleepNextMove
.sleepDiscourage
	pop bc
	pop hl
	; heavily discourage, if the player isn't asleep avoid using dream eater
	jr .discourage
.sleepNextMove
	pop bc
	pop hl
	jp .nextMove
.firewall
	; discourage firewall if opponent has a status that isn't burned since it will stay at 20 power in that case
	ld a, [wAITargetMonStatus]
	and a
	jr nz, .aiThinksStatus
	; ai doesn't think opponent has status on switching/healing
	ld a, [wAIMoveSpamAvoider] ; set if we switched or healed this turn
	cp 2 ; set to 2 if we switched
	jr z, .firewallNext ; if we switched and opponent thinks no status, don't discourage firewall 
	ld a, [wBattleMonStatus]
	and a
	jr z, .firewallNext ; if no status, don't discourage
.aiThinksStatus
	bit BRN, a
	jr z, .discourage
	; fall through
.firewallNext
	jp .nextMove
.discourageStatBoostingMoveWhenMaxedOut
	ld a, [wEnemyMoveEffect]
	ld hl, StatBoostingEffectList
	ld de, 1
	call IsInArray
	jp nc, .notStatBoostingMove
	ld a, [wEnemyMoveEffect]
	cp ATTACK_SPECIAL_SPEED_UP1
	jr z, .meditateCheck
	cp ATTACK_ACCURACY_UP1_EFFECT
	jr z, .sharpenCheck
	cp ATTACK_DEFENSE_UP1_EFFECT
	jr z, .bideCheck
	ld d, a
	callfar FarMapEffectToStat
	ld hl, wEnemyMonStatMods
	ld e, d
	ld d, 0
	add hl, de
	ld a, [hl] ; number of stat mods
	cp MAX_STAT_LEVEL
	jr z, .discourageStatBoostMove
.notMaxedOut
	pop bc
	pop de
	pop hl
	jp .nextMove
.discourageStatBoostMove
	pop bc
	pop de
	pop hl
	jp .discourage
.meditateCheck
	ld a, [wEnemyMonAttackMod]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut
	ld hl, wEnemyMonSpeedMod
	ld a, [hli]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut
	ld a, [hl]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut	
	jr .discourageStatBoostMove
.sharpenCheck
	ld a, [wEnemyMonAttackMod]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut
	ld a, [wEnemyMonAccuracyMod]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut
	jr .discourageStatBoostMove
.bideCheck
	ld hl, wEnemyMonAttackMod
	ld a, [hli]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut
	ld a, [hl]
	cp MAX_STAT_LEVEL
	jr nz, .notMaxedOut
	jr .discourageStatBoostMove

PotentiallyPointlessMoveEffectsJumpTable:
	dbw TELEPORT_EFFECT, CheckTeleportUsable
	dbw DISABLE_EFFECT, CheckDisabled
	dbw LEECH_SEED_EFFECT, CheckSeeded
	dbw FOCUS_ENERGY_EFFECT, CheckPumpedUp
	dbw LIGHT_SCREEN_EFFECT, CheckLightScreenUp
	dbw REFLECT_EFFECT, CheckReflectUp
	dbw MIST_EFFECT, CheckMistUp
	dbw CONFUSION_EFFECT, CheckConfused
	dbw HEAL_EFFECT, CheckFullHealth
	dbw WITHDRAW_EFFECT, CheckFullHealth
	dbw GROWTH_EFFECT, CheckFullHealth
	dbw DEFENSE_CURL_EFFECT, CheckDefenseCurlUp
	dbw ACID_ARMOR_EFFECT, CheckBothReflectLightScreenUp
	db -1

StatusAilmentMoveEffects:
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db -1 ; end

CheckTeleportUsable:
	callfar CheckCanForceSwitchEnemy
	jr nz, CheckFullHealth ; also make sure the pokemon isn't at full health as then teleport is kind of pointless to use
	; disourage teleport if there is only one pokemon left in the AI trainer's party (would fail in that case)
	scf ; carry = discourage
	ret

CheckDisabled:
	ld a, [wPlayerDisabledMove] ; non-zero if the player has a disabled move
	and a
	ret z ; don't discourage
	scf ; otherwise discourage using disable while opponent is disabled already
	ret

CheckPumpedUp:
	ld a, [wEnemyBattleStatus2]
	and a
	bit GETTING_PUMPED, a
	ret z
	scf ; discourage
	ret

CheckLightScreenUp:
	ld a, [wEnemyBattleStatus3]
	and a
	bit HAS_LIGHT_SCREEN_UP, a
	ret z
	scf ; if the enemy has a light screen up dont use the move again
	ret

CheckReflectUp:
	ld a, [wEnemyBattleStatus3]
	and a
	bit HAS_REFLECT_UP, a
	ret z
	scf ; if the enemy has a reflect up dont use the move again
	ret

CheckMistUp:
	ld a, [wEnemyBattleStatus2]
	and a
	bit STAT_DOWN_IMMUNITY, a
	ret z
	scf ; if the enemy has used mist, don't use it again
	ret

CheckConfused:
	ld a, [wPlayerBattleStatus1]
	and a
	bit CONFUSED, a
	ret z 
	scf ; if the player is confused, don't use confusion-inflicting moves
	ret

CheckFullHealth: ; avoid using moves like recover at full health.
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP
	ld a, [de]
	cp [hl]
	jr nz, .notFullHealth
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	jr nz, .notFullHealth
	scf ; discourage
	ret
.notFullHealth
	and a
	ret

CheckRemapMirrorMove:
	ld a, [wPlayerLastSelectedMove]
	and a
	jr nz, .skipDiscourageMirrorMove ; don't use mirror move if the player has never selected a move yet
	ld a, [hl]
	add 5 ; heavily discourage mirror move when it will fail
	ld [hl], a
.skipDiscourageMirrorMove
	jp GetMirrorMoveResultMove ; otherwise remap this move to the one it will use, and we'll check if it should be discouraged after

CheckDefenseCurlUp:
	ld a, [wEnemyBattleStatus1]
	and a
	bit DEFENSE_CURLED, a
	ret z
	scf ; if the enemy has a defense curl up dont use the move again
	ret

CheckBothReflectLightScreenUp:
	ld a, [wEnemyBattleStatus3]
	and a
	bit HAS_REFLECT_UP, a
	ret z
	bit HAS_LIGHT_SCREEN_UP, a
	ret z
	scf ; discourage acid armor if it would fail
	ret

;;;;;;;;;; PureRGBnote: ADDED: function for checking if the player can have leech seed applied and whether they already have it applied

CheckSeeded:
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jr nz, CheckTypeMatchesB.discourage ; if the enemy has used leech seed don't use again
	ld b, GRASS
CheckTypeMatchesB:
	ld a, [wAIMoveSpamAvoider]
	cp 2 ; set to 2 if we switched out this turn
	ld hl, wBattleMonType1
	jr nz, .noSwitchOut
	ld hl, wAITargetMonType1 ; stores what the AI thinks the player's type is when a switchout happens
.noSwitchOut	
	ld a, [hli]
	cp b
	jr z, .discourage ; leech seed does not affect grass types
	ld a, [hl]
	cp b
	jr z, .discourage ; leech seed does not affect grass types
	and a
	ret
.discourage
	scf
	ret	

;;;;;;;;;;

;;;;;;;;;; PureRGBnote: ADDED: function for checking if the player's pokemon is unaffected by specific status moves.

CheckStatusImmunity:
	push bc
	push hl
	ld a, [wEnemyMoveEffect]
	cp POISON_EFFECT
	ld b, POISON
	jr z, .getMonTypes
	cp PARALYZE_EFFECT
	jr z, .checkParalyze
	jr .done
.checkParalyze
	ld a, [wEnemyMoveType]
	cp ELECTRIC
	ld b, GROUND
	jr nz, .done
.getMonTypes
	call CheckTypeMatchesB
	jr c, .discourage
.done
	pop hl
	pop bc
	and a
	ret
.discourage
	pop hl
	pop bc
	scf
	ret	
;;;;;;;;;;

;;;;;;;;;; PureRGBnote: ADDED: function that allows AI to avoid OHKO moves if they will never do anything to the player's pokemon due to speed differences
WillOHKOMoveAlwaysFail:
	call CompareSpeed
	jr c, .userIsSlower
	and a
	ret
.userIsSlower
	scf
	ret
;;;;;;;;;;

; PureRGBnote: CHANGED: AKA the "Boost stats on the first turn" subroutine
; slightly encourage moves with specific effects on the first turn. (PureRGBnote: FIXED: used to be the second turn, made it first turn)
; this mostly means trainers will buff their pokemon a bit on the first turn
AIMoveChoiceModification2:
	ld a, [wAILayer2Encouragement]
	and a
	ret nz ; choose this modifier only on the first turn
	; if player switched this turn, skip the below comparisons and go straight to seeing if we should use a preferred move
	call IsPlayerPokemonDangerous
	ret c ; player pokemon is dangerous so don't encourage moves that boost your stats on the first turn
.continue
	; otherwise see if we should use a boosting move first turn 
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveNum]
	cp MIRROR_MOVE
	call z, GetMirrorMoveResultMove ; we will treat mirror move as the move it will use if selected
	ld a, [wEnemyMoveEffect]
	cp DISABLE_EFFECT
	jr z, .disable
	cp LEECH_SEED_EFFECT
	jr z, .leechseed
	push hl
	push de
	push bc
	ld hl, Modifier2PreferredMoves
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
.preferMove
	dec [hl] ; slightly encourage this move
	jr .nextMove
.disable
	ld a, [wPlayerDisabledMove]
	and a
	jr nz, .nextMove
	jr .preferMove ; prefer disable if it will do something on turn 1
.leechseed
	; encourage leech seed turn 1 if it can work and opponent isn't already seeded
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jr nz, .nextMove ; player already seeded
	push hl
	push bc
	ld b, GRASS
	call CheckTypeMatchesB
	pop bc
	pop hl
	jr c, .nextMove ; player is grass type (immune to leech seed)
	jr .preferMove


Modifier2PreferredMoves:
	db FOCUS_ENERGY_EFFECT
	db REFLECT_EFFECT
	db LIGHT_SCREEN_EFFECT
	db ATTACK_UP_SIDE_EFFECT
	db MIMIC_EFFECT
	db DEFENSE_CURL_EFFECT
	db SUBSTITUTE_EFFECT
	db HAZE_EFFECT
	db MIST_EFFECT
	db ATTACK_DOWN2_EFFECT
	db DEFENSE_DOWN2_EFFECT
	db SPEED_DOWN2_EFFECT
	db SPECIAL_DOWN2_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_DOWN2_EFFECT
	db ATTACK_DOWN1_EFFECT
	db DEFENSE_DOWN1_EFFECT
	db SPEED_DOWN1_EFFECT
	db SPECIAL_DOWN1_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db EVASION_DOWN1_EFFECT
StatBoostingEffectList:
	db ATTACK_UP1_EFFECT
	db DEFENSE_UP1_EFFECT
	db SPEED_UP1_EFFECT
	db SPECIAL_UP1_EFFECT
	db ACCURACY_UP1_EFFECT
	db EVASION_UP1_EFFECT
	db ATTACK_UP2_EFFECT
	db DEFENSE_UP2_EFFECT
	db SPEED_UP2_EFFECT
	db SPECIAL_UP2_EFFECT
	db ACCURACY_UP2_EFFECT
	db EVASION_UP2_EFFECT
	db ATTACK_ACCURACY_UP1_EFFECT
	db ATTACK_DEFENSE_UP1_EFFECT
	db ATTACK_SPECIAL_SPEED_UP1
	db -1

; PureRGBnote: ADDED: function that does a couple of comparisons before deciding whether the player is "dangerous" or not
; used to help decide whether the opponent should use boosting moves for AI move choice 2 on the first turn,
; and also used to decide for some trainers whether to use boosting items like X Attack.
IsPlayerPokemonDangerous::
	; check if player is asleep, paralyzed, frozen, or confused, if so, not considered dangerous
	ld a, [wAITargetMonStatus]
	bit FRZ, a
	jp nz, .notDangerous
	bit PAR, a
	jp nz, .notDangerous
	and SLP_MASK
	jp nz, .notDangerous

	ld a, [wAIMoveSpamAvoider]
	cp 2 ; player switched
	jr z, .notDangerous ; if player switched this turn, don't consider them dangerous

	; check if player mon has boosted its stats
	ld a, [wPlayerMonAttackMod]
	cp 9 ; boosted 2 stages (7 is normal)
	jr nc, .dangerous ; player has boosted attack by at least 2 stages
	ld a, [wPlayerMonSpecialMod]
	cp 9 ; boosted 2 stages (7 is normal)
	jr nc, .dangerous ; player has boosted special by at least 2 stages

	push bc
	; compare levels first, higher level player pokemon will be considered dangerous
	ld a, [wEnemyMonLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	sub b
	pop bc
	jr z, .continue ; same level
	jr c, .lowerLevel
	cp 5 ; is player pokemon at least 5 levels higher
	jr nc, .dangerous ; always consider higher level pokemon dangerous
	jr .continue
.lowerLevel
	cp -9 ; is player pokemon at least 10 levels lower
	jr c, .notDangerous ; if so never consider them dangerous

.continue

	ld a, [wPlayerBattleStatus1]
	bit CONFUSED, a
	jr nz, .notDangerous ; player is confused - not dangerous

	push bc
	ld a, [wEnemyMonSpeedMod]
	ld b, a
	ld a, [wPlayerMonSpeedMod]
	sub b
	pop bc
	jr z, .speedComparison ; same level of stat boosts, compare speeds
	cp 2
	jr nc, .dangerous ; if player has 2 stages higher boosted speed compared to opponent, they're considered dangerous by default
	cp -1
	jr c, .skipSpeedComparison ; if enemy has boosted their speed up compared to player, forget about comparing speed base stats, likely faster
.speedComparison
	push bc
	ld a, [wEnemyMonBaseSpeed]
	ld b, a
	ld a, [wPlayerMonBaseSpeed]
	sub b
	pop bc
	jr nc, .dangerous ; if player is likely faster than opponent, consider them dangerous (using a non damaging move will result in the enemy getting hit twice due to slower speed) 
.skipSpeedComparison

	ld a, 2
	call AICheckIfHPBelowFractionWrapped
	jr c, .dangerous ; if enemy mon has less than half health remaining, player is always considered dangerous

	; does opponent pokemon have >130 base HP
	ld a, [wEnemyMonBaseHP] ; base HP
	cp 130
	jr nc, .notDangerous ; if enemy mon has a high HP stat and more than half its HP remaining, it can tank more attacks, consider player not dangerous
	; does player pokemon have >=100 base attack and opponent pokemon have < 80 defense
	ld a, [wPlayerMonBaseAttack] ; currently contains player base attack
	cp 100
	jr c, .specialBaseCompare
	ld a, [wEnemyMonBaseDefense] ; defense stat of current opponent pokemon
	cp 80
	jr c, .dangerous
.specialBaseCompare
	; does player pokemon have >100 base special and opponent has < 80 special
	ld a, [wPlayerMonBaseSpecial] ; currently contains player base special
	cp 100
	jr c, .notDangerous
	ld a, [wEnemyMonBaseSpecial] ; special stat of current opponent pokemon
	cp 80
	jr nc, .notDangerous
.dangerous
	scf
	ret
.notDangerous
	and a ; clear carry
	ret

; PureRGBnote: CHANGED: AKA the "Use Effective damaging moves offensively" subroutine
; encourages moves that are effective against the player's mon if they do damage. 
; discourage damaging moves that are ineffective or not very effective against the player's mon,
; unless there's no damaging move that deals at least neutral damage
; encourage effective or super effective priority moves if the pokemon is slower than the player's pokemon (but only after obtaining 5 badges)
; encourage effective or super effective draining moves to be used at low health
; PureRGBnote: FIXED: this subroutine won't cause the AI to prefer status moves 
;                     just because their type is super effective against the opponent. Like spamming agility on a poison pokemon.
AIMoveChoiceModification3:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	jp z, .clearPreviousTypes ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	jp z, .clearPreviousTypes ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveNum]
	cp CONVERSION
	jr z, .skipEffectivenessCheckAndEncourage
	cp MIRROR_MOVE
	call z, GetMirrorMoveResultMove ; we will treat mirror move as the move it will use if selected
	ld a, [wEnemyMovePower]
	and a
	jr z, .nextMove ; ignores moves that do no damage (status moves), as we're only concerned with damaging moves for this modifier
.continue
	ld a, [wAIMoveSpamAvoider] ; if we switched this turn or healed status, this is set
	cp 2 ; it's 2 if we switched pokemon this turn
	call nz, StoreBattleMonTypes ; in the case where we didnt switch
								 ; we need to populate wAITargetMonType1 and wAITargetMonType2 with the current pokemon's type data
	push hl
	push bc
	push de
	callfar AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl

	ld a, [wTypeEffectiveness]
	cp EFFECTIVE
	jr z, .checkSpecificEffects
	jr c, .notEffectiveMove
	;ld a, [wEnemyMoveEffect]
	; check for reasons not to use a super effective move here
	dec [hl] ; slightly encourage this super effective move
	cp FOUR_TIMES_EFFECTIVE
	jr nz, .checkSpecificEffects
	call CheckHarderAIActive
	jr z, .checkSpecificEffects ; only encourages 4x moves further once you've obtained the soulbadge
.skipEffectivenessCheckAndEncourage
	dec [hl] ; encourage 4x effective moves further
.checkSpecificEffects ; we'll further encourage certain moves
	call EncouragePriorityIfSlow
	call EncourageDrainingMoveIfLowHealth
	call EncourageOHKOMoveIfXAccuracy
	jr .nextMove
.notEffectiveMove ; discourages non-effective moves if better moves are available
	cp NO_EFFECT
	jr nz, .notNoEffect
	inc [hl]
	inc [hl] ; discourage ineffective moves even more than not very effective moves regardless of other move options
.notNoEffect
	push hl
	push de
	push bc
	ld a, [wEnemyMoveType]
	ld d, a
	ld hl, wEnemyMonMoves  ; enemy moves
	lb bc, NUM_MOVES + 1, 0
.loopMoves
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp CONVERSION
	jr z, .betterMoveFound ; Conversion is considered a better move
	cp SUPER_FANG_EFFECT
	jr z, .betterMoveFound ; Super Fang is considered to be a better move
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .betterMoveFound ; any special damage moves are considered to be better moves
	cp FLY_EFFECT
	jr z, .betterMoveFound ; Fly is considered to be a better move
	ld a, [wEnemyMoveType]
	cp d
	jr z, .loopMoves
	ld a, [wEnemyMovePower]
	and a
	jr z, .loopMoves
.betterMoveFound ; damaging moves of a different type are considered to be better moves
	ld c, a
.done
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jp z, .nextMove
	inc [hl] ; slightly discourage this move
	jp .nextMove
.clearPreviousTypes
	xor a
	ld [wAITargetMonType1], a
	ld [wAITargetMonType2], a
	ret

;;;;;;;;;; PureRGBnote: ADDED: function that allows AI to be aware if they are slower than the opponent. Allows them to prefer priority moves.
CompareSpeed:
	push hl
	push de
	push bc
	ld hl, wEnemyMonSpeed + 1
	ld de, wBattleMonSpeed + 1
.compareSpeed
; check if current speed is higher than the target's
	ld a, [de]
	dec de
	ld b, a
	ld a, [hld]
	sub b
	ld a, [de]
	ld b, a
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret
;;;;;;;;;;


CheckHarderAIActive:
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a
	ret

; PureRGBnote: ADDED: encourages priority moves if the enemy's pokemon is slower than the player's and the move is neutral or super effective.
; BUT this effect is only applied after you have the soulbadge to prevent priority moves from being spammed early game.
; Applies to trainers that use AI subroutine 3
EncouragePriorityIfSlow:
	call CheckHarderAIActive
	ret z
	ld a, [wEnemyMoveNum]
	cp SWIFT
	jr z, .skipInvulCheck ; swift hits even invul enemies and is priority
	ld a, [wPlayerBattleStatus1]
	bit INVULNERABLE, a
	ret nz ; don't encourage priority if player invulnerable due to fly/dig
.skipInvulCheck
	call CheckAIMoveIsPriority
	ret nc
	call CompareSpeed
	ret nc
	dec [hl] ; encourage the move if it's a priority move and the pokemon is slower
	ret

CheckAIMoveIsPriority:
	ld a, [wEnemyMoveNum]
	push hl
	push bc
	push de
	ld d, a
	callfar FarCheckPriority
	pop de
	pop bc
	pop hl
	ret

; PureRGBnote: ADDED: if the opponent has less than 1/2 health they will prefer healing moves if they use AI subroutine 3
EncourageDrainingMoveIfLowHealth:
	ld a, [wEnemyMoveEffect]
	cp DRAIN_HP_EFFECT
	ret nz
	ld a, 2 ; 1/2 maximum hp gone
	call AICheckIfHPBelowFractionWrapped
	ret nc
	dec [hl] ; encourage the draining move if enemy has more than half health gone
	ret

; PureRGBnote: ADDED: gets the move that using mirror move will use, so we can see if using mirror move will be a good idea
GetMirrorMoveResultMove:
	ld a, [wPlayerLastSelectedMove]
	and a
	ret z ; no move to be mirrored, don't rewrite any move data, we'll avoid using mirror move
	call ReadMove ; read move data into wEnemyMove struct
	ld a, MIRROR_MOVE
	ld [wEnemyMoveNum], a ; keep the move number as MIRROR_MOVE so we know it's mirror move being used for later
	ret

; PureRGBnote: ADDED: one trainer in the game can use x accuracy, and will prioritize OHKO moves once they have
EncourageOHKOMoveIfXAccuracy:
	; further encourage OHKO move if x accuracy is active (only 1 trainer uses x accuracies ever)
	ld a, [wEnemyBattleStatus2]
	bit USING_X_ACCURACY, a
	ret z
	call WillOHKOMoveAlwaysFail
	ret c
	dec [hl]
	dec [hl] ; encourage twice to make it really likely to be used
	ret

; PureRGBnote: ADDED: AKA the "Apply Status and Heal when needed" subroutine
; slightly encourage moves with specific effects. 
; This one will make the opponent want to use status applying moves when you don't have one.
; It also makes them want to use dream eater if you're asleep, and want to use a recovery move at low health.
AIMoveChoiceModification4:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveNum]
	cp MIRROR_MOVE
	call z, GetMirrorMoveResultMove ; we will treat mirror move as the move it will use if selected
	ld a, [wEnemyMoveEffect]
	cp DREAM_EATER_EFFECT
	jr z, .checkOpponentAsleep
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	ld a, [wEnemyMoveEffect]
	cp HEAL_EFFECT
	jr z, .checkWorthHealing
	cp WITHDRAW_EFFECT
	jr z, .checkWorthHealing
	cp GROWTH_EFFECT
	jr z, .checkWorthHealing
	cp TELEPORT_EFFECT
	jr z, .checkWorthTeleporting
	push hl
	push de
	push bc
	ld hl, Modifier4PreferredMoves
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
	ld a, [wAITargetMonStatus] ; set to nonzero if player healed battle mon's status or switched one with a status out this turn
	and a
	jr z, .preferMove
	ld a, [hl]
	add $5 
	ld [hl], a ; heavily discourage using a status move right after the player switched or healed
	jr .nextMove
.preferMove
	dec [hl] ; slightly encourage this move
	jr .nextMove
.checkWorthHealing
	ld a, 2 ; 1/2 maximum HP
	call AICheckIfHPBelowFractionWrapped
	jr c, .preferMove ; if HP is below 50% encourage using a healing move
	jr .nextMove ; otherwise don't encourage it
.checkOpponentAsleep
	ld a, [wAITargetMonStatus] ; set to nonzero if player healed battle mon's status or switched one with a status out this turn
	and SLP_MASK
	jr nz, .preferMoveEvenMore
	ld a, [wAIMoveSpamAvoider] ; set if we switched or healed this turn
	cp 2 ; set to 2 if we switched
	jr z, .nextMove ; if the AI thinks the player IS NOT asleep before they switch, we shouldn't encourage based on the new mon's status
	ld a, [wBattleMonStatus]
	and SLP_MASK
	jr z, .nextMove
.preferMoveEvenMore ; heavier favor for dream eater if the opponent is asleep
	dec [hl]
	jr .preferMove
.checkWorthTeleporting
	; use teleport to heal if you are able to use it
	push hl
	push de
	push bc
	callfar CheckCanForceSwitchEnemy
	pop bc
	pop de
	pop hl 
	jp z, .nextMove
	; only use teleport to heal if health it less than 1/2
	jr .checkWorthHealing

Modifier4PreferredMoves:
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db FIREWALL_EFFECT
	db CONFUSION_EFFECT
	db -1 ; end

ReadMove:
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wEnemyMoveNum
	rst _CopyData
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/trainers/move_choices.asm"

INCLUDE "data/trainers/names.asm"

INCLUDE "engine/battle/misc.asm"

INCLUDE "engine/battle/read_trainer_party.asm"

INCLUDE "data/trainers/special_moves.asm"

INCLUDE "data/trainers/parties.asm"

TrainerAI:
	and a ; clear carry
	ld a, [wIsInBattle]
	dec a
	ret z ; if not a trainer, we're done here
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; if in a link battle, we're done as well
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;shinpokerednote: FIXED: AI should not use actions (items / switching) if in a move that prevents such a thing
	and a ; clear carry flag in case we return due to the next two checks, we dont want carry returned in those cases as it marks an action as being taken by the opponent.
	ld a, [wEnemyBattleStatus2]
	bit NEEDS_TO_RECHARGE, a
	ret nz
	ld a, [wEnemyBattleStatus1]
	and %01110010 
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	ld a, [wTrainerClass] ; what trainer class is this?
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerAIPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [wAICount]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz, .getpointer
	dec hl
	ld a, [hli]
	ld [wAICount], a
.getpointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	jp hl

INCLUDE "data/trainers/ai_pointers.asm"

; PureRGBnote: CHANGED: some of these trainer-specific AI were tweaked to happen more or less often or had their item modified from vanilla.

JugglerAI:
	cp 25 percent + 1
	ret nc
	jp AISwitchIfEnoughMons

BlackbeltAI:
	cp 13 percent - 1
	ret nc
	jp AIUseXAttack

GiovanniAI:
	cp 20 percent + 1
	ret nc
	and a ; clear carry
	ld a, [wEnemyBattleStatus2]
	bit GETTING_PUMPED, a
	ret nz
	jp AIUseDireHit

CooltrainerMAI:
	cp 20 percent + 1
	ret nc
	jp AIUseXSpecial

CooltrainerFAI:
	; The intended 25% chance to consider switching will not apply.
	; Uncomment the line below to fix this.
	cp 25 percent + 1
	ret nc
	ld a, 10
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AISwitchIfEnoughMons

; PureRGBnote: ADDED: opponents in the champ arena will use multiple types of items, full heal and full restore
ChampArenaAICheck:
	push af
	ld a, [wCurMap]
	cp CHAMP_ARENA
	jr z, .jpToChampArenaAI
	pop af
	ret
.jpToChampArenaAI
	pop af
	pop hl ; will return from TrainerAI completely instead of returning to what called this
	push af
	jp ChampArenaAI

BrockAI:
; if his active monster has a status condition, use a full heal
	call ChampArenaAICheck
	ld a, [wEnemyMonStatus]
	and a
	ret z
	jp AIUseFullHeal

MistyAI:
	call ChampArenaAICheck
	cp 20 percent + 1
	ret nc
	jp AIUseXDefend

LtSurgeAI:
	call ChampArenaAICheck
	cp 20 percent + 1
	ret nc
	jp AIUseXSpeed

ErikaAI:
	call ChampArenaAICheck
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

KogaAI:
	call ChampArenaAICheck
	cp 20 percent + 1
	ret nc
	jp AIUseXAttack

BlaineAI:	;blaine needs to check HP. this was an oversight
	call ChampArenaAICheck
	cp 40 percent + 1
	ret nc
	ld a, 2
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

SabrinaAI:
	call ChampArenaAICheck
	cp 25 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

Rival2AI:
	cp 13 percent - 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

Rival3AI:
	call ChampArenaAICheck
	cp 40 percent - 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseFullRestore

LoreleiAI:
	call ChampArenaAICheck
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

BrunoAI:
	;cp 10 percent + 1
	;ret nc
	;jp AIUseXDefend
	call ChampArenaAICheck
	cp 30 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

AgathaAI:
	cp 8 percent
	jp c, AISwitchIfEnoughMons
	call ChampArenaAICheck
	cp 50 percent + 1
	ret nc
	ld a, 4
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

LanceAI:
	call ChampArenaAICheck
	; fall through
FullRestore50Percent:
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseFullRestore

GymGuideAI:
	push af
	call IsPlayerPokemonDangerous
	jr c, ChampArenaAI
	call WillOHKOMoveAlwaysFail
	jr c, ChampArenaAI
	ld a, [wEnemyBattleStatus2]
	bit USING_X_ACCURACY, a
	jr nz, ChampArenaAI
	ld a, [wEnemyMonSpecies]
	cp TAUROS
	jr nz, ChampArenaAI
.useXAccuracy
	pop af
	jp AIUseXAccuracy

ChampArenaAI:
	ld a, [wEnemyMonStatus]
	bit FRZ, a
	jr nz, .useFullHeal ; AI will use full heal to heal freeze
	and SLP_MASK
	jp nz, .useFullHeal ; AI will use full heal to heal sleep
	pop af
	jr FullRestore50Percent ; otherwise has 50% chance to use full restore when HP is below 1/5th of max
.useFullHeal
	pop af
	; TODO: check if low health, full restore if low and status instead of full heal
	jp AIUseFullHeal


GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount:
	call UndoEnemySelectionPPDecrement	;shinpokerednote: ADDED: undo the pp decrement of already-selected move if applicable
	ld hl, wAICount
	dec [hl]
	scf
	ret

AIPlayRestoringSFX:
	ld a, SFX_HEAL_AILMENT
	jp PlaySoundWaitForCurrent

AIUseFullRestore:
	call AICureStatus
	ld a, FULL_RESTORE
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jr AIPrintItemUseAndUpdateHPBar

AIUsePotion:
; enemy trainer heals his monster with a potion
	ld a, POTION
	ld b, 50
	jr AIRecoverHP

AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
	ld a, SUPER_POTION
	ld b, 100
	jr AIRecoverHP

AIUseHyperPotion:
; enemy trainer heals his monster with a hyper potion
	ld a, HYPER_POTION
	ld b, 200
	; fallthrough

AIRecoverHP:
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [wAIItem], a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wHPBarOldHP], a
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	ld [wHPBarNewHP+1], a
	jr nc, .next
	inc a
	ld [hl], a
	ld [wHPBarNewHP+1], a
.next
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wHPBarMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wHPBarMaxHP+1], a
	sbc b
	jr nc, AIPrintItemUseAndUpdateHPBar
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wHPBarNewHP+1], a
	; fallthrough

AIPrintItemUseAndUpdateHPBar:
	call AIPrintItemUse_
	hlcoord 2, 2
	xor a
	ld [wHPBarType], a
	predef UpdateHPBar2
	jp DecrementAICount

AISwitchIfEnoughMons:
; enemy trainer switches if there are 2 or more unfainted mons in party
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP

	ld d, 0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp 2    ; don't bother if only 1
	push af
	call nc, UndoEnemySelectionPPDecrement	;shinpokerednote: ADDED: undo the pp decrement of already-selected move if applicable
	pop af
	jp nc, SwitchEnemyMon
	and a
	ret

SwitchEnemyMonNoText:
	call SwitchEnemyMonCommon
	jp SwitchEnemyMonCommon2

SwitchEnemyMon:
	call SwitchEnemyMonCommon
	ld hl, AIBattleWithdrawText
	rst _PrintText
	jp SwitchEnemyMonCommon2

SwitchEnemyMonCommon:
;;;;; shinpokerednote: CHANGED: if player using trapping move, then end their move
	ld a, [wPlayerBattleStatus1]
	bit USING_TRAPPING_MOVE, a
	jr z, .preparewithdraw
	ld hl, wPlayerBattleStatus1
	res USING_TRAPPING_MOVE, [hl] 
	xor a
	ld [wPlayerNumAttacksLeft], a
	ld a, $FF
	ld [wPlayerSelectedMove], a
.preparewithdraw
;;;;;

; prepare to withdraw the active monster: copy hp, number, and status to roster

	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1HP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonHP
	ld bc, 4
	rst _CopyData

	;shinpokerednote: ADDED: don't copy PP information if transformed
	ld a, [wEnemyBattleStatus3]
	bit TRANSFORMED, a 	;check the state of the enemy transformed bit
	ret nz	;skip ahead if bit is set
	
	;shinpokerednote: ADDED: copy PP information
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1PP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonPP
	ld bc, 4
	rst _CopyData
	ret

SwitchEnemyMonCommon2:
;;;;;;;;;; PureRGBnote: ADDED: clear the previous selected move here to reset disable functionality on opponent switching pokemon.
	xor a
	ld [wEnemyLastSelectedMoveDisable], a 
;;;;;;;;;;

	; This wFirstMonsNotOutYet variable is abused to prevent the player from
	; switching in a new mon in response to this switch.
	ld a, 1
	ld [wFirstMonsNotOutYet], a
	callfar EnemySendOut
	xor a
	ld [wFirstMonsNotOutYet], a

	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z

	;shinpokerednote: FIXED: the act of switching clears hWhoseTurn, so it needs to be set back to 1
	ld a, 1
	ldh [hWhoseTurn], a
	scf
	ret

AIBattleWithdrawText:
	text_far _AIBattleWithdrawText
	text_end

AIUseFullHeal:
	call AIPlayRestoringSFX
	call AICureStatus
	ld a, FULL_HEAL
	jp AIPrintItemUse

AICureStatus:	;shinpokerednote: CHANGED: modified to be more robust and also undo stat changes of brn/par
; cures the status of enemy's active pokemon
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hl], a ; clear status in enemy team roster
	ldh a, [hWhoseTurn]
	push af
	ld a, $01 	;forcibly set it to the AI's turn
	ldh [hWhoseTurn], a
	farcall UndoBurnParStats	;undo brn/par stat changes
	pop af
	ldh [hWhoseTurn], a
	xor a
	ld [wEnemyMonStatus], a ; clear status in active enemy data
	ld hl, wEnemyBattleStatus3
	res BADLY_POISONED, [hl]	;clear toxic bit
	ret

AIUseXAccuracy:
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set USING_X_ACCURACY, [hl]
	ld a, X_ACCURACY
	jp AIPrintItemUse

;AIUseGuardSpec: ; PureRGBnote: CHANGED: now unused
;	call AIPlayRestoringSFX
;	ld hl, wEnemyBattleStatus2
;	set STAT_DOWN_IMMUNITY, [hl]
;	ld a, GUARD_SPEC
;	jp AIPrintItemUse

AIUseDireHit:
	call IsPlayerPokemonDangerous
	jr c, .clearCarryAndReturn
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set GETTING_PUMPED, [hl]
	ld a, DIRE_HIT
	jp AIPrintItemUse
.clearCarryAndReturn
	and a
	ret


AICheckIfHPBelowFractionWrapped:
	push hl
	push bc
	push de
	call AICheckIfHPBelowFraction
	pop de
	pop bc
	pop hl
	ret


FarCheckIfPlayerHPBelowFraction::
	ld a, d
	; fall through
CheckIfPlayerHPBelowFraction::
	ld hl, wBattleMonMaxHP
	ld de, wBattleMonHP + 1
	jr CheckIfHPBelowFractionCommon

; PureRGBnote: ADDED: if enemy HP is below a 1/[wUnusedC000], store 1 in wUnusedC000.
; used for checking whether the hyper ball item should guarantee success on use
FarCheckIfEnemyHPBelowFraction::
	ld a, d
	; fall through
AICheckIfHPBelowFraction:
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP + 1
CheckIfHPBelowFractionCommon:
; return carry if enemy trainer's current HP is below 1 / a of the maximum
	ldh [hDivisor], a
	ld a, [hli]
	ldh [hDividend], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 3]
	ld c, a
	ldh a, [hQuotient + 2]
	ld b, a
	ld h, d
	ld l, e ; hl = MonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	sub b
	ret nz
	ld a, e
	sub c
	ret

AIUseXAttack:
	ld b, $A
	ld a, X_ATTACK
	jr AIIncreaseStat

AIUseXDefend:
	ld b, $B
	ld a, X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed:
	ld b, $C
	ld a, X_SPEED
	jr AIIncreaseStat

AIUseXSpecial:
	ld b, $D
	ld a, X_SPECIAL
	; fallthrough

AIIncreaseStat:
	ld [wAIItem], a
	call IsPlayerPokemonDangerous ; don't use stat increasing item if player is considered dangerous, instead attack
	jr c, .clearCarryAndReturn ; player pokemon is considered dangerous
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl, wEnemyMoveEffect
	ld a, [hld]
	push af
	ld a, [hl]
	push af
	push hl
	ld a, XSTATITEM_ANIM
	ld [hli], a
	ld [hl], b
	callfar StatModifierUpEffect
	pop hl
	pop af
	ld [hli], a
	pop af
	ld [hl], a
	jp DecrementAICount
.clearCarryAndReturn
	and a ; clear carry
	ret

AIPrintItemUse:
	ld [wAIItem], a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [wAIItem] on z!"
	ld a, [wAIItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AIBattleUseItemText:
	text_far _AIBattleUseItemText
	text_end

;;;;;;;;;; PureRGBnote: ADDED: these wram properties are used to make sure the 
;;;;;;;;;;                     AI doesn't instantly read the player's current pokemon type after a player switches.
;;;;;;;;;;                     makes sure the AI doesn't appear to predict all your switch-outs of pokemon.
StoreBattleMonTypes:
	push hl
	ld hl, wBattleMonType
	ld a, [hl]                 ; b = type 1 of player's pokemon
	ld [wAITargetMonType1], a
	inc hl
	ld a, [hl]                 ; c = type 2 of player's pokemon
	ld [wAITargetMonType2], a
	pop hl
	ret

;shinpokerednote: ADDED: get the enemy move that has already been selected
;if it is found in the move list, increment the pp that was deducted when selecting the move
UndoEnemySelectionPPDecrement:
	push hl
	push bc
	push de
	ld a, [wEnemySelectedMove]
	and a
	jr z, .return	;return if the selected move is 00
	cp NUM_ATTACKS + 1
	jr nc, .return	;return if the selected move is invalid (> max number of moves)
	ld d, a
	ld e, NUM_MOVES
	ld bc, wEnemyMonPP - wEnemyMonMoves
	ld hl, wEnemyMonMoves
.loop
	ld a, [hl]
	and a
	jr z, .return
	cp d
	jr z, .found
	inc hl
	dec e
	jr z, .return
	jr .loop
.found
	add hl, bc
	inc [hl]
.return
	pop de
	pop bc
	pop hl
	ret