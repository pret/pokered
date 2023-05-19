; Bill's Garden is being built based on the original playground rumours.
; Essentially, most people would claim that it was filled with all those one-time deals.
; So here, we add those: Eevee, Starters, Hitmons, and Fossils, plus Totartle.
; Only difference is Hisuian Formes, which otherwise are basically impossible to fit.
; Legendary Birds were also in the mythos but there's no space and it sounds terrible.
BillsGardenWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 50, EEVEE ; People are here for Eevee so just give them the ~40% chance...
	db 50, EEVEE
	db 50, CHARMANDER
	db 50, BULBASAUR
	db 50, HITMONLEE
	db 50, HITMONCHAN
	db 50, HITMONTOP
	db 50, ELECTRODE_H
	db 50, ARCANINE_H
	db 50, DECILLA
	end_grass_wildmons

	def_water_wildmons 10 ; encounter rate
	db 50, BLASTYKE
	db 50, SQUIRTLE
	db 50, SQUIRTLE
	db 50, KABUTO
	db 50, OMANYTE
	db 50, AERODACTYL ; In games like DPP, you can encounter fliers on Water. Most notably, Zubat. No space on land so this is the best we got.
	db 50, WARTORTLE
	db 50, WARTORTLE
	db 50, BLASTOISE
	db 50, TOTARTLE
	end_water_wildmons