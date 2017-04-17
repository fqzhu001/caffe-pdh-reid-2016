clear all;clc
jump_distance = 0 ;
Num=19732;
file_id=fopen('./test_baseline_512dim','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat=fread(file_id, Dim*Num, 'single') ; 
feat_test=zeros(Num,Dim);
for i=1:Num
    i
    feat_test(i,:)=feat((i-1)*Dim+1:i*Dim);
end
feat_test1=feat_test';   
Hist_test=feat_test1>0.5;   

save('Hist_test_baseline.mat','Hist_test','-v7.3');