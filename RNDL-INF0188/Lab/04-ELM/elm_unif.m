function [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm_unif(P, T, TV_P, TV_T, Elm_Type, NumberofHiddenNeurons, ActivationFunction, RangeTarget)

% Usage: elm(TrainingData_File, TestingData_File, Elm_Type, NumberofHiddenNeurons, ActivationFunction)
% OR:    [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm(TrainingData_File, TestingData_File, Elm_Type, NumberofHiddenNeurons, ActivationFunction)
%
% Input:
% TrainingData_File     - Filename of training data set (normalized) .txt
% TestingData_File      - Filename of testing data set  (normalized) .txt
% Elm_Type              - 0 for regression; 1 for (both binary and multi-classes) classification
% NumberofHiddenNeurons - Number of hidden neurons assigned to the ELM
% ActivationFunction    - Type of activation function:
%                           'sig' for Sigmoidal function
%                           'sin' for Sine function
%                           'hardlim' for Hardlim function
%                           'tribas' for Triangular basis function
%                           'radbas' for Radial basis function (for additive type of SLFNs instead of RBF type of SLFNs)
%
% Output:
% TrainingTime          - Time (seconds) spent on training ELM
% TestingTime           - Time (seconds) spent on predicting ALL testing data
% TrainingAccuracy      - Training accuracy:
%                           RMSE for regression or correct classification rate for classification
% TestingAccuracy       - Testing accuracy:
%                           RMSE for regression or correct classification rate for classification
%
% MULTI-CLASSE CLASSIFICATION: NUMBER OF OUTPUT NEURONS WILL BE AUTOMATICALLY SET EQUAL TO NUMBER OF CLASSES
% FOR EXAMPLE, if there are 7 classes in all, there will have 7 output
% neurons; neuron 5 has the highest output means input belongs to 5-th class
%
% Sample1 regression: [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm('sinc_train', 'sinc_test', 0, 20, 'sig')
% Sample2 classification: elm('diabetes_train', 'diabetes_test', 1, 20, 'sig')
%
    %%%%    Authors:    MR QIN-YU ZHU AND DR GUANG-BIN HUANG
    %%%%    NANYANG TECHNOLOGICAL UNIVERSITY, SINGAPORE
    %%%%    EMAIL:      EGBHUANG@NTU.EDU.SG; GBHUANG@IEEE.ORG
    %%%%    WEBSITE:    http://www.ntu.edu.sg/eee/icis/cv/egbhuang.htm
    %%%%    DATE:       APRIL 2004

%disp('unif')

%%%%%%%%%%% Macro definition
REGRESSION = 0;
CLASSIFIER = 1;

% % %%%%%%%%%%% Load training dataset
% % train_data=load(TrainingData_File);
% % T=train_data(:,1)';
% % P=train_data(:,2:size(train_data,2))';
% % clear train_data;                                   %   Release raw training data array
% %
% % %%%%%%%%%%% Load testing dataset
% % test_data=load(TestingData_File);
% % TV_T = test_data(:,1)'; %disp (TV_T(1:5))
% % TV_P=test_data(:,2:size(test_data,2))';
% % clear test_data;                                    %   Release raw testing data array

NumberofTrainingData = size(P,2);
NumberofTestingData = size(TV_P,2);
NumberofInputNeurons = size(P,1);

% % if Elm_Type~=REGRESSION
% %     %%%%%%%%%%%% Preprocessing the data of classification
% % %     sorted_target=sort(cat(2,T,TV_T),2);
% % %     label=zeros(1,1);                               %   Find and save in 'label' class label from training and testing data sets
% % %     label(1,1)=sorted_target(1,1);
% % %     j=1;
% % %     for i = 2:(NumberofTrainingData+NumberofTestingData)
% % %         if sorted_target(1,i) ~= label(1,j)
% % %             j=j+1;
% % %             label(1,j) = sorted_target(1,i);
% % %         end
% % %     end
% % %     number_class=j;
% %
% %     target = cat(2,T,TV_T);
% %     label = unique(target);
% %     number_class = length(label);
% %     NumberofOutputNeurons = number_class
% %
% %     %%%%%%%%%% Processing the targets of training
% % %     temp_T=zeros(NumberofOutputNeurons, NumberofTrainingData);
% %     temp_T = -ones(NumberofOutputNeurons, NumberofTrainingData);
% %     for i = 1:NumberofTrainingData
% %         for j = 1:number_class
% %             if label(1,j) == T(1,i)
% %                 break;
% %             end
% %         end
% %         temp_T(j,i)=1;
% %     end
% % %     T=temp_T*2-1;
% %     T = temp_T;
% %
% %     %%%%%%%%%% Processing the targets of testing
% % %     temp_TV_T=zeros(NumberofOutputNeurons, NumberofTestingData);
% %     temp_TV_T = -ones(NumberofOutputNeurons, NumberofTestingData);
% %     for i = 1:NumberofTestingData
% %         for j = 1:number_class
% %             if label(1,j) == TV_T(1,i)
% %                 break;
% %             end
% %         end
% %         temp_TV_T(j,i)=1;
% %     end
% % %     TV_T=temp_TV_T*2-1;
% %     TV_T = temp_TV_T;
% %
% % end                                                 %   end if of Elm_Type

%%%%%%%%%%% Calculate weights & biases
start_time_train = cputime;

%%%%%%%%%%% Random generate input weights InputWeight (w_i) and biases BiasofHiddenNeurons (b_i) of hidden neurons
%rand('state',32);	%AGGIUNTA ELM
%%%%%%%%%%% Uniform weights
InputWeight=rand(NumberofHiddenNeurons,NumberofInputNeurons)*2-1;      %Huang
%InputWeight = rand(NumberofHiddenNeurons,NumberofInputNeurons)*2*sqrt(1/NumberofHiddenNeurons)-sqrt(1/NumberofHiddenNeurons);
BiasofHiddenNeurons=rand(NumberofHiddenNeurons,1)*2-1;   %Huang
%BiasofHiddenNeurons = rand(NumberofHiddenNeurons,1)*2*sqrt(1/NumberofHiddenNeurons)-sqrt(1/NumberofHiddenNeurons);

%%%%%%%%%%% Uniform weights
tempH = InputWeight*P;
clear P;                                            %   Release input of training data
ind = ones(1,NumberofTrainingData);
BiasMatrix = BiasofHiddenNeurons(:,ind);              %   Extend the bias matrix BiasofHiddenNeurons to match the demention of H
tempH = tempH+BiasMatrix;

%%%%%%%%%%% Calculate hidden neuron output matrix H
switch lower(ActivationFunction)
    case {'sig','sigmoid'}
        %%%%%%%% Sigmoid
        H = 1 ./ (1 + exp(-tempH));
    case {'sin','sine'}
        %%%%%%%% Sine
        H = sin(tempH);
    case {'hyptan'}
        %%%%%%%% Hyperbolic tangent
        H =(exp(tempH/10)-exp(-tempH/10))./(exp(tempH/10)+exp(-tempH/10));
    case {'tribas'}
        %%%%%%%% Triangular basis function
        H = tribas(tempH);   % not existent
    case {'radbas'}
        %%%%%%%% Radial basis function
        H = radbas(tempH);   % not existent
        %%%%%%%% More activation functions can be added here
end
clear tempH;                                        %   Release the temparary array for calculation of hidden neuron output matrix H

%%%%%%%%%%% Calculate output weights OutputWeight (beta_i)
[h1,h2] = size(H);        %AGGIUNTA ELM
OutputWeight = pinv(H') * T';                        % slower implementation
%lambda = 0.003;
%OutputWeight=inv(H * H'+ lambda*eye(h1)) * H * T';
% OutputWeight=inv(H * H') * H * T';               % faster implementation
end_time_train = cputime;
TrainingTime = end_time_train-start_time_train;        %   Calculate CPU time (seconds) spent for training ELM

%%%%%%%%%%% Calculate the training accuracy
Y=(H' * OutputWeight)';                             %   Y: the actual output of the training data
% % if Elm_Type == REGRESSION
% %     TrainingAccuracy = sqrt(mse(T - Y));               %   Calculate training accuracy (RMSE) for regression case
% %     TrainingAccuracy_orig = sqrt(mse(RangeTarget*(T - Y)));       %   Calculate train accuracy (RMSE) in original interval (normalized x max-min)
% % end

% clear H;

%%%%%%%%%%% Calculate the output of testing input
start_time_test = cputime;
tempH_test = InputWeight*TV_P;
clear TV_P;             %   Release input of testing data
ind = ones(1,NumberofTestingData);
BiasMatrix = BiasofHiddenNeurons(:,ind);              %   Extend the bias matrix BiasofHiddenNeurons to match the demention of H
tempH_test = tempH_test + BiasMatrix;
switch lower(ActivationFunction)
    case {'sig','sigmoid'}
        %%%%%%%% Sigmoid
        H_test = 1 ./ (1 + exp(-tempH_test));
    case {'sin','sine'}
        %%%%%%%% Sine
        H_test = sin(tempH_test);
    case {'hyptan'}
        %%%%%%%% Hyperbolic tangent
        H_test =(exp(tempH_test/10)-exp(-tempH_test/10))./(exp(tempH_test/10)+exp(-tempH_test/10));
    case {'tribas'}
        %%%%%%%% Triangular basis function
        H_test = tribas(tempH_test);
    case {'radbas'}
        %%%%%%%% Radial basis function
        H_test = radbas(tempH_test);
        %%%%%%%% More activation functions can be added here
end
TY = (H_test' * OutputWeight)';                       %   TY: the actual output of the testing data
% sizeTY = size(TY)
end_time_test = cputime;
TestingTime = end_time_test-start_time_test;           %   Calculate CPU time (seconds) spent by ELM predicting the whole testing data

if Elm_Type == REGRESSION

    TrainingAccuracy = sqrt(mse(T - Y));               %   Calculate training accuracy (RMSE) for regression case
    TrainingAccuracy_orig = sqrt(mse(RangeTarget*(T - Y)));       %   Calculate train accuracy (RMSE) in original interval (normalized x max-min)

    TestingAccuracy = sqrt(mse(TV_T - TY));            %   Calculate test accuracy (RMSE) in normalized values
    TestingAccuracy_orig = sqrt(mse(RangeTarget*(TV_T - TY)));       %   Calculate test accuracy (RMSE) in original interval (normalized x max-min)

%     outfile = 'Output.txt';
    tmp = [num2str(NumberofHiddenNeurons) '  ' num2str(TestingAccuracy_orig)];
    diary('./output/Output.txt')
    diary on
    disp(tmp)
    diary off

end

if Elm_Type == CLASSIFIER

%%%%%%%%%% Calculate training & testing classification accuracy
    MissClassificationRate_Training = 0;
    MissClassificationRate_Testing = 0;

    for i = 1 : size(T, 2)
        [x, label_index_expected] = max(T(:,i));
        [x, label_index_actual] = max(Y(:,i));
        if label_index_actual ~= label_index_expected
            MissClassificationRate_Training=MissClassificationRate_Training+1;
        end
    end
    TrainingAccuracy = MissClassificationRate_Training/size(T,2);

    TY;
    for i = 1 : size(TV_T, 2)
        [x, label_index_expected] = max(TV_T(:,i));
        [x, label_index_actual] = max(TY(:,i));
        if label_index_actual ~= label_index_expected
            MissClassificationRate_Testing = MissClassificationRate_Testing+1;
        end
    end
    TestingAccuracy = MissClassificationRate_Testing/size(TV_T,2);

%     outfile = 'Output.txt';
%    disp('num.Hidden testAcc')
    tmp = [num2str(NumberofHiddenNeurons) '  ' num2str(TestingAccuracy)];
    diary('./output/Output.txt')
    diary on
    disp(tmp)
    diary off

end
