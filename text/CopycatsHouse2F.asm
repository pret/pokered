_CopycatsHouse2FCopycatDoYouLikePokemonText::
	text "<PLAYER>: Hi! Do"
	line "you like #MON?"

	para "<PLAYER>: Uh no, I"
	line "just asked you."

	para "<PLAYER>: Huh?"
	line "You're strange!"

	para "COPYCAT: Hmm?"
	line "Quit mimicking?"

	para "But, that's my"
	line "favorite hobby!"
	prompt

_CopycatsHouse2FCopycatTM31PreReceiveText::
	text "Oh wow!"
	line "A # DOLL!"

	para "For me?"
	line "Thank you!"

	para "You can have"
	line "this, then!"
	prompt

_CopycatsHouse2FCopycatReceivedTM31Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation1Text::
	text_start

	para "TM31 contains my"
	line "favorite, MIMIC!"

	para "Use it on a good"
	line "#MON!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation2Text::
	text "<PLAYER>: Hi!"
	line "Thanks for TM31!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Is it"
	line "that fun to mimic"
	cont "my every move?"

	para "COPYCAT: You bet!"
	line "It's a scream!"
	done

_CopycatsHouse2FCopycatTM31NoRoomText::
	text "Don't you want"
	line "this?@"
	text_end

_CopycatsHouse2FDoduoText::
	text "DODUO: Giiih!"

	para "MIRROR MIRROR ON"
	line "THE WALL, WHO IS"
	cont "THE FAIREST ONE"
	cont "OF ALL?"
	done

_CopycatsHouse2FRareDollText::
	text "This is a rare"
	line "#MON! Huh?"
	cont "It's only a doll!"
	done

_CopycatsHouse2FSNESText::
	text "A game with MARIO"
	line "wearing a bucket"
	cont "on his head!"
	done

_CopycatsHouse2FPCMySecretsText::
	text "..."

	para "My Secrets!"

	para "Skill: Mimicry!"
	line "Hobby: Collecting"
	cont "dolls!"
	cont "Favorite #MON:"
	cont "CLEFAIRY!"
	done

_CopycatsHouse2FPCCantSeeText::
	text "Huh? Can't see!"
	done
