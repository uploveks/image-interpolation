function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Rotate the grayscale image I of size m x n by rotation_angle radians,
    % using Proximal Interpolation.
    % =========================================================================

    [m n nr_colors] = size(I);
    
    % Convert the input image to grayscale, if necessary.
    if nr_colors > 1
        R = -1;
        return
    endif
    % Note:
    % When applying a rotation, the point (0, 0) of the image will not move.
    % In Octave, the pixels of the image are indexed from 1 to n.
    % If we work with indices from 1 to n and multiply x and y by s_x and s_y,
    % then the origin of the image will move from (1, 1) to (s_x, s_y)!
    % Therefore, we must work with indices in the range [0, n-1].

    % TODO: Calculate the cosine and sine of rotation_angle.
    c = cos(rotation_angle);
    s = sin(rotation_angle);
    % TODO: Initialize the final matrix.
    R = zeros(m, n);

    % TODO: Calculate the transformation matrix.
    T = [c -s; s c];
    % TODO: Invert the transformation matrix, USING only predefined functions!
    T_inv = (T)';

    % Loop through each pixel in the image.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Apply the inverse transformation to (x, y) and calculate x_p and y_p
            % in the original image space.
            i = y * T_inv(1,1) + x * T_inv(2,1) + 1;
            j = T_inv(1,2) * y + T_inv(2,2)* x + 1 ;

            % TODO: Convert (x_p, y_p) from the [0, n-1] coordinate system to
            % the [1, n] coordinate system in order to apply interpolation.

            % TODO: If x_p or y_p are outside the image, put a black pixel and move on.

            % TODO: Find the surrounding points (x1, y1) and (x2, y2).
            x1 = floor(i);
            x2 = ceil(i);
            y1 = floor(j);
            y2 = ceil(j);
            % TODO: Calculate the interpolation coefficients denoted by a
            % Note: An auxiliary function can be used to calculate the coefficients,
            % according to the formula.
            if i > 1 && j > 1 && i <= m - 1 && j <= n -1
              a = proximal_coef(I, x1, y1, x2, y2);
              R(y+1, x+1) = (a(1) + a(2) * i + a(3) * j + a(4) * i * j);
            endif
            R(1, 1) = I(1, 1);
            % TODO: Calculate the interpolated value of the pixel (x, y).
        endfor
    endfor
    % TODO: Convert the resulting matrix to uint8 to be a valid image.
    R = uint8(R);

endfunction
