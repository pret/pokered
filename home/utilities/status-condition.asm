; prints a pokemon's status condition
; INPUT:
; de = address of status condition
; hl = destination address
PrintStatusCondition:: ; 14e1 (0:14e1)
	push de
	dec de
	dec de ; de = address of current HP
	ld a,[de]
	ld b,a
	dec de
	ld a,[de]
	or b ; is the pokemon's HP zero?
	pop de
	jr nz,PrintStatusConditionNotFainted
; if the pokemon's HP is 0, print "FNT"
	ld a,"F"
	ld [hli],a
	ld a,"N"
	ld [hli],a
	ld [hl],"T"
	and a
	ret
PrintStatusConditionNotFainted ; 14f6
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(PrintStatusAilment)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call PrintStatusAilment ; print status condition
	pop bc
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret