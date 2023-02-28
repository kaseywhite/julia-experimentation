using StatsBase

#Permutation test that takes in two samples, and outputs a p-value according to some condition.

function permutationtest(sampleone, sampletwo; n, func :: Function, lowertail = true, twosided = false)
    pooled = cat(sampleone, sampletwo, dims = 1)
    lengthone, lengthpooled = length(sampleone), length(pooled) 
    basestat = func(sampleone, sampletwo) 
    try
        basetat = float(basestat)
    catch e
        error("Invalid function return value.")
    end
    permutedstats = [] 
    for i = 1:n
        permuted = sample(pooled, lengthpooled, replace=false)
        permutedone, permutedtwo = permuted[1:lengthone], permuted[lengthone+1:lengthpooled] 
        push!(permutedstats, func(permutedone, permutedtwo))
    end
    return ifelse(lowertail, mean(permutedstats .<= basestat), mean(permutedstats .>= basestat))*(twosided+1)
end 
