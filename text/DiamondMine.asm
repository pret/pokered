_DiamondMineProspectorText::
	text "Hey kid!"
	para "There's gold in"
	line "these hills!"
	para "Or even better,"
	line "diamonds!"
	para "Want to help"
	line "find some?"
	done

_DiamondMineProspectorHelp::
	text "I like the cut"
	line "of your jib!"
	para "The ZUBAT around"
	line "here are getting"
	cont "a bit ridiculous!"
	para "I have to wear"
	line "earplugs to drown"
	cont "out their ear-"
	cont "piercing cries!"
	para "I want to spend"
	line "my time digging,"
	para "not swatting at"
	line "ZUBATs!"
	para "I need exactly"
	line "10 REPELs!"
	done

_DiamondProspectorRepels::
	text "Did you pick up"
	line "10 REPELs yet?"
	done

_DiamondProspectorGiveRepels::
	text "Give 10 REPELs?"
	done

_DiamondProspectorUseRepels::
	text "Great, let's spray"
	line "REPEL everywhere!"
	prompt

_DiamondMineProspectorHelp2::
	text "The ZUBAT have"
	line "gone away!"
	para "Perfect!"
	para "On to the"
	line "next thing."
	para "My boombox ran"
	line "out of batteries!"
	para "How about you"
	line "give it a zap"
	cont "with an ELECTRIC"
	cont "#MON to start"
	cont "it up again?"
	para "Or a #MON with"
	line "THUNDER WAVE."
	para "I need my fave"
	line "digging music!"
	done

_DiamondMineProspectorHelp3::
	text "That's my jam!"
	line "Oh yeah!"
	para "Now we're cooking!"
	para "Let's do this!"
	prompt

_DiamondMineProspectorRagh::
	text "RAAAAAAAGH!!!"
	done

_DiamondMineProspectorHelp4::
	text "We're hitting"
	line "bedrock!"
	para "I need a #MON"
	line "that can smash"
	cont "hard stone!"
	para "Do you have an"
	line "ONIX?"
	done

_DiamondMineBoomboxInitial::
	text "It's a portable"
	line "boombox!"
	para "It doesn't seem"
	line "to turn on."
	done

_DiamondMineBoomboxZap::
	text "Zap it with"
	line "electricity?"
	done

_DiamondMineBoomboxZapProc::
	text_ram wNameBuffer
	text " zapped"
	line "the boombox!"
	done

_DiamondMineBoomboxZapProc2::
	text_ram wNameBuffer
	text " zapped"
	line "the boombox with"
	cont "THUNDER WAVE!"
	done

_DiamondMineBoomboxFunctional::
	text "The boombox is"
	line "playing a rather"
	cont "bombastic tune."
	done

_DiamondMinePickedOnix::
	text "Okay @"
	text_ram wNameBuffer
	text ","
	line "now the real hard"
	cont "work begins!"
	prompt

_DiamondMineDownHere::
	text "Hey, kid!"
	line "Climb down!"
	para "You won't believe"
	line "your eyes!"
	done

_DiamondMineWeeksOfWork::
	text "<PLAYER>, the"
	line "prospector, and"
	cont "@"
	text_ram wNameBuffer
	text " spent"
	cont "weeks digging"
	cont "through the hard"
	cont "bedrock."
	para "Soon only"
	line "@"
	text_ram wNameBuffer
	text " could"
	cont "make progress."
	para "Until<...>"
	prompt

_DiamondMineFinished::
	text "Diamonds!!"
	line "Everywhere!!"
	para "It's all thanks"
	line "to @"
	text_ram wNameBuffer
	text "!"
	para "Looks like"
	line "its rocky body"
	cont "got harder from"
	cont "all that digging!"
	para "It's as hard as"
	line "diamond now!"
	done

_DiamondMineFinished2::
	text_start
	para "@"
	text_ram wNameBuffer
	text " has"
	line "been powered up!"
	done

_DiamondMineFinished3::
	text_start
	para "Its base HP"
	line "increased! 55→80"
	para "Its base ATTACK"
	line "increased! 25→85"
	para "It'll also take"
	line "less damage from"
	cont "WATER, ICE, and"
	cont "GRASS attacks!"
	done

_DiamondMineEndText::
	text "Whoo boy, kid!"
	para "These diamonds"
	line "will take a while"
	cont "to cart out!"
	para "I was down on my"
	line "luck and you"
	cont "helped me out!"
	para "Come say hi at"
	line "my house in"
	cont "CELADON CITY"
	cont "sometime!"
	done

_DiamondMineMoreOnix::
	text "Or did you want"
	line "me to train with"
	cont "another ONIX?"
	done

_DiamondMineMoreOnix2::
	text "I'd love to!"
	line "Here we go!"
	prompt

_DiamondMineOnixTrainDone::
	text "That was some"
	line "intense digging!"
	done