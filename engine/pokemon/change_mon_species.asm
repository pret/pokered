; input: 
; [wcf91] = target pokemon species
; wWhichPokemon = which party pokemon to change

ChangePartyPokemonSpecies::
	ld hl, wPartySpecies
	ld a, [wWhichPokemon]
	ld d, 0
	ld e, a
	add hl, de
	ld a, [wcf91]
	ld [hl], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	push hl
	ld a, [wcf91]
	ld [hl], a ; set the pokemon's species to the desired one
	ld bc, wPartyMon1Level - wPartyMon1
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLVL], a ; value needed for stat calculation
	ld d, h
	ld e, l ; de now points to stats
	ld bc, (wPartyMon1Exp + 2) - wPartyMon1Stats
	add hl, bc ; hl now points to LSB of experience
	ld b, 1
	call CalcStats ; recalculate stats
	pop hl
	ld bc, wPartyMon1MaxHP - wPartyMon1
	add hl, bc ; hl now points to MSB of recalculated max HP
	ld a, [hli]
	ld b, a
	ld a, [hld]
	ld c, a
	; set current hp to new max hp
	ld de, wPartyMon1HP - wPartyMon1MaxHP
	add hl, de ; hl now points to MSB of current HP
	ld a, b
	ld [hli], a
	ld a, c
	ld [hld], a
	ret