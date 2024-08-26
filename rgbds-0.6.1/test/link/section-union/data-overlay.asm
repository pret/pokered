IF !DEF(SECOND)
DATA equs "ds 4"
ELSE
DATA equs "db $aa, $bb, $cc, $dd"
ENDC

SECTION UNION "overlaid data", ROM0
	DATA

	PURGE DATA
