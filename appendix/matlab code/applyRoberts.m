function [x] = applyRoberts(image,dimension, threshold)
%applyRoberts carries out a Roberts filter to an image

RobertsX = [[0 1] [-1 0]];
RobertsY = [[1 0] [0 -1]];

Robertsx = conv2(RobertsX,double(image));
Robertsy = conv2(RobertsY,double(image));
mag = magnitude(Robertsx,Robertsy);

cutting = floor(dimension/2);

if mod(dimension, 2) == 0
    y = mag(cutting+1:end-(cutting-1),cutting+1:end-(cutting-1));
else
    y = mag(cutting+1:end-cutting,cutting+1:end-cutting);
end

x = y > threshold;

end

