; Macro invocations not followed by a newline may scan an EOF;
; If this is the case, it shouldn't cause the parse to end before the macro is expanded
macro mac
	PRINTLN "Hi beautiful"
endm
	mac