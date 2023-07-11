package data;

import jade.core.AID;
import lombok.Getter;
import lombok.Setter;
import lombok.SneakyThrows;
import ui.GUI;

import java.util.*;

public class AuctionModel {

    public enum State {
        WAITING,
        RUNNING,
        FINISHED
    }

    @Getter
    private State currentState = State.WAITING;

    // Store a reference of the GUI
    private final GUI gui;

    public static int MIN_PARTICIPANTS = 3;
    public static float PRICE_INCREMENT_PCT = 10;
    public static float MAX_PRICE = 300f;

    // Data related to this auction
    int elapsedTime = 0;
    @Getter
    float currentBid;
    @Getter
    List<AID> participants = Collections.synchronizedList(new ArrayList<>());
    @Getter
    List<AID> exParticipants = Collections.synchronizedList(new ArrayList<>());

    @Setter
    Runnable onMinParticipantsReached = () -> { };

    public AuctionModel() {
        // Setup price with a Random number
        Random random = new Random();
        currentBid = random.nextFloat(0, MAX_PRICE);

        // Setup GUI
        gui = new GUI();
        gui.updatePrice(currentBid);
        gui.setVisible(true);
    }

    // At each time step we must increase the price and the elapsed time
    @SneakyThrows
    public void tickTime() {
        // Add elapsed time
        elapsedTime++;
        // Modify current bid
        currentBid += (currentBid / 100) * PRICE_INCREMENT_PCT;
        // Update prices and time
        gui.updatePrice(currentBid);
        gui.updateTime(elapsedTime);
    }

    public void addParticipant(AID agent) {
        // When we add a new participant, we change the state from WAITING to RUNNING
        if (currentState == State.WAITING && participants.size() > MIN_PARTICIPANTS) {
            onMinParticipantsReached.run();
            currentState = State.RUNNING;
            gui.updateState(currentState.toString());
        }
        this.participants.add(agent);
        gui.addParticipant(agent.getLocalName());
    }

    public void removeParticipant(AID agent) {
        this.participants.remove(agent);
        // Keep track of removed participants
        this.exParticipants.add(agent);
        gui.removeParticipant(agent.getLocalName());

        // If the size is 1, we have finished the auction
        if (currentState == State.RUNNING && participants.size() == 1) {
            currentState = State.FINISHED;
            gui.updateState(currentState.toString());
        }
        // If we have finished the auction, just show the winner
        else if(currentState == State.FINISHED && participants.isEmpty()) {
            gui.showWinner(agent.getLocalName(), currentBid);
        }
    }

    public boolean isAuthorized(AID agent) {
        // No more agents in if it's finished
        if (currentState == State.FINISHED) {
            return false;
        }
        return !exParticipants.contains(agent);
    }
}