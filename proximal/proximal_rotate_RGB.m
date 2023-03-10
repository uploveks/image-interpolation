function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Apply Proximal Interpolation to rotate an RGB image by a given angle.
    % =========================================================================

    % TODO: Extract the red channel of the image.
    R_ch = img(:,:,1);
    % TODO: Extract the green channel of the image.
    G_ch = img(:,:,2);
    % TODO: Extract the blue channel of the image.
    B_ch = img(:,:,3);
    % TODO: Apply the proximal function on the 3 color channels of the image.
    R_new = proximal_rotate(R_ch, rotation_angle);
    G_new = proximal_rotate(G_ch, rotation_angle);
    B_new = proximal_rotate(B_ch, rotation_angle);
    % TODO: Form the final image by concatenating the 3 color channels.
    out = cat(3, R_new, G_new, B_new);
endfunction
