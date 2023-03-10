function a = proximal_coef(f, x1, y1, x2, y2)
% =========================================================================
% Calculates coefficients a for Proximal Interpolation between points
% (x1, y1), (x1, y2), (x2, y1) and (x2, y2).
% =========================================================================

    % TODO: Calculate matrix A.
    A = [1 x1 y1 x1*y1; 1 x1 y2 x1*y2; 1 x2 y1 x2*y1; 1 x2 y2 x2*y2];
    % TODO: Calculate vector b.
    b = [ f(x1, y1) ; f(x1, y2) ; f(x2, y1) ; f(x2, y2)];
    % TODO: Calculate coefficients.
    b = double(b);
    A_inv = PR_Inv(A);
    a = A_inv * b;

    
endfunction
