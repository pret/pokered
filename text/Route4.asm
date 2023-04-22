_Route4Text1::
	text "Ouch! I tripped"
	line "over a rocky"
	cont "#MON, GEODUDE!"
	done

_Route4BattleText1::
	text "I came to get my"
	line "mushroom #MON!"
	done

_Route4EndBattleText1::
	text "Oh! My cute"
	line "mushroom #MON!"
	prompt

_Route4AfterBattleText1::
	text "There might not"
	line "be any more"
	cont "mushrooms here."

	para "I think I got"
	line "them all."
	done

_Route4Text5::
	text "MT.MOON"
	line "Tunnel Entrance"
	done

_Route4Text6::
	text "ROUTE 4"
	line "MT.MOON -"
	cont "CERULEAN CITY"
	done

_TM01PreReceiveText::
	text "A punch of"
	line "roaring ferocity!"
	
	para "Packed with"
	line "destructive"
	cont "power!"
	
	para "When the chips"
	line "are down, MEGA"
	cont "PUNCH is the"
	cont "ultimate attack!"
	
	para "You agree, yes?"
	prompt

_ReceivedTM01Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_TM01ExplanationText::
	text "Now, we are"
	line "comrades in the"
	cont "art of punching!"
	
	para "You should go"
	line "before you're"
	cont "seen by the"
	cont "misguided fool"
	cont "who trains only"
	cont "his silly kicking"
	cont "over there."
	done

_TM01Refused::
	text "You'll come back"
	line "when you"
	cont "understand the"
	cont "worth of MEGA"
	cont "PUNCH."
	done

_MegaNoRoomText::
	text "You have no"
	line "room for this!"
	done

_TM05PreReceiveText::
	text "A kick of brutal"
	line "ferocity!"
	
	para "Packed with"
	line "destructive"
	cont "power!"
	
	para "When you get"
	line "right down to"
	cont "it, MEGA KICK"
	cont "is the ultimate"
	cont "attack!"
	
	para "Don't you agree?"
	prompt

_ReceivedTM05Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_TM05ExplanationText::
	text "Now, we are soul"
	line "mates in the way"
	cont "of kicking!"
	
	para "You should run"
	line "before you're"
	cont "seen by the"
	cont "deluded nitwit"
	cont "who trains only"
	cont "simple punching"
	cont "over there."
	done

_TM05Refused::
	text "You'll come"
	line "crawling back"
	cont "when you"
	cont "realize the"
	cont "value of MEGA"
	cont "KICK."
	done
