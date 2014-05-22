Func_42769: ; 42769 (10:6769)
	FuncCoord 5,0
	ld hl,Coord
	ld de,OTString67E5
	call PlaceString
	ld a,[$CD3D]
	ld [$D11E],a
	ld a,$3A
	call Predef
	FuncCoord 9, 0 ; $c3a9
	ld hl,Coord
	ld de,$D11E
	ld bc,$8103
	call PrintNumber
	FuncCoord 5,2
	ld hl,Coord
	ld de,$CF4B
	call PlaceString
	FuncCoord 8,4
	ld hl,Coord
	ld de,$CD41
	call PlaceString
	FuncCoord 8, 6 ; $c420
	ld hl,Coord
	ld de,$CD4C
	ld bc,$8205
	jp PrintNumber

Func_427a7: ; 427a7 (10:67a7)
	FuncCoord 5,10
	ld hl,Coord
	ld de,OTString67E5
	call PlaceString
	ld a,[$CD3E]
	ld [$D11E],a
	ld a,$3A
	call Predef
	FuncCoord 9, 10 ; $c471
	ld hl,Coord
	ld de,$D11E
	ld bc,$8103
	call PrintNumber
	FuncCoord 5,12
	ld hl,Coord
	ld de,$CD6D
	call PlaceString
	FuncCoord 8,14
	ld hl,Coord
	ld de,$CD4E
	call PlaceString
	FuncCoord 8, 16 ; $c4e8
	ld hl,Coord
	ld de,$CD59
	ld bc,$8205
	jp PrintNumber

OTString67E5: ; 427e5 (10:67e5)
	db "──",$74,$F2,$4E
	db $4E
	db "OT/",$4E
	db $73,"№",$F2,"@"
