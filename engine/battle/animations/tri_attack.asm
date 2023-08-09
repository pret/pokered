; Tri attack animation is separated into 6 different ones to set up different color palettes for each part.

; Runs if the game is on SGB or GB, in order to reach the animation despite no difference in palettes
TriAttackCheck:
	ld a, [wAnimationID]
	cp TRI_ATTACK
	ret nz
	; fall through (need to run this animation code even on SGB or GB to make tri attack do its animation)

TriAttack: ; runs from here if on GBC
	xor a
	ld [wAnimationType], a ; allows tri attack to do the multi-color animation without a damage animation
	ld a, TRI_ATTACK_START
	ld [wAnimationID], a
	callfar MoveAnimationNoWaitingForSound
	ld a, TRI_ATTACK_TRIANGLE2
	ld [wAnimationID], a
	callfar MoveAnimationNoWaitingForSound
	ld a, TRI_ATTACK_TRIANGLE3
	ld [wAnimationID], a
	callfar MoveAnimationNoWaitingForSound
	ld a, TRI_ATTACK_FIRE
	ld [wAnimationID], a
	callfar MoveAnimationNoWaitingForSound
	ld a, TRI_ATTACK_ICE
	ld [wAnimationID], a
	callfar MoveAnimationNoWaitingForSound
	ld a, TRI_ATTACK_THUNDER
	ld [wAnimationID], a
	callfar MoveAnimationNoWaitingForSound
	ld a, 2
	ld [wAnimationType], a ; finishes tri attack with a damage animation
	ld a, TRI_ATTACK
	ld [wAnimationID], a
	ld b, PAL_REDBAR
	ret