PrintFightingDojoText2:
	call EnableAutoTextBoxDrawing
	tx_pre_jump EnemiesOnEverySideText

EnemiesOnEverySideText::
	TX_FAR _EnemiesOnEverySideText
	db "@"

PrintFightingDojoText3:
	call EnableAutoTextBoxDrawing
	tx_pre_jump WhatGoesAroundComesAroundText

WhatGoesAroundComesAroundText::
	TX_FAR _WhatGoesAroundComesAroundText
	db "@"

PrintFightingDojoText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText

FightingDojoText::
	TX_FAR _FightingDojoText
	db "@"
