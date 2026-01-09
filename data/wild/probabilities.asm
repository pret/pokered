MACRO def_wild_chance
	def wild_chance_total = 0
	def wild_chance_slot = 0
ENDM

MACRO wild_chance
	def wild_chance_total += \1

	db wild_chance_total - 1 
	db wild_chance_slot * 2

	def wild_chance_slot += 1
ENDM

WildMonEncounterSlotChances:
; There are 10 slots for wild pokemon, and this is the list that defines how common each of
; those 10 slots is. A random number is generated and then the cumulative chance value up to the current
; slot (included) is compared against that random number. If the random number is less than or equal
; to said cumulative value, then that slot is chosen.
	def_wild_chance

	wild_chance 51 ; 51/256 = 19.9% chance of slot 0
	wild_chance 51 ; 51/256 = 19.9% chance of slot 1
	wild_chance 39 ; 39/256 = 15.2% chance of slot 2
	wild_chance 25 ; 25/256 =  9.8% chance of slot 3
	wild_chance 25 ; 25/256 =  9.8% chance of slot 4
	wild_chance 25 ; 25/256 =  9.8% chance of slot 5
	wild_chance 13 ; 13/256 =  5.1% chance of slot 6
	wild_chance 13 ; 13/256 =  5.1% chance of slot 7
	wild_chance 11 ; 11/256 =  4.3% chance of slot 8
	wild_chance  3 ;  3/256 =  1.2% chance of slot 9

	ASSERT wild_chance_total == 256, "Total wild_chance expected to add up to 256, currently {d:wild_chance_total}."
	ASSERT NUM_WILDMONS == wild_chance_slot, "Expected {d:NUM_WILDMONS} wild_chance slots, currently {d:wild_chance_slot}."
