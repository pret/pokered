; PureRGBnote: ADDED: function used in some special battles where some effect happens each turn.
; like in the volcano, each turn you have a non fire/rock/ground pokemon out they will get burned if they aren't burned.
CheckPerTurnSpecialBattleEffect::
	ld a, [wCurMapTileset]
	cp VOLCANO
	jp z, .volcano
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	; pokemon tower b1f code
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_IRRADIATED
	ret nz
.irradiated
	ldh a, [hWhoseTurn]
	push af
	call .checkPlayerPoisonable
	jr c, .radiationSpreads
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .dontPoisonIrradiated
.radiationSpreads
	ld hl, .radiationSpreadsText
	rst _PrintText
	ld a, RADIATION_ANIM
	call SpecialBattleEffectDoAnimation
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .dontPoisonIrradiated
	xor a
	ldh [hWhoseTurn], a
	set PSN, a
	ld [wEnemyMonStatus], a
	ld hl, .autoPoisonedEnemy
	rst _PrintText
.dontPoisonIrradiated
	ld a, 1
	ldh [hWhoseTurn], a
	call .checkPlayerPoisonable
	jr nc, .noPoison
	; automatically badly poison the player
	ld hl, wBattleMonStatus
	set PSN, [hl]
	ld hl, wPlayerBattleStatus3
	set BADLY_POISONED, [hl]
	ld hl, wPlayerToxicCounter
	ld [hl], 0
	ld hl, .autoPoisoned
	rst _PrintText
	callfar ReadPlayerMonCurHPAndStatus
.noPoison
	ld hl, .growsLarger
	rst _PrintText
	SetFlag FLAG_SKIP_STAT_ANIMATION
	call .random0to5
	ld b, a
	ld a, ATTACK_UP2_EFFECT
	add b ; random stat up 2 stages
	ld [wEnemyMoveEffect], a
	push bc
	callfar StatModifierUpEffect
	pop bc
.random0to5NotSameOne
	call .random0to5
	cp b
	jr z, .random0to5NotSameOne
	ld c, a
	ld a, ATTACK_DOWN1_EFFECT
	add c ; random stat down 1 stage
	ld [wPlayerMoveEffect], a
	ld a, $FF ; 100%
	ld [wPlayerMoveAccuracy], a
	xor a
	ldh [hWhoseTurn], a
	callfar StatModifierDownEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret
.checkPlayerPoisonable
	ld a, [wBattleMonStatus]
	and a
	jr nz, .no
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .no
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .no
	scf
	ret
.no
	and a
	ret
.random0to5
	call Random
	and %111 ; number between 0 and 7
	cp 6
	jr nc, .random0to5 ; reroll if the result was 6 or 7 because we want only 6 options
	ret
.volcano
	; in the volcano, the player pokemon is burned if it's not FIRE, GROUND or ROCK
	ld a, [wBattleMonType1]
	cp FIRE
	ret z
	cp GROUND
	ret z
	cp ROCK
	ret z
	ld a, [wBattleMonType2]
	cp FIRE
	ret z
	cp GROUND
	ret z
	cp ROCK
	ret z
	ld a, [wBattleMonStatus]
	and a
	ret nz ; don't do anything if already has a status
	ld hl, .volcanoTooHot
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	ld a, 1
	ldh [hWhoseTurn], a ; force enemy turn so player's stats are lowered
	ld de, wBattleMonStatus
	callfar AutoBurnEffect
	callfar ReadPlayerMonCurHPAndStatus
	pop af
	ldh [hWhoseTurn], a
	ret
.volcanoTooHot
	text_far _VolcanoBattleBurnText
	text_end
.autoPoisonedEnemy
	text_far _PoisonedText
	text_end
.autoPoisoned
	text_far _BadlyPoisonedText
	text_end
.radiationSpreadsText
	text_far _IrradiatedBattleInitText
	text_end
.growsLarger
	text_far _IrradiatedGrowsLarger
	text_end

; PureRGBnote: ADDED: when battle starts in special battles something can happen, for example moltres in the volcano gets powered up by magma.
CheckInitSpecialBattleEffect::
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
.pokemonTowerB1F
	ldh a, [hWhoseTurn]
	push af
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_TORCHED
	jr z, .torched
	cp SPIRIT_PAINLESS
	jr z, .painless
	; the maw
	jr .resetWhoseTurn
.painless
	ld hl, .painlessText
	rst _PrintText
	jr .resetWhoseTurn
.torched
	ld hl, .onFire
	rst _PrintText
	ld de, wEnemyMonStatus
	callfar AutoBurnEffect ; burn torched
	ld a, 1
	ldh [hWhoseTurn], a ; raise enemy mon's special
	call .maxSpecial
	jr .resetWhoseTurn
