macro def_sect
	IF _NARG == 2
		SECTION "\1", \2
	ELSE
		SECTION "\1", \2, BANK[\3]
	ENDC

	PRINTLN BANK("\1")
endm

 def_sect ROM0_ok,  ROM0
 def_sect ROMX_ok,  ROMX,  42
 def_sect ROMX_bad, ROMX
 def_sect VRAM_ok,  VRAM,  1
 def_sect VRAM_bad, VRAM
 def_sect SRAM_ok,  SRAM,  4
 def_sect SRAM_bad, SRAM
 def_sect WRAM0_ok, WRAM0
 def_sect WRAMX_ok, WRAMX, 7
 def_sect WRAMX_bad,WRAMX
 def_sect OAM_ok,   OAM
 def_sect HRAM_ok,  HRAM
