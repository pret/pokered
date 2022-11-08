; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves:
	ld a, $a
	ld hl, wBuffer ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
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
	jr z, .loopFindMinimumEntries
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
	ld a, [wEnemyMoveEffect]
	cp DREAM_EATER_EFFECT
	jp z, .checkAsleep
	cp OHKO_EFFECT
	jr z, .ohko
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	ld a, [wEnemyMoveEffect]
	cp DISABLE_EFFECT
	jr z, .checkDisabled
	cp LEECH_SEED_EFFECT
	jp z, .checkSeeded
	cp FOCUS_ENERGY_EFFECT
	jr z, .checkPumpedUp
	cp LIGHT_SCREEN_EFFECT
	jr z, .checkLightScreenUp
	cp REFLECT_EFFECT
	jr z, .checkReflectUp
	cp MIST_EFFECT
	jp z, .checkMistUp
	cp CONFUSION_EFFECT
	jp z, .checkConfused
	cp HEAL_EFFECT
	jp z, .checkFullHealth
	cp MIRROR_MOVE_EFFECT
	jp z, .checkNoMirrorMoveOnFirstTurn
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
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
	add $5 ; heavily discourage move
	ld [hl], a
	jr .nextMove
.ohko
	call WillOHKOMoveAlwaysFail
	jr nc, .nextMove
	jr .discourage
.checkDisabled
	ld a, [wPlayerDisabledMove] ; non-zero if the player has a disabled move
	and a
	jp z, .nextMove ; if it's zero don't do anything
	jr .discourage ; otherwise discourage using disable while opponent is disabled already
.checkPumpedUp
	ld a, [wEnemyBattleStatus2]
	bit GETTING_PUMPED, a
	jr nz, .discourage ; if the enemy has used focus energy don't use again
	jp .nextMove
.checkAsleep
	ld a, [wAITargetMonStatus]
	and SLP_MASK
	jp nz, .nextMove ; if we just healed sleep or switched out a sleeping pokemon, 
					 ; the AI shouldn't predict this perfectly when deciding whether to use dream eater
	ld a, [wBattleMonStatus]
	and SLP_MASK
	jr z, .discourage ; heavily discourage, if the player isn't asleep avoid using dream eater
	jp .nextMove
