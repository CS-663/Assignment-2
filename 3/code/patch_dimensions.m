function [height_top, height_bottom, width_left, width_right] = patch_dimensions(psh, i, j, height, width)
    height_top = max(i-psh, 1);
    height_bottom = min(i+psh, height);
    width_left = max(j-psh, 1);
    width_right = min(j+psh, width);
end