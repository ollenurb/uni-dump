% +------------------------- Domain Knowledge -------------------------+

% Compute Euclidean distance between 2 stations
euclidean_distance(S1, S2, D) :-
    station(S1, PX, PY), % Query
    station(S2, QX, QY), % Query
    DX is PX - QX,
    DY is PY - QY,
    DE is sqrt(DX*DX + DY*DY), % Euclidean distance
    D is DE * 111.32. % From euclidean distance in KM (see doi:10.1088/1742-6596/1413/1/012032)

% Compute Haversine distance between 2 stations
haversine_distance(S1, S2, D):-
    station(S1, PX, PY), % Query
    station(S2, QX, QY), % Query
    DTR is 0.0174533, % Degrees-to-radians conversion factor
    ER is 6372, % Earth radius in kilometers
    D is 2 * ER * asin(sqrt(sin(((PX - QX) * DTR) / 2)**2  + cos(PX * DTR) * cos(QX * DTR) * sin(((PY - QY) * DTR) / 2)**2)). % Haversine formula

heuristic(agent(_, Station), D) :-
    goal_state(agent(_, GoalStation)),
    haversine_distance(Station, GoalStation, D).

% +----------------------------- Actions -----------------------------+
applicable(get_on(Line), agent(_, Station)) :-
    connected(Line, Station, _, _).

applicable(get_on(Line), agent(_, Station)) :-
    connected(Line, _, Station, _).

% You can get off a train if and only if you are actually riding a train
applicable(get_off(Position), agent(State, Position)) :-
    State \= stop.

applicable(stay_on(Position), agent(State, Position)) :-
    State \= stop.

% +----------------------------- Actions -----------------------------+
% The agent is steady at the station
apply(get_on(Line), agent(stop, Station), agent(NewState, Station)) :-
    NewState = moving(Line).

apply(get_off(_), agent(moving(_), Station), agent(NewState, Station)) :-
    NewState = stop.

% Don't get off the train
apply(stay_on(_), agent(moving(Line), Station), agent(moving(Line), NextStation)) :-
    connected(Line, Station, NextStation, _).

apply(stay_on(_), agent(moving(Line), Station), agent(moving(Line), NextStation)) :-
    connected(Line, NextStation, Station, _).

% Get the cost of a particular state
get_cost(agent(moving(Line), Station), agent(moving(Line), NextStation), Cost) :-
    connected(Line, Station, NextStation, Cost).
get_cost(agent(moving(Line), Station), agent(moving(Line), NextStation), Cost) :-
    connected(Line, NextStation, Station, Cost).
get_cost(agent(moving(_), _), agent(stop, _), Cost) :- Cost is 0. % Stopping at a station costs nothing
get_cost(agent(stop, _), agent(moving(_), _), Cost) :- Cost is 0. % Stopping at a station costs nothing
