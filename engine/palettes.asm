Func_71ddf: ; 71ddf (1c:5ddf)
	call GetPredefRegisters
	ld a, b
	cp $ff
	jr nz, .asm_71dea
	ld a, [wcf1c]
.asm_71dea
	cp $fc
	jp z, Func_71fc2
	ld l, a
	ld h, $0
	add hl, hl
	ld de, PointerTable_71f73
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, Func_72156
	push de
	jp [hl]

SendPalPacket_Black: ; 71dff (1c:5dff)
	ld hl, PalPacket_Black
	ld de, BlkPacket_Battle
	ret

; uses PalPacket_Empty to build a packet based on mon IDs and health color
BuildBattlePalPacket: ; 71e06 (1c:5e06)
	ld hl, PalPacket_Empty
	ld de, wcf2d
	ld bc, $10
	call CopyData
	ld a, [W_PLAYERBATTSTATUS3]
	ld hl, wBattleMonSpecies
	call DeterminePaletteID
	ld b, a
	ld a, [W_ENEMYBATTSTATUS3]
	ld hl, wEnemyMonSpecies2
	call DeterminePaletteID
	ld c, a
	ld hl, wcf2e
	ld a, [wcf1d]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	ld a, [wcf1e]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	inc hl
	ld a, c
	ld [hl], a
	ld hl, wcf2d
	ld de, BlkPacket_Battle
	ld a, $1
	ld [wcf1c], a
	ret

SendPalPacket_TownMap: ; 71e48 (1c:5e48)
	ld hl, PalPacket_TownMap
	ld de, BlkPacket_WholeScreen
	ret

; uses PalPacket_Empty to build a packet based the mon ID
BuildStatusScreenPalPacket: ; 71e4f (1c:5e4f)
	ld hl, PalPacket_Empty
	ld de, wcf2d
	ld bc, $10
	call CopyData
	ld a, [wcf91]
	cp VICTREEBEL + 1
	jr c, .pokemon
	ld a, $1 ; not pokemon
.pokemon
	call DeterminePaletteIDOutOfBattle
	push af
	ld hl, wcf2e
	ld a, [wcf25]
	add $1f
	ld [hli], a
	inc hl
	pop af
	ld [hl], a
	ld hl, wcf2d
	ld de, BlkPacket_StatusScreen
	ret

SendPalPacket_PartyMenu: ; 71e7b (1c:5e7b)
	ld hl, PalPacket_PartyMenu
	ld de, wcf2e
	ret

SendPalPacket_Pokedex: ; 71e82 (1c:5e82)
	ld hl, PalPacket_Pokedex
	ld de, wcf2d
	ld bc, $10
	call CopyData
	ld a, [wcf91]
	call DeterminePaletteIDOutOfBattle
	ld hl, wcf30
	ld [hl], a
	ld hl, wcf2d
	ld de, BlkPacket_Pokedex
	ret

SendPalPacket_Slots: ; 71e9f (1c:5e9f)
	ld hl, PalPacket_Slots
	ld de, BlkPacket_Slots
	ret

SendPalPacket_Titlescreen: ; 71ea6 (1c:5ea6)
	ld hl, PalPacket_Titlescreen
	ld de, BlkPacket_Titlescreen
	ret

; used mostly for menus and the Oak intro
SendPalPacket_Generic: ; 71ead (1c:5ead)
	ld hl, PalPacket_Generic
	ld de, BlkPacket_WholeScreen
	ret

SendPalPacket_NidorinoIntro: ; 71eb4 (1c:5eb4)
	ld hl, PalPacket_NidorinoIntro
	ld de, BlkPacket_NidorinoIntro
	ret

SendPalPacket_GameFreakIntro: ; 71ebb (1c:5ebb)
	ld hl, PalPacket_GameFreakIntro
	ld de, BlkPacket_GameFreakIntro
	ld a, $8
	ld [wcf1c], a
	ret

