% +------------------+ Iterative Deepening A-Star +--------------------+
iterative_deepening_a_star(S, Cutoff, Plan) :-
    write('\nTrying with cutoff: '),
    write(Cutoff),
    search(S, Cutoff, 0, [], Plan).
iterative_deepening_a_star(S, _, Path) :-
    compute_new_cutoff(NewCutoff),
    iterative_deepening_a_star(S, NewCutoff, Path).

search(S, _, _, _, []) :- % Goal case
    goal_state(S),
    retractall(failedFValue(_)), !. % Retract asserted failedFValue(s) to keep the KB consistent after execution
search(S, Cutoff, GValue, Visited, [Action | Actions]) :- % Success case: f(n) <= Cutoff
    applicable(Action, S),
    apply(Action, S, NewState),
    \+member(NewState, Visited),
    compute_new_state_costs(S, NewState, GValue, FValNew, GValNew),
    FValNew =< Cutoff, % IDA*: if the current FValue <= Cutoff, continue the search
    search(NewState, Cutoff, GValNew, [S | Visited], Actions).
search(S, Cutoff, GValue, Visited, [Action | _]) :- % Failure case: f(n) > Cutoff
    applicable(Action, S),
    apply(Action, S, NewState),
    \+member(NewState, Visited),
    compute_new_state_costs(S, NewState, GValue, FValNew, _),
    FValNew > Cutoff, % IDA*: if the current FValue > Cutoff, fail.
    assertz(failedFValue(FValNew)), % Assert che current FValue for the calculation of the next Cutoff
    !, fail.

% Compute f(n) = g(n) + h(n)
compute_new_state_costs(State, NewState, GValue, FValNew, GValNew) :-
    get_cost(State, NewState, Cost), % unifies with the real cost between two states, i.e. g(n)
    GValNew is GValue + Cost,
    heuristic(State, HValNew),
    FValNew is GValNew + HValNew.

% IDA*: The new cutoff is the minimum of the previous failures-related FValues
compute_new_cutoff(NewCutoff) :-
    findall(FV, failedFValue(FV), FValues),
    min_list(FValues, NewCutoff),
    retractall(failedFValue(_)).
