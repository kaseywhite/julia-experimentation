using Plots
using CSV
using DataFrames
using Distributions
using HypothesisTests
using StatsBase
using StatsPlots
using Interact
using Blink
using Dates

chess = CSV.read("plotting-and-data-exploration\\chess.csv", DataFrame)
to_date(str) = try Date(str) catch; missing end
chess[!, :B_day] = map(to_date, chess[!, :B_day])

gbschess = groupby(chess, :Sex)
summary_stats = combine(gbschess, :Rating => maximum, :Rating => mean)

bar(summary_stats.Sex, summary_stats.Rating_maximum)
@df chess histogram(
    :Rating, 
    group = (:Sex),
    fillalpha = 0.5)
@df chess density(
    :Rating, 
    group = (:Sex),
    fillalpha = 0.01)


function permutationtest(sampleone, sampletwo; n, func :: Function)
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
        permutedone, permutedtwo = permuted[1:lengthone], permuted[lengthone:lengthpooled] 
        push!(permutedstats, func(permutedone, permutedtwo))
    end
    return (mean(permutedstats .>= basestat),permutedstats) 
end 

diffmax(s1, s2) = maximum(s2) - maximum(s1)

#chessind = subset(chess,[:Country, :B_day] => (x,y) -> ByRow(x == "India" && y < Date(2000)), skipmissing=true )

chessind = subset(chess, :Country => ByRow(==("India")), :B_day => ByRow(<(Date(2000))), skipmissing=true)
#chess[(chess.Country .== "India") .& (Date(chess.B_day) .< Date(2000)),:]
chessindsum = combine(
    groupby(chessind, :Sex),
    :Rating => maximum,
    :Rating => mean,
    nrow
)



fratings = chessind[(chessind.Sex .== "F"),:].Rating
mratings = chessind[(chessind.Sex .== "M"),:].Rating
diff = diffmax(fratings, mratings)

results = permutationtest(fratings, mratings, n=100_000, func = diffmax) 

pval, means = results[1],results[2] 

plot = density(
    means,
    plot_title = "Average Difference of Maxes in Permuted Samples",
    plot_titlefontsize = 12,
    fontfamily = "Roboto",
    xaxis = (
        "Difference in Maximum Ratings",
        font(8, "Roboto")
    ),
    yaxis =(
        font(8, "Roboto")
    ),
    label = "Density",
    linecolor =:black
)

plot!([diff], seriestype="vline", 
    linecolor=:red, 
    label = "Original Difference")

