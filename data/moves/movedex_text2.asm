; PureRGBnote: ADDED: text pointers for the descriptions that show up in the movedex. 
; Separated into two files because it doesn't fit in a single bank.

_SharpenDexEntry::
	text "The user sharpens"
	next "its claws or"
	next "edges."

	bage "Raises ATTACK"
	next "and ACCURACY."
	next "(+1 Each)"
	dex

_ConversionDexEntry::
	text "The user analyzes"
	next "the opponent and"
	next "upgrades its body"

	bage "to be better"
	next "suited for taking"
	next "down its enemy."

	bage "Greatly raises"
	next "user's SPECIAL."
	next "(+2 SPECIAL)"
	dex

_TriAttackDexEntry::
	text "Shoots triangles"
	next "with properties"
	next "of 3 elements:"

	bage "Fire, ice, and"
	next "electricity."

	bage "10% chance each"
	next "of burn, freeze"
	next "or paralysis"
	dex

_SuperFangDexEntry::
	text "The user chomps"
	next "hard on the"
	next "foe with razor"

	bage "-sharp front"
	next "fangs."

	bage "Always does 2/3"
	next "of the opponent's"
	next "current HP"
	dex

_SlashDexEntry::
	text "User heavily"
	next "slashes the foe"
	next "with claws or"

	bage "anything sharp."
	next "Often lands"
	next "critical hits"
	dex

_SubstituteDexEntry::
	text "A decoy doll"
	next "replaces the user"
	next "and takes damage"

	bage "instead of it."
	next "Need to sacrifice"
	next "1/4 HP to use"
	dex

_StruggleDexEntry::
	text "A last ditch"
	next "move only usable"
	next "when all moves"

	bage "have 0 PP left."
	next "Does heavy recoil"
	next "to the user"
	dex

