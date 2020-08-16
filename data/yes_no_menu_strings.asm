two_option_menu: MACRO
	db \1, \2, \3
	dw \4
ENDM

IF DEF(_ENGLISH)
TwoOptionMenuStrings:
; entries correspond to *_MENU constants
	; width, height, blank line before first menu item?, text pointer
	two_option_menu 4, 3, FALSE, .YesNoMenu
	two_option_menu 6, 3, FALSE, .NorthWestMenu
	two_option_menu 6, 3, FALSE, .SouthEastMenu
	two_option_menu 6, 3, FALSE, .YesNoMenu
	two_option_menu 6, 3, FALSE, .NorthEastMenu
	two_option_menu 7, 3, FALSE, .TradeCancelMenu
	two_option_menu 7, 4, TRUE,  .HealCancelMenu
	two_option_menu 4, 3, FALSE, .NoYesMenu

.NoYesMenu:
	db   "NO"
	next "YES@"

.YesNoMenu:
	db   "YES"
	next "NO@"

.NorthWestMenu:
	db   "NORTH"
	next "WEST@"

.SouthEastMenu:
	db   "SOUTH"
	next "EAST@"

.NorthEastMenu:
	db   "NORTH"
	next "EAST@"

.TradeCancelMenu:
	db   "TRADE"
	next "CANCEL@"

.HealCancelMenu:
	db   "HEAL"
	next "CANCEL@"
ENDC

IF DEF(_GERMAN)
TwoOptionMenuStrings:
; entries correspond to *_MENU constants
	; width, height, blank line before first menu item?, text pointer
	two_option_menu 5, 3, FALSE, .YesNoMenu
	two_option_menu 6, 3, FALSE, .NorthWestMenu
	two_option_menu 6, 3, FALSE, .SouthEastMenu
	two_option_menu 6, 3, FALSE, .YesNoMenu
	two_option_menu 6, 3, FALSE, .NorthEastMenu
	two_option_menu 7, 3, FALSE, .TradeCancelMenu
	two_option_menu 7, 4, TRUE,  .HealCancelMenu
	two_option_menu 5, 3, FALSE, .NoYesMenu

.NorthWestMenu
	db   "NORTH"
	next "WEST@"

.SouthEastMenu
	db   "SOUTH"
	next "EAST@"

.NorthEastMenu
	db   "NORTH"
	next "EAST@"

.NoYesMenu
	db   "NEIN"
	next "JA@"

.YesNoMenu
	db   "JA"
	next "NEIN@"

.TradeCancelMenu
	db   "TAUSCH"
	next "ZURÜCK@"

.HealCancelMenu
	db   "HEILEN"
	next "ZURÜCK@"
ENDC
