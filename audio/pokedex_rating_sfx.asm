PlayPokedexRatingSfx::
	ldh a, [hDexRatingNumMonsOwned]
	ld c, $0
	ld hl, OwnedMonValues
.getSfxPointer
	cp [hl]
	jr c, .gotSfxPointer
	inc c
	inc hl
	jr .getSfxPointer
.gotSfxPointer
	push bc
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySoundWaitForCurrent
	pop bc
	ld b, $0
	ld hl, PokedexRatingSfxPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, [hl]
	call PlaySound
	jp PlayDefaultMusic

PokedexRatingSfxPointers:
	db SFX_DENIED,         0 ; BANK(SFX_Denied_1)
	db SFX_POKEDEX_RATING, 0 ; BANK(SFX_Pokedex_Rating_1)
	db SFX_GET_ITEM_1,     0 ; BANK(SFX_Get_Item1_1)
	db SFX_CAUGHT_MON,     0 ; BANK(SFX_Caught_Mon)
	db SFX_LEVEL_UP,       0 ; BANK(SFX_Level_Up)
	db SFX_GET_KEY_ITEM,   0 ; BANK(SFX_Get_Key_Item_1)
	db SFX_GET_ITEM_2,     0 ; BANK(SFX_Get_Item2_1)

OwnedMonValues:
	db 10, 40, 60, 90, 120, 150, $ff
