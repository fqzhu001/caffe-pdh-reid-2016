clear all;clc
jump_distance = 0 ;
Num=3368;
file_id=fopen('./query_baseline_512dim','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat=fread(file_id, Dim*Num, 'single') ; 
feat_query=zeros(Num,Dim);
for i=1:Num
    i
    feat_query(i,:)=feat((i-1)*Dim+1:i*Dim);
end
feat_query1=feat_query';   
Hist_query=feat_query1>0.5;   

save('Hist_query_baseline.mat','Hist_query','-v7.3');