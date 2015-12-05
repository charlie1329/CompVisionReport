function [out] = batchNoisePlot()
%batchNoisePlot this function loops through a series of noise filters and
%then plots a graph consisting of the results of the tests
%using a controlled sobel filter, with a controlled threshold of 20


%reads in the image and gets the green component
img1 = imread('9343 AM.bmp');
img1 = img1(:,:,2);

img2 = imread('10905 JL.bmp');
img2 = img2(:,:,2);

img3 = imread('43590 AM.bmp');
img3 = img3(:,:,2);

xpoints = zeros([1 2100]);
ypoints = zeros([1 2100]);
labels = cell([1 2100]);
count = 1;
disp(count);

for i = 5:5:50,
    
    for threshold = 10:10:100,
        
        meanVal = getAverageRocMeanF(i,threshold, img1, img2, img3);
        xpoints(count) = cell2mat(meanVal(1));
        ypoints(count) = cell2mat(meanVal(2));
        labels(count) = meanVal(3);
        count = count + 1;
        disp(count);

        for j = 1:20,
            gaussVal = getAverageRocGaussianF(i,j,threshold, img1, img2, img3);
            xpoints(count) = cell2mat(gaussVal(1));
            ypoints(count) = cell2mat(gaussVal(2));
            labels(count) = gaussVal(3);
            count = count + 1;
            disp(count);
        end
    end
end

graph = scatter(xpoints,ypoints,'rx');
title('ROC Space for 210 different noise filters');
xlabel('FPR');
ylabel('TPR');
for i = 1:2100,
    x = xpoints(i);
    y = ypoints(i);
    label = labels(i);
    text(x+0.001,y+0.001,label);
end
    
out = graph;

end

