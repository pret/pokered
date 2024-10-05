_MomDadNotHereText::
	text "You're back,"
	line "<PLAYER>!"
	para "Where's DAD?"
	para "You just missed"
	line "him!"
	para "He had something"
	line "urgent at work."
	para "Don't worry,"
	line "you'll see him"
	cont "sometime soon."
	done

_MomFoodReadyText::
	text "There you are!"
	para "Your food is"
	line "ready!"
	prompt

_MomFoodBonAppetit::
	text "Bon appetit!"
	prompt

_MomFoodRiceBallsText::
	text "Every rice"
	line "ball from MOM"
	cont "was like a"
	cont "surprise."
	para "They all had"
	line "something"
	cont "different and"
	cont "tasty inside."
	prompt

_MomFoodJellyDonutsText::
	text "Nothing beats"
	line "the sweetness of"
	cont "MOM's scrumptious"
	cont "jelly-filled"
	cont "donuts."
	prompt

_MomFoodBrisketText::
	text "The brisket"
	line "prepared from"
	cont "DAD's recipe"
	cont "was totally"
	cont "delicious!"
	prompt

_DadFoodBrisketText::
	text "DAD brought out"
	line "his slow-cooked"
	cont "BBQ brisket."
	para "It was totally"
	line "delicious!"
	prompt

_MomFoodBrisketText2::
	text "The savory"
	line "sauce was"
	cont "perfect."
	prompt

_MomFoodLasagnaText::
	text "Mom's cheesy"
	line "lasagna couldn't"
	cont "be beat."
	para "<PLAYER> ate"
	line "every last morsel"
	cont "of the meal."
	prompt

_DadChowedDownText::
	text "DAD wolfed his"
	line "down with gusto."
	prompt

_MomFoodPokemonJoinsText::
	text "@"
	text_ram wNameBuffer
	text " "
	line "had some as well!"
	prompt

_MomFoodPokemonChowedDownText::
	text "It chowed down"
	line "like crazy."
	prompt

_MomFoodPokemonShowText::
	text "MOM looked"
	line "really happy!"
	done

_MomFoodDone::
	text "You'd better"
	line "get going!"
	para "Have fun!"
	done

_DaisyTeaEvent::
	text "Oh, hi there"
	line "<PLAYER>!"
	para "Are you here"
	line "for some tea?"
	prompt

_DaisyTeaEventNo::
	text "Okay, come back"
	line "later!"
	done

_DaisyTeaPeppermint::
	text "Today's tea is"
	line "peppermint."
	para "Its lovely aroma"
	line "helps you wake up"
	cont "in the morning."
	para "It helps digestion"
	line "after a meal as"
	cont "well."
	prompt

_DaisyTeaBarley::
	text "Today I've made"
	line "barley tea."
	para "It's served cold"
	line "and tastes great"
	cont "on a hot summer"
	cont "day."
	prompt

_DaisyTeaChai::
	text "Today I've made"
	line "spiced chai tea."
	para "It's a black tea"
	line "brewed with milk."
	para "Some spices are"
	line "added, including"
	cont "ginger, green"
	cont "cardamom, nutmeg,"
	cont "cinnamon, and"
	cont "brown sugar."
	para "It really has a"
	line "diverse powerful"
	cont "taste."
	para "It's common as"
	line "an alternative to"
	cont "coffee."
	prompt

_DaisyTeaSitDown::
	text "Okay! But first,"
	line "have a seat!"
	done

_TeaDrink::
	text "<PLAYER> tried"
	line "DAISY's tea."
	done

_TeaReaction::
	text "It had a nice"
	line "calming effect."
	para "It's so very"
	line "revitalizing!"
	para "@"
	text_ram wNameBuffer
	text " "
	line "is looking at"
	cont "DAISY."
	para "It really seems"
	line "to like her."
	para "It's totally"
	line "relaxed!"
	done

_DaisyTeaEnd::
	text "I'll be right here"
	line "whenever you feel"
	cont "like some tea."
	para "Thanks for"
	line "coming, bye!"
	done