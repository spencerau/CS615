function [outputArg1, min_output, max_output, output_img] = custom_histogram(inputIMG)
%CUSTOM_HISTOGRAM Summary of this function goes here
%   Detailed explanation goes here

% grayscale the image if necessary
if size(inputIMG, 3) == 3
    grayscale = rgb2gray(inputIMG);
else
    grayscale = inputIMG;
end

colormap(gray)

% grab the size of the image
[height, width] = size(grayscale);

% lets use this instead since i want an array of counts of each graylevel, 
% where the index is the respective gray level, so if gLC[5] = 10, that
% means there is 10 counts of a graylevel of 5 in the image
grayLevelCounts = zeros(1, 256);

min = 256;

max = -1;

% iterate through image and 
% Gray Level 0 corresponds to gLC(1)
for i = 1:height
    for j = 1:width
        grayValue = grayscale(i, j) + 1;
        % can't use += in MATLAB
        grayLevelCounts(grayValue) = grayLevelCounts(grayValue) + 1;
        if grayValue > max
            max = grayValue;
        elseif grayValue < min
            min = grayValue;
        end
    end
end

bar(grayLevelCounts)

outputArg1 = grayLevelCounts;
min_output = min;
max_output = max;
output_img = grayscale;

end

