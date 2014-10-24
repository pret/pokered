_CeladonMartRoofText_484ee:: ; 9cbb5 (27:4bb5)
	text "Give her which"
	line "drink?"
	done

_CeladonMartRoofText_484f3:: ; 9cbcc (27:4bcc)
	text "Yay!"

	para "FRESH WATER!"

	para "Thank you!"

	para "You can have this"
	line "from me!@@"

_CeladonMartRoofText_484f9:: ; 9cc06 (27:4c06)
	text $52, " received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_CeladonMartRoofText_484fe:: ; 9cc1a (27:4c1a)
	db $0
	para "@"
	TX_RAM wcf4b
	text " contains"
	line "ICE BEAM!"

	para "It can freeze the"
	line "target sometimes!@@"

_CeladonMartRoofText_48504:: ; 9cc5a (27:4c5a)
	text "Yay!"

	para "SODA POP!"

	para "Thank you!"

	para "You can have this"
	line "from me!@@"

_CeladonMartRoofText_4850a:: ; 9cc91 (27:4c91)
	text $52, " received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_CeladonMartRoofText_4850f:: ; 9cca5 (27:4ca5)
	db $0
	para "@"
	TX_RAM wcf4b
	text " contains"
IF DEF(_YELLOW)
	line "ROCK SLIDE!@@"
ELSE
	line "ROCK SLIDE!"

	para "It can spook the"
	line "target sometimes!@@"
ENDC

_CeladonMartRoofText_48515:: ; 9cce6 (27:4ce6)
	text "Yay!"

	para "LEMONADE!"

	para "Thank you!"

	para "You can have this"
	line "from me!@@"

_ReceivedTM49Text:: ; 9cd1d (27:4d1d)
	text $52, " received"
	line "TM49!@@"

_CeladonMartRoofText_48520:: ; 9cd30 (27:4d30)
	db $0
	para "TM49 contains"
	line "TRI ATTACK!@@"

_CeladonMartRoofText_48526:: ; 9cd4d (27:4d4d)
	text "You don't have"
	line "space for this!@@"

_CeladonMartRoofText_4852c:: ; 9cd6d (27:4d6d)
	text "No thank you!"
	line "I'm not thirsty"
	cont "after all!@@"

_CeladonMartRoofText1:: ; 9cd97 (27:4d97)
	text "My sister is a"
	line "trainer, believe"
	cont "it or not."

	para "But, she's so"
	line "immature, she"
	cont "drives me nuts!"
	done

_CeladonMartRoofText_48598:: ; 9cdee (27:4dee)
	text "I'm thirsty!"
	line "I want something"
	cont "to drink!"
	done

_CeladonMartRoofText4:: ; 9ce16 (27:4e16)
	text "I'm thirsty!"
	line "I want something"
	cont "to drink!"

	para "Give her a drink?"
	done

_CeladonMartRoofText6:: ; 9ce50 (27:4e50)
	text "ROOFTOP SQUARE:"
	line "VENDING MACHINES"
	done

_VendingMachineText1:: ; 9ce72 (27:4e72)
	text "A vending machine!"
	line "Here's the menu!"
	prompt

_VendingMachineText4:: ; 9ce96 (27:4e96)
	text "Oops, not enough"
	line "money!"
	done

_VendingMachineText5:: ; 9ceaf (27:4eaf)
	TX_RAM wcf4b
	db $0
	line "popped out!"
	done

_VendingMachineText6:: ; 9cec0 (27:4ec0)
	text "There's no more"
	line "room for stuff!"
	done

_VendingMachineText7:: ; 9cee0 (27:4ee0)
	text "Not thirsty!"
	done

