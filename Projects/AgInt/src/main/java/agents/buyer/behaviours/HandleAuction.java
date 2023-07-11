package agents.buyer.behaviours;

import data.Message;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import jade.util.Logger;
import lombok.SneakyThrows;

class HandleAuction extends Behaviour {
    Logger log = Logger.getJADELogger(this.getClass().getName());

    float expectedPrice;
    boolean done = false;

    public HandleAuction(float expectedPrice) {
        this.expectedPrice = expectedPrice;
    }

    @SneakyThrows
    @Override
    public void action() {
        MessageTemplate template = MessageTemplate.MatchPerformative(ACLMessage.INFORM);
        ACLMessage message = myAgent.receive(template);
        if (message != null) {
            Message messageContent = (Message) message.getContentObject();

            if(messageContent instanceof Message.ItemPrice) {
                // The price has reached a number too high, exit the auction
                if (((Message.ItemPrice) messageContent).price > expectedPrice) {
                    this.done = true;
                    myAgent.addBehaviour(new ExitAuction(message.getSender(), expectedPrice));
                }
            }
            // We actually won the auction
            else if(messageContent instanceof Message.Won) {
                this.done = true;
                log.info("[" + myAgent.getLocalName() + "] I WON!");
                myAgent.addBehaviour(new TryAuction(expectedPrice));
            } else {
                throw new RuntimeException("Cannot handle this message body!");
            }
        } else {
            block();
        }
    }

    @Override
    public boolean done() {
        return this.done;
    }
}
