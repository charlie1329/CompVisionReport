function [x] = LOG(img,dimension,sd,threshold )
%LOG carries out laplacian of gaussian on an image
% 

Laplacian = [[0 -1 0]; [-1 4 -1]; [0 -1 0]];
Gaussian1D = gaussianFilter(dimension,sd);
Gaussian2D = Gaussian1D' * Gaussian1D;

logFilter = conv2(Gaussian2D,Laplacian);

imgApplied = conv2(logFilter,double(img));


mySize = size(logFilter);

cut = floor(mySize(1)/2);


y = zeroCrossing(imgApplied,threshold);


if mod(mySize(1), 2) == 0
    y = y(cut+1:end-(cut-1),cut+1:end-(cut-1));
else
    y = y(cut+1:end-cut,cut+1:end-cut);
end

x=y;
end

