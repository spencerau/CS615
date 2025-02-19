
% rgb to gray
% use rgb2gray()

A = spiral(11);
%A

% B gives this:
% 7     8     9
% 6     1     2
% 5     4     3 
B = A(5:7, 5:7);
B

colormap(gray)

C = A;

% simple thresholding; use 50 for the threshold
for i = 1:11
    for j = 1:11
        if C(i, j) >= 50
            C(i, j) = 1;
        else
            C(i, j) = 0;
        end
    end
end

% faster to just do this:
%C = (A >= 50);

C

imagesc(C)
imagesc(A)

% this is like the mann pages for C
%help histogram
histogram(A)
A