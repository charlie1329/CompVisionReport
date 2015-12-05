function [x] = compareImg(true,calculated)
%UNTITLED this function does compares two images using ROC analysis
%   will return a 2x2 matrix consisting of TP,FP,FN,TN

[xdimen,ydimen] = size(true);
TP = 0;
FP = 0;
FN = 0;
TN = 0;


for i = 1:xdimen,
    for j = 1:ydimen,
        if (true(i,j) == 1 && calculated(i,j) == 1)
            TP = TP + 1;
        elseif (true(i,j) == 0 && calculated(i,j) == 0)
            TN = TN + 1;
        elseif (true(i,j) == 1 && calculated(i,j) == 0)
            FN = FN + 1;
        elseif (true(i,j) == 0 && calculated(i,j) == 1)
            FP = FP + 1;
        end
    end
end

%getting 2 graph values
TPR = TP/(TP+FN);
FPR = 1 - (TN/(TN+FP));

x = [FPR TPR];

end

