function r = fx(f, x, y)
    % =========================================================================
    % Approximates the derivative of f with respect to x at point (x, y).
    % =========================================================================

    % TODO: Calculate the derivative.
    r = (f(y , x + 1) - f(y , x - 1))/2.0;
endfunction
