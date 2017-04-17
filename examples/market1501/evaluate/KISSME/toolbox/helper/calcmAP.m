function [ mAP, CMC ] = calcmAP( M, data_test, data_query )
query=dir('dataset\query\*.jpg');
dist = sqdist(data_test, data_query, M);
ap = zeros(size(dist, 2), 1);
CMC = zeros(size(dist, 2), size(dist, 1));
for k = 1:size(dist, 2)
    % find groudtruth index (good and junk)
    file_name1 = ['dataset\gt_query\' query(k).name(1:19) '_good.mat'];
    good_index = importdata(file_name1);
    file_name2 = ['dataset\gt_query\' query(k).name(1:19) '_junk.mat'];
    junk_index = importdata(file_name2); 
    score = dist(:, k);
    [~, index] = sort(score, 'ascend');% the higher, the better
    [ap(k), CMC(k, :)] = compute_AP(good_index, junk_index, index);% see compute_AP
end
%% cmc and mAP
CMC = mean(CMC);
mAP = mean(ap);

end

