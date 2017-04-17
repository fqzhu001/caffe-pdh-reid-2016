clear all; clc
jump_distance = 0 ;
Num=19732;
file_id=fopen('./test_PDH_part_1','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat1=fread(file_id, Dim*Num, 'single') ; 
feat_train1=zeros(Num,Dim);
for i=1:Num
    i
    feat_train1(i,:)=feat1((i-1)*Dim+1:i*Dim);
end
feat_test1=feat_train1';   
Hist_test_1=feat_test1>0.5;   
save('Hist_test_1.mat','Hist_test_1','-v7.3');

clear all;clc;

jump_distance = 0 ;
Num=19732;
file_id=fopen('./test_PDH_part_2','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat2=fread(file_id, Dim*Num, 'single') ; 
feat_train2=zeros(Num,Dim);
for i=1:Num
    i
    feat_train2(i,:)=feat2((i-1)*Dim+1:i*Dim);
end
feat_test2=feat_train2';   
Hist_test_2=feat_test2>0.5;   
save('Hist_test_2.mat','Hist_test_2','-v7.3');

clear all;clc;

jump_distance = 0 ;
Num=19732;
file_id=fopen('./test_PDH_part_3','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat3=fread(file_id, Dim*Num, 'single') ; 
feat_train3=zeros(Num,Dim);
for i=1:Num
    i
    feat_train3(i,:)=feat3((i-1)*Dim+1:i*Dim);
end
feat_test3=feat_train3';   
Hist_test_3=feat_test3>0.5;   
save('Hist_test_3.mat','Hist_test_3','-v7.3');

clear all;clc;

jump_distance = 0 ;
Num=19732;
file_id=fopen('./test_PDH_part_4','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat4=fread(file_id, Dim*Num, 'single') ; 
feat_train4=zeros(Num,Dim);
for i=1:Num
    i
    feat_train4(i,:)=feat4((i-1)*Dim+1:i*Dim);
end
feat_test4=feat_train4';   
Hist_test_4=feat_test4>0.5;  
save('Hist_test_4.mat','Hist_test_4','-v7.3');

clear all;clc

load Hist_test_1.mat;
load Hist_test_2.mat;
load Hist_test_3.mat;
load Hist_test_4.mat;

Hist_test=[Hist_test_1;Hist_test_2;Hist_test_3;Hist_test_4];

save('Hist_test_PDH.mat','Hist_test','-v7.3');