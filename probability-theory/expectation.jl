using StatsBase
using Distributions
using HypothesisTests
using Plots
using LinearAlgebra

qa = Dict() 

#= 
Question 3.8 
X random variable from 3.1. 
(a) Compute mean of X.
(b) Compute E[|X-2|] 
=#
qa["Question 3.8"] = Dict() 

x = [1,2,3,4,5]; p = [1/7,1/14,3/14,2/7,2/7] 

#(a) 
qa["Question 3.8"]["(a)"] = sum(x .* p)

#(b) 
qa["Question 3.8"]["(b)"] = sum(map(x->abs(x-2), x).*p)

#=
Question 3.24
Suppose X has discrete dist (follows). 

(a) What is P(X >= 2) 
(b) What is E(1/(1+X)) 
=#
qa["Question 3.24"] = Dict() 
x = [1,2,3]; p=[1/7,2/7,4/7] 

#(a)
qa["Question 3.24"]["(a)"] = sum(p[x.>= 2])

#(b) 
qa["Question 3.24"]["(b)"] = sum(map(x-> 1/(1+x), x).*p)

#= 
Question 3.32
A fair coin is flipped three times. 
Let X be the number of heads observed. 
(a) Give both the possible values and pmf of X. 
(b) Find P(X >= 1) and P(X > 1).
(c) Compute E[X] and Var(X). 
=# 
qa["Question 3.32"] = Dict()
x=[0,1,2,3] 

#(a) 
p = map(x -> pdf(Binomial(3,0.5),x), x)
qa["Question 3.32"]["(a)"] = hcat(x,p) 

#(b) 
qa["Question 3.32"]["(b)"] = (sum(p[x.>=1]), sum(p[x.>1])) 

#(c) 
e_x = sum(p.*x); var_x = sum(p.*map(x->x^2, x))-e_x^2
qa["Question 3.32"]["(c)"] = (e_x, var_x) 

#= 
Question 3.36
Suppose a random variable X has density function:
f(x) = 2/(x^2) when 1<= x<= 2, 0 else
Compute E(X^4) 
=#
function generate_X_samples(n; k=4)
    u = (n:(2^k*n)) ./ n;v = map(v->(2/(v^2)), u)
    return sample(u, Weights(v), n) 
end 

qa["Question 3.36"] = mean(generate_X_samples(100_000))
#=
Question 3.38
Let random variable Z pdf 
f_Z(z) = 5/z*z^4 when -1 <= z <= 1, 0 else 
(a) Calculate E[Z]
(b) Calculate P(0<Z<1/2)
(c) Calculate P(Z<1/2 | Z>0)
(d) Calculate all moments E[Z^n] 
=#

qa["Question 3.38"] = Dict() 

function generate_Z_samples(n ; k=1)
u = (-k*n:k*n) ./ n ; x = map(z-> (5/2) * (z^4), u)
return sample(u, Weights(x), n) 
end 

sample_3_38 = generate_Z_samples(1_000_000)
#(a) Calculate E[Z]  
qa["Question 3.38"]["(a)"] = mean(sample_3_38)

#(b) 
qa["Question 3.38"]["(b)"] = mean((sample_3_38 .<= 1/2) .& (sample_3_38 .>= 0))

#(c) 
qa["Question 3.38"]["(c)"]  =  qa["Question 3.38"]["(b)"] / mean(sample_3_38 .>=0)

#(d) 
qa["Question 3.38"]["(d)"] = mean(map(x -> mean(generate_Z_samples(100_000, k = x)), 2:100))

#=
Question 3.48
A random point is picked uniformly inside the triangle
on the plane with vertices (0,0), (2,0), and (0,1).
Compute the expectation of the distance of this point
to y-axis. 
=# 

uniquepoint(n) = hcat(rand(Uniform(0,2), n),  rand(Uniform(0,1),n ))
sim(n) = mean(map(x->abs(x), uniquepoint(n)[:,1]))

qa["Question 3.48"] = sim(1_000_000)