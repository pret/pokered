SECTION "Scopes", ROM0

; Neither of these should be created
.tooSoon
Nice.try

Parent:
.loc
	dw Parent.loc ; This is what it should expand to
Parent.explicit
	dw .explicit ; This should expand to the above


; None of the two locals below should manage to be created, being in the wrong scopes
; Note however that `Parentheses` begins with `Parent`, which string checks may fail to handle

Parentheses.check

Parentheses:

Parent.check
