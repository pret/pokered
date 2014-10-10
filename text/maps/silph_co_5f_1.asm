_SilphCo5Text_1a010:: ; 82936 (20:6936)
	text "TEAM ROCKET is"
	line "in an uproar over"
	cont "some intruder."
	cont "That's you right?"
	done

_SilphCo5Text_1a015:: ; 82978 (20:6978)
	text "TEAM ROCKET took"
	line "off! You're our"
	cont "hero! Thank you!"
	done

_SilphCo5BattleText2:: ; 829aa (20:69aa)
	text "I heard a kid was"
	line "wandering around."
	done

_SilphCo5EndBattleText2:: ; 829cf (20:69cf)
	text "Boom!"
	prompt

_SilphCo5AfterBattleText2:: ; 829d6 (20:69d6)
	text "It's not smart"
	line "to pick a fight"
	cont "with TEAM ROCKET!"
	done

_SilphCo5BattleText3:: ; 82a07 (20:6a07)
	text "We study #"
	line "BALL technology"
	cont "on this floor!"
	done

_SilphCo5EndBattleText3:: ; 82a32 (20:6a32)
	text "Dang!"
	line "Blast it!"
	prompt

_SilphCo5AfterBattleText3:: ; 82a43 (20:6a43)
	text "We worked on the"
	line "ultimate #"
	cont "BALL which would"
	cont "catch anything!"
	done

_SilphCo5BattleText4:: ; 82a81 (20:6a81)
	text "Whaaat? There"
	line "shouldn't be any"
IF DEF(_YELLOW)
	cont "children here!"
ELSE
	cont "children here?"
ENDC
	done

