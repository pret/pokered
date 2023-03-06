; Bill's Garden is being built based on the original playground rumours.
; Essentially, most people would claim that it was filled with all those one-time deals.
; So here, we add those: Eevee, Starters, Hitmons, and Fossils, plus Totartle.
; Only difference is Hisuian Formes, which otherwise are basically impossible to fit.
; Legendary Birds were also in the mythos but there's no space and it sounds terrible.
BillsGardenWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 46, EEVEE ; People are here for Eevee so just give them the ~40% chance...
	db 46, EEVEE
	db 46, CHARMANDER
	db 49, BULBASAUR
	db 49, HITMONTOP
	db 52, HITMONCHAN
	db 49, HITMONLEE
	db 52, EEVEE ; Hisuian Electrode
	db 53, EEVEE ; Hisuian Arcanine
	db 53, DECILLA
	end_grass_wildmons

	def_water_wildmons 10 ; encounter rate
	db 40, SQUIRTLE
	db 40, SQUIRTLE
	db 40, SQUIRTLE
	db 40, KABUTO
	db 40, OMANYTE
	db 40, AERODACTYL ; In games like DPP, you can encounter fliers on Water. Most notably, Zubat. No space on land so this is the best we got.
	db 40, WARTORTLE
	db 40, WARTORTLE
	db 40, BLASTOISE
	db 40, TOTARTLE
	end_water_wildmons