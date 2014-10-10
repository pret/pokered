_TM39PreReceiveText:: ; 8c86b (23:486b)
	text "My #MON's"
	line "ashes are stored"
	cont "in #MON TOWER."

	para "You can have this"
	line "TM. I don't need"
IF DEF(_YELLOW)
	cont "it anymore..."
ELSE
	cont "it any more..."
ENDC
	prompt

_ReceivedTM39Text:: ; 8c8c6 (23:48c6)
	text $52, " received"
	line "TM39!@@"

_TM39ExplanationText:: ; 8c8d9 (23:48d9)
	text "TM39 is a move"
	line "called SWIFT."

	para "It's very accurate,"
	line "so use it during"
	cont "battles you can't"
	cont "afford to lose."
	done

_TM39NoRoomText:: ; 8c93c (23:493c)
	text "You don't have"
	line "room for this."
	done

_Route12GateUpstairsText_495b8:: ; 8c95a (23:495a)
	text "Looked into the"
	line "binoculars."

	para "A man fishing!"
	done

_Route12GateUpstairsText_495c4:: ; 8c986 (23:4986)
	text "Looked into the"
	line "binoculars."

	para "It's #MON TOWER!"
	done

