function image = downscaling(input)
% https://dsp.stackexchange.com/questions/28208/gaussian-filter-in-terms-of-pixel-radius
    gaussian_kernel = fspecial('gaussian', [3 3], 0.66);
    image = imresize(imfilter(input, gaussian_kernel), 1/2);
end
