_DaisyInitialText::
	text "!<PLAYER> היי"
	line "מחוץ לבית <RIVAL>"
	cont ".במעבדה של סבא"
	done

_DaisyOfferMapText::
	text "סבא ביקש ממך"
	line "לעשות בשבילו"
	cont ",סידורים? אז קח"
	cont "!זה יעזור לך"
	prompt

_GotMapText::
	text "קיבל <PLAYER>"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_DaisyBagFullText::
	text "אתה נושא יותר"
	line ".מדי דברים"
	done

_DaisyUseMapText::
	text "השתמש במפת הערים"
	line "כדי לגלות איפה"
	cont ".אתה נמצא"
	done

_BluesHouseText2::
	text "פוקימונים הם"
	line "!יצורים חיים"
	cont ",אם הם מתעייפים"
	cont "!תן להם לנוח"
	done

_BluesHouseText3::
	text "!זו מפה גדולה"
	line "!היא שימושית"
	done