.volcano
	CheckEitherEventSet EVENT_BATTLING_VOLCANO_MAGMAR, EVENT_BATTLING_MOLTRES
	ret z ; returns if neither set
	; magmar gets buffs when the battle starts for a little bit more interesting battle
	ld hl, .poweredUp
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	ld a, FIRE_PILLAR_ANIM
	call SpecialBattleEffectDoAnimation
	ld a, 3 ; make it really hard to catch so you can't just catch the pokemon to proceed
	ld [wEnemyMonActualCatchRate], a
	; max out its special and defense
	call .maxSpecial
	ld a, MAX_STAT_LEVEL - 2
	ld [wEnemyMonDefenseMod], a
	ld a, DEFENSE_UP2_EFFECT
	ld [wEnemyMoveEffect], a
	callfar StatModifierUpEffect
.resetWhoseTurn
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret	
.maxSpecial
	SetFlag FLAG_SKIP_STAT_ANIMATION
	ld a, MAX_STAT_LEVEL - 2
	ld [wEnemyMonSpecialMod], a
	ld a, SPECIAL_UP2_EFFECT
	ld [wEnemyMoveEffect], a
	jpfar StatModifierUpEffect
.poweredUp
	text_far _MagmarBattleInit
	text_end
.onFire
	text_far _TorchedOnFire
	text_end
.painlessText
	text_far _PainlessBattleInitText
	text_end

; a = which animation
SpecialBattleEffectDoAnimation:
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a
	inc a
	ldh [hWhoseTurn], a
	jpfar PlayBattleAnimationGotID

; PureRGBnote: ADDED: in specific battles we may modify the data (accuracy/power) of the move the player chose based on the current state of battle.
CheckSpecialBattleMoveModifiersPlayer:
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_PAINLESS
	jr z, .painless
	ret
.painless
	ld hl, wPlayerMovePower
	ld a, [hl]
	cp 2
	ret c
	ld [hl], 1 ; set all moves with power > 1 to 1 when fighting PAINLESS
	ret

; PureRGBnote: ADDED: in special battles the opponent's moves may get new effects / different data.
CheckSpecialBattleMoveModifiersEnemy:
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	jr z, .maw
	ret
.maw
	ld a, [wEnemyMoveNum]
	cp HYPER_BEAM
	jr nz, .noTypeRemap
	ld hl, wEnemyMoveType
	ld [hl], GHOST ; hyper beam becomes ghost type for THE MAW
	ld hl, wEnemyMoveAccuracy
	ld [hl], 100 percent ; 100% accuracy on hyper beam
.noTypeRemap
	ld hl, wEnemyMovePower
	ld a, [hl]
	and a
	ret z ; has 0 power, do nothing
	call IsBattleMonGhostCubone
	ret nc
	ld [hl], 1 ; set all moves with power > 0 to 1 when fighting ghost cubone
	ret

IsBattleMonGhostCubone:
	ld a, [wBattleMonSpecies]
	cp CUBONE
	jr nz, .no
	ld a, [wBattleMonFlags]
	bit 0, a ; is it alt palette cubone
	jr z, .no
	scf
	ret
.no
	and a
	ret

; PureRGBnote: ADDED: This function runs when sending out a pokemon, in case we want to trigger a special event or effect when you
; send out every mon or a specific mon. Example: Sending out CUBONE vs THE MAW powers up Cubone.
CheckOnSendOutSpecialEffect::
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	ret nz
	call IsBattleMonGhostCubone
	jr nc, .checkResetMusic
	CheckAndSetEvent EVENT_CUBONE_FIGHTING_THE_MAW
	ret nz
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr nz, .playMusic1
	ld hl, Music_TitleScreen
	ld c, BANK(Music_TitleScreen)
	call PlaySpecialBattleMusic
	jr .cubonePowerUp
.playMusic1
	ld hl, Music_GRChallengeCup
	ld c, BANK(Music_GRChallengeCup)
	call PlaySpecialBattleMusic
	ld hl, wMusicTempo + 1
	ld [hl], 0
	ld a, 3
	ld hl, wChannelTranspositions
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .cubonePowerUp
.checkResetMusic
	CheckAndResetEvent EVENT_CUBONE_FIGHTING_THE_MAW
	ret z
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr nz, .playMusic2
	ld hl, Music_GymLeaderBattle
	ld c, BANK(Music_GymLeaderBattle)
	jp PlaySpecialBattleMusic3
.playMusic2
	ld hl, Music_GengarInTheGraveyard
	ld c, BANK(Music_GengarInTheGraveyard)
	jp PlaySpecialBattleMusic
