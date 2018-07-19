my_reverse([], []).
my_reverse([H|T], R) :- my_reverse(T, Rev), append(Rev, [H], R).


my_length([], 0). 
my_length([H|T], N) :- my_length(T, N1), N is N1 + 1. 

my_member(X, [X|_]).
my_member(X, [_|T]) :- my_member(X, T).

my_subset(_, [], []). 
my_subset(Type, [H|Y], L) :-  (call(Type, H) ->   my_subset(Type, Y, NewL), append([H], NewL, L)) ; my_subset(Type, Y, L). 


my_intersect([], [], []).
my_intersect([_|_], [], []).
my_intersect([], [_|_], []).
my_intersect([H|T], [X|Y], L) :- (my_member(H, [X|Y]) ->  my_intersect(T, [X|Y], R), append([H], R, L) ; my_intersect(T, [X|Y], L)).

compute_change(0, 0, 0, 0, 0). 
compute_change(Money, Quarters, Dimes, Nickels, Pennies):- (Money >= 25 ->   M is Money - 25, compute_change(M, Q, D, N, P), Quarters is Q +1 , Dimes is D, Nickels is N, Pennies is P; 
                                                            Money >= 10, M is Money - 10, compute_change(M, Q, D, N, P), Quarters is Q, Dimes is D+1, Nickels is N, Pennies is P;
                                                            Money >= 5, M is Money - 5, compute_change(M, Q, D, N, P), Quarters is Q, Dimes is D, Nickels is N+1, Pennies is P;
                                                            M is Money - 1, compute_change(M, Q, D, N, P),Quarters is Q, Dimes is D, Nickels is N, Pennies is P + 1). 
                                                   
compose([], T, T).
compose([], [], []).
compose([H|T], [X|Y], [H, X|R]) :- !, compose(T, Y, R).
compose(T, [], T).

palindrome(B, R) :- my_reverse(B, Rev), append(B, Rev, R). 