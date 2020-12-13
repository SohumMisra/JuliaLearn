using JuMP
using Cbc

Grid = [
    6 0 0  5 0 2  0 7 0;
    0 0 0  4 0 0  0 0 0;
    5 0 0  0 6 0  3 0 0;

    7 0 1  0 0 0  8 0 0;
    0 8 2  6 0 4  7 5 0;
    0 0 5  0 0 0  6 0 2;

    0 0 7  0 8 0  0 0 9;
    0 0 0  0 0 3  0 0 0;
    0 5 0  2 0 7  0 0 6;
]

m = Model(Cbc.Optimizer)

nSq = collect(1:9)

@variable(m, x[1:9,1:9,1:9], Bin)

# Constraint 1: Each cell must have 1 value
for i in nSq
    for j in nSq
        @constraint(m,sum(x[i,j,:]) == 1)
    end
end

# Constraint 2: All rows must have unique numbers 1 to 9
for k in nSq
    for j in nSq
        @constraint(m,sum(x[:,j,k]) == 1)
    end
end

# Constraint 3: All Columns must have unique numbers 1 to 9
for k in nSq
    for i in nSq
        @constraint(m,sum(x[i,:,k]) == 1)
    end
end

# Constraint 4: All 3X3 Grids must have unique numbers 1 to 9
for i in [1,4,7]
    for j in [1,4,7]
        for k in nSq
            @constraint(m,sum(x[i:i+2,j:j+2,k]) == 1)
        end
    end
end

# Initial condition
for i in nSq
    for j in nSq
        if Grid[i,j] !=0
            @constraint(m,x[i,j,Grid[i,j]]==1)
            # println(Grid[i,j])
        end
    end
end

Status = optimize!(m)

# Check Solution
if Status == :Infeasible
    error("No solution found")
else
    Out  = JuMP.value.(x)
    Soln = zeros(Int,9,9)
    for i in nSq, j in nSq, k in nSq
        if Out[i,j,k]>0.9 # Ignore zeros
            Soln[i,j] = k
        end
    end
end

# Display Solution
println("Solution:")
println("---------------------")

for i in nSq
    for j in nSq
        print("$(Soln[i,j]) ")
        if j%3==0 && j<9
            print("| ")
        end
    end
    println()
    if i%3 == 0
        println("---------------------")
    end
end
