
println """This paragraph has exactly 257--that's two hundred and
fifty-seven--characters altogether. That's just enough for its last
two characters to be truncated by rgbasm's lexer, since it can't
handle more than 255-character strings. The final two won't print: !?"""

MACRO mac
	println "\1" ; x1
	println "\1\1\1\1\1\1" ; x6
ENDM

	mac Hello! ; 6x6 = 36
	mac This sentence spans forty-three characters. ; 43x6 = 258
