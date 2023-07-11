package agents.auction;

import agents.auction.behaviours.AuctionCycle;
import agents.auction.behaviours.HandlePriceRequest;
import data.AuctionModel;
import jade.core.Agent;
import jade.domain.DFService;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;
import lombok.SneakyThrows;
import lombok.extern.java.Log;

@Log
public class AuctionAgent extends Agent {

    // Stores data related to this auction
    AuctionModel model;

    @SneakyThrows
    @Override
    protected void setup() {
        super.setup();
        this.model = new AuctionModel();

        // Register yourself as an available auction service
        ServiceDescription serviceDescription = new ServiceDescription();
        serviceDescription.setName("Auction");
        serviceDescription.setType("Auction");
        DFAgentDescription dfAgentDescription = new DFAgentDescription();
        dfAgentDescription.setName(getAID());
        dfAgentDescription.addServices(serviceDescription);
        DFService.register(this, dfAgentDescription);

        // Setup listener that will get called whenever the minimum number of participants is reached
        model.setOnMinParticipantsReached(() -> addBehaviour(new AuctionCycle(this, model)));
        // Setup basic messages handler
        addBehaviour(new HandlePriceRequest(model));
    }

}
