CeladonMart2F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart2F_TextPointers:
	dw CeladonMart2Clerk1Text
	dw CeladonMart2Clerk2Text
	dw CeladonMart2Text3
	dw CeladonMart2Text4
	dw CeladonMart2Text5

CeladonMart2Text3:
	text_far _CeladonMart2Text3
	text_end

CeladonMart2Text4:
	text_far _CeladonMart2Text4
	text_end

CeladonMart2Text5:
	text_far _CeladonMart2Text5
	text_end

CeladonMart2Clerk1Text::
	script_mart GREAT_BALL, SUPER_POTION, REVIVE, SUPER_REPEL, ANTIDOTE, BURN_HEAL, ICE_HEAL, AWAKENING, PARLYZ_HEAL

CeladonMart2Clerk2Text::
	script_mart TM_DOUBLE_TEAM, TM_REFLECT, TM_RAZOR_WIND, TM_HORN_DRILL, TM_EGG_BOMB, TM_MEGA_PUNCH, TM_MEGA_KICK, TM_TAKE_DOWN, TM_SUBMISSION
