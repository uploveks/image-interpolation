function r = fy(f, x, y)
    % =========================================================================
    % Approximates the derivative of f with respect to y at the point (x, y).
    % =========================================================================

    % TODO: Calculate the derivative.
    r = (f(y + 1, x) - f(y - 1, x))/2.0;
endfunction
