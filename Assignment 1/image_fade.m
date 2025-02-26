ada_orig = imread('assets/ada_kitchen.JPG');
hux_orig = imread('assets/huxley.JPG');

ada_orig = rot90(ada_orig, -1);
hux_orig = rot90(hux_orig, -1);

% this will be the original image
gray_ada = rgb2gray(ada_orig);
% this will be the output after fading 
gray_hux = rgb2gray(hux_orig);
colormap(gray)

% define the number of intermediate images (should prob change to funct)
num_int_img = 20;
[height, width] = size(gray_ada);
% set an array of images so i can display side by side
int_image_array = cell(1, num_int_img + 2);
int_image_array{1} = gray_ada;

imshow(gray_ada)

for x = 1:num_int_img
    int_img = gray_ada;
    for i = 1:height
        for j = 1:width
            % generate intermediate image at x
            dist = double(gray_hux(i, j)) - double(gray_ada(i, j)); % NOT uint8
            single_dist = dist / num_int_img;
            int_img(i, j) = int_img(i, j) + (single_dist * x);
        end
    end
    %drawnow()
    int_image_array{x + 1} = int_img;
    drawnow()
    imshow(int_img)
end

%imshow(gray_hux)

%int_image_array{num_int_img + 2} = gray_hux;

%montage(int_image_array, 'Size', [1, numel(int_image_array)]);



