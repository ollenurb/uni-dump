package agents.auction.behaviours;

import data.AuctionModel;
import data.Message;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import jade.util.Logger;
import lombok.SneakyThrows;

public class HandlePriceRequest extends CyclicBehaviour {

    Logger log = Logger.getJADELogger(this.getClass().getName());

    AuctionModel model;

    public HandlePriceRequest(AuctionModel model) {
        this.model = model;
    }

    @SneakyThrows
    @Override
    public void action() {
        MessageTemplate pattern = MessageTemplate.or(
            MessageTemplate.MatchPerformative(ACLMessage.QUERY_REF),
            MessageTemplate.MatchPerformative(ACLMessage.REQUEST)
        );

        ACLMessage message = myAgent.receive(pattern);

        if (message != null) {
            if(message.getPerformative() == ACLMessage.REQUEST) {
                log.info("[ "  + myAgent.getLocalName() + " ] " + message.getSender().getLocalName()  + " has requested to enter, letting him in");
                model.addParticipant(message.getSender());
            } else {
                // If the agent is authorized, reply with the price (INFORM), otherwise reply with REFUSE
                ACLMessage reply = message.createReply();
                if (model.isAuthorized(message.getSender())) {
                    log.info("[ "  + myAgent.getLocalName() + " ] " + message.getSender().getLocalName()  + " is authorized, sending price");
                    // Reply with the current auction price
                    reply.setContentObject(new Message.ItemPrice(model.getCurrentBid()));
                    reply.setPerformative(ACLMessage.INFORM);
                } else {
                    log.info("[ "  + myAgent.getLocalName() + " ] " + message.getSender().getLocalName()  + " is not authorized!");
                    reply.setPerformative(ACLMessage.REFUSE);
                }
                myAgent.send(reply);
            }
        } else {
            block();
        }
    }
}
