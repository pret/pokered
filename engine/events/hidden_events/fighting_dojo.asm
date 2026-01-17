PrintFightingDojoText2:
	call EnableAutoTextBoxDrawing
	tx_pre_jump EnemiesOnEverySideText

EnemiesOnEverySideText::
	text_far _EnemiesOnEverySideText
	text_end

PrintFightingDojoText3:
	call EnableAutoTextBoxDrawing
	tx_pre_jump WhatGoesAroundComesAroundText

WhatGoesAroundComesAroundText::
	text_far _WhatGoesAroundComesAroundText
	text_end

PrintFightingDojoText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText

FightingDojoText::
	text_far _FightingDojoText
	text_end
