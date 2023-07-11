package agents.auction.behaviours;

import data.AuctionModel;
import data.Message;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.TickerBehaviour;
import jade.domain.DFService;
import jade.lang.acl.ACLMessage;
import lombok.SneakyThrows;
import lombok.extern.java.Log;

@Log
public class AuctionCycle extends TickerBehaviour {

    AuctionModel model;

    public AuctionCycle(Agent agent, AuctionModel model) {
        // Execute every second
        super(agent, 1000);
        this.model = model;
        agent.addBehaviour(new UpdateParticipants(this.model));
    }

    // Every second, update the auction data, then inform each agent that is participating
    // this auction with the new price.
    @Override
    @SneakyThrows
    protected void onTick() {
        switch (model.getCurrentState()) {
            case RUNNING -> {
                // We tick the time ONLY if the auction hasn't terminated
                model.tickTime();
                ACLMessage rawMessage = new ACLMessage(ACLMessage.INFORM);
                rawMessage.setSender(myAgent.getAID());
                rawMessage.setContentObject(new Message.ItemPrice(model.getCurrentBid()));
                model.getParticipants().forEach(rawMessage::addReceiver);
                myAgent.send(rawMessage);
            }
            case FINISHED -> {
                // The auction has finished, inform the winner then close this Behaviour
                ACLMessage message = new ACLMessage(ACLMessage.INFORM);
                message.setContentObject(new Message.Won(model.getCurrentBid()));
                AID winner = model.getParticipants().get(0);
                model.removeParticipant(winner);
                message.addReceiver(winner);
                myAgent.send(message);

                // Deregister from the DF service and remove this behaviour
                DFService.deregister(myAgent);
                myAgent.removeBehaviour(this);
            }
            case WAITING -> throw new RuntimeException("Cannot run the auction cycle before the minimum number of participants is reached");
        }
    }

}
