%%  houses(-Solution)
%   @param  Solution is a list of houses that satisfy all constraints.
%   @author Folklore attributes this puzzle to Einstein
%   @see http://en.wikipedia.org/wiki/Zebra_Puzzle


/* Houses logical puzzle: who owns the zebra and who drinks water?

	 1. The Brit lives in the red house.
     2. The Swede keeps dogs as pets.
     3. The Dane drinks tea.
     4. The green house is on the left of the white house.
     5. The green house’s owner drinks coffee.
     6. The person who smokes Pall Mall rears birds.
     7. The owner of the yellow house smokes Dunhill.
     8. The man living in the center house drinks milk.
     9. The Norwegian lives in the first house.
    10. The man who smokes Blend lives next to the one who keeps cats
	11. The man who keeps horses lives next to the man who smokes Dunhill.
    12. The owner who smokes BlueMaster drinks beer.
    13. The German smokes Prince.
    14. The Norwegian lives next to the blue house.
    15. The man who smokes Blend has a neighbour who drinks water.

Who owns the fish?
*/
/*
% Render the houses term as a nice table.
:- use_rendering(table,
		 [header(h('Color', 'Nationality', 'Beverage', 'Pets', 'Cigarette'))]).

fish_owner(Owner) :-
	houses(Hs),
	member(h(_,Owner,_,fish,_), Hs).


houses(Hs) :-
	% each house in the list Hs of houses is represented as:
	%      h(Color, Nationality, Beverage, Pets, Cigarette)
	length(Hs, 5),                                            %  1
    Hs = [H1, H2, H3, H4, H5],

    % Define all houses
    H1 = h(Color1, Nat1, Bev1, Pet1, Cig1),
    H2 = h(Color2, Nat2, Bev2, Pet2, Cig2),
    H3 = h(Color3, Nat3, Bev3, Pet3, Cig3),
    H4 = h(Color4, Nat4, Bev4, Pet4, Cig4),
    H5 = h(Color5, Nat5, Bev5, Pet5, Cig5),

    different([Color1, Color2, Color3, Color4, Color5]),
    different([Nat1, Nat2, Nat3, Nat4, Nat5]),
    different([Bev1, Bev2, Bev3, Bev4, Bev5]),
    different([Pet1, Pet2, Pet3, Pet4, Pet5]),
    different([Cig1, Cig2, Cig3, Cig4, Cig5])

	member(h(red,brit,_,_,_), Hs),                            %  2
	member(h(_,swede,_,dog,_), Hs),                           %  3
	member(h(_,dane,tea,_,_), Hs),                            %  4
	left_of(h(green,_,coffee,_,_), h(white,_,_,_,_), Hs),        %  5
	member(h(_,_,_,birds,pallmall), Hs),                      %  6
	member(h(yellow,_,_,_,dunhill), Hs),                      %  7
	Hs = [_,_,h(_,_,milk,_,_),_,_],                           %  8
	Hs = [h(_,norwegian,_,_,_)|_],                            %  9
	next(h(_,_,_,_,blend), h(_,_,_,cats,_), Hs),        	  % 10
	next(h(_,_,_,horses,_), h(_,_,_,_,dunhill), Hs),          % 11
	member(h(_,_,beer,_,bluemaster), Hs),                     % 12
	member(h(_,german,_,_,prince), Hs),                       % 13
	next(h(_,norwegian,_,_,_), h(blue,_,_,_,_), Hs),          % 14
	next(h(_,_,_,_,blend), h(_,_,_,water,_), Hs),			  %
	member(h(_,_,_,fish,_), Hs).							  % one of them owns a fish

next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).

% Helper predicates
different([]).
different([H|T]) :- 
    \+ member(H, T), 
    different(T).

left_of(A, B, Ls) :- append(_, [A,B|_], Ls).

/** <examples>

?- fish_owner(Owner).

houses(Hs) :-
	length(Hs, 5),
	member(h(red,brit,_,_,_), Hs),
	member(h(_,swede,_,dog,_), Hs),
	member(h(_,dane,tea,_,_), Hs),
	next(h(green,_,coffee,_,_), h(white,_,_,_,_), Hs),
	member(h(_,_,_,birds,pallmall), Hs),
	member(h(yellow,_,_,_,dunhill), Hs),
	Hs = [_,_,h(_,_,_,milk,_),_,_],
	Hs = [h(_,norwegian,_,_,_)|_],
	next(h(_,_,_,_,blend), h(_,_,_,cats,_), Hs),
	next(h(_,_,_,horses,_), h(_,_,_,_,dunhill), Hs),
	member(h(_,_,beer,_,bluemaster), Hs),
	member(h(_,german,_,_,prince), Hs),
	next(h(_,norwegian,_,_,_), h(blue,_,_,_,_), Hs),
	next(h(_,_,_,_,blend), h(_,_,_,water,_), Hs),
	member(h(_,_,_,fish,_), Hs).

*/
**/

