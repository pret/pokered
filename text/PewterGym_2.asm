_PewterGymBrockPostBattleAdviceText::
	text "There are all"
	line "kinds of trainers"
	cont "in the world!"

	para "You appear to be"
	line "very gifted as a"
	cont "#MON trainer!"

	para "Go to the GYM in"
	line "CERULEAN and test"
	cont "your abilities!"
	done

_PewterGymBrockWaitTakeThisText::
	text "Wait! Take this"
	line "with you!"
	done

_PewterGymReceivedTM34Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_TM34ExplanationText::
	text_start

	para "A TM contains a"
	line "technique that"
	cont "can be taught to"
	cont "#MON!"

	para "A TM is good only"
	line "once! So when you"
	cont "use one to teach"
	cont "a new technique,"
	cont "pick the #MON"
	cont "carefully!"

	para "@"
	text_ram wStringBuffer
	text " contains"
	line "BIDE!"

	para "Your #MON will"
	line "steel itself,"
	cont "raising ATTACK"
	cont "and DEFENSE!"
	done

_PewterGymTM34NoRoomText::
	text "You don't have"
	line "room for this!"
	done

_PewterGymBrockReceivedBoulderBadgeText::
	text "I took"
	line "you for granted."

	para "As proof of your"
	line "victory, here's"
	cont "the BOULDERBADGE!"

	para "<PLAYER> received"
	line "the BOULDERBADGE!@"
	text_end

_PewterGymBrockBoulderBadgeInfoText::
	text_start

	para "That's an official"
	line "#MON LEAGUE"
	cont "BADGE!"

	para "Its bearer's"
	line "#MON become"
	cont "more powerful!"

	para "The technique"
	line "FLASH can now be"
	cont "used any time!"
	prompt

_PewterGymCooltrainerMBattleText::
	text "Stop right there,"
	line "kid!"

	para "You're still light"
	line "years from facing"
	cont "BROCK!"
	done

_PewterGymCooltrainerMEndBattleText::
	text "Darn!"

	para "Light years isn't"
	line "time! It measures"
	cont "distance!"
	prompt

_PewterGymCooltrainerMAfterBattleText::
	text "You're pretty hot,"
	line "but not as hot"
	cont "as BROCK!"
	done

_PewterGymGuidePreAdviceText::
	text "Hiya! I can tell"
	line "you have what it"
	cont "takes to become a"
	cont "#MON champ!"

	para "I'm no trainer,"
	line "but I can tell"
	cont "you how to win!"

	para "Let me take you"
	line "to the top!"
	done

_PewterGymGuideBeginAdviceText::
	text "All right! Let's"
	line "get happening!"
	prompt

_PewterGymGuideAdviceText::
	text "The 1st #MON"
	line "out in a match is"
	cont "at the top of the"
	cont "#MON LIST!"

	para "By changing the"
	line "order of #MON,"
	cont "matches could be"
	cont "made easier!"
	done

_PewterGymGuideFreeServiceText::
	text "It's a free"
	line "service! Let's"
	cont "get happening!"
	prompt

_PewterGymGuidePostBattleText::
	text "Just as I thought!"
	line "You're #MON"
	cont "champ material!"
	prompt

_PewterGymGuideApexChipText::
	text "I want you"
	line "to have these!"
	prompt

_ReceivedApexChipsText::
	text "<PLAYER> received"
	line "2 APEX CHIPs!@"
	text_end

_ApexChipExplanationText::
	text_start

	para "The APEX CHIP is a"
	line "special microchip"
	cont "I developed."
	
	para "You install it"
	line "onto a #MON's"
	cont "Poké Ball."

	para "It simulates the"
	line "natural wild"
	cont "environment of"
	cont "the #MON"
	cont "inside its Poké"
	cont "Ball!"

	para "It makes #MON"
	line "happy and helps"
	cont "achieve their"
	cont "max potential!"

	para "Use them on your"
	line "best #MON!"

	para "For Rock-type"
	line "#MON, an APEX"
	cont "CHIP simulates"
	cont "a jagged craggy"
	cont "ridge with cave"
	cont "systems and steep"
	cont "mountain terrain."
	prompt

_AlreadyReceivedApexChipsText::
	text "Talk to me at"
	line "the next GYM if"
	cont "you defeat the"
	cont "LEADER for more"
	cont "APEX CHIPs!"
	done