.checkLightScreenUp
	ld a, [wEnemyBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a
	jr nz, .discourage ; if the enemy has a light screen up dont use the move again
	jp .nextMove
.checkReflectUp
	ld a, [wEnemyBattleStatus3]
	bit HAS_REFLECT_UP, a
	jr nz, .discourage ; if the enemy has a reflect up dont use the move again
	jp .nextMove
.checkMistUp
	ld a, [wEnemyBattleStatus2]
	bit PROTECTED_BY_MIST, a
	jr nz, .discourage ; if the enemy has used mist, don't use it again
	jp .nextMove
.checkConfused
	ld a, [wPlayerBattleStatus1]
	bit CONFUSED, a
	jr nz, .discourage ; if the player is confused, don't use confusion-inflicting moves
	jp .nextMove
.checkSeeded
	call CheckSeeded
	jp nc, .nextMove
	jr .discourage
.checkFullHealth ; avoid using moves like recover at full health.
	push hl
	push de
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
	pop de
	pop hl
	jp .discourage
.notFullHealth
	pop de
	pop hl
	jp .nextMove
.checkNoMirrorMoveOnFirstTurn
	ld a, [wPlayerLastSelectedMove]
	and a
	jp z, .discourage ; don't use mirror move if the player has never selected a move yet
	jp .nextMove


StatusAilmentMoveEffects:
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db BURN_EFFECT
	db -1 ; end

;;;;;;;;;; PureRGBnote: ADDED: function for checking if the player can have leech seed applied and whether they already have it applied

CheckSeeded:
	push hl
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jr nz, .discourage ; if the enemy has used leech seed don't use again
	ld a, [wAIMoveSpamAvoider]
	cp 2 ; set to 2 if we switched out this turn
	ld hl, wBattleMonType1
	jr nz, .noSwitchOut
	ld hl, wAITargetMonType1 ; stores what the AI thinks the player's type is when a switchout happens
.noSwitchOut	
	ld a, [hl]
	cp GRASS
	jr z, .discourage ; leech seed does not affect grass types
	inc hl
	ld a, [hl]
	cp GRASS
	jr z, .discourage ; leech seed does not affect grass types
	pop hl
	and a
	ret
.discourage
	pop hl
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
	cp BURN_EFFECT
	ld b, FIRE
	jr z, .getMonTypes
	jr .done
.checkParalyze
	ld a, [wEnemyMoveType]
	cp ELECTRIC
	ld b, GROUND
	jr nz, .done
.getMonTypes
	ld a, [wAIMoveSpamAvoider] ; set if we healed status or switched out this turn
	cp 2 ; it's 2 if we switched out
	jr nz, .noSwitchOut
	ld hl, wAITargetMonType1
	jr .checkTypes
.noSwitchOut
	ld hl, wBattleMonType1
.checkTypes
	ld a, [hl]
	cp b
	jr z, .discourage
	inc hl
	ld a, [hl]
	cp b
	jr z, .discourage
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
	ld a, [wEnemyMoveEffect]
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

Modifier2PreferredMoves:
	db LEECH_SEED_EFFECT
	db FOCUS_ENERGY_EFFECT
	db REFLECT_EFFECT
	db LIGHT_SCREEN_EFFECT
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
	db ATTACK_ACCURACY_UP1_EFFECT
	db ATTACK_DEFENSE_UP1_EFFECT
	db ATTACK_SPECIAL_SPEED_UP1
	db ATTACK_UP_SIDE_EFFECT
	db SUBSTITUTE_EFFECT
	db -1 ; end

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
	ld a, [wEnemyMovePower]
	and a
	jr z, .nextMove ; ignores moves that do no damage (status moves), as we're only concerned with damaging moves for this modifier
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
.checkSpecificEffects ; we'll further encourage certain moves
	call EncouragePriorityIfSlow
	call EncourageDrainingMoveIfLowHealth
	jr .nextMove
.notEffectiveMove ; discourages non-effective moves if better moves are available
	push hl
	push de
	push bc
	ld a, [wEnemyMoveType]
	ld d, a
	ld hl, wEnemyMonMoves  ; enemy moves
	ld b, NUM_MOVES + 1
	ld c, $0
.loopMoves
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [wEnemyMoveEffect]
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
	jr nz, .betterMoveFound ; damaging moves of a different type are considered to be better moves
	jr .loopMoves
.betterMoveFound
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

; PureRGBnote: ADDED: encourages priority moves if the enemy's pokemon is slower than the player's and the move is neutral or super effective.
; BUT this effect is only applied after you have the soulbadge to prevent priority moves from being spammed early game.
; Applies to trainers that use AI subroutine 3
EncouragePriorityIfSlow:
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a
	ret z
	call CompareSpeed
	ret nc
	dec [hl] ; encourage the move if it's a priority move and the pokemon is slower
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
	jr z, .done ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	jr z, .done ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp DREAM_EATER_EFFECT
	jr z, .checkOpponentAsleep
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	ld a, [wEnemyMoveEffect]
	cp HEAL_EFFECT
	jr z, .checkWorthHealing
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
	jr nz, .preferMoveEvenMore ; heavier favor for dream eater if the opponent is asleep
	jr .nextMove
.preferMoveEvenMore
	dec [hl]
	jr .preferMove
.done
	ret

Modifier4PreferredMoves:
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db BURN_EFFECT
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
	call CopyData
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
	and a
	ld a, [wIsInBattle]
	dec a
	ret z ; if not a trainer, we're done here
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; if in a link battle, we're done as well

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;shinpokerednote: FIXED: AI should not use actions (items / switching) if in a move that prevents such a thing
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

BrockAI:
; if his active monster has a status condition, use a full heal
	ld a, [wEnemyMonStatus]
	and a
	ret z
	jp AIUseFullHeal

MistyAI:
	cp 20 percent + 1
	ret nc
	jp AIUseXDefend

LtSurgeAI:
	cp 10 percent + 1
	ret nc
	jp AIUseXSpeed

ErikaAI:
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

KogaAI:
	cp 10 percent + 1
	ret nc
	jp AIUseXAttack

BlaineAI:	;blaine needs to check HP. this was an oversight
	cp 40 percent + 1
	jr nc, .blainereturn
	ld a, 2
	call AICheckIfHPBelowFraction	
	jp c, AIUseSuperPotion
.blainereturn
	ret

SabrinaAI:
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
	cp 40 percent - 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseFullRestore

LoreleiAI:
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
	cp 30 percent + 1
	jr nc, .brunoreturn
	ld a, 5
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.brunoreturn
	ret

AgathaAI:
	cp 8 percent
	jp c, AISwitchIfEnoughMons
	cp 50 percent + 1
	ret nc
	ld a, 4
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

LanceAI:
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseFullRestore

GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount:
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
	ld b, 20
	jr AIRecoverHP

AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
	ld a, SUPER_POTION
	ld b, 50
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
	jp nc, SwitchEnemyMon
	and a
	ret

SwitchEnemyMon:

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
	call CopyData

	ld hl, AIBattleWithdrawText
	call PrintText
	
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

;AIUseXAccuracy: ; unused
;	call AIPlayRestoringSFX
;	ld hl, wEnemyBattleStatus2
;	set 0, [hl]
;	ld a, X_ACCURACY
;	jp AIPrintItemUse

;AIUseGuardSpec: ; PureRGBnote: CHANGED: now unused
;	call AIPlayRestoringSFX
;	ld hl, wEnemyBattleStatus2
;	set 1, [hl]
;	ld a, GUARD_SPEC
;	jp AIPrintItemUse

AIUseDireHit: 
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 2, [hl]
	ld a, DIRE_HIT
	jp AIPrintItemUse

; PureRGBnote: ADDED: if enemy HP is below a 1/[wUnusedC000], store 1 in wUnusedC000.
; used for checking whether the hyper ball item should guarantee success on use
AICheckIfHPBelowFractionStore::
	ld a, [wUnusedC000]
	call AICheckIfHPBelowFraction
	jr c, .below
	xor a
	jr .done
.below
	ld a, 1
.done
	ld [wUnusedC000], a 
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

AICheckIfHPBelowFraction:
; return carry if enemy trainer's current HP is below 1 / a of the maximum
	ldh [hDivisor], a
	ld hl, wEnemyMonMaxHP
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
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, d
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

AIPrintItemUse:
	ld [wAIItem], a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [wAIItem] on z!"
	ld a, [wAIItem]
	ld [wd11e], a
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
