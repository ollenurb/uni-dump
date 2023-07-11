package agents.auction.behaviours;

import data.AuctionModel;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import jade.util.Logger;

public class UpdateParticipants extends CyclicBehaviour {

    Logger log = Logger.getJADELogger(this.getClass().getName());

    AuctionModel model;

    public UpdateParticipants(AuctionModel model) { this.model = model; }

    @Override
    public void action() {
        // Handle CANCEL messages by keeping in mind that multiple agents may request it on the same time
        MessageTemplate template = MessageTemplate.MatchPerformative(ACLMessage.CANCEL);
        ACLMessage message = myAgent.receive(template);
        // We handle the message ONLY if the auction is running. Otherwise, a WIN message will
        // be sent by the AuctionCycle
        if (message != null && model.getCurrentState() == AuctionModel.State.RUNNING) {
            model.removeParticipant(message.getSender());
            message = message.createReply();
            message.setPerformative(ACLMessage.CONFIRM);
            myAgent.send(message);
        } else {
            block();
        }
    }

}
