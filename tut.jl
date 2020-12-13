using JuMP
using Ipopt
using Printf
using Statistics

println("Hello World!")

function changeNum()
    x::Int8 = 10
    x = 20
    println(x)
end

# BigFloat BigInt for high precision data

changeNum()

c2 = Char(120)
println(c2)

i1 = UInt8(trunc(3.14))
println(i1)

f1 = parse(Float64,"1")
println(f1)

i2 = parse(Float64,"1")
println(i2)

s1 = "Random Words\n"
println(length(s1))

println(s1[1]) # start from 1 and not 0
println(s1[end])
println(s1[1:4])

s2 = string("Sohum", "Misra")
println(s2)
println("misra.sohum"*"@gmail.com")
i3 = 2
i4 = 3
println("$i3 + $i4 = $(i3+i4)")

s3 = """ I
have
many
lines""" # Multi-line strings

println("Takao">"Hiyama")
println(findfirst(isequal('i'),"Keigo"))
println(occursin("key", "monkey"))

age = 12
if age >= 5 && age <= 6
    println("AG-1")
elseif age >= 7 && age <= 13
    println("AG-2")
else
    println("AG-NA")
end

@printf("true || false = %s\n", true || false ? "true" : "false")
