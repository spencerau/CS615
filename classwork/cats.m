%A = imread('cats.JPG');
original = imread('class_images/mammogram.jpg');

size(original)

%imagesc(original)

grayscale = original;

%grayscale = rgb2gray(original);
%grayscale = im2gray(original);

colormap(gray)


imagesc(grayscale)

histogram(grayscale)

bw = (grayscale >= 70);

imagesc(bw)


%B