%% MyMainScript

tic;
%% Your code here 
    sigma = 2.5;
    patch_size = 9;
    window_size = 25;
    h = 0.0024;
    
    % Reading in Barbara
    temp = load('../data/barbara.mat');
    barbara = mat2gray(temp.imageOrig);
    %imshow(noise(downscaling(barbara)));
   
    % Reading in grass
    grass = im2double(imread('../data/grass.png'));
    %figure;
    %imshow(noise(downscaling(grass)));
    
    % Reading in HoneyCombReal
    honeyCombReal = im2double(imread('../data/honeyCombReal.png'));
    %figure;
    %imshow(noise(honeyCombReal));
    
     input_image = downscaling(grass);
    
     filtered_image = myPatchBasedFiltering(noise(input_image), patch_size, window_size, sigma, h);
     X = ['RMSD: ',num2str(rmsd(input_image, filtered_image))];
     disp(X);
     
%      filtered_image = myPatchBasedFiltering(noise(input_image), patch_size, window_size, sigma, 0.9*h);
%      X = ['RMSD: ',num2str(rmsd(input_image, filtered_image))];
%      disp(X);
    
%      filtered_image = myPatchBasedFiltering(noise(input_image), patch_size, window_size, sigma, 1.1*h);
%      X = ['RMSD: ',num2str(rmsd(input_image, filtered_image))];
%      disp(X);
     
    figure;
    subplot(1, 3, 1);
    imshow(contrast_streching(input_image));
    axis on;
    title('Original');

    subplot(1, 3, 2);
    imshow(contrast_streching(noise(input_image)));
    axis on;
    title('Noisy image');

    subplot(1, 3, 3);
    imshow(contrast_streching(filtered_image));
    axis on;
    title('Patch filtered image');

toc;










