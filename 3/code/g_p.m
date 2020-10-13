%% Creating a 9x9 gaussian patch
function gaussian_patch = g_p(n, sigma)
% https://stackoverflow.com/questions/13193248/how-to-make-a-gaussian-filter-in-matlab
%     ng = (n-1)/2;
%     [x,y] = meshgrid(-ng:ng, -ng:ng);
%     gaussian_patch = exp(-(x.^2 + y.^2)/(2*sigma^2)); 
    gaussian_patch = fspecial('gaussian', [n n], sigma);
end