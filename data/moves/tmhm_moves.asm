; The add_hm and add_tm macros in constants/item_constants.asm simultaneously
; define constants for the item IDs and for the corresponding move values.

TechnicalMachines:

n = 1
REPT NUM_TMS
IF n < 10
MOVE_FOR_TM EQUS "TM0{d:n}_MOVE"
ELSE
MOVE_FOR_TM EQUS "TM{d:n}_MOVE"
ENDC
	db MOVE_FOR_TM
PURGE MOVE_FOR_TM
n = n + 1
ENDR

n = 1
REPT NUM_HMS
IF n < 10
MOVE_FOR_HM EQUS "HM0{d:n}_MOVE"
ELSE
MOVE_FOR_HM EQUS "HM{d:n}_MOVE"
ENDC
	db MOVE_FOR_HM
PURGE MOVE_FOR_HM
n = n + 1
ENDR
