; PureRGBnote: ADDED: Firewall burns the opponent, and its power increases each time you use it on burned opponents.

FirewallEffect_:
	ld hl, wEnemyMonStatus
	ld de, wEnemyMonType1
	ldh a, [hWhoseTurn]
	and a
	jp z, .gotTurn
	ld hl, wBattleMonStatus
	ld de, wBattleMonType1
.gotTurn
	ld a, [hl]
	bit BRN, a
	jr nz, .setFirewallFlag
	and a ; does the target already have a status ailment?
	ret nz
; check if the target is immune to burn due to types
	ld a, [de]
	cp FIRE
	ret z
	inc de
	ld a, [de]
	cp FIRE
	ret z
	set BRN, [hl]
	callfar HalveAttackDueToBurn
	jpfar PrintBurnText	
.setFirewallFlag
	; if already burned and the move hit, set a flag that will increase power further
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus3
	jr z, .gotTurn2
	ld hl, wPlayerBattleStatus3
.gotTurn2
	set BOOSTED_FIREWALL, [hl]
	ret

; input de = wBattleMonStatus or wEnemyMonStatus
AutoBurnEffect::
	ld h, d
	ld l, e
	set BRN, [hl]
	callfar HalveAttackDueToBurn
	jpfar PrintBurnText