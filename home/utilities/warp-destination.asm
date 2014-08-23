; function to load position data for destination warp when switching maps
; INPUT:
; a = ID of destination warp within destination map
LoadDestinationWarpPosition:: ; 1313 (0:1313)
	ld b,a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[wPredefParentBank]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld a,b
	add a
	add a
	ld c,a
	ld b,0
	add hl,bc
	ld bc,4
	ld de,wd35f
	call CopyData
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret