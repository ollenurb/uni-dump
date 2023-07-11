import agents.auction.AuctionAgent;
import agents.buyer.BuyerAgent;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.util.ExtendedProperties;
import jade.util.leap.Properties;
import jade.wrapper.AgentContainer;
import jade.wrapper.AgentController;
import jade.wrapper.ControllerException;
import lombok.SneakyThrows;

import java.util.Random;

import static java.lang.Integer.parseInt;

public class Main {

    @SneakyThrows
    public static void main(String[] args) {
        try {
            // Parse CLI arguments
            if (args.length < 2) {
                throw new IllegalArgumentException();
            }
            int numAuctions = parseInt(args[0]);
            int numBuyers = parseInt(args[1]);

            // Start agents
            Runtime runtime = Runtime.instance();
            Properties properties = new ExtendedProperties();

            properties.setProperty(Profile.GUI, "true");

            Profile profile = new ProfileImpl(properties);
            AgentContainer mainContainer = runtime.createMainContainer(profile);

            // Create and start Auctions
            for (int i = 0; i < numAuctions; i++) {
                AgentController auction = mainContainer.createNewAgent("Auction " + i, AuctionAgent.class.getName(), new Object[]{});
                auction.start();
            }

            Random random = new Random();
            // Create and start Buyers
            for (int i = 0; i < numBuyers; i++) {
                AgentController buyer = mainContainer.createNewAgent("Buyer" + i, BuyerAgent.class.getName(), new Object[]{});
                buyer.start();
            }
        } catch (ControllerException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            System.out.println("Wrong arguments, expected: <NUM_AUCTIONS> <NUM_BUYERS>");
        }
    }

}
