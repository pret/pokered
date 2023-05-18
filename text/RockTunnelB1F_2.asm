_RockTunnel2AfterBattleText8::
	text "I'll raise my"
	line "#MON to beat"
	cont "yours, kid!"
	done

_RockTunnel2BattleText9::
	text "I draw #MON"
	line "when I'm home."
	done

_RockTunnel2EndBattleText9::
	text "Whew!"
	line "I'm exhausted!"
	prompt

_RockTunnel2AfterBattleText9::
	text "I'm an artist,"
	line "not a fighter."
	done

_TM48PreReceiveText::
	text "When you're on a"
	line "rocky mountain"
	cont "like this, rock"
	cont "slides are a"
	cont "threat."
	
	para "Can you imagine?"
	line "Boulders tumbling"
	cont "down on you?"
	
	para "That'd be like..."
	line "Waaaaah! Total"
	cont "terror!"
	
	para "You don't seem to"
	line "be scared. Want"
	cont "to try using"
	cont "ROCK SLIDE?"
	prompt

_ReceivedTM48Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_TM48ExplanationText::
	text "It may be scary"
	line "to use this in"
	cont "a tunnel."
	done

_TM48Refused::
	text "Oh, so you are"
	line "scared after"
	cont "all."
	done
