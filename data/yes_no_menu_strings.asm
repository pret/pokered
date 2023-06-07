MACRO two_option_menu
	db \1, \2, \3
	dw \4
ENDM

TwoOptionMenuStrings:
; entries correspond to *_MENU constants
	table_width 5, TwoOptionMenuStrings
	; width, height, blank line before first menu item?, text pointer
	two_option_menu 4, 3, FALSE, .YesNoMenu
	two_option_menu 5, 3, FALSE, .BoyGirlMenu
	two_option_menu 6, 3, TRUE,  .CatsDogsMenu
	two_option_menu 6, 3, FALSE, .YesNoMenu
	two_option_menu 6, 3, FALSE, .NorthEastMenu
	two_option_menu 7, 3, FALSE, .TradeCancelMenu
	two_option_menu 7, 4, TRUE,  .HealCancelMenu
	two_option_menu 4, 3, FALSE, .NoYesMenu
	assert_table_length NUM_TWO_OPTION_MENUS

.NoYesMenu:
	db   "NO"
	next "YES@"

.YesNoMenu:
	db   "YES"
	next "NO@"

; There is probably a better way to word this...
; Replaced North/West
.BoyGirlMenu:
	db   "BOY"
	next "GIRL@"

; For the Vermilion Beauty event.
; Replaced South/East
.CatsDogsMenu:
	db   "CATS"
	next "DOGS@"

.NorthEastMenu:
	db   "NORTH"
	next "EAST@"

.TradeCancelMenu:
	db   "TRADE"
	next "CANCEL@"

.HealCancelMenu:
	db   "HEAL"
	next "CANCEL@"
