function [Ix, Iy, Ixy] = precalc_d(I)
% =========================================================================
% Precompute the Ix, Iy, and Ixy matrices that contain the dx, dy, and dxy
% derivatives of the image I for each pixel of it.
% =========================================================================

   % Get the size of the image.
   [m, n, nr_colors] = size(I);
   % TODO: Convert the matrix I to double.
   I = double(I);
   % TODO: Compute the matrix with the x derivatives Ix.
   Ix = zeros(m, n);
   for i = 1 : m
       for j = 2 : n - 1
           Ix(i, j) = fx(I, j, i);
       endfor
   endfor
   % TODO: Compute the matrix with the y derivatives Iy.
   Iy = zeros(m, n);
   for i = 2 : m - 1
       for j = 1 : n
           Iy(i, j) = fy(I, j, i);
       endfor
   endfor
   % TODO: Compute the matrix with the xy derivatives Ixy.
   Ixy = zeros(m, n);
   for i = 2 : m - 1
       for j = 2 : n - 1
           Ixy(i, j) = fxy(I, j, i);
       endfor
   endfor
