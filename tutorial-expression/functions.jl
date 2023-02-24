array = 1:10
typeof(array)

#creating anonymous functions
f = x -> x+1
g = x -> x*2
h = x -> x^2 

#piping
y = 3 
y |> f |> g |> h

#mapping without explicit declaration

array = [1]*50
array