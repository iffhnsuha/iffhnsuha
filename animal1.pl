/**
animal(bear,mammal).
animal(tiger,mammal).
animal(sparrow,bird).
animal(stork,bird).
*/

%Animal definition as a single list
animal(X, mammal) :- member(X, [bear, tiger]).
animal(X, bird) :- member(X, [sparrow, stork]).

%Carnivor definition as a single list
carnivore(X) :- member(X, [bear, tiger]).

%herbivore definition as a single list
herbivore(X) :- member(X, [sparrow, stork]).