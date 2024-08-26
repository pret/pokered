IF !DEF(SECOND)
INSTR equs "sbc a"
ELSE
INSTR equs "db $9f"
ENDC

SECTION UNION "different syntaxes", ROM0
	INSTR

	PURGE INSTR
