function out = proximal_2x2_RGB(img, STEP = 0.1)
% =====================================================================================================
% Applies Proximal Interpolation to the 2x2 image defined by img with equidistant intermediate points.
% img is a RGB -Red, Green, Blue- colored image.
% =====================================================================================================

    % TODO: Extract the red channel of the image.
    R_ch = img(:,:,1);
    % TODO: Extract the green channel of the image.
    G_ch = img(:,:,2);
    % TODO: Extract the blue channel of the image.
    B_ch = img(:,:,3);
    % TODO: Apply the proximal function to the 3 color channels of the image.
    R_new = proximal_2x2(R_ch, STEP);
    G_new = proximal_2x2(G_ch, STEP);
    B_new = proximal_2x2(B_ch, STEP);
    % TODO: Form the final image by concatenating the 3 color channels.
    out = cat(3, R_new, G_new, B_new);
endfunction
