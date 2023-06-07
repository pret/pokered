_VermilionCityText1::
	text "We're careful"
	line "about pollution!"

	para "We've heard GRIMER"
	line "multiplies in"
	cont "toxic sludge!"
	done

_VermilionCityTextDidYouSee::
	text "Did you see S.S."
	line "ANNE moored in"
	cont "the harbor?"
	done

_VermilionCityTextSSAnneDeparted::
	text "So, S.S.ANNE has"
	line "departed!"

	para "She'll be back"
	line "soon."		; changed since the ship actually comes back
	done

_SSAnneWelcomeText4::
	text "Welcome to S.S."
	line "ANNE!"
	done

_SSAnneWelcomeText9::
	text "Welcome to S.S."
	line "ANNE!"

	para "Excuse me, do you"
	line "have a ticket?"
	prompt

_SSAnneFlashedTicketText::
	text "<PLAYER> flashed"
	line "the S.S.TICKET!"

	para "Great! Welcome to"
	line "S.S.ANNE!"
	done

_SSAnneNoTicketText::
	text "<PLAYER> doesn't"
	line "have the needed"
	cont "S.S.TICKET."

	para "Sorry!"

	para "You need a ticket"
	line "to get aboard."
	done

_SSAnneNotHereText::
	text "The ship set sail."
	done

_VermilionCityText4::
	text "I'm putting up a"
	line "building on this"
	cont "plot of land."

	para "My #MON is"
	line "tamping the land."
	done

_VermilionCityText5::
	text "MACHOP: Guoh!"
	line "Gogogoh!@"
	text_end

_VermilionCityText14::
	text_start
	para "A MACHOP is"
	line "stomping the land"
	cont "flat."
	done

_VermilionCityText6::
	text "S.S.ANNE is a"
	line "famous luxury"
	cont "cruise ship."
	done

_VermilionCityText7::
	text "VERMILION CITY"
	line "The Port of"
	cont "Exquisite Sunsets"
	done

_VermilionCityText8::
	text "NOTICE!"

	para "ROUTE 12 may be"
	line "blocked off by a"
	cont "sleeping #MON."

	para "Detour through"
	line "ROCK TUNNEL to"
	cont "LAVENDER TOWN."

	para "VERMILION POLICE"
	done

_VermilionCityText11::
	text "#MON FAN CLUB"
	line "All #MON fans"
	cont "welcome!"
	done

_VermilionCityText12::
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning "
	line "American!"
	done

_VermilionCityText13::
	text "VERMILION HARBOR"
	done

_VermilionCityText15::
	text "The S.S.ANNE"
	line "has returned!"
	done

_RoingusText:: ; new NPC made as an inside joke, with a slight reference to Mew
	text "I wanna discover"
	line "a new species of"
	cont "#MON someday!"

	para "If I'm the first"
	line "to discover it, I"
	cont "could name it!"

	para "I'm gonna call"
	line "it... ROINGUS!"
	done

; Text for the new pass system.
_VermillionCityPassSelectionText::
	text "Which PASS do you"
	line "want to present?"
	prompt
	
_VermillionCityOldSeaMap::
	text "<PLAYER> flashed"
	line "the OLD SEA MAP!"

	para "My, my. I haven't"
	line "seen this in a"
	cont "long time."
	
	para "Come. I'll take"
	line "you there."
	done

_VermillionCityCitrinePass::
	text "<PLAYER> flashed"
	line "the CITRINE PASS!"

	para "Ah! You must be"
	line "pretty strong to"
	cont "have this PASS!"
	
	para "Come on, come"
	line "on!"
	done

_VermillionCityHarborRefuse::
	text "Alright! Have a"
	line "nice day!"
	done

_BeautyText1::
	text "Hey! Do you like"
	line "cats or dogs?"
	prompt

_BeautyText2::
	text "Ah! I knew it!"
	
	para "Sorry, it was a"
	line "silly question..."
	prompt ; needed for text to scroll correctly - it looks and acts fine in-game, don't worry.

_BeautyChoice:: ; this is separate for the in-progress event.
	text "If you catch 5"
	line "@"
	text_ram wcd6d ; efficiency - means we don't need two separate texts...
	text ", I'll"
	cont "give you a great"
	cont "#MON!"
	
	para "See you then!"
	done

_BeautyFinish::
	text "Oh! You've caught"
	line "5 "
	text_ram wcd6d
	text "!"
	prompt

_BeautyExplain::
	text "When "
	text_ram wcd6d
	line "evolves, it will"
	cont "look like this."
	
	para "Hm? Why did I"
	line "make you catch"
	cont "the opposite"
	cont "#MON?"
	
	para "Well, I wanted"
	line "to see if your"
	cont "preferences"
	cont "stayed the same."
	
	para "It seems I was"
	line "wrong!"
	done

