% This file was published on Wed Nov 14 20:48:30 2012, UTC.

function a4_main(n_hid, lr_rbm, lr_classification, n_iterations)

% first, train the rbm
    global report_calls_to_sample_bernoulli
    report_calls_to_sample_bernoulli = false;
    global data_sets
    if prod(size(data_sets)) ~= 1,
        error('You must run a4_init before you do anything else.');
    end
    
    global rbm_w;
    
    
    
    %create and initialize RBM
    model_shape= [n_hid, 256];
    training_data= data_sets.training;
    model = (a4_rand(model_shape, prod(model_shape)) * 2 - 1) * 0.1;
    
    momentum_speed = zeros(model_shape);
    mini_batch_size = 100;
    start_of_next_mini_batch = 1;
    for iteration_number = 1:n_iterations
        mini_batch = extract_mini_batch(training_data, start_of_next_mini_batch, mini_batch_size);
        start_of_next_mini_batch = mod(start_of_next_mini_batch + mini_batch_size, size(training_data.inputs, 2));
        if start_of_next_mini_batch ==0
            start_of_next_mini_batch =1;
        end
        gradient = cd1(model, mini_batch.inputs);
        momentum_speed = 0.9 * momentum_speed + gradient;
        model = model + momentum_speed * lr_rbm;
    end
    
    rbm_w= model;
    % rbm_w is now a weight matrix of <n_hid> by <number of visible units,
    % i.e. 256>. This is visualized in figure 1.
    show_rbm(rbm_w);
    
   
    
    %Up to here: result of training RBM.  Hidden units weights
    %visualized. Weights input hidden are those found by rbm:   
    input_to_hid = rbm_w;
   
    
    hidden_representation = logistic(input_to_hid * data_sets.training.inputs);
    % train hid_to_class
    data_2.inputs = hidden_representation;
    data_2.targets = data_sets.training.targets;
    
    
    
    
    
     %Now backprop
    
    [A,B,R,err,c]=retropro(data_sets.training.inputs', data_sets.training.targets', n_hid,lr_classification, 0.01, n_iterations, 2525);
    
    
    
    [d1,p1]=comparer(R',data_sets.training.targets);
   
    figure(2)
    plot(err);
   