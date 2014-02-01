_LanceBeforeBattleText:: ; 85d3c (21:5d3c)
	text "Ah! I heard about"
	line "you ", $52, "!"

	para "I lead the ELITE"
	line "FOUR! You can"
	cont "call me LANCE the"
	cont "dragon trainer!"

	para "You know that"
	line "dragons are"
	cont "mythical #MON!"

	para "They're hard to"
	line "catch and raise,"
	cont "but their powers"
	cont "are superior!"

	para "They're virtually"
	line "indestructible!"

	para "Well, are you"
	line "ready to lose?"

	para "Your LEAGUE"
	line "challenge ends"
	cont "with me, ", $52, "!"
	done

_LanceEndBattleText:: ; 85e64 (21:5e64)
	text "That's it!"

	para "I hate to admit"
	line "it, but you are a"
	cont "#MON master!"
	prompt

_LanceAfterBattleText:: ; 85e9e (21:5e9e)
	text "I still can't"
	line "believe my"
	cont "dragons lost to"
	cont "you, ", $52, "!"

	para "You are now the"
	line "#MON LEAGUE"
	cont "champion!"

	para "...Or, you would"
	line "have been, but"
	cont "you have one more"
	cont "challenge ahead."

	para "You have to face"
	line "another trainer!"
	cont "His name is..."

	para $53, "!"
	line "He beat the ELITE"
	cont "FOUR before you!"

	para "He is the real"
	line "#MON LEAGUE"
	cont "champion!@@"

