_SilphCo2Text_59ded:: ; 82454 (20:6454)
	text "Eeek!"
	line "No! Stop! Help!"

	para "Oh, you're not"
	line "with TEAM ROCKET."
	cont "I thought..."
	cont "I'm sorry. Here,"
	cont "please take this!"
	prompt

_ReceivedTM36Text:: ; 824ba (20:64ba)
	text $52, " got"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_TM36ExplanationText:: ; 824c9 (20:64c9)
	text "TM36 is"
	line "SELFDESTRUCT!"

	para "It's powerful, but"
	line "the #MON that"
	cont "uses it faints!"
	cont "Be careful."
	done

_TM36NoRoomText:: ; 8251c (20:651c)
	text "You don't have any"
	line "room for this."
	done

_SilphCo2BattleText1:: ; 8253e (20:653e)
	text "Help! I'm a SILPH"
	line "employee."
	done

_SilphCo2EndBattleText1:: ; 8255a (20:655a)
	text "How"
	line "did you know I"
	cont "was a ROCKET?"
	prompt

_SilphCo2AfterBattleText1:: ; 8257c (20:657c)
	text "I work for both"
	line "SILPH and TEAM"
	cont "ROCKET!"
	done

_SilphCo2BattleText2:: ; 825a4 (20:65a4)
	text "It's off limits"
	line "here! Go home!"
	done

_SilphCo2EndBattleText2:: ; 825c3 (20:65c3)
	text "You're"
	line "good."
	prompt

_SilphCo2AfterBattleText2:: ; 825d0 (20:65d0)
	text "Can you solve the"
	line "maze in here?"
	done

_SilphCo2BattleText3:: ; 825f1 (20:65f1)
	text "No kids are"
	line "allowed in here!"
	done

_SilphCo2EndBattleText3:: ; 8260f (20:660f)
	text "Tough!"
	prompt

_SilphCo2AfterBattleText3:: ; 82617 (20:6617)
IF DEF(_YELLOW)
	text "Diamond-shaped"
ELSE
	text "Diamond shaped"
ENDC
	line "tiles are"
	cont "teleport blocks!"

	para "They're hi-tech"
	line "transporters!"
	done

_SilphCo2BattleText4:: ; 8265f (20:665f)
	text "Hey kid! What are"
	line "you doing here?"
	done

_SilphCo2EndBattleText4:: ; 82682 (20:6682)
	text "I goofed!"
	prompt

_SilphCo2AfterBattleText4:: ; 8268d (20:668d)
	text "SILPH CO. will"
	line "be merged with"
	cont "TEAM ROCKET!"
	done

