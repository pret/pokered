_LavenderHouse1Text_1d8d1:: ; 99e8d (26:5e8d)
	text "That's odd, MR.FUJI"
	line "isn't here."
	cont "Where'd he go?"
	done

_LavenderHouse1Text_1d8d6:: ; 99eba (26:5eba)
	text "MR.FUJI had been"
	line "praying alone for"
	cont "CUBONE's mother."
	done

_LavenderHouse1Text_1d8f4:: ; 99eee (26:5eee)
	text "This is really"
	line "MR.FUJI's house."

	para "He's really kind!"

	para "He looks after"
	line "abandoned and"
	cont "orphaned #MON!"
	done

_LavenderHouse1Text_1d8f9:: ; 99f4b (26:5f4b)
	text "It's so warm!"
	line "#MON are so"
	cont "nice to hug!"
	done

_LavenderHouse1Text3:: ; 99f72 (26:5f72)
	text "PSYDUCK: Gwappa!@@"

_LavenderHouse1Text4:: ; 99f85 (26:5f85)
	text "NIDORINO: Gaoo!@@"

_LavenderHouse1Text_1d94c:: ; 99f97 (26:5f97)
	text "MR.FUJI: ", $52, "."

	para "Your #DEX quest"
	line "may fail without"
	cont "love for your"
	cont "#MON."

	para "I think this may"
	line "help your quest."
	prompt

_ReceivedFluteText:: ; 99ffb (26:5ffb)
	text $52, " received"
	line "a @"
	TX_RAM wcf4b
	text "!@@"

_FluteExplanationText:: ; 9a011 (26:6011)
	db $0
	para "Upon hearing #"
	line "FLUTE, sleeping"
	cont "#MON will"
	cont "spring awake."

	para "It works on all"
	line "sleeping #MON."
	done

_FluteNoRoomText:: ; 9a069 (26:6069)
	text "You must make"
	line "room for this!"
	done

_MrFujiAfterFluteText:: ; 9a087 (26:6087)
	text "MR.FUJI: Has my"
	line "FLUTE helped you?"
	done

_LavenderHouse1Text6:: ; 9a0aa (26:60aa)
	text "#MON Monthly"
	line "Grand Prize"
	cont "Drawing!"

	para "The application"
	line "form is..."

	para "Gone! It's been"
	line "clipped out!"
	done

