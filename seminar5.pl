
%Exercise 4
/*
rev([],[]).
rev([H|T], X) :-
    rev(T, RevT), append(RevT, [H], X).
**/


%Using Accumulator
rev([], A, A).
rev([H|T], A, R) :- rev(T, [H|A], R).

%Exercise 5
sublista([], _).
sublista([X|Xs], [X|Ys]) :- sublista(Xs, Ys).
sublista(Xs, [_|Ys]) :- sublista(Xs, Ys).

%checks whether the second is a consecutive sublist of the first
%must preserve the prefix of the elements in the list
prefix([],_).
prefix([X|Xs], [X|Ys]) :- prefix(Xs, Ys).

sublistb(X,Y) :- prefix(X,Y).
sublistb(Xs, [_|Ys]) :- sublistb(Xs, Ys).


