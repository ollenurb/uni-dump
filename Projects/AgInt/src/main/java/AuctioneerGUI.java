import jason.asSemantics.ActionExec;

import java.util.function.Function;

import jason.architecture.AgArch;
import jason.asSyntax.NumberTerm;
import lombok.SneakyThrows;
import ui.GUI;

public class AuctioneerGUI extends AgArch {

    private int elapsedTime = 0;
    private final GUI gui;

    public AuctioneerGUI() {
        gui = new GUI();
        gui.setVisible(true);
    }

    @SneakyThrows
    @Override
    public void act(ActionExec action) {
        // Just to keep the code a bit cleaner
        Function<String, Boolean> matchesWith = n -> action.getActionTerm().getFunctor().startsWith(n);
        Function<Integer, String> getTermAndTrim = i -> action.getActionTerm().getTerm(i).toString().replaceAll("\"", "");

        // "Switch" on the type of the action
        if (matchesWith.apply("add_participant_gui")) {
            gui.addParticipant(getTermAndTrim.apply(0));
            action.setResult(true);
            actionExecuted(action);
        }
        else if (matchesWith.apply("remove_participant_gui")) {
            gui.removeParticipant(getTermAndTrim.apply(0));
            action.setResult(true);
            actionExecuted(action);
        }
        else if (matchesWith.apply("update_price_gui")) {
            float value = (float) ((NumberTerm) action.getActionTerm().getTerm(0)).solve();
            gui.updatePrice(value);
            action.setResult(true);
            actionExecuted(action);
        }
        else if (action.getActionTerm().getFunctor().startsWith("tick")) {
            elapsedTime += 1;
            gui.updateTime(elapsedTime);
            action.setResult(true);
            actionExecuted(action);
        }
        else if (action.getActionTerm().getFunctor().startsWith("show_winner_gui")) {
            String name = getTermAndTrim.apply(0);
            float value = (float) ((NumberTerm) action.getActionTerm().getTerm(1)).solve();
            gui.showWinner(name, value);
            action.setResult(true);
            actionExecuted(action);
        }
        else if (action.getActionTerm().getFunctor().startsWith("update_state_gui")) {
            String state = getTermAndTrim.apply(0);
            gui.updateState(state.toUpperCase());
            action.setResult(true);
            actionExecuted(action);
        }
        else {
            super.act(action);
        }
    }

    // Cleanup GUI
    @Override
    public void stop() {
        gui.dispose();
        super.stop();
    }

}
