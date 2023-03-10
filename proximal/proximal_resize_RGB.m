function out = proximal_resize_RGB(img, p, q)
% =========================================================================
% Resize the image img to have dimensions p x q.
% The input image is in color.
% =========================================================================

    % TODO: Extract the red channel of the image.
    R_ch = img(:,:,1);
    % TODO: Extract the green channel of the image.
    G_ch = img(:,:,2);
    % TODO: Extract the blue channel of the image.
    B_ch = img(:,:,3);
    % TODO: Apply the proximal_resize function on each of the 3 channels of the image.
    R_new = proximal_resize(R_ch, p, q);
    G_new = proximal_resize(G_ch, p, q);
    B_new = proximal_resize(B_ch, p, q);
    % TODO: Form the final image by concatenating the 3 color channels.
    out = cat(3, R_new, G_new, B_new);

endfunction