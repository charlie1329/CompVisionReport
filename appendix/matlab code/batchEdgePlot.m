function [x] = batchEdgePlot()
%batchEdgePlot this function goes through all of the different edge
%detectors and tests them under different conditions, eventually plotting
%an roc plot of the edge detectors
%   Detailed explanation goes here
%reads in the image and gets the green component
img1 = imread('9343 AM.bmp');
img1 = img1(:,:,2);

img2 = imread('10905 JL.bmp');
img2 = img2(:,:,2);

img3 = imread('43590 AM.bmp');
img3 = img3(:,:,2);

xpoints = zeros([1 283]);
ypoints = zeros([1 283]);
labels = cell([1 283]);
count = 1;
disp(count);

for threshold = 10:10:100,
    for sd = 1:3,
        gaussVal = getAverageRocGaussianFirstDerivative(5,sd,threshold,img1,img2,img3,'sobel');
        xpoints(count) = cell2mat(gaussVal(1));
        ypoints(count) = cell2mat(gaussVal(2));
        labels(count) = gaussVal(3);
        count = count + 1;
        disp(count);
        gaussVal = getAverageRocGaussianFirstDerivative(5,sd,threshold,img1,img2,img3,'prewitt');
        xpoints(count) = cell2mat(gaussVal(1));
        ypoints(count) = cell2mat(gaussVal(2));
        labels(count) = gaussVal(3);
        count = count + 1;
        disp(count);
        gaussVal = getAverageRocGaussianFirstDerivative(5,sd,threshold,img1,img2,img3,'roberts');
        xpoints(count) = cell2mat(gaussVal(1));
        ypoints(count) = cell2mat(gaussVal(2));
        labels(count) = gaussVal(3);
        count = count + 1;
        disp(count);
        
        cannyVal = getAverageRocCanny(sd,img1,img2,img3);
        xpoints(count) = cell2mat(cannyVal(1));
        ypoints(count) = cell2mat(cannyVal(2));
        labels(count) = cannyVal(3);
        count = count + 1;
        disp(count);
    end
    meanVal = getAverageRocMeanFirstDerivative(5,threshold,img1,img2,img3,'sobel');
    xpoints(count) = cell2mat(meanVal(1));
    ypoints(count) = cell2mat(meanVal(2));
    labels(count) = meanVal(3);
    count = count + 1;
    disp(count);
     meanVal = getAverageRocMeanFirstDerivative(5,threshold,img1,img2,img3,'prewitt');
     xpoints(count) = cell2mat(meanVal(1));
     ypoints(count) = cell2mat(meanVal(2));
     labels(count) = meanVal(3);
     count = count + 1;
     disp(count); 
    meanVal = getAverageRocMeanFirstDerivative(5,threshold,img1,img2,img3,'roberts');
    xpoints(count) = cell2mat(meanVal(1));
    ypoints(count) = cell2mat(meanVal(2));
    labels(count) = meanVal(3);
    count = count + 1;
    disp(count);
end
    
for newThreshold = 1:20,
    for sd = 1:3,
        gaussVal = getAverageRocNewMethod(5,sd,newThreshold,img1,img2,img3);
        xpoints(count) = cell2mat(gaussVal(1));
        ypoints(count) = cell2mat(gaussVal(2));
        labels(count) = gaussVal(3);
        count = count + 1;
        disp(count);
         
        logVal = getAverageRocLOG(5,sd,newThreshold,img1,img2,img3);
        xpoints(count) = cell2mat(logVal(1));
        ypoints(count) = cell2mat(logVal(2));
        labels(count) = logVal(3);
        count = count + 1;
        disp(count);
    end
     meanVal = getAverageRocNewMethodMean(5,newThreshold,img1,img2,img3);
     xpoints(count) = cell2mat(meanVal(1));
     ypoints(count) = cell2mat(meanVal(2));
     labels(count) = meanVal(3);
     count = count + 1;
     disp(count);
     
     lapVal = getAverageRocLaplacian(newThreshold,img1,img2,img3);
     xpoints(count) = cell2mat(lapVal(1));
     ypoints(count) = cell2mat(lapVal(2));
     labels(count) = lapVal(3);
     count = count + 1;
     disp(count);
end

graph = scatter(xpoints,ypoints,'rx');

title('Testing Edge Detectors');
xlabel('FPR');
ylabel('TPR');
axis([0,1,0,1]);
for i = 1:283,
    x = xpoints(i);
    y = ypoints(i);
    label = labels(i);
    text(x+0.001,y+0.001,label);
end

end

