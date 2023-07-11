function visible_probability = hidden_state_to_visible_probabilities(rbm_w, hidden_state)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <hidden_state> is a binary matrix of size <number of hidden units> by <number of configurations that we're handling in parallel>.
% The returned value is a matrix of size <number of visible units> by <number of configurations that we're handling in parallel>.
% This takes in the (binary) states of the hidden units, and returns the activation probabilities of the visible units, conditional on those states.
% tip: use rbm_w'* hidden_state of which visible_probability will be a function: lth column concerns the lth configuration of the
% hidden units, obtained after the presentation of the lth element of the
% training set. The ith row is the total input arriving at visible unit i from the hidden layer. This is Delta_Ei.
net_input = rbm_w'*hidden_state;
visible_probability = 1 ./ (1 + exp(-net_input));
end
