man("Stefanyk Vasyl").
woman("Grytskiv Ganna").
man("Stefanyk Mykola").
man("Stefanyk Taras").
woman("Stefanyk Mariya").

man("Chikh Mykola").
woman("Marunchak Mariya").
man("Chikh Ivan").
woman("Chikh Oksana").

parent("Stefanyk Vasyl","Stefanyk Mykola").
parent("Grytskiv Ganna","Stefanyk Mykola").

parent("Stefanyk Vasyl","Stefanyk Taras").
parent("Grytskiv Ganna","Stefanyk Taras").

parent("Stefanyk Vasyl","Stefanyk Mariya").
parent("Grytskiv Ganna","Stefanyk Mariya").

parent("Chikh Mykola","Chikh Ivan").
parent("Marunchak Mariya","Chikh Ivan").

parent("Chikh Mykola","Chikh Oksana").
parent("Marunchak Mariya","Chikh Oksana").

man("Chikh Volodymyr").
man("Chikh Bohdan").

parent("Chikh Ivan","Chikh Volodymyr").
parent("Stefanyk Mariya","Chikh Volodymyr").
parent("Chikh Ivan","Chikh Bohdan").
parent("Stefanyk Mariya","Chikh Bohdan").

man("Marunchak Myhailo").
woman("Marunchak Olga").
woman("Marunchak Nadia").

parent("Marunchak Myhailo","Marunchak Olga").
parent("Chikh Oksana","Marunchak Olga").
parent("Marunchak Myhailo","Marunchak Nadia").
parent("Chikh Oksana","Marunchak Nadia").

father(X, Y) :- parent(X, Y), man(X).
mother(X, Y) :- parent(X, Y), woman(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

sibling(X, Y) :- father(Z, X), father(Z, Y), mother(ZZ, X), mother(ZZ, Y), X \= Y.
sister(X, Y) :- sibling(X, Y), woman(X).
brother(X, Y) :- sibling(X, Y), man(X).

aunt(X,Y) :- parent(Z,Y), sister(X,Z).
uncle(X,Y) :- parent(Z,Y), brother(X,Z). 

%?-mother("Chikh Oksana",X), write(X), write(" ").
%?-grandparent("Stefanyk Vasyl", X), write(X), write(" ").
%?-sibling("Chikh Volodymyr", X), write(X), write(" ").
%?-sister("Stefanyk Mariya", X), write(X), write(" ").
%?-uncle("Stefanyk Mykola", X) , write(X), write(" ").







