A = imread('Cat.jpg');
%A = 255 - A; % invert the colors; dark -> light and light -> dark

for i = 1:512
    % overlay a line on diagonals from top left to bottom right
    A(i,i) = 0;
    % overlay a line on diagonals from top right to bottom left
    A(i, 513-i) = 0;
end

colormap(gray) % see in gray level 
imagesc(A) % display image

