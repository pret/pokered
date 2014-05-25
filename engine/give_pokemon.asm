_GivePokemon: ; 4fda5 (13:7da5)
	call EnableAutoTextBoxDrawing
	xor a
	ld [$ccd3], a
	ld a, [W_NUMINPARTY] ; $d163
	cp $6
	jr c, .asm_4fe01
	ld a, [W_NUMINBOX] ; $da80
	cp $14
	jr nc, .asm_4fdf9
	xor a
	ld [W_ENEMYBATTSTATUS3], a ; $d069
	ld a, [$cf91]
	ld [W_ENEMYMONID], a
	callab Func_3eb01
	call SetPokedexOwnedFlag
	callab Func_e7a4
	ld hl, $cf4b
	ld a, [$d5a0]
	and $7f
	cp $9
	jr c, .asm_4fdec
	sub $9
	ld [hl], $f7
	inc hl
	add $f6
	jr .asm_4fdee
.asm_4fdec
	add $f7
.asm_4fdee
	ld [hli], a
	ld [hl], $50
	ld hl, SetToBoxText
	call PrintText
	scf
	ret
.asm_4fdf9
	ld hl, BoxIsFullText
	call PrintText
	and a
	ret
.asm_4fe01
	call SetPokedexOwnedFlag
	call AddPokemonToParty
	ld a, $1
	ld [$cc3c], a
	ld [$ccd3], a
	scf
	ret

SetPokedexOwnedFlag: ; 4fe11 (13:7e11)
	ld a, [$cf91]
	push af
	ld [$d11e], a
	ld a, $3a
	call Predef ; indirect jump to IndexToPokedex (41010 (10:5010))
	ld a, [$d11e]
	dec a
	ld c, a
	ld hl, wPokedexOwned ; $d2f7
	ld b, $1
	ld a, $10 ; FlagActionPredef
	call Predef
	pop af
	ld [$d11e], a
	call GetMonName
	ld hl, GotMonText
	jp PrintText

GotMonText: ; 4fe39 (13:7e39)
	TX_FAR _GotMonText
	db $0b
	db "@"

SetToBoxText: ; 4fe3f (13:7e3f)
	TX_FAR _SetToBoxText
	db "@"

BoxIsFullText: ; 4fe44 (13:7e44)
	TX_FAR _BoxIsFullText
	db "@"
