_CopycatsHouse2FText_5ccd4:: ; a15ad (28:55ad)
	text $52, ": Hi! Do"
	line "you like #MON?"

	para $52, ": Uh no, I"
	line "just asked you."

	para $52, ": Huh?"
	line "You're strange!"

	para "COPYCAT: Hmm?"
	line "Quit mimicking?"

	para "But, that's my"
	line "favorite hobby!"
	prompt

_TM31PreReceiveText:: ; a1636 (28:5636)
	text "Oh wow!"
	line "A # DOLL!"

	para "For me?"
	line "Thank you!"

	para "You can have"
	line "this, then!"
	prompt

_ReceivedTM31Text:: ; a1675 (28:5675)
	text $52, " received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_TM31ExplanationText1:: ; a1689 (28:5689)
	db $0
	para "TM31 contains my"
	line "favorite, MIMIC!"

	para "Use it on a good"
	line "#MON!@@"

_TM31ExplanationText2:: ; a16c5 (28:56c5)
	text $52, ": Hi!"
	line "Thanks for TM31!"

	para $52, ": Pardon?"

	para $52, ": Is it"
	line "that fun to mimic"
	cont "my every move?"

	para "COPYCAT: You bet!"
	line "It's a scream!"
	done

_TM31NoRoomText:: ; a1733 (28:5733)
	text "Don't you want"
	line "this?@@"

_CopycatsHouse2FText2:: ; a1749 (28:5749)
	text "DODUO: Giiih!"

	para "MIRROR MIRROR ON"
	line "THE WALL, WHO IS"
	cont "THE FAIREST ONE"
	cont "OF ALL?"
	done

_CopycatsHouse2FText3:: ; a1792 (28:5792)
	text "This is a rare"
	line "#MON! Huh?"
	cont "It's only a doll!"
	done

_CopycatsHouse2FText6:: ; a17be (28:57be)
	text "A game with MARIO"
	line "wearing a bucket"
	cont "on his head!"
	done

_CopycatsHouse2FText_5cd17:: ; a17ef (28:57ef)
	text "..."

	para "My Secrets!"

	para "Skill: Mimicry!"
	line "Hobby: Collecting"
	cont "dolls!"
	cont "Favorite #MON:"
	cont "CLEFAIRY!"
	done

_CopycatsHouse2FText_5cd1c:: ; a1842 (28:5842)
	text "Huh? Can't see!"
	done

