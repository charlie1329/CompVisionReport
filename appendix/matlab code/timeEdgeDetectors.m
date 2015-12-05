function [x] = timeEdgeDetectors()
%timeEdgeDetectors function times some edge detectors
%   We are timing the best set of conditions for each edge detector we
%   tested; this is in order for us to be able to compare the performance
%   with time so we can make an informed decision on what the most suitable
%   edge detection algorithm is
%   we are using one single image for this process, 9343 AM.bmp

% reading the image
img = imread('9343 AM.bmp');
img = img(:,:,2);

times = zeros(1,7);

% test canny
tic;
edge(img,'canny',[],0,1);
times(1,1) = toc;

% test laplacian
tic;
applyLaplacian(img,10);
times(1,2) = toc;

% test LOG
tic;
LOG(img,5,1,1);
times(1,3) = toc;

% test the new method
tic;
filter = gaussianFilter(5,1);
smoothed1 = conv2(filter',conv2(filter,double(img)));
newEdgeDetector(smoothed1,30);
times(1,4) = toc;

% test prewitt
tic;
filter = gaussianFilter(5,1);
smoothed2 = conv2(filter',conv2(filter,double(img)));
applyPrewitt(smoothed2,5,20);
times(1,5) = toc;

% test roberts
tic;
filter = gaussianFilter(5,1);
smoothed3 = conv2(filter',conv2(filter,double(img)));
applyRoberts(smoothed3,5,20);
times(1,6) = toc;

% test sobel
tic;
filter = gaussianFilter(5,1);
smoothed4 = conv2(filter',conv2(filter,double(img)));
applySobel(smoothed4,5,20);
times(1,7) = toc;

x = times;

end

