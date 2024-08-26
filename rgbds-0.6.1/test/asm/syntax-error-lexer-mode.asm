newline equs "\n"

def x = 1 newline def y = 2
println "x={d:x}, y={d:y}"

; the lexer is already in normal mode at the `AF`, so `newline` gets expanded
def m = AF newline def n = 2
println "n={d:n}"

; the lexer is in raw mode at the `AF`, but the parser resets it to normal
def AF = 1 newline def q = 2
println "q={d:q}"
