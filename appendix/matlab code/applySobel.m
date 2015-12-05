function [x] = applySobel(image,dimension, threshold)
%applySobel carries out a sobel filter to an image

sobelX = [[-1 0 1] ;[-2 0 2]; [-1 0 1]];
sobelY = [[-1 -2 -1]; [0 0 0]; [1 2 1]];

sobelx = conv2(sobelX,double(image));
sobely = conv2(sobelY,double(image));
mag = magnitude(sobelx,sobely);

cutting = floor(dimension/2) + 1;

if mod(dimension, 2) == 0
    y = mag(cutting+1:end-(cutting-1),cutting+1:end-(cutting-1));
else
    y = mag(cutting+1:end-cutting,cutting+1:end-cutting);
end

x = y > threshold;

end

