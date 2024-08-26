
	old: MACRO ; comment
		println "out with the ", \1
	ENDM ; comment

	MACRO new ; comment
		println "in with the ", \1
	ENDM ; comment

	old 1
	new 2

	bad1: MACRO bad2 ; comment
		println "which?"
	ENDM ; comment
