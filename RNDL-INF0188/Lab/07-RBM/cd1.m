function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary)
%matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.

%WE GO UP!
visible_data = sample_bernoulli(visible_data);
%TO-DO First use visible_state_to_hidden_probabilities to calculate  probability
%hidden, store result in variable hidden_probabilities.
hidden_probabilities = visible_state_to_hidden_probabilities(rbm_w, visible_data);

%Then determine hidden states by using sample_bernoulli:
hidden_states = sample_bernoulli(hidden_probabilities);

%TO-DO: study the correlations between hidden and visible states. If you
%are dealing with several cases at the time, average these values (?????).
%Store result in stati_hidden_stati_visible_0
stati_hidden_stati_visible_0 = hidden_states * visible_data';

%TO-DO: From the hidden states establish the visual probabilities by using
%hidden_state_to_visible_probabilities. Store results in variable
%visible_probabilities.
visible_probabilities = hidden_state_to_visible_probabilities(rbm_w, hidden_states);

%THEN DOWN!

%Then establish visible states from probabilities by sampling:
visible_states= sample_bernoulli(visible_probabilities);

%THEN UP AGAIN!

%TO-DO Determine hidden probabilities from visible states.
hidden_probabilities = visible_state_to_hidden_probabilities(rbm_w, visible_states);

%Sample hidden states
hidden_states= sample_bernoulli(hidden_probabilities);


%TO-DO Study the correlations again. Store in stati_hidden_stati_visible_1
stati_hidden_stati_visible_1 = hidden_probabilities * visible_states';

% Return the graident approximation
ret = stati_hidden_stati_visible_0-stati_hidden_stati_visible_1;

end
