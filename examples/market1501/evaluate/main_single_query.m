clc;clear all;close all;

%% load query features
Hist_query = importdata('../feature_extract/Hist_query_baseline.mat');%%%%%%%%%%%
nQuery = size(Hist_query, 2);

%% load database features
Hist_test = importdata('../feature_extract/Hist_test_baseline.mat');%%%%%%%%%%%%
nTest = size(Hist_test, 2);

%% load the ID and camera for database images
testID = importdata('data/testID.mat');
testCAM = importdata('data/testCAM.mat');    

%% load the ID and camera for query images
queryID = importdata('data/queryID.mat');
queryCAM = importdata('data/queryCAM.mat');    

%% search the database and calcuate re-id accuracy
ap = zeros(nQuery, 1); 
CMC = zeros(nQuery, nTest);
r1 = 0; 
dist = sqdist(Hist_test, Hist_query);  
knn = 1; 
for k = 1:nQuery
    k
    good_index = intersect(find(testID == queryID(k)), find(testCAM ~= queryCAM(k)))';
    junk_index1 = find(testID == -1);
    junk_index2 = intersect(find(testID == queryID(k)), find(testCAM == queryCAM(k))); 
    junk_index = [junk_index1; junk_index2]';
    score = dist(:, k);
    [~, index] = sort(score, 'ascend');  
    [ap(k), CMC(k, :)] = compute_AP(good_index, junk_index, index);          
end

CMC = mean(CMC);
%% print result
fprintf('single query:                                   mAP = %f, r1 precision = %f\r\n', mean(ap), CMC(1));

