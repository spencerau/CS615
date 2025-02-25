function image_threshold(inputImage)

[grayLevelCounts, minGray, maxGray, image] = custom_histogram(inputImage);

% get the midpoint of the min and max graylevel
midpoint = (minGray + maxGray)/2;
fprintf('Midpoint: %d\n', midpoint);

% prob need to change this to what the initial should be
t0 = 1;

t = midpoint;

diff = 999;
grayLevels = 0:255;
iter = 1;

while diff > t0
    fprintf("Running Iteration %d\n", iter);

    % need to cast t as an int and clamp it between [1, 255]
    t = int32(round(t));
    t = max(1, min(t, length(grayLevelCounts) - 1));

    bw = (image >= t);

    % use .* which does element wise multiplication
    
    % white region
    g1_list = grayLevelCounts(t+1:end);
    g1_total = sum(g1_list);
    g1 = sum(grayLevels(t+1:end) .* g1_list)/g1_total;

    % black region
    g2_list = grayLevelCounts(1:t);
    g2_total = sum(g2_list);
    g2 = sum(grayLevels(1:t) .* g2_list)/g2_total;

    % calculate new threshold value
    t_new = (g1 + g2)/2;

    diff = abs(t_new - t);
    t = t_new;

    fprintf('diff: %d\n', diff);

    iter = iter + 1;

end

% display both images side by side
imshowpair(image, bw, 'montage');
title('Original (Left) vs Thresholded B/W (Right)');

end