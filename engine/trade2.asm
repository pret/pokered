Func_42769: ; 42769 (10:6769)
	FuncCoord 5,0
	ld hl,Coord
	ld de,OTString67E5
	call PlaceString
	ld a,[wWhichTrade]
	ld [wd11e],a
	ld a,$3A
	call Predef
	FuncCoord 9, 0
	ld hl,Coord
	ld de,wd11e
	ld bc,$8103
	call PrintNumber
	FuncCoord 5,2
	ld hl,Coord
	ld de,wcf4b
	call PlaceString
	FuncCoord 8,4
	ld hl,Coord
	ld de,wTrainerScreenX
	call PlaceString
	FuncCoord 8, 6
	ld hl,Coord
	ld de,wcd4c
	ld bc,$8205
	jp PrintNumber

Func_427a7: ; 427a7 (10:67a7)
	FuncCoord 5,10
	ld hl,Coord
	ld de,OTString67E5
	call PlaceString
	ld a,[wTrainerEngageDistance]
	ld [wd11e],a
	ld a,$3A
	call Predef
	FuncCoord 9, 10
	ld hl,Coord
	ld de,wd11e
	ld bc,$8103
	call PrintNumber
	FuncCoord 5,12
	ld hl,Coord
	ld de,wcd6d
	call PlaceString
	FuncCoord 8,14
	ld hl,Coord
	ld de,wcd4e
	call PlaceString
	FuncCoord 8, 16
	ld hl,Coord
	ld de,wcd59
	ld bc,$8205
	jp PrintNumber

OTString67E5: ; 427e5 (10:67e5)
	db "──",$74,$F2,$4E
	db $4E
	db "OT/",$4E
	db $73,"№",$F2,"@"
