% +---------------------+ Depth Limited Search +-----------------------+
depth_limited_search(S, _, _, []) :- goal_state(S), !.
depth_limited_search(S, Depth, Visited, [Action | Actions]) :-
    applicable(Action, S),
    apply(Action, S, NewState),
    \+member(NewState, Visited),
    Depth > 0, NewDepth is Depth - 1,
    depth_limited_search(NewState, NewDepth,  [S | Visited], Actions).
