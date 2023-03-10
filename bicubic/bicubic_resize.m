function R = bicubic_resize(I, p, q)
    % =========================================================================
        % Resizes the image using the Bicubic Interpolation algorithm.
        % Transforms the image I from size m x n to size p x q.
        % =========================================================================

    [m n nr_colors] = size(I);
    
    % TODO: Initialize the final matrix as a zero matrix.
    R = zeros(p, q);
    I = double(I);
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Note:
        % When scaling an image, the point (0, 0) of the image will not move.
        % In Octave, pixels in images are indexed from 1 to n.
        % If you work with indices from 1 to n and multiply x and y by s_x
        % and s_y respectively, the origin of the image will move from (1, 1) to (sx, sy)!
        % Therefore, you must work with indices in the range [0, n-1]!


    % TODO: Calculate the scale factors.
    % Note: If you work with indices in the range [0, n-1], the last pixel
    % of the image will move from (m-1, n-1) to (p, q).
    % s_x will not be q ./ n
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
    % TODO: Defineste matricea de transformare pentru redimensionare.
    T = [ s_x 0 ; 0 s_y];
    % TODO: Define the transformation matrix for resizing.
    T_inv = [ 1/s_x 0; 0 1/s_y];
    % TODO: Precalculate the derivatives.
    [Ix, Iy, Ixy] = precalc_d(I);
    % Loop through each pixel in the image.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Apply the inverse transformation to (x, y) and calculate x_p and y_p
            % in the original image space.
            j = y * T_inv(2,2) + 1;
            i = x * T_inv(1,1) + 1;
            % TODO: Convert (xp, yp) from the 0, n-1 coordinate system to
            % the 1, n coordinate system to apply interpolation.

            % TODO: Find the four points surrounding the point x, y.
            x1 = floor(i);
            y1 = floor(j);
            x2 = x1 + 1;
            y2 = y1 + 1;
            
            if x2 > n
              x2 = x1 - 2;
            endif
            if y2 > m
              y2 = y1 - 2;
            endif

            % TODO: Convert the coordinates (xp, yp) to the unit square by subtracting (x1, y1).
            i = i - x1;
            j = j - y1;
            % TODO: Calculate the interpolated value of the pixel (x, y).
            % Note: For writing to the image, x and y are in coordinates from
            % 0 to n-1 and they need to be from 1 to n.
            R(y+1, x+1) = ([1 i i .^2 i .^3] * A * [1; j; j .^2; j .^ 3]) ;
        endfor
    endfor
    R = uint8(R);
endfunction





