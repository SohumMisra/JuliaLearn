using JuMP
using Ipopt

m = Model(Ipopt.Optimizer)
@variable(m, 2<= x <=4)
@constraint(m, x^2 <= 9)
@objective(m, Max, x^2)

optimize!(m)

println(m)
println(objective_value(m))
println(value(x))

#  functions with !    - can change the input arguments
#  functions without ! - may or may not change the input arguments

# look through JuMP documentation
# try linear, NL problems
# how to formulate a problem, solve and get a solution
# how to add constraints
# obtain and store solution
# how to read from text files

# Install CPLEX (CPLEX.jl)
# Ctrl+Shift+Enter to run code
