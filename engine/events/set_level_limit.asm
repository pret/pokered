SetLevelLimit::
	ld a, MAX_LEVEL
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	jr nz, .saveLimit	

	ld hl, wBeatGymFlags
;Giovanni
	ld a, 65
	bit 7, [hl]
	jr nz, .saveLimit
;Blaine
	ld a, 50
	bit 6, [hl]
	jr nz, .saveLimit
;Sabrina
	ld a, 43
	bit 5, [hl]
	jr nz, .sabrinaKogaCheck
;Koga (also uses the 43 above)
	bit 4, [hl]
	jr nz, .saveLimit
;Erika (also uses the 43 above)
	bit 3, [hl]
	jr nz, .saveLimit
;Surge
	ld a, 29 ;TODO: Might need to change to 32 depending on what Erika ends up having
	bit 2, [hl]
	jr nz, .saveLimit
;Misty
	ld a, 24
	bit 1, [hl]
	jr nz, .saveLimit
;Brock
	ld a, 21
	bit 0, [hl]
	jr nz, .saveLimit
;new game
	ld a, 14
	jr .saveLimit
.sabrinaKogaCheck	;Sabrina is confirmed, check Koga (if both, cap = 47, if only one, cap = 43)
	bit 4, [hl]
	jr z, .saveLimit
	ld a, 47
	;fall through
.saveLimit
	ld hl, wLevelLimit
	ld [hl], a
	ret