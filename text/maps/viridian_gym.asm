_ViridianGymText_74ace:: ; 95e09 (25:5e09)
	text "Fwahahaha! This is"
	line "my hideout!"

	para "I planned to"
	line "resurrect TEAM"
	cont "ROCKET here!"

	para "But, you have"
	line "caught me again!"
	cont "So be it! This"
	cont "time, I'm not"
	cont "holding back!"

	para "Once more, you"
	line "shall face"
	cont "GIOVANNI, the"
	cont "greatest trainer!"
	done

_ViridianGymText_74ad3:: ; 95ed5 (25:5ed5)
	text "Ha!"
	line "That was a truly"
	cont "intense fight!"
	cont "You have won!"
	cont "As proof, here is"
	cont "the EARTHBADGE!@@"

_ViridianGymText_74ad9:: ; 95f2b (25:5f2b)
	text "Having lost, I"
	line "cannot face my"
	cont "underlings!"
	cont "TEAM ROCKET is"
	cont "finished forever!"

	para "I will dedicate my"
	line "life to the study"
	cont "of #MON!"

	para "Let us meet again"
IF DEF(_YELLOW)
	line "someday!"
ELSE
	line "some day!"
ENDC
	cont "Farewell!@@"

_ViridianGymText12:: ; 95fcc (25:5fcc)
	text "The EARTHBADGE"
	line "makes #MON of"
	cont "any level obey!"

	para "It is evidence of"
	line "your mastery as a"
	cont "#MON trainer!"

	para "With it, you can"
	line "enter the #MON"
	cont "LEAGUE!"

	para "It is my gift for"
	line "your #MON"
	cont "LEAGUE challenge!"
	done

_ReceivedTM27Text:: ; 96082 (25:6082)
	text $52, " received"
	line "TM27!@@"

_TM27ExplanationText:: ; 96095 (25:6095)
	db $0
	para "TM27 is FISSURE!"
	line "It will take out"
	cont "#MON with just"
	cont "one hit!"

	para "I made it when I"
	line "ran the GYM here,"
	cont "too long ago..."
	done

_TM27NoRoomText:: ; 96104 (25:6104)
	text "You do not have"
	line "space for this!"
	done

_ViridianGymBattleText1:: ; 96125 (25:6125)
	text "Heh! You must be"
	line "running out of"
	cont "steam by now!"
	done

_ViridianGymEndBattleText1:: ; 96154 (25:6154)
	text "I"
	line "ran out of gas!"
	prompt

_ViridianGymAfterBattleText1:: ; 96167 (25:6167)
	text "You need power to"
	line "keep up with our"
	cont "GYM LEADER!"
	done

_ViridianGymBattleText2:: ; 96197 (25:6197)
	text "Rrrroar! I'm"
	line "working myself"
	cont "into a rage!"
	done

_ViridianGymEndBattleText2:: ; 961c0 (25:61c0)
	text "Wargh!"
	prompt

_ViridianGymAfterBattleText2:: ; 961c8 (25:61c8)
	text "I'm still not"
	line "worthy!"
	done

_ViridianGymBattleText3:: ; 961de (25:61de)
	text "#MON and I, we"
	line "make wonderful"
	cont "music together!"
	done

_ViridianGymEndBattleText3:: ; 9620d (25:620d)
	text "You are in"
	line "perfect harmony!"
	prompt

_ViridianGymAfterBattleText3:: ; 9622a (25:622a)
	text "Do you know the"
	line "identity of our"
	cont "GYM LEADER?"
	done

_ViridianGymBattleText4:: ; 96257 (25:6257)
	text "Karate is the"
	line "ultimate form of"
	cont "martial arts!"
	done

_ViridianGymEndBattleText4:: ; 96285 (25:6285)
	text "Atcho!"
	prompt

_ViridianGymAfterBattleText4:: ; 9628d (25:628d)
	text "If my #MON"
	line "were as good at"
	cont "Karate as I..."
	done

_ViridianGymBattleText5:: ; 962b8 (25:62b8)
	text "The truly talented"
	line "win with style!"
	done

_ViridianGymEndBattleText5:: ; 962dc (25:62dc)
	text "I"
	line "lost my grip!"
	prompt

_ViridianGymAfterBattleText5:: ; 962ed (25:62ed)
	text "The LEADER will"
	line "scold me!"
	done

_ViridianGymBattleText6:: ; 96308 (25:6308)
	text "I'm the KARATE"
	line "KING! Your fate"
	cont "rests with me!"
	done

_ViridianGymEndBattleText6:: ; 96336 (25:6336)
	text "Ayah!"
	prompt

_ViridianGymAfterBattleText6:: ; 9633d (25:633d)
	text "#MON LEAGUE?"
	line "You? Don't get"
	cont "cocky!"
	done

_ViridianGymBattleText7:: ; 96360 (25:6360)
	text "Your #MON will"
	line "cower at the"
	cont "crack of my whip!"
	done

_ViridianGymEndBattleText7:: ; 9638f (25:638f)
	text "Yowch!"
	line "Whiplash!"
	prompt

_ViridianGymAfterBattleText7:: ; 963a1 (25:63a1)
	text "Wait! I was just"
	line "careless!"
	done

_ViridianGymBattleText8:: ; 963bd (25:63bd)
	text "VIRIDIAN GYM was"
	line "closed for a long"
	cont "time, but now our"
	cont "LEADER is back!"
	done

_ViridianGymEndBattleText8:: ; 96403 (25:6403)
	text "I"
	line "was beaten?"
	prompt

_ViridianGymAfterBattleText8:: ; 96412 (25:6412)
IF DEF(_YELLOW)
	text "You can go on to"
ELSE
	text "You can go onto"
ENDC
	line "#MON LEAGUE"
	cont "only by defeating"
	cont "our GYM LEADER!"
	done

_ViridianGymText_74bd4:: ; 96451 (25:6451)
	text "Yo! Champ in"
	line "making!"

	para "Even I don't know"
	line "VIRIDIAN LEADER's"
	cont "identity!"

	para "This will be the"
	line "toughest of all"
	cont "the GYM LEADERs!"

	para "I heard that the"
	line "trainers here"
	cont "like ground-type"
	cont "#MON!"
	done

_ViridianGymText_74bd9:: ; 964fb (25:64fb)
	text "Blow me away!"
	line "GIOVANNI was the"
	cont "GYM LEADER here?"
	done

