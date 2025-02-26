img = imread('assets/ada_cat.JPG');

% this is just to test

grayscale = rgb2gray(img);
colormap(gray)

% subplot(2, 2, 1), histogram(grayscale)
% title('Matlab Histogram() Function');
% subplot(2, 2, 2), custom_histogram(grayscale)
% title("Implemented custom\_histogram()");

clc

image_threshold(img)



