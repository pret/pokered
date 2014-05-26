_SecretHouseText_4a350:: ; 858a4 (21:58a4)
	text "Ah! Finally!"

	para "You're the first"
	line "person to reach"
	cont "the SECRET HOUSE!"

	para "I was getting"
	line "worried that no"
	cont "one would win our"
	cont "campaign prize."

	para "Congratulations!"
	line "You have won!"
	prompt

_ReceivedHM03Text:: ; 85943 (21:5943)
	text $52, " received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_HM03ExplanationText:: ; 85957 (21:5957)
	text "HM03 is SURF!"

	para "#MON will be"
	line "able to ferry you"
	cont "across water!"

	para "And, this HM isn't"
	line "disposable! You"
	cont "can use it over"
	cont "and over!"

	para "You're super lucky"
	line "for winning this"
	cont "fabulous prize!"
	done

_HM03NoRoomText:: ; 85a02 (21:5a02)
	text "You don't have"
	line "room for this"
	cont "fabulous prize!"
	done

