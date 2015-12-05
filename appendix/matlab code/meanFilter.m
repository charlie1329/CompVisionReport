function [ x ] = meanFilter(dimension)
%UNTITLED3 function will create a matrix of values 1/n where n is the
%dimension^2
%
filter = zeros(dimension);
eachVal = 1/(dimension * dimension);

mySize = size(filter);

for i = 1:mySize(1),
    for j = 1:mySize(2),
        filter(i,j) = eachVal;
    end
end
    
x = filter;

end

