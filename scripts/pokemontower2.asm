PokemonTower2Script: ; 604f2 (18:44f2)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower2ScriptPointers
	ld a, [W_POKEMONTOWER2CURSCRIPT]
	jp CallFunctionInTable

PokemonTower2Script_604fe: ; 604fe (18:44fe)
	xor a
	ld [wJoyIgnore], a
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower2ScriptPointers: ; 60509 (18:4509)
	dw PokemonTower2Script0
	dw PokemonTower2Script1
	dw PokemonTower2Script2

PokemonTower2Script0: ; 6050f (18:450f)
	ld a, [wd764]
	bit 7, a
	ret nz
	ld hl, CoordsData_6055e ; $455e
	call ArePlayerCoordsInArray
	ret nc
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wd764
	res 6, [hl]
	ld a, [wWhichTrade]
	cp $1
	ld a, $8
	ld b, $0
	jr nz, .asm_60544 ; 0x60539 $9
	ld hl, wd764
	set 6, [hl]
	ld a, $2
	ld b, $c
.asm_60544
	ld [wd528], a
	ld a, $1
	ld [$ff8c], a
	ld a, b
	ld [$ff8d], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ld [$ff8c], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ret

CoordsData_6055e: ; 6055e (18:455e)
	db $05,$0F
	db $06,$0E
	db $0F ; isn't this supposed to end in $ff?

PokemonTower2Script1: ; 60563 (18:4563)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, PokemonTower2Script_604fe
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd764
	set 7, [hl]
	ld a, $1
	ld [$ff8c], a
	call DisplayTextID
	ld de, MovementData_605b2
	ld a, [wd764]
	bit 6, a
	jr nz, .asm_60589 ; 0x60584 $3
	ld de, MovementData_605a9
.asm_60589
	ld a, $1
	ld [$ff8c], a
	call MoveSprite
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $2
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

MovementData_605a9: ; 605a9 (18:45a9)
	db $C0,$00,$00,$C0,$00,$00,$C0,$C0,$FF

MovementData_605b2: ; 605b2 (18:45b2)
	db $00,$00,$C0,$C0,$C0,$C0,$00,$00,$FF

PokemonTower2Script2: ; 605bb (18:45bb)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $38
	ld [wcc4d], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, $0
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower2TextPointers: ; 605db (18:45db)
	dw PokemonTower2Text1
	dw PokemonTower2Text2

PokemonTower2Text1: ; 605df (18:45df)
	db $08 ; asm
	ld a, [wd764]
	bit 7, a
	jr z, .asm_16f24 ; 0x605e5
	ld hl, PokemonTower2Text_6063c
	call PrintText
	jr .asm_41852 ; 0x605ed
.asm_16f24 ; 0x605ef
	ld hl, PokemonTower2Text_6062d
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, PokemonTower2Text_60632
	ld de, PokemonTower2Text_60637 ; XXX $4637
	call SaveEndBattleTextPointers
	ld a, SONY2 + $c8
	ld [W_CUROPPONENT], a

	; select which team to use during the encounter
	ld a, [W_RIVALSTARTER]
	cp STARTER2
	jr nz, .NotSquirtle ; 0x6060f
	ld a, $4
	jr .done
.NotSquirtle ; 0x60615
	cp STARTER3
	jr nz, .Charmander ; 0x60617
	ld a, $5
	jr .done
.Charmander ; 0x6061d
	ld a, $6
.done
	ld [W_TRAINERNO], a

	ld a, $1
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
.asm_41852 ; 0x6062a
	jp TextScriptEnd

PokemonTower2Text_6062d: ; 6062d (18:462d)
	TX_FAR _PokemonTower2Text_6062d
	db "@"

PokemonTower2Text_60632: ; 60632 (18:4632)
	TX_FAR _PokemonTower2Text_60632
	db "@"

PokemonTower2Text_60637: ; 60637 (18:4637)
	TX_FAR _PokemonTower2Text_60637
	db "@"

PokemonTower2Text_6063c: ; 6063c (18:463c)
	TX_FAR _PokemonTower2Text_6063c
	db "@"

PokemonTower2Text2: ; 60641 (18:4641)
	TX_FAR _PokemonTower2Text2
	db "@"
