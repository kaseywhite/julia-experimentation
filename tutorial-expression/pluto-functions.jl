### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ a60a66b0-b47b-11ed-0854-e722183fda5a
#We will be working with various kinds of function syntax here

# ╔═╡ 8eb400eb-5cda-4427-a076-44050a440c53
array = 1:10

# ╔═╡ 85fe73d7-43e1-4735-92c5-426523ee7439
testarray = repeat([1], 50)

# ╔═╡ 81db77ce-2dd9-437b-8811-adf12fc72466
#creating anonymous functions
f = x -> x+1

# ╔═╡ be1ceabd-352e-4328-958f-4c3671b8dc50
g = x -> x*2

# ╔═╡ 11bbf274-9636-40f5-bab4-a05d15538c80
h = x -> x^2

# ╔═╡ baea9a03-c4a1-4293-a7c8-ffb015ff038a
#piping

# ╔═╡ b7ba13e5-6933-425e-8de0-0084f5a4c758
y = 5

# ╔═╡ 724d34fa-962c-4e1b-a18d-18aa8e21dcff
y |> f |> g |> h

# ╔═╡ 6d904489-aba6-4ac4-8b08-6734324124fd
y |> h |> g |> f

# ╔═╡ 0b2a76bb-33f5-4cd9-a471-7bc5e392d027
#map

# ╔═╡ b363ec01-4721-4a9f-8cb0-1fe5882b753b
out1 = map(f, array) #can pass a function 

# ╔═╡ 11d64c99-2fa5-45a1-a460-e607344edef6
#out2 = map(f|>h, array) can't pipe inside map

# ╔═╡ 34d1d191-0f9f-4033-9990-7c7f60130be6
out3 = map(x->2*x, array) #can map inside

# ╔═╡ fe8ca03e-44f7-432e-a143-703a3815a8e3
out4 = map(x -> x.< 5, array) #way to mutate an array

# ╔═╡ 64e917a3-78d5-45ef-94dc-257e29cbeaa4
fmap = x -> map(f, x)

# ╔═╡ cb6d642f-07f8-4776-8cbf-970b82e424cf
gmap = x -> map(g, x)

# ╔═╡ 923ed1d5-43fc-4899-821a-ee0859f38ccb
hmap = x-> map(h, x)

# ╔═╡ 3483e32d-d447-40a7-b575-b823c4539e9f
array |> fmap 

# ╔═╡ bf252767-53b2-4d98-b6ce-170c67e2f71b
array |> fmap |> gmap |> hmap

# ╔═╡ e7806cc9-463d-4917-a7df-ce3b491573ab


# ╔═╡ 666420d1-01d9-4416-aee8-97e2e4ea462a
array[array .< 5]

# ╔═╡ 6f8903da-d72c-4eaa-b48e-fd88b869bf26
array[out4] 

# ╔═╡ ce0127a1-f799-4cc2-9cd3-8395824b155c


# ╔═╡ 2e82809f-84e0-4d89-89cd-af0cb8450068
fv = (x,y) -> x+y

# ╔═╡ 06e1f237-b92d-4ea3-8b5e-78079221db18
fv(1,2) 

# ╔═╡ e34d8836-3b53-4465-bd10-929360280a1c
#3 |> f |> fv(2) #doesn't work 

# ╔═╡ a096010b-0479-4c53-8843-d6613b8678e8


# ╔═╡ 54415c22-5dfe-4d34-939e-9312e53646b7
pos = x-> x>0 ? 1 : 0

# ╔═╡ ce5ad367-020d-4ea6-8486-b3b1c7548fdb
pos(-3)

# ╔═╡ 6b0dfbaa-4df3-424c-a851-08703dd26645
pos(3)

# ╔═╡ b2c7a0d2-4053-4ad3-ae67-c61ce1a5e940
pos(0)

# ╔═╡ 789b70da-03c3-4376-a390-07a4579739cf
map(pos, -5:5) 

# ╔═╡ a32956d6-80f9-48bf-8aaf-7272e7bcf0dd
map(x -> x >0 ? 1 : 0, -5:5)

# ╔═╡ cdf946d9-be9f-414a-9d5c-26991bf9470e
arraynegatives = -10:10

# ╔═╡ 10366127-65f8-4108-bef9-c5701eb4fc46
arraynegatives[arraynegatives .> 0] 

# ╔═╡ 98747a4f-1cf6-4d69-b8ec-1072a373a763


# ╔═╡ Cell order:
# ╠═a60a66b0-b47b-11ed-0854-e722183fda5a
# ╠═8eb400eb-5cda-4427-a076-44050a440c53
# ╠═85fe73d7-43e1-4735-92c5-426523ee7439
# ╠═81db77ce-2dd9-437b-8811-adf12fc72466
# ╠═be1ceabd-352e-4328-958f-4c3671b8dc50
# ╠═11bbf274-9636-40f5-bab4-a05d15538c80
# ╠═baea9a03-c4a1-4293-a7c8-ffb015ff038a
# ╠═b7ba13e5-6933-425e-8de0-0084f5a4c758
# ╠═724d34fa-962c-4e1b-a18d-18aa8e21dcff
# ╠═6d904489-aba6-4ac4-8b08-6734324124fd
# ╠═0b2a76bb-33f5-4cd9-a471-7bc5e392d027
# ╠═b363ec01-4721-4a9f-8cb0-1fe5882b753b
# ╠═11d64c99-2fa5-45a1-a460-e607344edef6
# ╠═34d1d191-0f9f-4033-9990-7c7f60130be6
# ╠═fe8ca03e-44f7-432e-a143-703a3815a8e3
# ╠═64e917a3-78d5-45ef-94dc-257e29cbeaa4
# ╠═cb6d642f-07f8-4776-8cbf-970b82e424cf
# ╠═923ed1d5-43fc-4899-821a-ee0859f38ccb
# ╠═3483e32d-d447-40a7-b575-b823c4539e9f
# ╠═bf252767-53b2-4d98-b6ce-170c67e2f71b
# ╠═e7806cc9-463d-4917-a7df-ce3b491573ab
# ╠═666420d1-01d9-4416-aee8-97e2e4ea462a
# ╠═6f8903da-d72c-4eaa-b48e-fd88b869bf26
# ╠═ce0127a1-f799-4cc2-9cd3-8395824b155c
# ╠═2e82809f-84e0-4d89-89cd-af0cb8450068
# ╠═06e1f237-b92d-4ea3-8b5e-78079221db18
# ╠═e34d8836-3b53-4465-bd10-929360280a1c
# ╠═a096010b-0479-4c53-8843-d6613b8678e8
# ╠═54415c22-5dfe-4d34-939e-9312e53646b7
# ╠═ce5ad367-020d-4ea6-8486-b3b1c7548fdb
# ╠═6b0dfbaa-4df3-424c-a851-08703dd26645
# ╠═b2c7a0d2-4053-4ad3-ae67-c61ce1a5e940
# ╠═789b70da-03c3-4376-a390-07a4579739cf
# ╠═a32956d6-80f9-48bf-8aaf-7272e7bcf0dd
# ╠═cdf946d9-be9f-414a-9d5c-26991bf9470e
# ╠═10366127-65f8-4108-bef9-c5701eb4fc46
# ╠═98747a4f-1cf6-4d69-b8ec-1072a373a763
