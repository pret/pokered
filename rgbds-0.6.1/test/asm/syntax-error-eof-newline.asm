; Syntax errors at the end of a buffer (here, the INCLUDEd file) should be reported in their file,
; not in the parent context (here, this file).

	PRINTLN "Before"
	INCLUDE "syntax-error-eof-newline.inc"
	PRINTLN "After"
