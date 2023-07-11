% +------------------+ Iterative Deepening Search +--------------------+
:- ['dls.pro'].

iterative_deepening_search(S, Depth, Path) :-
    write('\nTrying with depth: '),
    write(Depth),
    depth_limited_search(S, Depth, [], Path).
iterative_deepening_search(S, Depth, Path) :-
    NewDepth is Depth + 1,
    iterative_deepening_search(S, NewDepth, Path).
