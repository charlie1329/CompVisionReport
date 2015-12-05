function [ x ] = getAverageRocLaplacian( threshold, img1, img2, img3)
%getAverageRocGaussianF This function calculates an average ROC point 
%and label for a given filter dimension and standard deviation.

result1 = applyLaplacian(double(img1),threshold);
result2 = applyLaplacian(double(img2),threshold);
result3 = applyLaplacian(double(img3),threshold);

%read in the edge images
true1 = imread('9343 AM Edges.bmp') > 0;
true2 = imread('10905 JL Edges.bmp') > 0;
true3 = imread('43590 AM Edges.bmp') > 0;

%compare the edge images against the corresponding images which have been
%smoothed and have had sobel applied to obtain a roc value
roc1 = compareImg(true1,result1);
roc2 = compareImg(true2,result2);
roc3 = compareImg(true3,result3);

%find the average for the x and y coordinates of the roc values
avgx = (roc1(1) + roc2(1) + roc3(1))/3;
avgy = (roc1(2) + roc2(2) + roc3(2))/3;

%create label with the appropriate naming convention
label = strcat('laplacian','T',int2str(threshold));

%return a cell array containing the average roc coordinates aswell as the
%label for the point
x = {avgx,avgy,label};

end