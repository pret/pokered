_PokemonTower2FRivalWhatBringsYouHereText::
	text "<RIVAL>: Hey,"
	line "<PLAYER>! What"
	cont "brings you here?"
	cont "Your #MON"
	cont "don't look dead!"

	para "I can at least"
	line "make them faint!"
	cont "Let's go, pal!"
	done

_PokemonTower2FRivalDefeatedText::
	text "What?"
	line "You stinker!"

	para "I took it easy on"
	line "you too!"
	prompt

_PokemonTower2FRivalVictoryText::
	text "Well,"
	line "look at all your"
	cont "wimpy #MON!"

	para "Toughen them up a"
	line "bit more!"
	prompt

_PokemonTower2FRivalHowsYourDexText::
	text "How's your #DEX"
	line "coming, pal?"
	cont "I just caught a"
	cont "CUBONE!"

	para "I can't find the"
	line "grown-up MAROWAK"
	cont "yet!"

	para "I doubt there are"
	line "any left! Well, I"
	cont "better get going!"
	cont "I've got a lot to"
	cont "accomplish, pal!"

	para "Smell ya later!"
	done

_PokemonTower2FChannelerText::
	text "Even we could not"
	line "identify the"
	cont "wayward GHOSTs!"

	para "A @"
	text_ram wNameBuffer
	text_start
	line "might be able to"
	cont "unmask them."
	done

_PokemonTower2FChannelerText2::
	text "Thanks for"
	line "getting rid of"
	cont "<TEAM><ROCKET>"
	cont "in our tower!"
	done

_PokemonTower2FChannelerText3::
	text "Thanks for all"
	line "your help!"
	done

_PokemonTower2FChannelerTextBorrowSilphScope::
	text "Before you go,"
	line "maybe you could"
	cont "lend me that"
	cont "@"
	text_ram wNameBuffer
	text "?"
	para "It'd help us"
	line "with the wayward"
	cont "spirits!"
	para "I'll give it"
	line "back whenever"
	cont "you visit here!"
	para "How about it?"
	done

_PokemonTower2FChannelerTextBorrowSilphScopeYes::
	text "Perfect!"
	para "<PLAYER> handed"
	line "the channeler the"
	cont "@"
	text_ram wNameBuffer
	text "."
	done

_PokemonTower2FChannelerTextBack::
	text "Do you want your"
	line "@"
	text_ram wNameBuffer
	text " back?"
	done

_PlayerGotBackItem::
	text "<PARA><PLAYER> got back"
	line "the @"
	text_ram wNameBuffer
	text "!"
	done

_PokemonTower2FChannelerTextBorrowAgain::
	text "By the way<...>"
	para "May I borrow your"
	line "@"
	text_ram wNameBuffer
	text " again?"
	done

_GenericWaitText::
	text "Wait!"
	done

_OhHelloAgainText::
	text "Oh, hello again!"
	done