% Render the houses term as a nice table.
:- use_rendering(table,
         [header(h('Color', 'Nationality', 'Beverage', 'Pet', 'Cigarette'))]).

fish_owner(Owner) :-
    houses(Hs),
    member(h(_, Owner, _, fish, _), Hs).

houses(Hs) :-
    length(Hs, 5),
    Hs = [H1, H2, H3, H4, H5],
    
    % Define all houses
    H1 = h(Color1, Nat1, Bev1, Pet1, Cig1),
    H2 = h(Color2, Nat2, Bev2, Pet2, Cig2),
    H3 = h(Color3, Nat3, Bev3, Pet3, Cig3),
    H4 = h(Color4, Nat4, Bev4, Pet4, Cig4),
    H5 = h(Color5, Nat5, Bev5, Pet5, Cig5),
    
    % All elements must be different
    different([Color1, Color2, Color3, Color4, Color5]),
    different([Nat1, Nat2, Nat3, Nat4, Nat5]),
    different([Bev1, Bev2, Bev3, Bev4, Bev5]),
    different([Pet1, Pet2, Pet3, Pet4, Pet5]),
    different([Cig1, Cig2, Cig3, Cig4, Cig5]),
    
    % 1. The Brit lives in the red house.
    member(h(red, brit, _, _, _), Hs),
    
    % 2. The Swede keeps dogs as pets.
    member(h(_, swede, _, dog, _), Hs),
    
    % 3. The Dane drinks tea.
    member(h(_, dane, tea, _, _), Hs),
    
    % 4. The green house is on the left of the white house.
    left_of(h(green, _, _, _, _), h(white, _, _, _, _), Hs),
    
    % 5. The green house's owner drinks coffee.
    member(h(green, _, coffee, _, _), Hs),
    
    % 6. The person who smokes Pall Mall rears birds.
    member(h(_, _, _, birds, pallmall), Hs),
    
    % 7. The owner of the yellow house smokes Dunhill.
    member(h(yellow, _, _, _, dunhill), Hs),
    
    % 8. The man living in the center house drinks milk.
    H3 = h(_, _, milk, _, _),
    
    % 9. The Norwegian lives in the first house.
    H1 = h(_, norwegian, _, _, _),
    
    % 10. The man who smokes Blend lives next to the one who keeps cats.
    next_to(h(_, _, _, _, blend), h(_, _, _, cats, _), Hs),
    
    % 11. The man who keeps horses lives next to the man who smokes Dunhill.
    next_to(h(_, _, _, horses, _), h(_, _, _, _, dunhill), Hs),
    
    % 12. The owner who smokes BlueMaster drinks beer.
    member(h(_, _, beer, _, bluemaster), Hs),
    
    % 13. The German smokes Prince.
    member(h(_, german, _, _, prince), Hs),
    
    % 14. The Norwegian lives next to the blue house.
    next_to(h(_, norwegian, _, _, _), h(blue, _, _, _, _), Hs),
    
    % 15. The man who smokes Blend has a neighbor who drinks water.
    next_to(h(_, _, _, _, blend), h(_, _, water, _, _), Hs),
    
    % Someone owns fish
    member(h(_, _, _, fish, _), Hs).

% Helper predicates
different([]).
different([H|T]) :- 
    \+ member(H, T), 
    different(T).

left_of(A, B, Ls) :- append(_, [A,B|_], Ls).

next_to(A, B, Ls) :- left_of(A, B, Ls).
next_to(A, B, Ls) :- left_of(B, A, Ls).

