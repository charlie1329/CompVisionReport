function [x] = applyPrewitt(image,dimension, threshold)
%applySobel carries out a prewitt filter to an image

prewittX = [[-1 0 1] ;[-1 0 1]; [-1 0 1]];
prewittY = [[-1 -1 -1]; [0 0 0]; [1 1 1]];

prewittx = conv2(prewittX,double(image));
prewitty = conv2(prewittY,double(image));
mag = magnitude(prewittx,prewitty);

cutting = floor(dimension/2) + 1;

if mod(dimension, 2) == 0
    y = mag(cutting+1:end-(cutting-1),cutting+1:end-(cutting-1));
else
    y = mag(cutting+1:end-cutting,cutting+1:end-cutting);
end


x = y > threshold;

end

