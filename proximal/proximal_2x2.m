function out = proximal_2x2(f, STEP = 0.1)
% ===================================================================================
% Applies Proximal Interpolation on the 2 x 2 image f with equidistant intermediate points.
% f has known values at points (1, 1), (1, 2), (2, 1), and (2, 2).
% Parameters:
% - f = image to be interpolated;
% - STEP = distance between two successive points.
% ===================================================================================

    % TODO: Define the x and y coordinates of the intermediate points.
    % size of the final image
    x = 0;
    y = 0;

    % here we find out how many points are on each row and column
    for i = 1 : STEP : 2
      x = x + 1;
      y = y + 1;
    endfor

    % we find out how many times the number of elements in a row/column of the final
    % image is greater than the one in the initial image, and do the same for the columns
    % (i.e., we calculate the values sx and sy from the transform)
    ratio_x = x / size(f, 1);
    ratio_y = y / size(f, 2);

    % we create two vectors, one for the rounded positions of x and one for y
    % (the ones from the initial image for the final one)
    % we calculate the ratio from 1 to the number of elements in a row/column of the
    % final image and divide it by the ratio of the number of elements calculated above
    Pos_row = zeros(x, 1);
    Pos_col = zeros(y, 1);
    Pos_row = ceil([1 : x]./ratio_x);
    Pos_col = ceil([1 : y]./ratio_y);

    % TODO: Initialize the result with a null n x n matrix.
    new_f = zeros(x, y);
    % Each pixel in the final image is processed.
    for i = 1 : x
        for j = 1 : y
            % TODO: Find the nearest pixel in the initial image.

            % TODO: Calculate the pixel in the final image.
            % as we have already found the positions in the initial image
            % for each element in the final matrix, we can take from the
            % initial image the elements from x in Pos_row and y in Pos_col
            new_f(i, j) = f(Pos_row(i), Pos_col(j));
        endfor
    endfor
    out = new_f;
endfunction