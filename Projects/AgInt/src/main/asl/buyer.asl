// Buyer Agent

// ====== Goals ======

!start.

// ====== Plans ======

+!start
    <- .random(R);
       P = (100 + (R * 400)); // generate a random number between 100 and 500
       +expected_price(P);
       !main_cycle.

+!main_cycle
    <- .print("Searching for auctions");
       .wait(500);
       .df_search("Auction", SearchResult);
       !try_auctions(SearchResult);
       !main_cycle.

// Try each auction in turn until you find one that suits your needs
// If you didn't find any, wait for some seconds
+!try_auctions([]) <- .println("No auction found, waiting 5 seconds before retrying"); .wait(5000).
+!try_auctions([Auction | Tail])
     <- -price(_);
        .send(Auction, askOne, price(_), price(P));
        .print(Auction, " responded with ", P);
        if (expected_price(EP) & P < EP) {
            .print("That's a pretty good price, requesting to enter...");
            // Request to enter
            .send(Auction, askOne, allowed(_), allowed(Allowed));
            .print("Received ", Allowed);
            // We are allowed to enter. Add the auction's name to the beliefs base and start the cycle to handle the auction.
            if (Allowed) {
                .my_name(Name);
                .send(Auction, achieve, add_participant(Name));
                +auction(Auction);
                !handle_auction;
            }
            // Request failed, try with another auction
            else { !try_auctions(Tail); }
        } else {
            .print("Bad price! Re-Evaluate!");
            !try_auctions(Tail);
        }.

+!handle_auction : auction(Auction)
    <-  .println("Waiting for the update on the price..");
        -price(_);
        .wait({ +price(P) }); // Wait for the auctioneer to update my belief
        .print("Received price ", P);
        if(expected_price(EP) & P > EP) {
            .print("It costs too much, leaving...");
            .my_name(Me);
            // Tell the auction to remove me
            .send(Auction, achieve, remove_participant(Me));
            -auction(Auction);
        } else {
            -price(P);
            !handle_auction;
        }.