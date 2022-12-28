; The add_hm and add_tm macros in constants/item_constants.asm simultaneously
; define constants for the item IDs and for the corresponding move values.

TechnicalMachines:
	table_width 1, TechnicalMachines

FOR n, 1, NUM_TMS + 1
	db TM{02d:n}_MOVE
ENDR
	assert_table_length NUM_TMS

FOR n, 1, NUM_HMS + 1
	db HM{02d:n}_MOVE
ENDR
	assert_table_length NUM_TM_HM
