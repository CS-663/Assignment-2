%% Getting the patch similarity 
function similarity = patch_similarity(patch1, patch2, h, gauss_patch)
    win1 = centerCropWindow2d(size(gauss_patch), size(patch1));
    gauss_patch = imcrop(gauss_patch,win1);
    similarity = exp(-sum(((patch1-patch2).*gauss_patch).^2, 'all')/((h^2)));
end