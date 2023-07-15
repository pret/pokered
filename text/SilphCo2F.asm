SilphCo2FSilphWorkerFPleaseTakeThisText::
	text "Eeek!"
	line "No! Stop! Help!"

	para "Oh, you're not"
	line "with TEAM ROCKET."
	cont "I thought..."
	cont "I'm sorry. Here,"
	cont "please take this!"
	prompt

_SilphCo2FSilphWorkerFReceivedTM36Text::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SilphCo2FSilphWorkerFTM36ExplanationText::
	text "TM36 is"
	line "SELFDESTRUCT!"

	para "It's powerful, but"
	line "the #MON that"
	cont "uses it faints!"
	cont "Be careful."
	done

_SilphCo2FSilphWorkerFTM36NoRoomText::
	text "You don't have any"
	line "room for this."
	done

_SilphCo2FScientist1BattleText::
	text "Help! I'm a SILPH"
	line "employee."
	done

_SilphCo2FScientist1EndBattleText::
	text "How"
	line "did you know I"
	cont "was a ROCKET?"
	prompt

_SilphCo2FScientist1AfterBattleText::
	text "I work for both"
	line "SILPH and TEAM"
	cont "ROCKET!"
	done

_SilphCo2FScientist2BattleText::
	text "It's off limits"
	line "here! Go home!"
	done

_SilphCo2FScientist2EndBattleText::
	text "You're"
	line "good."
	prompt

_SilphCo2FScientist2AfterBattleText::
	text "Can you solve the"
	line "maze in here?"
	done

_SilphCo2FRocket1BattleText::
	text "No kids are"
	line "allowed in here!"
	done

_SilphCo2FRocket1EndBattleText::
	text "Tough!"
	prompt

_SilphCo2FRocket1AfterBattleText::
	text "Diamond shaped"
	line "tiles are"
	cont "teleport blocks!"

	para "They're hi-tech"
	line "transporters!"
	done

_SilphCo2FRocket2BattleText::
	text "Hey kid! What are"
	line "you doing here?"
	done

_SilphCo2FRocket2EndBattleText::
	text "I goofed!"
	prompt

_SilphCo2FRocket2AfterBattleText::
	text "SILPH CO. will"
	line "be merged with"
	cont "TEAM ROCKET!"
	done
