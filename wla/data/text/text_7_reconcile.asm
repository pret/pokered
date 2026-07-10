; Explicit WLA-DX expansion of RGBDS text macros from data/text/text_7.asm.
_ItemUseText001::
	.DB TX_START, "<PLAYER> used@"
	.DB TX_END

_ItemUseText002::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"
	.DB "<DONE>"

_GotOnBicycleText1::
	.DB TX_START, "<PLAYER> got on the@"
	.DB TX_END

_GotOnBicycleText2::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_GotOffBicycleText1::
	.DB TX_START, "<PLAYER> got off@"
	.DB TX_END

_GotOffBicycleText2::
	.DB TX_START, "the @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "."
	.DB "<PROMPT>"

_ThrewAwayItemText::
	.DB TX_START, "Threw away"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "."
	.DB "<PROMPT>"

_IsItOKToTossItemText::
	.DB TX_START, "Is it OK to toss"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "?"
	.DB "<PROMPT>"

_TooImportantToTossText::
	.DB TX_START, "That's too impor-"
	.DB "<LINE>", "tant to toss!"
	.DB "<PROMPT>"

_AlreadyKnowsText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " knows"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_ConnectCableText::
	.DB TX_START, "Okay, connect the"
	.DB "<LINE>", "cable like so!"
	.DB "<PROMPT>"

_TradedForText::
	.DB TX_START, "<PLAYER> traded"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, " for"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START, "!@"
	.DB TX_END

_WannaTrade1Text::
	.DB TX_START, "I'm looking for"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, "! Wanna"

	.DB "<PARA>", "trade one for"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START, "? "
	.DB "<DONE>"

_NoTrade1Text::
	.DB TX_START, "Awww!"
	.DB "<LINE>", "Oh well..."
	.DB "<DONE>"

_WrongMon1Text::
	.DB TX_START, "What? That's not"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, "!"

	.DB "<PARA>", "If you get one,"
	.DB "<LINE>", "come back here!"
	.DB "<DONE>"

_Thanks1Text::
	.DB TX_START, "Hey thanks!"
	.DB "<DONE>"

_AfterTrade1Text::
	.DB TX_START, "Isn't my old"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START, " great?"
	.DB "<DONE>"

_WannaTrade2Text::
	.DB TX_START, "Hello there! Do"
	.DB "<LINE>", "you want to trade"

	.DB "<PARA>", "your @"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.DB "<LINE>", "for @"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START, "?"
	.DB "<DONE>"

_NoTrade2Text::
	.DB TX_START, "Well, if you"
	.DB "<LINE>", "don't want to..."
	.DB "<DONE>"

_WrongMon2Text::
	.DB TX_START, "Hmmm? This isn't"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, "."

	.DB "<PARA>", "Think of me when"
	.DB "<LINE>", "you get one."
	.DB "<DONE>"

_Thanks2Text::
	.DB TX_START, "Thanks!"
	.DB "<DONE>"

_AfterTrade2Text::
	.DB TX_START, "The @"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, " you"
	.DB "<LINE>", "traded to me"

	.DB "<PARA>", "went and evolved!"
	.DB "<DONE>"

_WannaTrade3Text::
	.DB TX_START, "Hi! Do you have"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, "?"

	.DB "<PARA>", "Want to trade it"
	.DB "<LINE>", "for @"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START, "?"
	.DB "<DONE>"

_NoTrade3Text::
	.DB TX_START, "That's too bad."
	.DB "<DONE>"

_WrongMon3Text::
	.DB TX_START, "...This is no"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, "."

	.DB "<PARA>", "If you get one,"
	.DB "<LINE>", "trade it with me!"
	.DB "<DONE>"

_Thanks3Text::
	.DB TX_START, "Thanks pal!"
	.DB "<DONE>"

_AfterTrade3Text::
	.DB TX_START, "How is my old"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START, "?"

	.DB "<PARA>", "My @"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START, " is"
	.DB "<LINE>", "doing great!"
	.DB "<DONE>"

_NothingToCutText::
	.DB TX_START, "There isn't"
	.DB "<LINE>", "anything to CUT!"
	.DB "<PROMPT>"

_UsedCutText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " hacked"
	.DB "<LINE>", "away with CUT!"
	.DB "<PROMPT>"
