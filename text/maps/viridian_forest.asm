_ViridianForestText1:: ; 8031d (20:431d)
	text "I came here with"
	line "some friends!"

	para "They're out for"
	line "#MON fights!"
	done

_ViridianForestBattleText1:: ; 80359 (20:4359)
	text "Hey! You have"
	line "#MON! Come on!"
IF DEF(_YELLOW)
	cont "Let's battle 'em!"
ELSE
	cont "Let's battle'em!"
ENDC
	done

_ViridianForestEndBattleText1:: ; 80387 (20:4387)
	text "No!"
	line "CATERPIE can't"
	cont "cut it!"
	prompt

_ViridianFrstAfterBattleText1:: ; 803a2 (20:43a2)
	text "Ssh! You'll scare"
	line "the bugs away!"
	done

_ViridianForestBattleText2:: ; 803c3 (20:43c3)
	text "Yo! You can't jam"
	line "out if you're a"
	cont "#MON trainer!"
	done

_ViridianForestEndBattleText2:: ; 803f2 (20:43f2)
	text "Huh?"
	line "I ran out of"
	cont "#MON!"
	prompt

_ViridianFrstAfterBattleText2:: ; 8040b (20:440b)
	text "Darn! I'm going"
	line "to catch some"
	cont "stronger ones!"
	done

_ViridianForestBattleText3:: ; 80438 (20:4438)
	text "Hey, wait up!"
	line "What's the hurry?"
	done

_ViridianForestEndBattleText3:: ; 80458 (20:4458)
	text "I"
	line "give! You're good"
	cont "at this!"
	prompt

_ViridianFrstAfterBattleText3:: ; 80475 (20:4475)
	text "Sometimes, you"
	line "can find stuff on"
	cont "the ground!"

	para "I'm looking for"
	line "the stuff I"
	cont "dropped!"
	done

if DEF(_YELLOW)
_ViridianForestBattleTextPikaGirl::
	text "Hi, do you have a"
	line "PIKACHU?"
	done

_ViridianForestEndBattleTextPikaGirl::
	text "Oh no,"
	line "really?"
	prompt

_ViridianForestAfterBattleTextPikaGirl::
	text "I looked forever,"
	line "but I never found"
	cont "a PIKACHU here!"
	done

_ViridianForestBattleTextSamurai::
	text "I'm gonna be the"
	line "best. You just"
	cont "can't beat me!"
	done

_ViridianForestEndBattleTextSamurai::
	text "After"
	line "all I did..."
	prompt

_ViridianForestAfterBattleTextSamurai::
	text "A METAPOD is cool"
	line "because its"
	cont "attack is its"
	cont "defense!"
	done
ENDC

_ViridianForestText8:: ; 804c7 (20:44c7)
	text "I ran out of #"
	line "BALLs to catch"
	cont "#MON with!"

	para "You should carry"
	line "extras!"
	done

_ViridianForestText9:: ; 8050a (20:450a)
	text "TRAINER TIPS"

	para "If you want to"
	line "avoid battles,"
	cont "stay away from"
	cont "grassy areas!"
	done

_ViridianForestText10:: ; 80553 (20:4553)
	text "For poison, use"
	line "ANTIDOTE! Get it"
	cont "at #MON MARTs!"
	done

_ViridianForestText11:: ; 80584 (20:4584)
	text "TRAINER TIPS"

	para "Contact PROF.OAK"
	line "via PC to get"
	cont "your #DEX"
	cont "evaluated!"
	done

_ViridianForestText12:: ; 805c6 (20:45c6)
	text "TRAINER TIPS"

	para "No stealing of"
	line "#MON from"
	cont "other trainers!"
	cont "Catch only wild"
	cont "#MON!"
	done

_ViridianForestText13:: ; 80613 (20:4613)
	text "TRAINER TIPS"

	para "Weaken #MON"
	line "before attempting"
	cont "capture!"

	para "When healthy,"
	line "they may escape!"
	done

_ViridianForestText14:: ; 80667 (20:4667)
	text "LEAVING"
	line "VIRIDIAN FOREST"
	cont "PEWTER CITY AHEAD"
	done

