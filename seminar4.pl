%Exercise 3
/**
hanoi(1, FromPeg, ToPeg, _):-
    write(FromPeg), write(' -> '), write(ToPeg), nl.

hanoi(N, FromPeg, ToPeg, IntPeg):-
    N > 1,
    N1 is N - 1,
    hanoi(N1, FromPeg, IntPeg, ToPeg),
    hanoi(1, FromPeg, ToPeg, _),
    hanoi(N1, IntPeg, ToPeg, FromPeg).
*/

%Exercise 4
/**
p([a,b,c],a(b)).
*/

%Exercise 5
first(X,[X|_]).

last(X,[X]).
last(X,[_|Z]) :- last(X,Z).