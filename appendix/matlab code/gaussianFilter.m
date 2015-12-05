function [ x] = gaussianFilter( dimensions, sd )
%gaussianFilter creates a gaussian filter using the dimensions and sd input

remainder = mod (dimensions, 2);
if remainder == 1
    val1 = floor(dimensions/2);
    val2 = -val1;
    spacing = val2:1:val1;
else 
    val1 = floor(dimensions/2) - 0.5;
    val2 = -val1;
    spacing = val2:1:val1;
end

x = N(0, sd, spacing);


end

