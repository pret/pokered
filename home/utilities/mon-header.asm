; copies the base stat data of a pokemon to W_MONHDEXNUM (W_MONHEADER)
; INPUT:
; [wd0b5] = pokemon ID
GetMonHeader:: ; 1537 (0:1537)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(BaseStats)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	push bc
	push de
	push hl
	ld a,[wd11e]
	push af
	ld a,[wd0b5]
	ld [wd11e],a
	ld de,FossilKabutopsPic
	ld b,$66 ; size of Kabutops fossil and Ghost sprites
	cp a,FOSSIL_KABUTOPS ; Kabutops fossil
	jr z,.specialID
	ld de,GhostPic
	cp a,MON_GHOST ; Ghost
	jr z,.specialID
	ld de,FossilAerodactylPic
	ld b,$77 ; size of Aerodactyl fossil sprite
	cp a,FOSSIL_AERODACTYL ; Aerodactyl fossil
	jr z,.specialID
	cp a,MEW
	jr z,.mew
	predef IndexToPokedex   ; convert pokemon ID in [wd11e] to pokedex number
	ld a,[wd11e]
	dec a
	ld bc,28
	ld hl,BaseStats
	call AddNTimes
	ld de,W_MONHEADER
	ld bc,28
	call CopyData
	jr .done
.specialID
	ld hl,W_MONHSPRITEDIM
	ld [hl],b ; write sprite dimensions
	inc hl
	ld [hl],e ; write front sprite pointer
	inc hl
	ld [hl],d
	jr .done
.mew
	ld hl,MewBaseStats
	ld de,W_MONHEADER
	ld bc,28
	ld a,BANK(MewBaseStats)
	call FarCopyData
.done
	ld a,[wd0b5]
	ld [W_MONHDEXNUM],a
	pop af
	ld [wd11e],a
	pop hl
	pop de
	pop bc
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret