_ItemUseText001::
	text "<PLAYER> used@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text "!"
	done

_GotOnBicycleText1::
	text "<PLAYER> got on the@"
	text_end

_GotOnBicycleText2::
	text_ram wStringBuffer
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> got off@"
	text_end

_GotOffBicycleText2::
	text "the @"
	text_ram wStringBuffer
	text "."
	prompt

_ThrewAwayItemText::
	text "Threw away"
	line "@"
	text_ram wcd6d
	text "."
	prompt

_IsItOKToTossItemText::
	text "Is it OK to toss"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_TooImportantToTossText::
	text "That's too impor-"
	line "tant to toss!"
	prompt

_AlreadyKnowsText::
	text_ram wcd6d
	text " knows"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

_ConnectCableText::
	text "Okay, connect the"
	line "cable like so!"
	prompt

_TradedForText::
	text "<PLAYER> traded"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " for"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WannaTrade1Text::
	text "I'm looking for"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "! Wanna"

	para "trade one for"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "? "
	done

_NoTrade1Text::
	text "Awww!"
	line "Oh well..."
	done

_WrongMon1Text::
	text "What? That's not"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "If you get one,"
	line "come back here!"
	done

_Thanks1Text::
	text "Hey, thanks!"
	done

_AfterTrade1Text::
	text "Isn't my old"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text " great?"
	done

_WannaTrade2Text::
	text "Hello there! Do"
	line "you want to trade"

	para "your @"
	text_ram wInGameTradeGiveMonName
	text_start
	line "for @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade2Text::
	text "Well, if you"
	line "don't want to..."
	done

_WrongMon2Text::
	text "Hmmm? This isn't"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Think of me when"
	line "you get one."
	done

_Thanks2Text::
	text "Thanks!"
	done

_AfterTrade2Text::
	text "The @"
	text_ram wInGameTradeGiveMonName
	text " you"
	line "traded to me"

	para "went and evolved!"
	done

_WannaTrade3Text::
	text "Hi! Do you have"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Want to trade it"
	line "for @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade3Text::
	text "That's too bad."
	done

_WrongMon3Text::
	text "...This is no"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "If you get one,"
	line "trade it with me!"
	done

_Thanks3Text::
	text "Thanks pal!"
	done

_AfterTrade3Text::
	text "How is my old"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "My @"
	text_ram wInGameTradeGiveMonName
	text " is"
	line "doing great!"
	done

_WannaTrade6Text::
	text "No way! The"
	line "Combat Breed is"
	cont "way better!"

	text "You agree, right?"
	line "Trade me your"
	cont "TAUROS!"
	done

_WrongMon6Text::
	text "What? That's not"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Come on, back"
	line "me up here!"
	done

_Thanks6Text::
	text "I knew you would"
	line "agree!"
	done

_AfterTrade6Text::
	text "Isn't the Combat"
	line "Breed amazing?"
	
	para "HI JUMP KICK is"
	line "so worth it!"
	done

_WannaTrade7Text::
	text "It's obvious."
	line "The Aqua Breed"
	cont "is superior."

	text "Surely you agree."
	line "Trade me your"
	cont "TAUROS!"
	done

_WrongMon7Text::
	text "Huh? That's not"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Time is of the"
	line "essence! Bring"
	cont "me one!"
	done

_AfterTrade7Text::
	text "Isn't the Aqua"
	line "Breed perfect?"
	
	para "TAUROS clearly"
	line "works best with"
	cont "HYDRO PUMP."
	done

_WannaTrade8Text::
	text "I can't believe"
	line "we're arguing"
	cont "this! The Blaze"
	cont "Breed is king!"

	text "Hey, you! Trade"
	line "me your TAUROS!"
	done

_WrongMon8Text::
	text "What? That's not"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "You pulling my"
	line "leg?"
	done

_AfterTrade8Text::
	text "Hey! What do"
	line "you think?"
	
	para "FIRE SPIN helps"
	line "TAUROS a lot,"
	cont "huh?"
	done

_NothingToCutText::
	text "There isn't"
	line "anything to CUT!"
	prompt

_UsedCutText::
	text_ram wcd6d
	text " hacked"
	line "away with CUT!"
	prompt

_WannaTrade4Text::
	text "I'm the TRADER!"
	line "I love to help"
	para "trainers evolve"
	line "their #MON!"
	para "Wanna trade?"
	done
	
_NoTrade4Text::
	text "Ok, maybe next"
	line "time then."
	done
	
_Thanks4Text::
	text "There we go!"
	para "Hope I helped!"
	done

_WannaTrade5Text::
	text "In my region, we"
	line "have our own"
	cont "@"
	text_ram wInGameTradeGiveMonName
	text "!"
	
	para "Want to trade me"
	line "yours?"
	done
	
_NoTrade5Text::
	text "Ok, maybe next"
	line "time then."
	done