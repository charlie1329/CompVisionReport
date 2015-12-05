function [result] = newEdgeDetector(imageMatrix,divThreshold)
%newEdgeDetector this function will attempt to recreate
% 'A new Edge Detection Method Based on Additions + Divisions'
% All credit for this goes to Sabina Priyadarshini and Gadadhar Sahoo
% Method originally detailed in the International Journal Of Computer
% Applications (0975-8887) Vol 9-10 November 2010
%   the method takes a grayscale image and then converts into a 
%   high dimensional vector. Through various means of addition and division
%   this then gets a threshold value which is then applied to the original
%   image


elements = size(imageMatrix);
dim = elements(1) * elements(2);
img_vec = zeros([1 dim]);

count = 1;
%converting to high dimensional vector

for i = 1:elements(1),
   for j = 1:elements(2),
       img_vec(1,count) = imageMatrix(i,j);
       count = count + 1;
   end
end

sizeVector = size(img_vec);
%first conversion
averages = zeros([1 (sizeVector(2)-1)]);

for i = 1 : sizeVector(2) -1,
    averages(1,i) = ((img_vec(1,i) + img_vec(1,i+1))/2);
end

sizeAverage = size(averages);
%second conversion
oneSixth = zeros([1 (sizeAverage(2)-1)]);

for i = 1: sizeAverage(2) - 1,
    oneSixth(1,i) = (averages(1,i) + averages(1,i+1))/6;
end

sizeSixth = size(oneSixth);
%final conversion
final = zeros([1 (sizeSixth(2)-1)]);

for i = 1: sizeSixth(2) - 1,
    final(1,i) = oneSixth(1,i) + oneSixth(1,i+1);
end

%getting the threshold to use on original image
sizeFinal = size(final);
sizeFinal = sizeFinal(2);
%setting threshold

threshold = 0;
for i = 1:sizeFinal,
    if final(1,i) > threshold
        threshold = final(1,i);
    end
end

threshold = threshold/divThreshold;

newMatrix = zeros([elements(1) (elements(2)-1)]);


% applying threshold to original image
for i = 1:elements(1),
    for j = 1:elements(2)-1,
        if abs(imageMatrix(i,j) - imageMatrix(i,j+1)) > threshold
            newMatrix(i,j) = 1;
        end
    end
end

%applying otherway round
newMatrix2 = zeros([(elements(1) - 1) elements(2)]);
for j = 1:elements(2),
    for i = 1:elements(1) -1,
        if abs(imageMatrix(i,j) - imageMatrix(i+1,j)) > threshold
            newMatrix2(i,j) = 1;
        end
    end
end

%combining the two together
result = (newMatrix(1:elements(1)-1,:)|newMatrix2(:,1:elements(2)-1));
end