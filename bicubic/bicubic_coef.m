function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculates Bicubic Interpolation coefficients for 4 adjacent points
    % =========================================================================
    A = zeros(4,4);
    f = double(f);
    A = double(A);
    % TODO: Calculate intermediate matrices.
    F = [f(y1,x1) f(y2,x1) Iy(y1,x1) Iy(y2,x1) ; 
         f(y1,x2) f(y2,x2) Iy(y1,x2) Iy(y2,x2) ;
         Ix(y1,x1) Ix(y2,x1) Ixy(y1,x1) Ixy(y2,x1) ;
         Ix(y1,x2) Ix(y2,x2) Ixy(y1,x2) Ixy(y2,x2)];
    M1 = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    M2 = [1 0 -3 2; 0 0 3 -2; 0 1 -2 1; 0 0 -1 1];
    % TODO: Convert intermediate matrices to double.
    F = double(F);
    M1 = double(M1);
    M2 = double(M2);
    % TODO: Calculate the final matrix.
    A = double(M1 * F * M2);
endfunction