/** p(X,Z):- q(X,Y), p(Y,Z).
p(X,X).
q(a,b).
*/

% wants to find results of p(T,b).
% we evalute the LHS and then evaluate the RHS rules

/**
p(X,Z):- p(Y,Z), q(X,Y). 
p(X,X).
q(a,b).
*/

% second code runs indefinitely 

/**
f(0,0).
f(1,1).
f(X,M):- X>1, Y is X-1, f(Y,T), M is 1-T.
*/

% computes the parity of X

/**
fac(1,1).
fac(N,R):-N>1,M is N-1,fac(M,T),R is N*T.
*/

fac(0,1).
% Recursive case: factorial of N is N * factorial(N-1).
fac(N, Result):-
    N > 0,
    N1 is N - 1,
    fac(N1, Temp),
    Result is N * Temp.
