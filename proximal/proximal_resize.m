function R = proximal_resize(I, p, q)
% =========================================================================
% Scales the image using Proximal Interpolation algorithm.
% Transforms the image I from size m x n to size p x q.
% =========================================================================

    [m n nr_colors] = size(I);

    % Converts the input image to grayscale, if necessary.
    if nr_colors > 1
        R = -1;
        return
    endif
    % TODO: Initialize the final matrix as a zero matrix.
    new_I = zeros(p, q);
    % Note:
    % When scaling an image, the point (0, 0) of the image will not move.
    % In Octave, the pixels of images are indexed from 1 to n.
    % If we work with indices from 1 to n and multiply x and y by s_x and s_y, respectively,
    % then the origin of the image will move from (1, 1) to (sx, sy)!
    % Therefore, we need to work with indices in the interval [0, n - 1].

    % TODO: Calculate the scaling factors.
    % Note: If we work with indices in the interval [0, n - 1], the last pixel
    % of the image will move from (m - 1, n - 1) to (p, q).
    % s_x will not be q ./ n
    %disp(I);
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % TODO: Define the transformation matrix for resizing.
    Pos_row = zeros(p, 1);
    Pos_col = zeros(q, 1);
    % I did not define the transformation matrix and worked with 1/sx and 1/sy at the same time.
    % I found the positions by multiplying from 0 to m-1 and from 0 to n-1 with s_y and s_x, respectively,
    % and thus I found the positions for rows and columns.
    Pos_row = round([0 : ((m - 1) * s_y)]./s_y) + 1;
    Pos_col = round([0 : ((n - 1) * s_x)]./s_x) + 1;

    % TODO: Invert the transformation matrix, WITHOUT using predefined functions!

    % Iterates through each pixel of the image.
    for y = 1 : p
        for x = 1 : q
            % TODO: Apply the inverse transformation on (x, y) and calculate x_p and y_p
            % in the initial image space.

            % TODO: Converts (xp, yp) from the coordinate system [0, n - 1] to
            % the coordinate system [1, n] to apply the interpolation.

            % TODO: Calculates the nearest pixel.

            % TODO: Calculates the value of the pixel in the final image.
            new_I(y, x) = I(Pos_row(y), Pos_col(x));
        endfor
    endfor
    % TODO: Convert the resulting matrix to uint8 to be a valid image.
    R = uint8(new_I);

endfunction