; uses PalPacket_Empty to build a packet based on the current map
BuildOverworldPalPacket: ; 71ec7 (1c:5ec7)
	ld hl, PalPacket_Empty
	ld de, wcf2d
	ld bc, $10
	call CopyData
	ld a, [W_CURMAPTILESET]
	cp CEMETERY
	jr z, .PokemonTowerOrAgatha
	cp CAVERN
	jr z, .caveOrBruno
	ld a, [W_CURMAP]
	cp REDS_HOUSE_1F
	jr c, .townOrRoute
	cp UNKNOWN_DUNGEON_2
	jr c, .normalDungeonOrBuilding
	cp NAME_RATERS_HOUSE
	jr c, .caveOrBruno
	cp LORELEIS_ROOM
	jr z, .Lorelei
	cp BRUNOS_ROOM
	jr z, .caveOrBruno
.normalDungeonOrBuilding
	ld a, [wLastMap] ; town or route that current dungeon or building is located
.townOrRoute
	cp SAFFRON_CITY + 1
	jr c, .town
	ld a, PAL_ROUTE - 1
.town
	inc a ; a town's pallete ID is its map ID + 1
	ld hl, wcf2e
	ld [hld], a
	ld de, BlkPacket_WholeScreen
	ld a, $9
	ld [wcf1c], a
	ret
.PokemonTowerOrAgatha
	ld a, PAL_GREYMON - 1
	jr .town
.caveOrBruno
	ld a, PAL_CAVE - 1
	jr .town
.Lorelei
	xor a
	jr .town

; used when a Pokemon is the only thing on the screen
; such as evolution, trading and the Hall of Fame
SendPokemonPalette_WholeScreen: ; 71f17 (1c:5f17)
	push bc
	ld hl, PalPacket_Empty
	ld de, wcf2d
	ld bc, $10
	call CopyData
	pop bc
	ld a, c
	and a
	ld a, $1e
	jr nz, .asm_71f31
	ld a, [wcf1d]
	call DeterminePaletteIDOutOfBattle
.asm_71f31
	ld [wcf2e], a
	ld hl, wcf2d
	ld de, BlkPacket_WholeScreen
	ret

BuildTrainerCardPalPacket: ; 71f3b (1c:5f3b)
	ld hl, BlkPacket_TrainerCard
	ld de, wcc5b
	ld bc, $40
	call CopyData
	ld de, LoopCounts_71f8f
	ld hl, wcc5d
	ld a, [W_OBTAINEDBADGES]
	ld c, $8
.asm_71f52
	srl a
	push af
	jr c, .asm_71f62
	push bc
	ld a, [de]
	ld c, a
	xor a
.asm_71f5b
	ld [hli], a
	dec c
	jr nz, .asm_71f5b
	pop bc
	jr .asm_71f67
.asm_71f62
	ld a, [de]
.asm_71f63
	inc hl
	dec a
	jr nz, .asm_71f63
.asm_71f67
	pop af
	inc de
	dec c
	jr nz, .asm_71f52
	ld hl, PalPacket_TrainerCard
	ld de, wcc5b
	ret

PointerTable_71f73: ; 71f73 (1c:5f73)
	dw SendPalPacket_Black
	dw BuildBattlePalPacket
	dw SendPalPacket_TownMap
	dw BuildStatusScreenPalPacket
	dw SendPalPacket_Pokedex
	dw SendPalPacket_Slots
	dw SendPalPacket_Titlescreen
	dw SendPalPacket_NidorinoIntro
	dw SendPalPacket_Generic
	dw BuildOverworldPalPacket
	dw SendPalPacket_PartyMenu
	dw SendPokemonPalette_WholeScreen
	dw SendPalPacket_GameFreakIntro
	dw BuildTrainerCardPalPacket

; each byte is the number of loops to make in .asm_71f5b for each badge
LoopCounts_71f8f: ; 71f8f (1c:5f8f)
	db $06,$06,$06,$12,$06,$06,$06,$06

DeterminePaletteID: ; 71f97 (1c:5f97)
	bit 3, a                 ; bit 3 of battle status 3, set if current Pokemon is transformed
	ld a, PAL_GREYMON        ; if yes, use Ditto's palette
	ret nz
	ld a, [hl]
