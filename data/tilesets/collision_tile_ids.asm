; PureRGBnote: MOVED: this code was moved out of home bank, and made so checking if a tile is passable uses a single function
; input d = tile to check whether it's passable
_CheckTilePassable::
	hl_deref wTilesetCollisionPtr
.tilePassableLoop
	ld a, [hli]
	cp $ff
	jr z, .impassable
	cp d
	jr nz, .tilePassableLoop
	and a ; passable
	ret
.impassable
	scf ; impassable
	ret

MACRO coll_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

; the ID of tiles that do NOT incur a collision

Underground_Coll::
	coll_tiles $0b, $0c, $13, $15, $18

Overworld_Coll::
	coll_tiles $00, $04, $10, $1b, $20, $21, $23, $2c, $2d, $2e, $30, $31, $33, $39, $3c, $3e, $52, $54, $58, $5b

RedsHouse1_Coll::
RedsHouse2_Coll::
	coll_tiles $01, $02, $03, $11, $12, $13, $14, $1c, $1a

Mart_Coll::
Pokecenter_Coll::
	coll_tiles $11, $1a, $1c, $3c, $5e

Dojo_Coll::
Gym_Coll::
	coll_tiles $11, $16, $19, $2b, $3c, $3d, $3f, $4a, $4c, $4d, $03

Forest_Coll::
	coll_tiles $1e, $20, $2e, $30, $34, $37, $39, $3a, $40, $51, $52, $5a, $5c, $5e, $5f

School_Coll::
House_Coll::
	coll_tiles $01, $12, $14, $28, $32, $37, $44, $54, $5c

ForestGate_Coll::
Museum_Coll::
Gate_Coll::
	coll_tiles $01, $12, $14, $1a, $1c, $37, $38, $3b, $3c, $5e

Ship_Coll::
	coll_tiles $04, $0d, $17, $1d, $1e, $23, $34, $37, $39, $4a

ShipPort_Coll::
	coll_tiles $0a, $1a, $32, $3b

Cemetery_Coll::
	coll_tiles $01, $10, $13, $1b, $22, $42, $52

Interior_Coll::
	coll_tiles $04, $0f, $15, $1f, $3b, $45, $47, $55, $56

Cavern_Coll::
	coll_tiles $05, $15, $18, $1a, $20, $21, $22, $2a, $2d, $30, $38

	coll_tiles ; unused

Lobby_Coll::
	coll_tiles $14, $17, $1a, $1c, $20, $38, $45

Mansion_Coll::
	coll_tiles $01, $05, $11, $12, $14, $1a, $1c, $2c, $53

Lab_Coll::
	coll_tiles $0c, $26, $16, $1e, $34, $37

Club_Coll::
	coll_tiles $0f, $1a, $1f, $26, $28, $29, $2c, $2d, $2e, $2f, $41

Facility_Coll::
	coll_tiles $01, $10, $11, $13, $1b, $20, $21, $22, $30, $31, $32, $42, $43, $52, $55, $58, $5e

Plateau_Coll::
	coll_tiles $1b, $23, $2c, $2d, $3b, $45

SecretLab_Coll::
	coll_tiles $08, $09, $18, $19, $1A, $1E, $1F, $2E, $2F, $36, $3C, $3D, $3E, $3F, $42, $43, $46, $49, $4C, $4D, $52

ChampCup_Coll::
	coll_tiles $05, $06, $09, $0D, $0E, $1D, $1E, $15, $16, $19, $20, $21, $25, $26, $30, $31, $32, $33, $34, $35, $36,\ 
	$37, $38, $39, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $50, $51, $56, $57, $58, $59, $5A, $5B