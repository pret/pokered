MACRO mac
	println "'mac \#':"
	for i, _NARG
		println strfmt("\\%d: <\1>", i+1)
		shift
	endr
	println
ENDM

	mac /* block
		...comment */ ; comment
	mac /*a*/ 1 , 2 /*b*/ , ; trailing comma
	mac \
	c, d
	mac 1, 2 + /* another ;
		; comment */ 2, 3

	mac           a                                                                                                                                                                                                                                                               b           ; truncated

	mac
	mac ,
	mac a,
	mac a,,
	mac ,,z
	mac a,,z
	mac ,a,b,c,
	mac ,,x,,,
	mac E,O,F ; no newline