; Pretty generic cave, only it contains the Ground-type tradables.
; Vague reference to the iconic wild Steelix.
CelesteHillCaveWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 51, GRAVELER
	db 52, MAROWAK
	db 52, GRAVELER
	db 51, MAROWAK
	db 53, TOEDSCOOL
	db 53, RHYDON
	db 53, STEELIX
	db 54, GOLEM
	db 54, RHYPERIOR
	db 55, RHYPERIOR
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons