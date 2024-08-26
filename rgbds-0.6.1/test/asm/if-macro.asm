macro m
	if 0
		WARN "3"
	else
		WARN "5"
	endc
endm

if 1
	m
else
	WARN "12"
endc
