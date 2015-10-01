left_side(L, R, [L, R, _, _, _]).
left_side(L, R, [_, L, R, _, _]).
left_side(L, R, [_, _, L, R, _]).
left_side(L, R, [_, _, _, L, R]).

neighbour(X, Y, Street) :- left_side(X, Y, Street).
neighbour(X, Y, Street) :- left_side(Y, X, Street).

get_zebra(Street, Who) :- 
    Street = [[C1, N1, P1, D1, S1],
              [C2, N2, P2, D2, S2],
              [C3, N3, P3, D3, S3],
              [C4, N4, P4, D4, S4],
              [C5, N5, P5, D5, S5]],
    member([red, english, _, _, _], Street),
    member([_, swede, dog, _, _], Street),
    member([_, dane, _, tea, _], Street),
    left_side([green, _, _, _, _], [white, _, _, _, _], Street),
    member([green, _, _, coffee, _], Street),
    member([_, _, birds, _, pallmall], Street),
    member([yellow, _, _, _, dunhill], Street),
    D3 = milk,
    N1 = norwegian,
    neighbour([_, _, _, _, blend], [_, _, cats, _, _], Street),
    neighbour([_, _, horse, _, _], [_, _, _, _, dunhill], Street),
    member([_, _, _, beer, bluemaster], Street),
    member([_, german, _, _, prince], Street),
    neighbour([_, norwegian, _, _, _], [blue, _, _, _, _], Street),
    neighbour([_, _, _, water, _], [_, _, _, _, blend], Street),
    member([_, Who, zebra, _, _], Street).

writeList([]).
writeList([H|T]):- write(H), write("\n"), writeList(T).
?- get_zebra(Street, Who), write(Who), write("\n"), writeList(Street).

%There are five houses.
%Each house has its own unique color.
%All house owners are of different nationalities.
%They all have different pets.
%They all drink different drinks.
%They all smoke different cigarettes.
%The English man lives in the red house.
%The Swede has a dog.
%The Dane drinks tea.
%The green house is on the left side of the white house.
%They drink coffee in the green house.
%The man who smokes Pall Mall has birds.
%In the yellow house they smoke Dunhill.
%In the middle house they drink milk.
%The Norwegian lives in the first house.
%The man who smokes Blend lives in the house next to the house with cats.
%In the house next to the house where they have a horse, they smoke Dunhill.
%The man who smokes Blue Master drinks beer.
%The German smokes Prince.
%The Norwegian lives next to the blue house.
%They drink water in the house next to the house where they smoke Blend.
%...who owns the Zebra?

%1 yellow    Norwegian cats      water     Dunhill  
%2 blue      Dane      horse     tea       Blend    
%3 red       English   birds     milk      Pall Mall
%4 green     German    zebra     coffee    Prince   
%5 white     Swede     dog       beer      Blue Master