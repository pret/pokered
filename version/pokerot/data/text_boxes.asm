TextBoxFunctionTable:
	; text box ID, function address
	dbw MONEY_BOX,           DisplayMoneyBox
	dbw BUY_SELL_QUIT_MENU,  DoBuySellQuitMenu
	dbw FIELD_MOVE_MON_MENU, DisplayFieldMoveMonMenu
	db -1 ; end

TextBoxCoordTable:
	; text box ID, upper-left X, upper-left Y, lower-right X, lower-right Y
	db MESSAGE_BOX,       0, 12, 19, 17
	db MENU_TEMPLATE_03,  0,  0, 19, 14
	db MENU_TEMPLATE_07,  0,  0, 11,  6
	db LIST_MENU_BOX,     4,  2, 19, 12
	db MENU_TEMPLATE_10,  7,  0, 19, 17
	db MON_SPRITE_POPUP,  6,  4, 14, 13
	db -1 ; end

text_box_text: MACRO
	db \1 ; text box ID
	db \2, \3, \4, \5 ; text box coordinates
	dw \6 ; text pointer
	db \7, \8 ; text coordinates
ENDM

TextBoxTextAndCoordTable:
	; text box ID, upper-left X, upper-left Y, lower-right X, lower-right Y, text pointer, text X, text Y
	text_box_text JP_MOCHIMONO_MENU_TEMPLATE,         0,  0, 14, 17, EmptyJapaneseText,        3,  0
	text_box_text USE_TOSS_MENU_TEMPLATE,            13, 10, 19, 14, UseTossText,             15, 11
	text_box_text JP_SAVE_MESSAGE_MENU_TEMPLATE,      0,  0,  7,  5, EmptyJapaneseText,        2,  2
	text_box_text JP_SPEED_OPTIONS_MENU_TEMPLATE,     0,  6,  5, 10, EmptyJapaneseText,        2,  7
	text_box_text BATTLE_MENU_TEMPLATE,               6, 12, 19, 17, BattleMenuText,           8, 14
	text_box_text SAFARI_BATTLE_MENU_TEMPLATE,        0, 12, 19, 17, SafariZoneBattleMenuText, 2, 14
	text_box_text SWITCH_STATS_CANCEL_MENU_TEMPLATE, 11, 11, 19, 17, SwitchStatsCancelText,   13, 12
	text_box_text BUY_SELL_QUIT_MENU_TEMPLATE,        0,  0, 10,  6, BuySellQuitText,          2,  1
	text_box_text MONEY_BOX_TEMPLATE,                11,  0, 19,  2, MoneyText,               13,  0
	text_box_text JP_AH_MENU_TEMPLATE,                7,  6, 11, 10, EmptyJapaneseText,        8,  8
	text_box_text JP_POKEDEX_MENU_TEMPLATE,          11,  8, 19, 17, EmptyJapaneseText,       12, 10

EmptyJapaneseText:
	db "@"

BuySellQuitText:
	db   "KAUF"
	next "VERKAUF"
	next "TSCHÜSS!@"
	
UseTossText:
	db   "OK"
	next "MÜLL@"
	
MoneyText:
	db "GELD@"
	
BattleMenuText:
	db   "KMPF <PK><MN>"
	next "ITEM FLUCHT@"
	
SafariZoneBattleMenuText:
	db   "BALL×      KÖDER"
	next "STEIN      FLUCHT@"
	
SwitchStatsCancelText:
	db   "TAUSCH"
	next "STATUS"
	next "ZURÜCK@"
