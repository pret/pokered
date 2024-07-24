_NameRatersHouseNameRaterWantMeToRateText::
	text "Hello, hello!"
	line "I am the official"
	cont "NAME RATER!"

	para "Want me to rate"
	line "the nicknames of"
	cont "your #MON?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "Which #MON"
	line "should I look at?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text_ram wNameBuffer
	text ", is it?"
	line "That is a decent"
	cont "nickname!"

	para "But, would you"
	line "like me to give"
	cont "it a nicer name?"

	para "How about it?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "Fine! What should"
	line "we name it?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! This #MON"
	line "has been renamed"
	cont "@"
	text_ram wBuffer
	text "!"

	para "That's a better"
	line "name than before!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Fine! Come any"
	line "time you like!"
	done

_NameRatersHouseNameRaterATrulyImpeccableNameText::
	text_ram wNameBuffer
	text ", is it?"
	line "That is a truly"
	cont "impeccable name!"

	para "Take good care of"
	line "@"
	text_ram wNameBuffer
	text "!"
	done
