_CeruleanGymText_5c7be:: ; 989c1 (26:49c1)
	text "Hi, you're a new"
	line "face!"

IF DEF(_YELLOW)
	para "What's your policy"
	line "on #MON? What"
	cont "is your approach?"
ELSE
	para "Trainers who want"
	line "to turn pro have"
	cont "to have a policy"
	cont "about #MON!"

	para "What is your"
	line "approach when you"
	cont "catch #MON?"
ENDC

	para "My policy is an"
	line "all-out offensive"
	cont "with water-type"
	cont "#MON!"

IF DEF(_YELLOW)
	para "MISTY, the world-"
	line "famous beauty, is"
	cont "your host!"

	para "Are you ready,"
	line "sweetie?"
ENDC
	done

_CeruleanGymText_5c7c3:: ; 98a7b (26:4a7b)
	text "TM11 teaches"
	line "BUBBLEBEAM!"

	para "Use it on an"
	line "aquatic #MON!"
	done

_CeruleanGymText_5c7c8:: ; 98ab0 (26:4ab0)
	text "The CASCADEBADGE"
	line "makes all #MON"
	cont "up to L30 obey!"

	para "That includes"
	line "even outsiders!"

	para "There's more, you"
	line "can now use CUT"
IF DEF(_YELLOW)
	cont "anytime!"
ELSE
	cont "any time!"
ENDC

	para "You can CUT down"
	line "small bushes to"
	cont "open new paths!"

	para "You can also have"
	line "my favorite TM!"
	done

_ReceivedTM11Text:: ; 98b7d (26:4b7d)
	text $52, " received"
	line "TM11!@@"

_CeruleanGymText_5c7d3:: ; 98b90 (26:4b90)
	text "You better make"
	line "room for this!"
	done

_CeruleanGymText_5c7d8:: ; 98bb0 (26:4bb0)
IF DEF(_YELLOW)
	text "I can't"
	line "believe I lost!"
ELSE
	text "Wow!"
	line "You're too much!"
ENDC

	para "All right!"

	para "You can have the"
	line "CASCADEBADGE to"
	cont "show you beat me!@@"

_CeruleanGymBattleText1:: ; 98c05 (26:4c05)
	text "I'm more than good"
	line "enough for you!"

	para "MISTY can wait!"
	done

_CeruleanGymEndBattleText1:: ; 98c38 (26:4c38)
	text "You"
	line "overwhelmed me!"
	prompt

_CeruleanGymAfterBattleText1:: ; 98c4d (26:4c4d)
	text "You have to face"
	line "other trainers to"
	cont "find out how good"
	cont "you really are."
	done

_CeruleanGymBattleText2:: ; 98c93 (26:4c93)
	text "Splash!"

	para "I'm first up!"
	line "Let's do it!"
	done

_CeruleanGymEndBattleText2:: ; 98cb5 (26:4cb5)
	text "That"
	line "can't be!"
	prompt

_CeruleanGymAfterBattleText2:: ; 98cc4 (26:4cc4)
	text "MISTY is going to"
	line "keep improving!"

	para "She won't lose to"
	line "someone like you!"
	done

_CeruleanGymText_5c82a:: ; 98d0a (26:4d0a)
	text "Yo! Champ in"
	line "making!"

	para "Here's my advice!"

	para "The LEADER, MISTY,"
	line "is a pro who uses"
	cont "water #MON!"

	para "You can drain all"
	line "their water with"
	cont "plant #MON!"

	para "Or, zap them with"
	line "electricity!"
	done

_CeruleanGymText_5c82f:: ; 98db0 (26:4db0)
	text "You beat MISTY!"
	line "What'd I tell ya?"

IF DEF(_YELLOW)
	para "You and me, kid,"
ELSE
	para "You and me kid,"
ENDC
	line "we make a pretty"
	cont "darn good team!"
	done

