_MtMoonB2FDomeFossilYouWantText::
	text "You want the"
	line "DOME FOSSIL?"
	done

_MtMoonB2FHelixFossilYouWantText::
	text "You want the"
	line "HELIX FOSSIL?" ; TODO: name buffer
	done

_MtMoonB2FReceivedFossilText::
	text "<PLAYER> got the"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MtMoonB2FYouHaveNoRoomText::
	text "Look, you've got"
	line "no room for this.@"
	text_end

_MtMoonB2FSuperNerdTheyreBothMineText::
	text "Hey, stop!"

	para "I found these"
	line "fossils! They're"
	cont "both mine!"
	done

_MtMoonB2FSuperNerdOkIllShareText::
	text "OK!"
	line "I'll share!"
	prompt

_MtMoonB2fSuperNerdEachTakeOneText::
	text "We'll each take"
	line "one!"
	cont "No being greedy!"
	done

_MtMoonB2FSuperNerdTheresAPokemonLabText::
	text "Far away, on"
	line "CINNABAR ISLAND,"
	cont "there's a #MON"
	cont "LAB."

	para "They do research"
	line "on regenerating"
	cont "fossils."
	prompt

_MtMoon3TextSuperNerdGiveFossil::
	text "I plan on taking"
	line "my fossil there!"

	para "Tell you what:"

	para "If you give me"
	line "your fossil too,"
	cont "I can bring it"
	cont "to the lab and"
	cont "see if it can be"
	cont "regenerated!"

	para "How about it?@"
	text_end

_MtMoon3TextSuperNerdNoFossil::
	text "Looks like you"
	line "don't have your"
	cont "fossil in your"
	cont "bag. Go get it!"
	done	

_MtMoon3TextSuperNerdGaveHelix::
	text "<PLAYER> gave the"
	line "HELIX FOSSIL to"
	cont "the SUPER NERD!"
	done

_MtMoon3TextSuperNerdGaveDome::
	text "<PLAYER> gave the"
	line "DOME FOSSIL to"
	cont "the SUPER NERD!"
	done

_MtMoon3TextSuperNerdGaveFossil::
	text "Great! I'll try"
	line "reviving both"
	cont "fossils."
	prompt

_MtMoon3TextSuperNerdKeptFossil::
	text "No worries!"
	para "It's your fossil"
	line "after all."
	done

_MtMoon3TextSuperNerdGaveFossilEnd::
	text "Meet me in"
	line "SAFFRON CITY."
	
	para "I'll tell you"
	line "the results!"
	done

_MtMoon3TextSuperNerdLookingForMoreFossils::
	text "Hey! I'm looking"
	line "for more fossils."

	para "Haven't found any"
	line "yet! Oh well."

	para "I live for the"
	line "hunt!"
	done

_MtMoonB2FSuperNerdThenThisIsMineText::
	text "All right. Then"
	line "this is mine!@"
	text_end

_MtMoonB2FRocket1BattleText::
	text "<TEAM><ROCKET> will"
	line "find the fossils,"
	cont "revive and sell"
	cont "them for cash!"
	done

_MtMoonB2FRocket1EndBattleText::
	text "Urgh!"
	line "Now I'm mad!"
	prompt

_MtMoonB2FRocket1AfterBattleText::
	text "You made me mad!"
	line "<TEAM><ROCKET> will"
	cont "blacklist you!"
	done

_MtMoonB2FRocket2BattleText::
	text "We, <TEAM><ROCKET>,"
	line "are #MON"
	cont "gangsters!"
	done

_MtMoonB2FRocket2EndBattleText::
	text "I blew"
	line "it!"
	prompt

_MtMoonB2FRocket2AfterBattleText::
	text "Darn it all! My"
	line "associates won't"
	cont "stand for this!"
	done

_MtMoonB2FRocket3BattleText::
	text "We're pulling a"
	line "big job here!"
	cont "Get lost, kid!"
	done

_MtMoonB2FRocket3EndBattleText::
	text "So, you"
	line "are good."
	prompt

_MtMoonB2FRocket3AfterBattleText::
	text "If you find a"
	line "fossil, give it"
	cont "to me and scram!"
	done

_MtMoonB2FRocket4BattleText::
	text "Little kids"
	line "should leave"
	cont "grown-ups alone!"
	done

_MtMoonB2FRocket4EndBattleText::
	text "I'm"
	line "steamed!"
	prompt

_MtMoonB2FRocket4AfterBattleText::
	text "#MON lived"
	line "here long before"
	cont "people came."
	done
