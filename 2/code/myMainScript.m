%% MyMainScript
tic;
img = load('../data/barbara.mat');
img1= mat2gray(img.imageOrig);
img2 = im2double(imread("../data/grass.png"));
img3 = im2double(imread("../data/honeyCombReal.png"));
[out1a,out1b, spatial1] = myBilateralFiltering(img1,1,5);
[out2a,out2b, spatial2] = myBilateralFiltering(img2,1,5);
[out3a,out3b, spatial3] = myBilateralFiltering(img3,1,5);
% rmsd2=sqrt(mean2((img2-out2b).^2);
% rmsd3=sqrt(sum(sum((img3-out3b).^2))/(rows*cols));

figure('Name', 'Part (a)');
subplot(2,2,1), imshow(img1);
axis equal tight on;
title('Original Image');
colorbar;
subplot(2,2,2), imshow(out1a);
axis equal tight on;
title('Corrupted Image');
colorbar;
subplot(2,2,3), imshow(out1b);
axis equal tight on;
title('Filtered Image');
colorbar;
subplot(2,2,4), imshow(spatial1);
axis equal tight on;
title('Spatial Gaussian Mask');
colorbar;


figure('Name', 'Part (b)');
subplot(2,2,1), imshow(img2);
axis equal tight on;
title('Original Image');
colorbar;
subplot(2,2,2), imshow(out2a);
axis equal tight on;
title('Corrupted Image');
colorbar;
subplot(2,2,3), imshow(out2b);
axis equal tight on;
title('Filtered Image');
colorbar;
subplot(2,2,4), imshow(spatial2);
axis equal tight on;
title('Spatial Gaussian Mask');
colorbar;


figure('Name', 'Part (c)');
subplot(2,2,1), imshow(img3);
axis equal tight on;
title('Original Image');
colorbar;
subplot(2,2,2), imshow(out3a);
axis equal tight on;
title('Corrupted Image');
colorbar;
subplot(2,2,3), imshow(out3b);
axis equal tight on;
title('Filtered Image');
colorbar;
subplot(2,2,4), imshow(spatial3);
axis equal tight on;
title('Spatial Gaussian Mask');
colorbar;


toc;
