img = imread('assets/spot.jpg');

clc

subplot(2, 2, 1), imagesc(img)
subplot(2, 2, 2), histogram(img)

% A is the global minimum gray level
A = min(min(img));
% B is the global maximum gray level
%B = max(max(img));
% 20 might be better since theres like one or two occurences of 255, etc
B = 25;

% K is the maximum number of gray levels; since the image is 8 bit, that
% corresponds to 256 GL
K = 256;

% equation to use is J(i,j) = (K - 1)/(B - A) * [I(i,j) - A]
scaled_img = img;
for i = 1:256
    for j = 1:256
        % above is kind of janky; just gonna do one line
        scaled_img(i, j) = ((K - 1)/(B - A)) * (img(i, j) - A);
    end
end

colormap(gray)

subplot(2, 2, 3), imagesc(scaled_img)
subplot(2, 2, 4), histogram(scaled_img)

