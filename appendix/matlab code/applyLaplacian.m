function [x] = applyLaplacian(image, threshold)
%applyLaplacian carries out a Laplacian filter to an image

Laplacian = [[0 -1 0]; [-1 4 -1]; [0 -1 0]];
%different method of getting method with laplacian, depends heavily on whether we use zero crossing or not
lap = conv2(Laplacian,double(image));

cutting =  1;

y = lap(cutting+1:end-cutting,cutting+1:end-cutting);


x = zeroCrossing(y,threshold);

end

