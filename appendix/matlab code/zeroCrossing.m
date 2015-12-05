function [ x ] = zeroCrossing(img, threshold)
%zeroCrossing this function carries out the zero crossing for an image
%matrix. This matrix will be assumed to have the second derivative i.e
%laplacian already applied

imgSize = size(img);

newImg = zeros(imgSize(1),imgSize(2));

for i = 1:imgSize(1),
    for j = 1:imgSize(2),
        centralVal = img(i,j);
        neighbours = get4Neighbours(i,j,imgSize(1),imgSize(2));
        neighSize = size(neighbours);
        for k = 1:neighSize(2),
            neighValue = img(neighbours(1,k),neighbours(2,k));
            if (centralVal > 0 && neighValue < 0) || (neighValue > 0 && centralVal < 0),
                if abs(centralVal - neighValue) >= threshold,
                    newImg(i,j) = 1;
                end
            end
        end
    end
end
            
x = newImg;


end