DeterminePaletteIDOutOfBattle: ; 71f9d (1c:5f9d)
	ld [wd11e], a
	and a
	jr z, .idZero
	push bc
	predef IndexToPokedex               ; turn Pokemon ID number into Pokedex number
	pop bc
	ld a, [wd11e]
.idZero
	ld e, a
	ld d, $00
	ld hl, MonsterPalettes   ; not just for Pokemon, Trainers use it too
	add hl, de
	ld a, [hl]
	ret

SendBlkPacket_PartyMenu: ; 71fb6 (1c:5fb6)
	ld hl, BlkPacket_PartyMenu ; $62f4
	ld de, wcf2e
	ld bc, $30
	jp CopyData

Func_71fc2: ; 71fc2 (1c:5fc2)
	ld hl, wcf1f
	ld a, [wcf2d]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, $5
	jr z, .asm_71fdb
	dec a
	ld e, $a
	jr z, .asm_71fdb
	ld e, $f
.asm_71fdb
	push de
	ld hl, wcf37
	ld bc, $6
	ld a, [wcf2d]
	call AddNTimes
	pop de
	ld [hl], e
	ret

SendSGBPacket: ; 71feb (1c:5feb)
;check number of packets
	ld a,[hl]
	and a,$07
	ret z
; store number of packets in B
	ld b,a
.loop2
; save B for later use
	push bc
; load a non-zero value in $fff9 to disable the routine that checks actual
; joypad input (said routine, located at $15f, does nothing if $fff9 is not
; zero)
	ld a,$01
	ld [$fff9],a
; send RESET signal (P14=LOW, P15=LOW)
	xor a
	ld [$ff00],a
; set P14=HIGH, P15=HIGH
	ld a,$30
	ld [$ff00],a
;load length of packets (16 bytes)
	ld b,$10
.nextByte
;set bit counter (8 bits per byte)
	ld e,$08
; get next byte in the packet
	ld a,[hli]
	ld d,a
.nextBit0
	bit 0,d
; if 0th bit is not zero set P14=HIGH,P15=LOW (send bit 1)
	ld a,$10
	jr nz,.next0
; else (if 0th bit is zero) set P14=LOW,P15=HIGH (send bit 0)
	ld a,$20
.next0
	ld [$ff00],a
; must set P14=HIGH,P15=HIGH between each "pulse"
	ld a,$30
	ld [$ff00],a
; rotation will put next bit in 0th position (so  we can always use command
; "bit 0,d" to fetch the bit that has to be sent)
	rr d
; decrease bit counter so we know when we have sent all 8 bits of current byte
	dec e
	jr nz,.nextBit0
	dec b
	jr nz,.nextByte
; send bit 1 as a "stop bit" (end of parameter data)
	ld a,$20
	ld [$ff00],a
; set P14=HIGH,P15=HIGH
	ld a,$30
	ld [$ff00],a
	xor a
	ld [$fff9],a
; wait for about 70000 cycles
	call Wait7000
; restore (previously pushed) number of packets
	pop bc
	dec b
; return if there are no more packets
	ret z
; else send 16 more bytes
	jr .loop2

LoadSGB: ; 7202b (1c:602b)
	xor a
	ld [wOnSGB], a
	call Func_7209b
	ret nc
	ld a, $1
	ld [wOnSGB], a
	ld a, [wGBC]
	and a
	jr z, .asm_7203f
	ret
.asm_7203f
	di
	call Func_72075
	ei
	ld a, $1
	ld [wcf2d], a
	ld de, ChrTrnPacket
	ld hl, SGBBorderGraphics
	call Func_7210b
	xor a
	ld [wcf2d], a
	ld de, PctTrnPacket
	ld hl, BorderPalettes
	call Func_7210b
	xor a
	ld [wcf2d], a
	ld de, PalTrnPacket
	ld hl, SuperPalettes
	call Func_7210b
	call ClearVram
	ld hl, MaskEnCancelPacket
	jp SendSGBPacket

