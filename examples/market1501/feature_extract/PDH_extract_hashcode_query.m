clear all;clc
jump_distance = 0 ;
Num=3368;
file_id=fopen('./query_PDH_part_1','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat1=fread(file_id, Dim*Num, 'single') ; 
feat_train1=zeros(Num,Dim);
for i=1:Num
    i
    feat_train1(i,:)=feat1((i-1)*Dim+1:i*Dim);
end
feat_query1=feat_train1';   
Hist_query_1=feat_query1>0.5;  
save('Hist_query_1.mat','Hist_query_1','-v7.3');

clear all;clc

jump_distance = 0 ;
Num=3368;
file_id=fopen('./query_PDH_part_2','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat2=fread(file_id, Dim*Num, 'single') ; 
feat_train2=zeros(Num,Dim);
for i=1:Num
    i
    feat_train2(i,:)=feat2((i-1)*Dim+1:i*Dim);
end
feat_query2=feat_train2';   
Hist_query_2=feat_query2>0.5;   
save('Hist_query_2.mat','Hist_query_2','-v7.3');

clear all;clc

jump_distance = 0 ;
Num=3368;
file_id=fopen('./query_PDH_part_3','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat3=fread(file_id, Dim*Num, 'single') ; 
feat_train3=zeros(Num,Dim);
for i=1:Num
    i
    feat_train3(i,:)=feat3((i-1)*Dim+1:i*Dim);
end
feat_query3=feat_train3';   
Hist_query_3=feat_query3>0.5;   
save('Hist_query_3.mat','Hist_query_3','-v7.3');

clear all;clc

jump_distance = 0 ;
Num=3368;
file_id=fopen('./query_PDH_part_4','rb');    
fseek(file_id, jump_distance, 'bof');
Dim=512;
feat4=fread(file_id, Dim*Num, 'single') ; 
feat_train4=zeros(Num,Dim);
for i=1:Num
    i
    feat_train4(i,:)=feat4((i-1)*Dim+1:i*Dim);
end
feat_query4=feat_train4';   
Hist_query_4=feat_query4>0.5;   
save('Hist_query_4.mat','Hist_query_4','-v7.3');

clear all;clc

load Hist_query_1.mat;
load Hist_query_2.mat;
load Hist_query_3.mat;
load Hist_query_4.mat;

Hist_query=[Hist_query_1;Hist_query_2;Hist_query_3;Hist_query_4];

save('Hist_query_PDH.mat','Hist_query','-v7.3');
