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

array = repeat([1,2,3],5)
array

#the do keyword : what this does is pass a function into an arg
map(array) do x 
    2x
end

#sample function for limitations
d(x,y) = sqrt(x^2+y^2) 

x, y = 4, 10
d(x,y)
#d(x) do y end fails, as y is a variable

y |> f |> g |> h |> y -> d(x,y) #this works! 