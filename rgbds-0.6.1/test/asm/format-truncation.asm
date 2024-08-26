num equ 42
fix equ 123.0
str equs "hello"

println "{#0260x:num}"
println "{#-260x:num}"
println "{0280.260f:fix}"
println "{260s:str}"
println "{-260s:str}"

println "<{#0260x:num}>"
println "<{#-260x:num}>"
println "<{0280.260f:fix}>"
println "<{260s:str}>"
println "<{-260s:str}>"
