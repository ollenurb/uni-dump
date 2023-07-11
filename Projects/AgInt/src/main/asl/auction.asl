// Auction Agent

// ====== Beliefs ======

state(waiting).
participants([]).
ex_participants([]).

// ====== Goals ======

!start.

// ====== Plans ======

+!start
    <- .random(R);
       P = R * 300;
       +price(P);
       update_price_gui(P);
       .print("Registering DF_Service");
       .df_register("Auction").

// Handle incoming requests messages from potential buyers
// Buyers are allowed if and only if they haven't already participated to the auction before.
+?allowed(P)[source(Ag)] : ex_participants(EP) & .member(Ag, EP) <- P = false.
+?allowed(P)[source(Ag)] : ex_participants(EP) &  not .member(Ag, EP) <- P = true.

// Update the state (had to do it like this because the thread hanged while updating the UI)
+state(finish)
    <- .df_deregister("Auction");
        .print("+================+ DEREGISTERED FROM DF +================+");
        update_state_gui(finish).

+state(S) <- update_state_gui(S).

// Note: The reason why remove_participant and add_participant are tagged as atomics is
// that they are concurrently called by more than one agent.
// Add a new participant to the auction
@[atomic]
+!add_participant(P)
    : participants(X) & not state(finish)
    <- -+participants([P | X]);
       add_participant_gui(P);              // Update the gui
       .print(P, " has entered the room").

// Remove a participant, updating the ex_participants with its value
@[atomic]
+!remove_participant(P)
    <- -participants(X);
       -ex_participants(E);
       .delete(P, X, PP);
       remove_participant_gui(P);           // Update the gui
       +participants(PP);
       +ex_participants([P | E]);
       .print(P, " has left the room").

// Starts the auction whenever we reached the minimum required number of participants
+participants(P)
    : .length(P) >= 2 & state(waiting)
    <- -+state(running);
       .print("Minimum number of participants reached, starting...");
       !!auction_cycle.

@[atomic]
+participants(P) : .length(P) == 1 & state(running)
    <- -+state(finish);
       ?price(Price);
       show_winner_gui(P, Price).

// Update the price each second, informing the participants with the new price
+!auction_cycle
    : participants(PL) & .length(PL) > 1 & state(running)
    <- .wait(1000);
       -price(P);
       I = (P / 100) * 10;
       NP = P + I;
       +price(NP);
       // Send the new price to participants
       ?participants(PP);
       !inform_participants(PP);
       // Update GUI
       update_price_gui(NP);
       tick;
       !auction_cycle.

// Avoid having warnings
-!auction_cycle <- true.

// Inform participants of the new price
+!inform_participants([]).
+!inform_participants([H | T])
    <- ?price(P);
       .print("Informing ", P);
       .send(H, tell, price(P));
       !inform_participants(T).