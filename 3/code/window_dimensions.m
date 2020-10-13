function [height_top, height_bottom, width_left, width_right] = window_dimensions(wsh, i, j, height, width)
    height_top = max(i-wsh, 1);
    height_bottom = min(i+wsh, height);
    width_left = max(j-wsh, 1);
    width_right = min(j+wsh, width);
end