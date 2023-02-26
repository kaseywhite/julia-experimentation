using StatsBase
using Distributions
using HypothesisTests
using Plots
using LinearAlgebra
using QuadGK 

#Q1(a) 
#sample without replacement
Ω = collect(1:1:100); samp1a = sample(Ω, 3, replace=false) 

#Q1(b)
#Geom(1/3), Y=(4 ∪ 5)
prob_b = pdf(Geometric(1/3), 4-1)+pdf(Geometric(1/3),5-1)

#Q1(c) 
#HyperGeometric 52 cards, 5 cards, num ace? 
distribution_c = Hypergeometric(4, 52-4, 5)

#Q1(d) 
f(z) = (2/π)*√(1-z^2); ∫f = quadgk(f, -1,1, rtol=1e-3) 

#Q1(e)
U = Uniform(0,2)
pA =  cdf(U, 1) - cdf(U,0); pB = cdf(U, 4/3) - cdf(U, 2/3) 
pAB = cdf(U, 1) - cdf(U, 2/3) 
independent = pA*pB - pAB < 1e-5

#Q2(a) 
pA = 1/4; pB = 1/4; pC=1/4
pABC = 0; pAB = 1/16; pBC = 1/16; pCA = 1/16
indepenedent = pA*pB*pC - pABC < 1e-5

#Q2(b)
pAuBuC = pA+pB+pC - pAB - pBC - pCA + pABC

#Q3(a) 
b1 = [repeat(['C'],20);repeat(['H'], 30)]; pb1 = 1/2
b2 = [repeat(['C'],15);repeat(['H'], 45)]; pb2 = 1/2
pHgb1 = mean(b1 .== 'H'); pHgb2 = mean(b2 .== 'H')
pH = pHgb1*pb1 + pHgb2*pb2

#Q3(b) 
pb1gH = (pHgb1 * pb1) / pH 

#Q3(c) 
pb1 = pb1gH; pb2 = 1- pb1
pH = pHgb1*pb1 + pHgb2*pb2
pb1gH = (pHgb1 * pb1) / pH 

#Q4(a) 
rX = [0,3]

#Q4(b) 
U_A1 = Uniform(0,2); U_A2 = Uniform(2,3); p_A1 = 4/5; p_A2 = 1/5
p_lt = cdf(U_A1, 5/2)*p_A1 + cdf(U_A2, 5/2)*p_A2
