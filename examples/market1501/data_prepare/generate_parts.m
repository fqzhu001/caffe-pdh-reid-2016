%% region setting
% For average 4parts {Part1: im=imcrop(im,[1 1 63 31]), Part 2: im=imcrop(im,[1 33 63 31]), Part 3: im=imcrop(im,[1 65 63 31]), Parts= 4: im=imcrop(im,[1 97 63 31])}
% For overlap 4parts {Part1: im=imcrop(im,[1 1 63 47]), Part 2: im=imcrop(im,[1 33 63 47]), Part 3: im=imcrop(im,[1 49 63 47]), Parts= 4: im=imcrop(im,[1 81 63 47])}
 % For non-average 4parts {Part1: im=imcrop(im,[1 1 63 27]), Part 2: im=imcrop(im,[1 29 63 39]), Part 3: im=imcrop(im,[1 69 63 39]), Parts= 4: im=imcrop(im,[1 109 63 19])}
% For average 3parts {Part1: im=imcrop(im,[1 1 63 41]), Part 2: im=imcrop(im,[1 43 63 43]), Part 3: im=imcrop(im,[1 87 63 41])}
 % For average 5parts {Part1: im=imcrop(im,[1 1 63 25]), Part 2: im=imcrop(im,[1 27 63 25]), Part 3: im=imcrop(im,[1 53 63 25]), Part 4: im=imcrop(im,[1 79 63 25]), Part 5: im=imcrop(im,[1 105 63 23])}
%% generate parts for training set (take overlap 4 parts as example)

% part 1
list1=dir('../Market-1501-v15.09.15/bounding_box_train/*.jpg');
img_num1=length(list1);
partdir1='../Market-1501-v15.09.15/bounding_box_train/part_1/';
mkdir(partdir1);
for i=1:img_num1
    filename1=list1(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_train/',filename1));
    im=imcrop(im,[1 1 63 47]);
    imwrite(im, [partdir1 filename1]);
end
clear all;

% part 2
list2=dir('../Market-1501-v15.09.15/bounding_box_train/*.jpg');
img_num2=length(list2);
partdir2='../Market-1501-v15.09.15/bounding_box_train/part_2/';
mkdir(partdir2);
for i=1:img_num2
    filename2=list2(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_train/',filename2));
    im=imcrop(im,[1 33 63 47]);
    imwrite(im, [partdir2 filename2]);
end
clear all;

% part 3
list3=dir('../Market-1501-v15.09.15/bounding_box_train/*.jpg');
img_num3=length(list3);
partdir3='../Market-1501-v15.09.15/bounding_box_train/part_3/';
mkdir(partdir3);
for i=1:img_num3
    filename3=list3(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_train/',filename3));
    im=imcrop(im,[1 49 63 47]);
    imwrite(im, [partdir3 filename3]);
end
clear all;

% part 4
list4=dir('../Market-1501-v15.09.15/bounding_box_train/*.jpg');
img_num4=length(list4);
partdir4='../Market-1501-v15.09.15/bounding_box_train/part_4/';
mkdir(partdir4);
for i=1:img_num4
    filename4=list4(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_train/',filename4));
    im=imcrop(im,[1 81 63 47]);
    imwrite(im, [partdir4 filename4]);
end
clear all;

%% generate parts for query set (take overlap 4 parts as example)

% part 1
list1=dir('../Market-1501-v15.09.15/query/*.jpg');
img_num1=length(list1);
partdir1='../Market-1501-v15.09.15/query/part_1/';
mkdir(partdir1);
for i=1:img_num1
    filename1=list1(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/query/',filename1));
    im=imcrop(im,[1 1 63 47]);
    imwrite(im, [partdir1 filename1]);
end
clear all;

% part 2
list2=dir('../Market-1501-v15.09.15/query/*.jpg');
img_num2=length(list2);
partdir2='../Market-1501-v15.09.15/query/part_2/';
mkdir(partdir2);
for i=1:img_num2
    filename2=list2(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/query/',filename2));
    im=imcrop(im,[1 33 63 47]);
    imwrite(im, [partdir2 filename2]);
end
clear all;

% part 3
list3=dir('../Market-1501-v15.09.15/query/*.jpg');
img_num3=length(list3);
partdir3='../Market-1501-v15.09.15/query/part_3/';
mkdir(partdir3);
for i=1:img_num3
    filename3=list3(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/query/',filename3));
    im=imcrop(im,[1 49 63 47]);
    imwrite(im, [partdir3 filename3]);
end
clear all;

% part 4
list4=dir('../Market-1501-v15.09.15/query/*.jpg');
img_num4=length(list4);
partdir4='../Market-1501-v15.09.15/query/part_4/';
mkdir(partdir4);
for i=1:img_num4
    filename4=list4(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/query/',filename4));
    im=imcrop(im,[1 81 63 47]);
    imwrite(im, [partdir4 filename4]);
end
clear all;

%% generate parts for testing set (take overlap 4 parts as example)

% part 1
list1=dir('../Market-1501-v15.09.15/bounding_box_test/*.jpg');
img_num1=length(list1);
partdir1='../Market-1501-v15.09.15/bounding_box_test/part_1/';
mkdir(partdir1);
for i=1:img_num1
    filename1=list1(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_test/',filename1));
    im=imcrop(im,[1 1 63 47]);
    imwrite(im, [partdir1 filename1]);
end
clear all;

% part 2
list2=dir('../Market-1501-v15.09.15/bounding_box_test/*.jpg');
img_num2=length(list2);
partdir2='../Market-1501-v15.09.15/bounding_box_test/part_2/';
mkdir(partdir2);
for i=1:img_num2
    filename2=list2(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_test/',filename2));
    im=imcrop(im,[1 33 63 47]);
    imwrite(im, [partdir2 filename2]);
end
clear all;

% part 3
list3=dir('../Market-1501-v15.09.15/bounding_box_test/*.jpg');
img_num3=length(list3);
partdir3='../Market-1501-v15.09.15/bounding_box_test/part_3/';
mkdir(partdir3);
for i=1:img_num3
    filename3=list3(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_test/',filename3));
    im=imcrop(im,[1 49 63 47]);
    imwrite(im, [partdir3 filename3]);
end
clear all;

% part 4
list4=dir('../Market-1501-v15.09.15/bounding_box_test/*.jpg');
img_num4=length(list4);
partdir4='../Market-1501-v15.09.15/bounding_box_test/part_4/';
mkdir(partdir4);
for i=1:img_num4
    filename4=list4(i).name;
    im=imread(strcat('../Market-1501-v15.09.15/bounding_box_test/',filename4));
    im=imcrop(im,[1 81 63 47]);
    imwrite(im, [partdir4 filename4]);
end
clear all;