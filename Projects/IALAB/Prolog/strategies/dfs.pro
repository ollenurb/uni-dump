% +-----------------------+ Depth First Search +-----------------------+
depth_first_search(S, _, []) :- goal_state(S), !.
depth_first_search(S, Visited, [Action | Actions]) :-
    applicable(Action, S),
    apply(Action, S, NewState),
    \+member(NewState, Visited),
    depth_first_search(NewState, [S | Visited], Actions).

