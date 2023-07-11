package agents.buyer.behaviours;

import data.Message;
import jade.core.AID;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import jade.util.Logger;
import lombok.SneakyThrows;

public class ExitAuction extends Behaviour {
    Logger log = Logger.getJADELogger(this.getClass().getName());

    enum State {
        SEND_MESSAGE,
        WAIT_RESPONSE,
    }

    boolean done = false;

    AID auctionId;
    State currentState = State.SEND_MESSAGE;
    float expectedPrice;

    public ExitAuction(AID auctionId, float expectedPrice) {
        this.auctionId = auctionId;
        this.expectedPrice = expectedPrice;
    }

    @SneakyThrows
    @Override
    public void action() {
        switch (currentState) {
            case SEND_MESSAGE -> {
                ACLMessage message = new ACLMessage(ACLMessage.CANCEL);
                message.setSender(myAgent.getAID());
                message.addReceiver(auctionId);
                myAgent.send(message);
                currentState = State.WAIT_RESPONSE;
            }
            case WAIT_RESPONSE -> {
                MessageTemplate pattern = MessageTemplate.or(
                        MessageTemplate.MatchPerformative(ACLMessage.INFORM),
                        MessageTemplate.MatchPerformative(ACLMessage.CONFIRM)
                );
                ACLMessage message = myAgent.receive(pattern);
                // We may receive either a WON message or CONFIRM message.
                if (message != null) {
                    switch (message.getPerformative()) {
                        case ACLMessage.INFORM -> {
                            if(message.getContentObject() instanceof Message.Won) {
                                log.info("[" + myAgent.getLocalName() + "] I won the item!");
                            } else {
                                throw new RuntimeException("Expected WON message, received " + message.getClass().getTypeName());
                            }
                        }
                        case ACLMessage.CONFIRM -> log.info("[" + myAgent.getLocalName() + "] Exiting the auction...");
                    }
                    myAgent.addBehaviour(new TryAuction(expectedPrice));
                    done = true;
                } else {
                    block();
                }
            }
        }
    }

    @Override
    public boolean done() {
        return done;
    }
}
