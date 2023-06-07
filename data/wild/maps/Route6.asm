; The Wild Data here has been redesigned to fit the Vermilion Beauty quest.
; Meowth and Growlithe have 19.6% chances of appearing.
; I've limited the amount of Pokemon that can appear by proxy, making it so it's easier to get what the player wants.
; Oh, and the water encounters are a mishmash of what's seen here over the franchise.
Route6WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 13, RATTATA
	db 13, PIDGEY
	db 15, PIDGEOTTO
	db 10, MEOWTH
	db 12, MEOWTH
	db 15, GROWLITHE
	db 16, GROWLITHE
	db 16, JIGGLYPUFF
	db 14, GROWLITHE
	db 16, ABRA
	end_grass_wildmons

	def_water_wildmons 10 ; encounter rate
	db 12, PSYDUCK
	db 12, SLOWPOKE
	db 15, PSYDUCK
	db 15, SLOWPOKE
	db 15, GOLDEEN
	db 15, WEIRDUCK
	db 15, WEIRDUCK
	db 16, SEAKING
	db 15, GOLDUCK
	db 20, GOLDUCK
	end_water_wildmons
