package agents.buyer.behaviours;

import data.Message;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;
import jade.core.behaviours.Behaviour;
import jade.domain.DFService;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import jade.util.Logger;
import lombok.SneakyThrows;
import java.util.Arrays;
import java.util.Stack;
import java.util.stream.Collectors;

public class TryAuction extends Behaviour {

    Logger log = Logger.getJADELogger(this.getClass().getName());

    enum State {
        SEARCH,
        REQUEST_PRICE,
        WAIT_RESPONSE,
        SLEEP
    }

    float expectedPrice;
    State currentState = State.SEARCH;
    Stack<DFAgentDescription> auctions;

    public TryAuction(float expectedPrice) {
        this.expectedPrice = expectedPrice;
    }

    @SneakyThrows
    @Override
    public void action() {
        switch (currentState) {
            // Search for auctions
            case SEARCH -> {
                ServiceDescription serviceDescription = new ServiceDescription();
                serviceDescription.setName("Auction");
                serviceDescription.setType("Auction");
                DFAgentDescription dfAgentDescription = new DFAgentDescription();
                dfAgentDescription.addServices(serviceDescription);
                DFAgentDescription[] result = DFService.search(myAgent, dfAgentDescription);
                auctions = Arrays.stream(result).collect(Collectors.toCollection(Stack::new));
                log.info("[" + myAgent.getLocalName() + "] got a stack of " + result.length + " auctions");
                currentState = State.REQUEST_PRICE;
            }

            // Request the price of Auction at the TOS
            case REQUEST_PRICE -> {
                ACLMessage message = new ACLMessage(ACLMessage.QUERY_REF);
                message.setSender(myAgent.getAID());
                message.addReceiver(auctions.peek().getName());
                myAgent.send(message);
                log.info("[" + myAgent.getLocalName() + "] Sent a price request");
                currentState = State.WAIT_RESPONSE;
            }

            // Wait for the auctioneer to respond to our price request
            // When he responds, evaluate if the price is good. If it matches out needs, then transition into
            // another state by advancing the protocol, otherwise remove this auction from the TOS and keep going eventually
            case WAIT_RESPONSE -> {
                MessageTemplate pattern = MessageTemplate.or(
                        MessageTemplate.MatchPerformative(ACLMessage.INFORM),
                        MessageTemplate.MatchPerformative(ACLMessage.REFUSE)
                );
                ACLMessage message = myAgent.receive(pattern);
                if (message != null && message.getPerformative() == ACLMessage.INFORM) {
                    Message messageContent = (Message) message.getContentObject();
                    // Evaluate the current price with our expected price. If it's reasonable, enter the auction
                    if (messageContent instanceof Message.ItemPrice itemPrice && itemPrice.price < expectedPrice) {
                        log.info("[" + myAgent.getLocalName() + "] Received a price of " + itemPrice.price);
                        // The price is reasonable, send a request to enter, then change state
                        message = message.createReply();
                        message.setPerformative(ACLMessage.REQUEST);
                        myAgent.send(message);
                        myAgent.addBehaviour(new HandleAuction(expectedPrice));
                        myAgent.removeBehaviour(this);
                    } else {
                        auctions.pop();
                        currentState = State.REQUEST_PRICE;
                    }
                } else if(message != null && message.getPerformative() == ACLMessage.REFUSE) {
                    // Cannot enter this auction, try another one
                    auctions.pop();
                    currentState = State.REQUEST_PRICE;
                } else {
                    block();
                }
            }

            case SLEEP -> {
                block(3_000);
                currentState = State.SEARCH;
                log.info("[" + myAgent.getLocalName() + "] No auction found, retrying after 3 seconds");
            }

        }
    }

    @Override
    public boolean done() {
        // We reached the end, then transition to the SLEEP state
        if (auctions.isEmpty() && currentState != State.SEARCH) {
            currentState = State.SLEEP;
        }
        // Basically a cyclic behaviour with custom checks added
        return false;
    }

}
