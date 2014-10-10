_SilphCoPresidentText:: ; 84e9b (21:4e9b)
	text "PRESIDENT: Thank"
	line "you for saving"
	cont "SILPH!"

	para "I will never"
	line "forget you saved"
	cont "us in our moment"
	cont "of peril!"

	para "I have to thank"
	line "you in some way!"

	para "Because I am rich,"
	line "I can give you"
	cont "anything!"

	para "Here, maybe this"
	line "will do!"
	prompt

_ReceivedSilphCoMasterBallText:: ; 84f63 (21:4f63)
	text $52, " got a"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_SilphCo10Text_6231c:: ; 84f74 (21:4f74)
	text "PRESIDENT: You"
	line "can't buy that"
	cont "anywhere!"

	para "It's our secret"
	line "prototype MASTER"
	cont "BALL!"

	para "It will catch any"
	line "#MON without"
	cont "fail!"

	para "You should be"
	line "quiet about using"
	cont "it, though."
	done

_SilphCoMasterBallNoRoomText:: ; 85013 (21:5013)
	text "You have no"
	line "room for this."
	done

_SilphCo11Text2:: ; 8502f (21:502f)
	text "SECRETARY: Thank"
	line "you for rescuing"
	cont "all of us!"

	para "We admire your"
	line "courage."
	done

_SilphCo11Text3:: ; 85075 (21:5075)
IF DEF(_YELLOW)
	text "Ah, ", $52, "!"
ELSE
	text "Ah ", $52, "!"
ENDC
	line "So we meet again!"

	para "The PRESIDENT and"
	line "I are discussing"
	cont "a vital business"
	cont "proposition."

	para "Keep your nose"
	line "out of grown-up"
	cont "matters..."

IF DEF(_YELLOW)
	para "or, experience a"
ELSE
	para "Or, experience a"
ENDC
	line "world of pain!"
	done

_SilphCo10Text_62330:: ; 85119 (21:5119)
	text "Arrgh!!"
	line "I lost again!?"
	prompt

_SilphCo10Text_62335:: ; 85131 (21:5131)
	text "Blast it all!"
	line "You ruined our"
	cont "plans for SILPH!"

	para "But, TEAM ROCKET"
	line "will never fall!"

	para $52, "! Never"
	line "forget that all"
	cont "#MON exist"
	cont "for TEAM ROCKET!"

	para "I must go, but I"
	line "shall return!"
	done

_SilphCo11BattleText1:: ; 851d6 (21:51d6)
	text "Stop right there!"
	line "Don't you move!"
	done

_SilphCo11EndBattleText1:: ; 851f8 (21:51f8)
	text "Don't..."
	line "Please!"
	prompt

_SilphCo11AfterBattleText1:: ; 85209 (21:5209)
	text "So, you want to"
	line "see my BOSS?"
	done

_SilphCo11BattleText2:: ; 85227 (21:5227)
	text "Halt! Do you have"
	line "an appointment"
	cont "with my BOSS?"
	done

_SilphCo11EndBattleText2:: ; 85257 (21:5257)
	text "Gaah!"
	line "Demolished!"
	prompt

_SilphCo11AfterBattleText2:: ; 8526a (21:526a)
	text "Watch your step,"
	line "my BOSS likes his"
	cont "#MON tough!"
	done

_SilphCo10Text_6237b:: ; 8529a (21:529a)
	text "The monitor has"
	line "#MON on it!"
	done