.cubonePowerUp
	ld hl, .cubonePowerUpText
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	xor a
	ldh [hWhoseTurn], a
	ld a, DIVINE_PROTECTION_ANIM
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a
	callfar PlayBattleAnimationGotID
	ld hl, .ultimateProtection
	rst _PrintText
	ld a, [wBattleMonLevel]
	cp 50
	jr nc, .normalBoosts
	; give it +4 attack in the end instead of just +2 if it's lower level
	ld a, MAX_STAT_LEVEL - 4
	ld [wPlayerMonAttackMod], a
.normalBoosts
	SetFlag FLAG_SKIP_STAT_ANIMATION
	ld a, ATTACK_UP2_EFFECT
	ld [wPlayerMoveEffect], a
	jpfar StatModifierUpEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret
.cubonePowerUpText
	text_far _CubonePoweredUp
	text_end
.ultimateProtection
	text_far _CuboneGainedUltimateProtection
	text_end

;;;;; PureRGBnote: ADDED: in some cases, we don't want to display "Opponent fainted!" after defeating a wild pokemon.
;;;;; Such as when fighting static Snorlax, since it doesn't faint, it leaves once losing the fight.
CheckSpecialFaintText::
	CheckEitherEventSet EVENT_FIGHT_ROUTE16_SNORLAX, EVENT_FIGHT_ROUTE12_SNORLAX
	jr nz, .yes
	CheckEvent EVENT_BATTLING_VOLCANO_MAGMAR
	jr nz, .yes
	CheckEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	jr nz, .yes
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	jr z, .yes
	and a
	ret
.yes
	ld hl, EnemyMonWasDefeatedText
	scf
	ret
;;;;;


; PureRGBnote: ADDED: when facing THE MAW specifically, it has rudimentary AI to choose a good move to use on your pokemon.
; On CUBONE it just uses random moves.
TheMawChooseMove::
; to make it harder to win without using cubone, the maw will use attacks depending on your pokemon's types
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	ret nz
	CheckEvent EVENT_CUBONE_FIGHTING_THE_MAW
	ret nz ; choose moves randomly against cubone
	ld a, [wEnemySelectedMove]
	cp STRUGGLE
	ret z ; don't do anything if they are using struggle
	ld a, [wAIMoveSpamAvoider]
	cp 2 ; if we switched mons
	ld hl, wAITargetMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	call .checkType
	jr c, .gotMove
	inc hl
	call .checkType
	jr c, .gotMove
	ret
.checkType
	ld a, [hl]
	cp PSYCHIC_TYPE
	jr z, .leechLife
	cp ROCK
	jr z, .megaDrain
	cp CRYSTAL
	jr z, .megaDrain
	cp NORMAL
	jr z, .poisonGas
	cp GHOST
	jr z, .hyperBeam
	cp POISON
	jr z, .hyperBeam
	cp GROUND
	jr z, .hyperBeam
	cp FIRE
	jr z, .hyperBeam
	cp FLYING
	jr z, .hyperBeam
	and a ; clear carry
	ret
.megaDrain
	; use mega drain on rock pokemon
	ld a, [wBattleMonSpecies]
	cp AERODACTYL
	jr z, .hyperBeam
	ld de, wEnemyMonPP + 2 ; mega drain pp pointer
	call .checkPPNotZero
	ret z
	ld a, MEGA_DRAIN
	ld b, 2
	scf
	ret
.hyperBeam
	; use hyper beam on most pokemon
	ld a, [wBattleMonSpecies]
	cp MISSINGNO
	jr z, .megaDrain
	cp RAPIDASH
	jr z, .poisonGas
	cp SANDSLASH
	jr z, .megaDrain
	ld de, wEnemyMonPP + 1
	call .checkPPNotZero
	ret z
	ld a, HYPER_BEAM
	ld b, 1
	scf
	ret
.leechLife
	ld de, wEnemyMonPP
	call .checkPPNotZero
	ret z
	ld a, LEECH_LIFE
	ld b, 0
	scf
	ret
.poisonGas
	ld de, wEnemyMonPP + 3
	call .checkPPNotZero
	ret z
	ld a, POISON_GAS
	ld b, 3
	scf
	ret
.gotMove
	push af
	call .isPPActive
	jr z, .noPP2
	call .getPPPointer
	inc [hl] ; increment move we would have used's PP back to normal
.noPP2
	pop af
	ld [wEnemySelectedMove], a
	ld a, b
	ld [wEnemyMoveListIndex], a
	call .isPPActive
	ret z
	call .getPPPointer
	dec [hl] ; decrement the move's pp that we intend to use
	ret
.getPPPointer
	ld a, [wEnemyMoveListIndex]
	ld hl, wEnemyMonPP
	ld d, 0
	ld e, a
	add hl, de
	ret
.isPPActive
	ld a, [wOptions3]
	bit BIT_NPC_PP, a
	ret
.checkPPNotZero
	call .isPPActive
	jr z, .noPP
	ld a, [de]
	and a
	ret
.noPP
	and a
	inc a
	ret