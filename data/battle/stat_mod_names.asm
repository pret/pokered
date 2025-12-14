; Stats that move effects can raise or lower
; The relevant move effect IDs correspond to the stats

StatModTextStrings:
	list_start STAT_NAME_LENGTH - 1
	li "ATTACK"
	li "DEFENSE"
	li "SPEED"
	li "SPECIAL"
	assert_list_length SPECIAL_DOWN_SIDE_EFFECT - ATTACK_DOWN_SIDE_EFFECT + 1
	li "ACCURACY"
	li "EVADE"
	assert_list_length NUM_STAT_MODS - 2 ; two bytes are unused
	assert_list_length EVASION_UP1_EFFECT - ATTACK_UP1_EFFECT + 1
	assert_list_length EVASION_DOWN1_EFFECT - ATTACK_DOWN1_EFFECT + 1
	assert_list_length EVASION_UP2_EFFECT - ATTACK_UP2_EFFECT + 1
	assert_list_length EVASION_DOWN2_EFFECT - ATTACK_DOWN2_EFFECT + 1
