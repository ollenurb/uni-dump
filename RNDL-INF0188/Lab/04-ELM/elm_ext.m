function elm_ext

file = './res/Abalone.csv';
Elm_Type = 0;   % 0 Regression , 1 Classification

%%%%%%%%%%% Macro definition
REGRESSION = 0;
CLASSIFIER = 1;

%%%%%%%%%%% Training and testing files extraction
RangeTarget = build_dataset(file, Elm_Type);
TrainingData_File = './output/train.csv';
TestingData_File = './output/test.csv';

% RangeTarget = 1508.593;
% TrainingData_File = 'training_astro.txt';
% TestingData_File = 'test_astro.txt';

tmp = csvread(file);
RangeTarget = max(tmp(:,end))-min(tmp(:,end));

%%%%%%%%%%% Load training dataset
train_data = load(TrainingData_File);
T = train_data(:,1)';
P = train_data(:,2:size(train_data,2))';
clear train_data;                                   %   Release raw training data array

%%%%%%%%%%% Load testing dataset
test_data = load(TestingData_File);
TV_T = test_data(:,1)'; %disp (TV_T(1:5))
TV_P = test_data(:,2:size(test_data,2))';
clear test_data;                                    %   Release raw testing data array

NumberofTrainingData = size(P,2);
NumberofTestingData = size(TV_P,2);
NumberofInputNeurons = size(P,1);

%%%%%%%%%%%% Preprocessing the data of classification
if Elm_Type == CLASSIFIER

    target = cat(2,T,TV_T);
    label = unique(target);
    number_class = length(label);
    NumberofOutputNeurons = number_class;

    %%%%%%%%%% Processing the targets of training
    temp_T = -ones(NumberofOutputNeurons, NumberofTrainingData);
    for i = 1:NumberofTrainingData
        for j = 1:number_class
            if label(1,j) == T(1,i)
                break;
            end
        end
        temp_T(j,i) = 1;
    end
    T = temp_T;

    %%%%%%%%%% Processing the targets of testing
    temp_TV_T = -ones(NumberofOutputNeurons, NumberofTestingData);
    for i = 1:NumberofTestingData
        for j = 1:number_class
            if label(1,j) == TV_T(1,i)
                break;
            end
        end
        temp_TV_T(j,i)=1;
    end
    TV_T = temp_TV_T;

end                                                 %   end if of Elm_Type

ActivationFunction = 'sig';
NCycles = 10;
for NumberofHiddenNeurons = 5 : 1 : 70

    %%%% UNIF
    for i = 1 : NCycles
        [TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm_unif(P, T, TV_P, TV_T, Elm_Type, NumberofHiddenNeurons, ActivationFunction, RangeTarget);
    end
   % disp('Statistics')
    tmp1 = load ('./output/Output.txt'); %    whos tmp1
    tmp1 = tmp1 (:, 2);
    tmp2 = mean (tmp1);
    tmp3 = std (tmp1);
    tmp4 = min (tmp1);
    diary('./output/Output_unif.txt')
    diary on
    tmp = [num2str(NumberofHiddenNeurons) '  ' num2str(tmp2) '  ' num2str(tmp3) '  ' num2str(tmp4)];
    disp(tmp)
    diary off
    delete ('./output/Output.txt');


end
return


