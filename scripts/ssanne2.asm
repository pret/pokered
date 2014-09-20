SSAnne2Script: ; 6139f (18:539f)
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne2ScriptPointers
	ld a, [W_SSANNE2CURSCRIPT]
	jp CallFunctionInTable

SSAnne2Script_613ab: ; 613ab (18:53ab)
	xor a
	ld [wJoyIgnore], a
	ld [W_SSANNE2CURSCRIPT], a
	ret

SSAnne2ScriptPointers: ; 613b3 (18:53b3)
	dw SSAnne2Script0
	dw SSAnne2Script1
	dw SSAnne2Script2
	dw SSAnne2Script3
	dw SSAnne2Script4

SSAnne2Script4: ; 613bd (18:53bd)
	ret

SSAnne2Script0: ; 613be (18:53be)
	ld hl, CoordsData_61411 ; $5411
	call ArePlayerCoordsInArray
	ret nc
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, [wWhichTrade]
	ld [$ffdb], a
	ld a, $71
	ld [wcc4d], a
	predef ShowObject
	call Delay3
	ld a, $2
	ld [$ff8c], a
	call SetSpriteMovementBytesToFF
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [$ffdb]
	cp $2
	jr nz, .asm_61400 ; 0x613f9 $5
	ld de, MovementData_6140c
	jr .asm_61403 ; 0x613fe $3
.asm_61400
	ld de, MovementData_6140d
.asm_61403
	call MoveSprite
	ld a, $1
	ld [W_SSANNE2CURSCRIPT], a
	ret

MovementData_6140c: ; 6140c (18:540c)
	db $00

MovementData_6140d: ; 6140d (18:540d)
	db $00,$00,$00,$FF

CoordsData_61411: ; 61411 (18:5411)
	db $08,$24,$08,$25,$FF

SSAnne2Script_61416: ; 61416 (18:5416)
	ld a, [W_XCOORD] ; wd362
	cp $25
	jr nz, .asm_61426
	ld a, $2
	ld [wd528], a
	ld a, $c
	jr .asm_61427
.asm_61426
	xor a
.asm_61427
	ld [$ff8d], a
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	jp SetSpriteFacingDirectionAndDelay

SSAnne2Script1: ; 61430 (18:5430)
	ld a, [wd730]
	bit 0, a
	ret nz
	call SSAnne2Script_61416
	xor a
	ld [wJoyIgnore], a
	ld a, $2
	ld [$ff8c], a
	call DisplayTextID
	call Delay3
	ld a, SONY2 + $c8
	ld [W_CUROPPONENT], a

	; select which team to use during the encounter
	ld a, [W_RIVALSTARTER]
	cp STARTER2
	jr nz, .NotSquirtle ; 0x61451 $4
	ld a, $1
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander ; 0x61459 $4
	ld a, $2
	jr .done
.Charmander
	ld a, $3
.done
	ld [W_TRAINERNO], a

	call SSAnne2Script_61416
	ld a, $2
	ld [W_SSANNE2CURSCRIPT], a
	ret

SSAnne2Script2: ; 6146d (18:546d)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, SSAnne2Script_613ab
	call SSAnne2Script_61416
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $3
	ld [$ff8c], a
	call DisplayTextID
	ld a, $2
	ld [$ff8c], a
	call SetSpriteMovementBytesToFF
	ld a, [W_XCOORD]
	cp $25
	jr nz, .asm_61497 ; 0x61490 $5
	ld de, MovementData_614b9
	jr .asm_6149a ; 0x61495 $3
.asm_61497
	ld de, MovementData_614b7
.asm_6149a
	ld a, $2
	ld [$ff8c], a
	call MoveSprite
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $3
	ld [W_SSANNE2CURSCRIPT], a
	ret

MovementData_614b7: ; 614b7 (18:54b7)
	db $C0,$00

MovementData_614b9: ; 614b9 (18:54b9)
	db $00,$00,$00,$00,$FF

SSAnne2Script3: ; 614be (18:54be)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $71
	ld [wcc4d], a
	predef HideObject
	call PlayDefaultMusic
	ld a, $4
	ld [W_SSANNE2CURSCRIPT], a
	ret

SSAnne2TextPointers: ; 614db (18:54db)
	dw SSAnne2Text1
	dw SSAnne2Text2
	dw SSAnne2Text3

SSAnne2Text1: ; 614e1 (18:54e1)
	TX_FAR _SSAnne2Text1
	db "@"

SSAnne2Text2: ; 614e6 (18:54e6)
	db $8
	ld hl, SSAnneRivalBeforeBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SSAnneRivalDefeatedText
	ld de, SSAnneRivalWonText
	call SaveEndBattleTextPointers
	jp TextScriptEnd

SSAnneRivalBeforeBattleText: ; 61500 (18:5500)
	TX_FAR _SSAnneRivalBeforeBattleText
	db "@"

SSAnneRivalDefeatedText: ; 61505 (18:5505)
	TX_FAR _SSAnneRivalDefeatedText
	db "@"

SSAnneRivalWonText: ; 6150a (18:550a)
	TX_FAR _SSAnneRivalWonText
	db "@"

SSAnne2Text3: ; 6150f (18:550f)
	TX_FAR _SSAnneRivalCaptainText
	db "@"
