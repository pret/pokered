_FightingDojoText_5ce8e:: ; a1852 (28:5852)
	text "Grunt!"

	para "I am the KARATE"
	line "MASTER! I am the"
	cont "LEADER here!"

	para "You wish to"
	line "challenge us?"
	cont "Expect no mercy!"

	para "Fwaaa!"
	done

_FightingDojoText_5ce93:: ; a18ba (28:58ba)
	text "Hwa!"
	line "Arrgh! Beaten!"
	prompt

_FightingDojoText_5ce98:: ; a18cf (28:58cf)
	text "Indeed, I have"
	line "lost!"

	para "But, I beseech"
	line "you, do not take"
	cont "our emblem as"
	cont "your trophy!"

	para "In return, I will"
	line "give you a prized"
	cont "fighting #MON!"

	para "Choose whichever"
	line "one you like!"
	done

_FightingDojoText_5ce9d:: ; a1972 (28:5972)
	text "Ho!"

	para "Stay and train at"
	line "Karate with us!"
	done

_FightingDojoBattleText1:: ; a1999 (28:5999)
	text "Hoargh! Take your"
	line "shoes off!"
	done

_FightingDojoEndBattleText1:: ; a19b7 (28:59b7)
	text "I give"
	line "up!"
	prompt

_FightingDojoAfterBattleText1:: ; a19c3 (28:59c3)
	text "You wait 'til you"
	line "see our Master!"

	para "I'm a small fry"
	line "compared to him!"
	done

_FightingDojoBattleText2:: ; a1a05 (28:5a05)
	text "I hear you're"
	line "good! Show me!"
	done

_FightingDojoEndBattleText2:: ; a1a22 (28:5a22)
	text "Judge!"
	line "1 point!"
	prompt

_FightingDojoAfterBattleText2:: ; a1a33 (28:5a33)
	text "Our Master is a"
	line "pro fighter!"
	done

_FightingDojoBattleText3:: ; a1a51 (28:5a51)
	text "Nothing tough"
	line "frightens me!"

	para "I break boulders"
	line "for training!"
	done

_FightingDojoEndBattleText3:: ; a1a8d (28:5a8d)
	text "Yow!"
	line "Stubbed fingers!"
	prompt

_FightingDojoAfterBattleText3:: ; a1aa4 (28:5aa4)
	text "The only thing"
	line "that frightens us"
	cont "is psychic power!"
	done

_FightingDojoBattleText4:: ; a1ad8 (28:5ad8)
	text "Hoohah!"

	para "You're trespassing"
	line "in our FIGHTING"
	cont "DOJO!"
	done

_FightingDojoEndBattleText4:: ; a1b09 (28:5b09)
	text "Oof!"
	line "I give up!"
	prompt

_FightingDojoAfterBattleText4:: ; a1b1a (28:5b1a)
	text "The prime fighters"
	line "across the land"
	cont "train here."
	done

_WantHitmonleeText:: ; a1b4a (28:5b4a)
	text "You want the"
IF DEF(_YELLOW)
	line "hard-kicking"
ELSE
	line "hard kicking"
ENDC
	cont "HITMONLEE?"
	done

_WantHitmonchanText:: ; a1b70 (28:5b70)
	text "You want the"
IF DEF(_YELLOW)
	line "piston-punching"
ELSE
	line "piston punching"
ENDC
	cont "HITMONCHAN?"
	done

_OtherHitmonText:: ; a1b9a (28:5b9a)
	text "Better not get"
	line "greedy..."
	done

