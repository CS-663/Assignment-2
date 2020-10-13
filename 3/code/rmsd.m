%% Function for calculating the RMDS w.r.t the refrence image
function value = rmsd(image1, image2)
    difference = image1 - image2;
    squared = difference.^2;
    
    squaredMean = mean2(squared);
    value = sqrt(squaredMean);
end