Func_72075: ; 72075 (1c:6075)
	ld hl, PointerTable_72089
	ld c, $9
.asm_7207a
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call SendSGBPacket
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .asm_7207a
	ret

PointerTable_72089: ; 72089 (1c:6089)
	dw MaskEnFreezePacket
	dw DataSnd_72548
	dw DataSnd_72558
	dw DataSnd_72568
	dw DataSnd_72578
	dw DataSnd_72588
	dw DataSnd_72598
	dw DataSnd_725a8
	dw DataSnd_725b8

Func_7209b: ; 7209b (1c:609b)
	ld hl, MltReq2Packet
	di
	call SendSGBPacket
	ld a, $1
	ld [$fff9], a
	ei
	call Wait7000
	ld a, [rJOYP] ; $ff0
	and $3
	cp $3
	jr nz, .asm_720fd
	ld a, $20
	ld [rJOYP], a ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	call Wait7000
	call Wait7000
	ld a, $30
	ld [rJOYP], a ; $ff0
	call Wait7000
	call Wait7000
	ld a, $10
	ld [rJOYP], a ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	call Wait7000
	call Wait7000
	ld a, $30
	ld [rJOYP], a ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	ld a, [rJOYP] ; $ff0
	call Wait7000
	call Wait7000
	ld a, [rJOYP] ; $ff0
	and $3
	cp $3
	jr nz, .asm_720fd
	call Func_72102
	and a
	ret
.asm_720fd
	call Func_72102
	scf
	ret

Func_72102: ; 72102 (1c:6102)
	ld hl, MltReq1Packet
	call SendSGBPacket
	jp Wait7000

Func_7210b: ; 7210b (1c:610b)
	di
	push de
	call DisableLCD
	ld a, $e4
	ld [rBGP], a ; $ff47
	ld de, vChars1
	ld a, [wcf2d]
	and a
	jr z, .asm_72122
	call Func_72188
	jr .asm_72128
.asm_72122
	ld bc, $1000
	call CopyData
.asm_72128
	ld hl, vBGMap0
	ld de, $c
	ld a, $80
	ld c, $d
.asm_72132
	ld b, $14
.asm_72134
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_72134
	add hl, de
	dec c
	jr nz, .asm_72132
	ld a, $e3
	ld [rLCDC], a ; $ff40
	pop hl
	call SendSGBPacket
	xor a
	ld [rBGP], a ; $ff47
	ei
	ret

Wait7000: ; 7214a (1c:614a)
; each loop takes about 10 cycles so this routine actually loops through 70000
; cycles.
	ld de, 7000
.loop
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .loop
	ret

Func_72156: ; 72156 (1c:6156)
	ld a, [wGBC]
	and a
	jr z, .asm_72165
	push de
	call Func_7216d
	pop hl
	call Func_72187
	ret
.asm_72165
	push de
	call SendSGBPacket
	pop hl
	jp SendSGBPacket

Func_7216d: ; 7216d (1c:616d)
	ld a, $80
	ld [$ff68], a
	inc hl
	ld c, $20
.asm_72174
	ld a, [hli]
	inc hl
	add a
	add a
	add a
	ld de, SuperPalettes
	add e
	jr nc, .asm_72180
	inc d
.asm_72180
	ld a, [de]
	ld [$ff69], a
	dec c
	jr nz, .asm_72174
	ret

Func_72187: ; 72187 (1c:6187)
	ret

Func_72188: ; 72188 (1c:6188)
	ld b, $80
.asm_7218a
	ld c, $10
.asm_7218c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7218c
	ld c, $10
	xor a
.asm_72195
	ld [de], a
	inc de
	dec c
	jr nz, .asm_72195
	dec b
	jr nz, .asm_7218a
	ret

INCLUDE "data/sgb_packets.asm"

INCLUDE "data/mon_palettes.asm"

INCLUDE "data/super_palettes.asm"

INCLUDE "data/sgb_border.asm"
