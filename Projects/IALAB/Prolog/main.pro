:- ['domain.pro'].
:- ['actions.pro'].
:- ['strategies/a_star.pro'].
:- ['strategies/dfs.pro'].
:- ['strategies/dls.pro'].
:- ['strategies/id.pro'].
:- ['strategies/ida_star.pro'].

% "Driver" predicate. Applies the given strategy returning the solution.
plan_solution(Strategy) :-
    start_state(S0),
    apply_strategy(Strategy, S0, Plan),
    write('\nPlan: \n'),
    write(Plan).

% apply_strategy/3
% Apply the given strategy to solve the problem
apply_strategy('depth_first', S0, Plan) :- depth_first_search(S0, [], Plan).
apply_strategy('depth_limited', S0, Plan) :- depth_limited_search(S0, 100, [], Plan).
apply_strategy('id', S0, Plan) :-  iterative_deepening_search(S0, 1, Plan).
apply_strategy('a_star', S0, Plan) :-
    a_star([node(S0, [], 0, 0)], [], ReversedPlan),
    reverse(ReversedPlan, Plan).
apply_strategy('ida_star', S0, Plan) :-
    heuristic(S0, HValue),
    iterative_deepening_a_star(S0, HValue, Plan).
