_WardenGibberishText1:: ; 9e444 (27:6444)
	text "WARDEN: Hif fuff"
	line "hefifoo!"

	para "Ha lof ha feef ee"
	line "hafahi ho. Heff"
	cont "hee fwee!"
	done

_WardenGibberishText2:: ; 9e48b (27:648b)
	text "Ah howhee ho hoo!"
	line "Eef ee hafahi ho!"
	done

_WardenGibberishText3:: ; 9e4b0 (27:64b0)
	text "Ha? He ohay heh"
	line "ha hoo ee haheh!"
	done

_WardenTeethText1:: ; 9e4d2 (27:64d2)
	text $52, " gave the"
	line "GOLD TEETH to the"
	cont "WARDEN!@@"

_WardenTeethText2:: ; 9e4f9 (27:64f9)
	db $0
	para "The WARDEN popped"
	line "in his teeth!"
	prompt

_WardenThankYouText:: ; 9e51b (27:651b)
	text "WARDEN: Thanks,"
	line "kid! No one could"
	cont "understand a word"
	cont "that I said."

	para "I couldn't work"
	line "that way."
	cont "Let me give you"
	cont "something for"
	cont "your trouble."
	prompt

_ReceivedHM04Text:: ; 9e5a2 (27:65a2)
	text $52, " received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_HM04ExplanationText:: ; 9e5b6 (27:65b6)
	text "WARDEN: HM04"
	line "teaches STRENGTH!"

	para "It lets #MON"
	line "move boulders"
	cont "when you're out-"
	cont "side of battle."

	para "Oh yes, did you"
	line "find SECRET HOUSE"
	cont "in SAFARI ZONE?"

	para "If you do, you"
	line "win an HM!"

	para "I hear it's the"
	line "rare SURF HM."
	done

_HM04NoRoomText:: ; 9e67a (27:667a)
	text "Your pack is"
	line "stuffed full!"
	done

_FuchsiaHouse2Text_75176:: ; 9e696 (27:6696)
	text "#MON photos"
	line "and fossils."
	done

_FuchsiaHouse2Text_7517b:: ; 9e6b0 (27:66b0)
	text "Old #MON"
	line "merchandise."
	done

