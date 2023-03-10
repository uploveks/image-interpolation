function r = fxy(f, x, y)
    % =========================================================================
    % Approximates the partial derivative of function f with respect to x and y
    % at point (x, y).
    % =========================================================================

    % TODO: Calculate the derivative using the central difference formula.
    r = (f(y - 1, x - 1) + f(y + 1, x + 1) - f(y - 1, x + 1) - f(y + 1, x - 1))/4.0;
endfunction
