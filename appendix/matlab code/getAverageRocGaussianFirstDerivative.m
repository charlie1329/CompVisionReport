function [ x ] = getAverageRocGaussianFirstDerivative( dimensions, sd, threshold, img1, img2, img3,operator )
%getAverageRocGaussianF This function calculates an average ROC point 
%and label for a given filter dimension and standard deviation.

filter = gaussianFilter(dimensions, sd);%creating mean filter

%smooth the image
smoothed1 = conv2(filter', conv2(filter,double(img1)));
smoothed2 = conv2(filter', conv2(filter,double(img2)));
smoothed3 = conv2(filter', conv2(filter,double(img3)));

%apply the sobel filter to each image
if strcmp(operator,'sobel')
    result1 = applySobel(smoothed1,dimensions, threshold);
    result2 = applySobel(smoothed2,dimensions,threshold);
    result3 = applySobel(smoothed3,dimensions, threshold);
elseif strcmp(operator,'roberts')
    result1 = applyRoberts(smoothed1,dimensions, threshold);
    result2 = applyRoberts(smoothed2,dimensions,threshold);
    result3 = applyRoberts(smoothed3,dimensions, threshold);
elseif strcmp(operator,'prewitt')
    result1 = applyPrewitt(smoothed1,dimensions, threshold);
    result2 = applyPrewitt(smoothed2,dimensions,threshold);
    result3 = applyPrewitt(smoothed3,dimensions, threshold);
end

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
label = strcat(operator,'G',int2str(dimensions), 'D', int2str(sd),'T',int2str(threshold));

%return a cell array containing the average roc coordinates aswell as the
%label for the point
x = {avgx,avgy,label};

end