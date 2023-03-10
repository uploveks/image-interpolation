function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Resize the color image 'img' to size p x q.
    % =========================================================================

    % TODO: Extract the red channel of the image.
    R_ch = img(:,:,1);
    % TODO: Extract the green channel of the image.
    G_ch = img(:,:,2);
    % TODO: Extract the blue channel of the image.
    B_ch = img(:,:,3);
    % TODO: Apply bicubic function on the three color channels of the image.
    R_new = bicubic_resize(R_ch, p, q);
    G_new = bicubic_resize(G_ch, p, q);
    B_new = bicubic_resize(B_ch, p, q);
    % TODO: Form the final image by concatenating the three color channels.
    out = cat(3, R_new, G_new, B_new);
endfunction
