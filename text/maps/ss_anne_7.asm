_SSAnne7RubText:: ; 812dd (20:52dd)
	text "CAPTAIN: Ooargh..."
	line "I feel hideous..."
	cont "Urrp! Seasick..."

	para $52, " rubbed"
	line "the CAPTAIN's"
	cont "back!"

	para "Rub-rub..."
	line "Rub-rub...@@"

_ReceivingHM01Text:: ; 81347 (20:5347)
	text "CAPTAIN: Whew!"
	line "Thank you! I"
	cont "feel much better!"

	para "You want to see"
	line "my CUT technique?"

	para "I could show you"
	line "if I wasn't ill..."

	para "I know! You can"
	line "have this!"

	para "Teach it to your"
	line "#MON and you"
	cont "can see it CUT"
	cont "any time!"
	prompt

_ReceivedHM01Text:: ; 8140d (20:540d)
	text $52, " got"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_SSAnne7Text_61932:: ; 8141c (20:541c)
	text "CAPTAIN: Whew!"

	para "Now that I'm not"
	line "sick any more, I"
	cont "guess it's time."
	done

_HM01NoRoomText:: ; 8145d (20:545d)
	text "Oh no! You have"
	line "no room for this!"
	done

_SSAnne7Text2:: ; 81480 (20:5480)
	text "Yuck! Shouldn't"
	line "have looked!"
	done

_SSAnne7Text3:: ; 8149d (20:549d)
	text "How to Conquer"
	line "Seasickness..."
	cont "The CAPTAIN's"
	cont "reading this!"
	done

