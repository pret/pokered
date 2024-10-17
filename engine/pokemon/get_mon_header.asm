; PureRGBnote: CHANGED: MOVED: This code was moved out of home bank since it's getting complicated and needs some jump tables to facilitate 
; "alternate" pokemon like powered up dragonair, haunter, volcanic magmar, etc.
GetMonHeader2::
	push bc
	push de
	push hl
	ld a, [wPokedexNum]
	push af
	ld a, [wCurSpecies]
	ld [wPokedexNum], a
	ld hl, NonPokemonSpecies
	ld de, 4
	call IsInArray
	jr nc, .notNonPokemonSpecies
	inc hl
	ld a, [hli]
	ld b, a
	de_deref
	ld hl, wMonHSpriteDim
	ld a, b
	ld [hli], a ; write sprite dimensions
	ld a, e
	ld [hli], a ; write front sprite pointer
	ld [hl], d
	jr .done
.notNonPokemonSpecies
	ld a, [wCurSpecies]
	ld hl, NonDexPokemonSpecies
	ld de, 1
	call IsInArray
	jr nc, .notNonDexPokemonSpecies
	ld a, b
	ld hl, NonDexMonsBaseStats
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	jr .copyBaseStats
.notNonDexPokemonSpecies
	predef IndexToPokedex   ; convert pokemon ID in [wPokedexNum] to pokedex number
	ld a, [wPokedexNum]
	dec a
	ld bc, BASE_DATA_SIZE
	ld hl, BaseStats
	call AddNTimes
.copyBaseStats
	ld bc, BASE_DATA_SIZE
	ld de, wMonHeader
	rst _CopyData ; PureRGBnote: CHANGED: mew header now in same bank as rest of base stat data so no need to farcopy
.done
	ld a, [wCurSpecies]
	ld [wMonHIndex], a
	pop af
	ld [wPokedexNum], a
	pop hl
	pop de
	pop bc
	ret

NonPokemonSpecies:
	db FOSSIL_KABUTOPS, $66
	dw FossilKabutopsPic
	db MON_GHOST, $66
	dw GhostPic
	db FOSSIL_AERODACTYL, $77
	dw FossilAerodactylPic
	db -1

NonDexPokemonSpecies:
	db MISSINGNO
	db ARMORED_MEWTWO
	db POWERED_HAUNTER
	db HARDENED_ONIX
	db FLOATING_MAGNETON
	db FLOATING_WEEZING
	db SPIRIT_TORCHED
	db SPIRIT_CHUNKY
	db SPIRIT_PAINLESS
	db SPIRIT_IRRADIATED
	db SPIRIT_THE_MAW
	db WINTER_DRAGONAIR
	db VOLCANIC_MAGMAR
	db -1
	
UncompressMonSprite::
	callfar CheckSpriteOptions ; PureRGBnote: ADDED: we need to check options and remap the front sprite based on player settings here
	push de
	ld bc,wMonHeader
	add hl,bc
	ld a,[hli]
	ld [wSpriteInputPtr],a    ; fetch sprite input pointer
	ld a,[hl]
	ld [wSpriteInputPtr+1],a
	ld a, [wCurPartySpecies]
	cp MISSINGNO
	jr z, .missingno
	ld hl, NonPokemonSpecies
	ld de, 4
	call IsInArray
	jr c, .nonPokemonSpeciesBank
	pop de
	ld a, d ; a = either wMonHPicBank or wMonAltPicBank depending on remap options
	jr .GotBank
;;;;;;;;;; PureRGBnote: ADDED: missingno has a randomized front sprite
.missingno
	call Random ; missingno sometimes displays other front sprites
	and %111
	ld de, FossilAerodactylPic 
	jr z, .loadMissingnoRandomizedSprite ; 1/8 chance of fossil aerodactyl
	dec a
	ld de, FossilKabutopsPic
	jr z, .loadMissingnoRandomizedSpriteSmaller ; 1/8 chance of fossil kabutops
	dec a
	ld de, GhostPic
	jr z, .loadMissingnoRandomizedSpriteSmaller ; 1/8 chance of ghost
	pop de
	ld a, [wMonHPicBank]
	jr .GotBank
.loadMissingnoRandomizedSpriteSmaller
	ld a, $66
	ld [wMonHSpriteDim], a
.loadMissingnoRandomizedSprite
	ld a, e
	ld [wSpriteInputPtr], a
	ld a, d
	ld [wSpriteInputPtr+1], a
;;;;;;;;;;
.nonPokemonSpeciesBank
	pop de
	ld a,BANK(FossilKabutopsPic)    
.GotBank
	jp UncompressSpriteData
