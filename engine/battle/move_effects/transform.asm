TransformEffect_:
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	ld bc, wEnemyBattleStatus3
	ld a, [wEnemyBattleStatus1]
	ldh a, [hWhoseTurn]
	and a
	jr nz, .hitTest
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	ld bc, wPlayerBattleStatus3
	ld [wPlayerMoveListIndex], a
	ld a, [wPlayerBattleStatus1]
.hitTest
	bit INVULNERABLE, a ; is mon invulnerable to typical attacks? (fly/dig)
	jp nz, .failed
	push hl
	push de
	push bc
	ld hl, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .transformEffect
	ld hl, wEnemyBattleStatus2
.transformEffect
; animation(s) played are different if target has Substitute up
	bit HAS_SUBSTITUTE_UP, [hl]
	push af
	ld hl, HideSubstituteShowMonAnim
	ld b, BANK(HideSubstituteShowMonAnim)
	call nz, Bankswitch
	ld a, [wOptions]
	add a ; TODO: Make clearer what it's checking (battle animation flag?)
	ld hl, PlayCurrentMoveAnimation
	ld b, BANK(PlayCurrentMoveAnimation)
	jr nc, .gotAnimToPlay
	ld hl, AnimationTransformMon
	ld b, BANK(AnimationTransformMon)
.gotAnimToPlay
	rst _Bankswitch
	ld hl, ReshowSubstituteAnim
	ld b, BANK(ReshowSubstituteAnim)
	pop af
	call nz, Bankswitch
	pop bc
	ld a, [bc]
	set TRANSFORMED, a ; mon is now transformed
	ld [bc], a
	pop de
	pop hl
	push hl
; transform user into opposing Pokemon
; species
	ld a, [hli]
	ld [de], a
	ld bc, 4
	add hl, bc
	inc de
	inc de
	inc de
	inc de
	inc de
;;;;;;;;;; PureRGBnote: CHANGED: need to preserve the "flags" data of the pokemon that is transforming to remember if it should keep the alternate palette it could have.
; type 1
	ld a, [hli]
	ld [de], a
	inc de
; type 2
	ld a, [hli]
	ld [de], a
	inc de
; skip catch rate as it's now a flag marker for the pokemon and should stay the same (potentially affects palette color)	
	inc hl 
	inc de
; moves - copy bc (4) bytes from hl to de
	rst _CopyData
; hl and de now point to pokemon DVs after Copydata is complete
;;;;;;;;;;
	ldh a, [hWhoseTurn]
	and a
	jr z, .next
; save enemy mon DVs at wTransformedEnemyMonOriginalDVs
	ld a, [de]
	ld [wTransformedEnemyMonOriginalDVs], a
	inc de
	ld a, [de]
	ld [wTransformedEnemyMonOriginalDVs + 1], a
	dec de
.next
; DVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
; Attack, Defense, Speed, and Special stats
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de
	ld bc, $8
	rst _CopyData
	ld bc, wBattleMonMoves - wBattleMonPP
	add hl, bc ; ld hl, wBattleMonMoves
	ld b, NUM_MOVES
.copyPPLoop
; 5 PP for all moves
	ld a, [hli]
	and a
	jr z, .lessThanFourMoves
	ld a, $5
	ld [de], a
	inc de
	dec b
	jr nz, .copyPPLoop
	jr .copyStats
.lessThanFourMoves
; 0 PP for blank moves
	xor a
	ld [de], a
	inc de
	dec b
	jr nz, .lessThanFourMoves
.copyStats
; original (unmodified) stats and stat mods
	pop hl
	ld a, [hl]
	ld [wd11e], a
	call GetMonName
	ld hl, wEnemyMonUnmodifiedAttack
	ld de, wPlayerMonUnmodifiedAttack
	call .copyBasedOnTurn8 ; original (unmodified) stats
	ld hl, wEnemyMonStatMods
	ld de, wPlayerMonStatMods
	call .copyBasedOnTurn8 ; stat mods
	ld hl, wEnemyMonBaseAttack ; skip HP stat which stays the same when transforming
	ld de, wPlayerMonBaseAttack
	ld bc, 4
	call .copyBasedOnTurn ; base stats
	ld hl, TransformedText
	jp PrintText

.copyBasedOnTurn8
	ld bc, $8
.copyBasedOnTurn
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotStatsOrModsToCopy
	push hl
	ld h, d
	ld l, e
	pop de
.gotStatsOrModsToCopy
	rst _CopyData
	ret

.failed
	ld c, 50
	rst _DelayFrames
	ld hl, PrintButItFailedText_
	jp EffectCallBattleCore

TransformedText:
	text_far _TransformedText
	text_end
