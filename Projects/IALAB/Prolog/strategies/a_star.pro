% +-------------------------+ A-Star Search +--------------------------+
% There are multiple ways of implementing A-Star. We could have represented the
% Queue as a list and took its minimum each time which is O(N), or we could
% have used a priority queue (aka min-heap) to store our nodes. Our idea is to
% represent a Node as a predicate `node(State, Path, GValue, FValue)` where:
% - State is the state that the node represent
% - PathToS is the path from the start node to State
% - GValue is g(State)
% - FValue is f(State)
% Then, we keep a sorted queue of nodes (by their FValue) so that the retrieval
% is O(1) (min is always the first element). This approach is also better than
% the priority queue apporach because we essentially need to bulk-insert a
% bunch of nodes into the Queue each time, thus keeping the operation
% logarithmic.

a_star([node(State, PathToS, _, _) | _], _, PathToS) :- goal_state(State), !.
a_star([node(State, PathToS, GValue, _) | QueueT], Closed, Path) :-
    % Get the list of applicable actions in the selected state
    findall(Action, applicable(Action, State), ApplicableActions),
    % Convert the list of applicable actions to a list of nodes by applying the predicate expand_node
    convlist(expand_node(Closed, State, PathToS, GValue), ApplicableActions, ExpandedStates), % "partially applied" expand_node
    % Bulk-Add into the queue generated nodes
    append(QueueT, ExpandedStates, Queue),
    % Sort queue by the 4th element of the compound `node` term (which is the f value)
    sort(4, @=<, Queue, SortedQueue),
    a_star(SortedQueue, [State | Closed], Path).

% Expand the given Action, returning false if the resulting State has already
% been expanded. After having expanded the action into a valid State, it
% transforms it into a node by computing its FValue, GValue and HValue.
expand_node(Closed, State, PathToS, GValue, Action, Node) :-
    apply(Action, State, NewState),
    \+member(NewState, Closed),
    % Get the "REAL" cost between two states
    get_cost(State, NewState, Cost),
    GValNew is GValue + Cost,
    heuristic(State, HValNew),
    FValNew is GValNew + HValNew,
    NewPathToS = [Action | PathToS],
    Node = node(NewState, NewPathToS, GValNew, FValNew).
