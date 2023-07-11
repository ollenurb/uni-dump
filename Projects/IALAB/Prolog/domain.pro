% +------------------------- Domain Knowledge -------------------------+
% For testing purposes, domain is for now Milan Metro
:- ['trainsforeurope.pro'].

% Start/Goal state
% The state is represented as a functor `agent(State, Position).` where:
% - State = stop | on(Line, Direction)
% - Position = station_1 | station_2 | ...

start_state(agent(stop, amsterdam)).
goal_state(agent(stop, syracuse)).
