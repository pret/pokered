; PureRGBnote: CHANGED: Code to map stat effects to the stat they modify. 
;                       The couple of attacks that affect multiple stats run multiple singular stat mod effects in a row.

StatMapping:
	; first byte = stat change effect constant
	; second byte = the stat it affects
	db ATTACK_UP1_EFFECT, MOD_ATTACK
	db DEFENSE_UP1_EFFECT, MOD_DEFENSE
	db SPEED_UP1_EFFECT, MOD_SPEED
	db SPECIAL_UP1_EFFECT, MOD_SPECIAL
	db ACCURACY_UP1_EFFECT, MOD_ACCURACY
	db EVASION_UP1_EFFECT, MOD_EVASION
	db ATTACK_DOWN1_EFFECT, MOD_ATTACK
	db DEFENSE_DOWN1_EFFECT, MOD_DEFENSE
	db SPEED_DOWN1_EFFECT, MOD_SPEED
	db SPECIAL_DOWN1_EFFECT, MOD_SPECIAL
	db ACCURACY_DOWN1_EFFECT, MOD_ACCURACY
	db EVASION_DOWN1_EFFECT, MOD_EVASION
	db ATTACK_UP2_EFFECT, MOD_ATTACK
	db DEFENSE_UP2_EFFECT, MOD_DEFENSE
	db SPEED_UP2_EFFECT, MOD_SPEED
	db SPECIAL_UP2_EFFECT, MOD_SPECIAL
	db ACCURACY_UP2_EFFECT, MOD_ACCURACY
	db EVASION_UP2_EFFECT, MOD_EVASION
	db ATTACK_DOWN2_EFFECT, MOD_ATTACK
	db DEFENSE_DOWN2_EFFECT, MOD_DEFENSE
	db SPEED_DOWN2_EFFECT, MOD_SPEED
	db SPECIAL_DOWN2_EFFECT, MOD_SPECIAL
	db ACCURACY_DOWN2_EFFECT, MOD_ACCURACY
	db EVASION_DOWN2_EFFECT, MOD_EVASION
	db ATTACK_DOWN_SIDE_EFFECT, MOD_ATTACK
	db DEFENSE_DOWN_SIDE_EFFECT, MOD_DEFENSE
	db SPEED_DOWN_SIDE_EFFECT, MOD_SPEED
	db SPECIAL_DOWN_SIDE_EFFECT, MOD_SPECIAL
	db ATTACK_UP_SIDE_EFFECT, MOD_ATTACK
	db SPEED_UP_SIDE_EFFECT, MOD_SPEED
	db -1 ; end

SideEffectMapping:
	db ATTACK_UP_SIDE_EFFECT, ATTACK_UP1_EFFECT
	db SPEED_UP_SIDE_EFFECT, SPEED_UP1_EFFECT
	db -1 ; end
	

MapEffectToStat:
	push bc
	push de
	ld b, a
	ld de, StatMapping
	;fallthrough

MapLoop:
.loop ; find the stat mapping in the array
	ld a, [de]
	inc de
	inc de
	cp $ff
	jr z, .mapStatDone
	cp b
	jr nz, .loop
	dec de
	ld a, [de]
.mapStatDone
	pop de
	pop bc
	ret

MapSideEffectToStatMod:
	push bc
	push de
	ld b, a
	ld de, SideEffectMapping
	jr MapLoop