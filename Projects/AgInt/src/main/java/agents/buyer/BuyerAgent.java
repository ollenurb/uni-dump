package agents.buyer;

import agents.buyer.behaviours.TryAuction;
import jade.core.Agent;
import jade.util.Logger;

import java.util.Random;

public class BuyerAgent extends Agent {

    Logger log = Logger.getJADELogger(this.getClass().getName());

    static float STARTING_PRICE = 100f;

    @Override
    protected void setup() {
        super.setup();

        // We determine the price that we are willing to spend for an item
        // by computing a random number from a Gaussian centered at the baseline price
        Random random = new Random();
        double expectedPrice = random.nextDouble(STARTING_PRICE, STARTING_PRICE * 5);
        log.info("[" + getName() + "] Got an expected price of " + expectedPrice);

        addBehaviour(new TryAuction((float) expectedPrice));
    }


}
