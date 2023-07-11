function hidden_probability = visible_state_to_hidden_probabilities(rbm_w, visible_state)
% <rbm_w> is a matrix of size <number of hidden units> by <number of
% visible units>, for the weights connecting visible and hidden units.
% <visible_state> is a binary matrix of size <number of visible units> by
% <number of configurations that we're handling in parallel>.
% The returned value is a matrix of size <number of hidden units> by <number of configurations that we're handling
% in parallel>.
% This takes in the (binary) states of the visible units, and returns the activation probabilities of
% the hidden units conditional on those states.
% Tip: the probability is a function of (rbm_w*visible_state) which has
% dimension hidden * number of cases (inputs dealt in parallel) in which given a column l (relative to
% trainining element l) the ith row is the total input arriving at hidden unit i when the lth training element is presented(sum_j s_jw_ij).
%This is Delta_Ei. Recall that the temperature is 1.
net_input = rbm_w * visible_state;
hidden_probability = 1 ./ (1 + exp(-net_input));
end
