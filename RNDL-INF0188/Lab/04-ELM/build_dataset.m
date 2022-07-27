% Build a dataset for a particular ELM_TYPE (the task selected)
% It loads the data from the specified file, then it normalizes each value between -1 and 1
% After the normalization step, it saves the training set and test set into separate files
function [rangeTarget] = build_dataset(file, Elm_Type)

tmp = csvread(file);

% Rows: instances;    (n)
% columns: variables; (d)
% target: last column (d-1)
DataSize = size(tmp);                 % (n x d): size of the dataset
rand('state',1246911)                 % setup rand seed
RndIndex = randperm(DataSize(1));     % Shuffle the dataset -> generate n indexed randomly
tmp = tmp (RndIndex, :);              % Apply the sequence of random indexes

% Create the real dataset by rearranging the target values to be in the first column
% while setting the rest of the columns to the ones that represent the features
tmp = [tmp(:,end) tmp(:,1:end-1)];    %target in first column

% Normalize each column in turn
nvar = DataSize(2);
for nv = 2 : nvar
    tmp1 = tmp (:, nv);
    % Normalize the current column. Each values should lie between -1 and 1
    tmp1 = 2 * (tmp1 - min(tmp1)) / (max(tmp1) - min(tmp1)) - 1;
    % substitute the old column with the new one (with normalized values)
    tmp (:, nv) = tmp1;
end

% Normalize the range between 0 and 1. We should only differentiate if the task is Classification or Regression
rangeTarget = max(tmp(:,1)) - min(tmp(:,1));
if(Elm_Type == 0)
    % Target between 0 and 1
    tmp (:,1) = (tmp(:,1) - min(tmp(:,1))) / (rangeTarget);
end

% Split the dataset between training set (2/3 of the dataset) and test set (the remaining portion)
n = ceil(DataSize(1)*2/3);
train = tmp (1:n, :);
test = tmp (n+1:end, :);

% Save the training set and test set into a new file
save ('-ascii', '-double', './output/train.csv', 'train');
save ('-ascii', '-double', './output/test.csv', 'test');

return
