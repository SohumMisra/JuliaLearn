using JuMP
# using Ipopt
using Cbc

m = Model(Cbc.Optimizer)

@variable(m, pennies >= 0, Int)
@variable(m, nickles >= 0, Int)
@variable(m, dimes >= 0, Int)
@variable(m, quarters >= 0, Int)
# @variable(m, pennies >= 0)
# @variable(m, nickles >= 0)
# @variable(m, dimes >= 0)
# @variable(m, quarters >= 0)

# @addConstraint
@constraint(m, 1*pennies+5*nickles+10*dimes+25*quarters == 99)

@objective(m, Min, 2.5*pennies+5*nickles+2.268*dimes+5.67*quarters)

optimize!(m)

println(m)
println("Solution Value: ", objective_value(m))
println("Pennies = ", value(pennies))
println("Nickles = ", value(nickles))
println("Dimes = ", value(dimes))
println("Quarters = ", value(quarters))
# \nNickles = %i\nDimes = %i\nQuarters = %i\n", value(pennies), value(nickles), value(dimes), value(quarters))
