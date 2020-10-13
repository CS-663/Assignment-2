%% MyMainScript


tic;
img1 = load('../data/superMoonCrop.mat').imageOrig;
img2 = load('../data/lionCrop.mat').imageOrig;
out1 = myUnsharpMasking(img1, 8, 0.7);
out2 = myUnsharpMasking(img2, 6, 0.9);
% Output figures
figure('Name', 'Part (a)');
subplot(1,2,1), imshow(img1);
axis equal tight on;
title('Original Image');
colorbar;
subplot(1,2,2), imshow(out1);
axis equal tight on;
title('Sharpened Image');
colorbar;
figure('Name', 'Part (b)');
subplot(1,2,1), imshow(img2);
axis equal tight on;
title('Original Image');
colorbar;
subplot(1,2,2), imshow(out2);
axis equal tight on;
title('Sharpened Image');
colorbar;

toc;
