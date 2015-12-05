function [x] = get4Neighbours(pointx,pointy,boundaryx,boundaryy )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

result = zeros(2,4);
count = 1;
for i = (pointx-1):(pointx+1),
    for j = (pointy-1):(pointy+1),
        if i > 0 && j > 0 && i<=boundaryx && j<=boundaryy && (i==pointx || j == pointy),
            if i == pointx && j == pointy,
            else,
            result(1,count) = i;
            result(2,count) = j;
            count = count+1;
            end
        end

    end
end

x = result(:,1:count-1);

end

