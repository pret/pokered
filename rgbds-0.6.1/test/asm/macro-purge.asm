; Check deleting a macro then using its file stack info
MACRO m
	PURGE m
	WARN "Where am I?"
ENDM
	m
