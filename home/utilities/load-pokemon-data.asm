; loads pokemon data from one of multiple sources to wcf98
; loads base stats to W_MONHDEXNUM
; INPUT:
; [wWhichPokemon] = index of pokemon within party/box
; [wcc49] = source
; 00: player's party
; 01: enemy's party
; 02: current box
; 03: daycare
; OUTPUT:
; [wcf91] = pokemon ID
; wcf98 = base address of pokemon data
; W_MONHDEXNUM = base address of base stats
LoadMonData:: ; 1372 (0:1372)
	ld hl,LoadMonData_
	ld b,BANK(LoadMonData_)
	jp Bankswitch