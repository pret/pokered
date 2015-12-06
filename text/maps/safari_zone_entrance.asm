_SafariZoneEntranceText1::
	text "Welcome to the"
	line "SAFARI ZONE!"
	done

SafariZoneEntranceText_9e6e4::
	text "For just ¥500,"
	line "you can catch all"
	cont "the #MON you"
	cont "want in the park!"

	para "Would you like to"
	line "join the hunt?@@"

SafariZoneEntranceText_9e747::
	text "That'll be ¥500"
	line "please!"

	para "We only use a"
	line "special # BALL"
	cont "here."

	para $52, " received"
	line "30 SAFARI BALLs!@@"

_SafariZoneEntranceText_75360::
	db $0
	para "We'll call you on"
	line "the PA when you"
	cont "run out of time"
	cont "or SAFARI BALLs!"
	done

_SafariZoneEntranceText_75365::
	text "OK! Please come"
	line "again!"
	done

_SafariZoneEntranceText_7536a::
	text "Oops! Not enough"
	line "money!"
	done

SafariZoneEntranceText_9e814::
	text "Leaving early?@@"

_SafariZoneEntranceText_753bb::
	text "Please return any"
	line "SAFARI BALLs you"
	cont "have left."
	done

_SafariZoneEntranceText_753c0::
	text "Good Luck!"
	done

_SafariZoneEntranceText_753c5::
	text "Did you get a"
	line "good haul?"
	cont "Come again!"
	done

_SafariZoneEntranceText_753e6::
	text "Hi! Is it your"
	line "first time here?"
	done

_SafariZoneEntranceText_753eb::
	text "SAFARI ZONE has 4"
	line "zones in it."

	para "Each zone has"
	line "different kinds"
	cont "of #MON. Use"
	cont "SAFARI BALLs to"
	cont "catch them!"

	para "When you run out"
	line "of time or SAFARI"
	cont "BALLs, it's game"
	cont "over for you!"

	para "Before you go,"
	line "open an unused"
	cont "#MON BOX so"
	cont "there's room for"
	cont "new #MON!"
	done

_SafariZoneEntranceText_753f0::
	text "Sorry, you're a"
	line "regular here!"
	done

IF DEF(_OPTION_LOWCOST_SAFARI)
_SafariZoneLowCostText1::
	db 0
	para "Oh, all right, pay"
	line "me what you have."
	prompt

_SafariZoneLowCostText2::
	text "But, I can't give"
	line "you all 30 BALLs."
	done

_SafariZoneLowCostText3::
	db 0
	para "You're persistent,"
	line "aren't you?"

	para "OK, you can go in"
	line "for free, but"
	cont "just this once!@@"

_SafariZoneLowCostText4::
	db 0
	done

_SafariZoneLowCostText5::
	text "I'm sorry, but you"
	line "have to pay to"
	cont "enter."
	done

_SafariZoneLowCostText6::
	text "You can't enter"
	line "without paying!"
	done

_SafariZoneLowCostText7::
	text "I said, no money,"
	line "no entry!"
	done

_SafariZoneLowCostText8::
	text "Read my lips, NO!"
	line "Get it?"
	done
ENDC
