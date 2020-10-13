%% Function for patch-based filtering
function filtered_image = myPatchBasedFiltering(image, patch_size, window_size, sigma, h)
    gaussian_patch = g_p(patch_size, sigma);
    imagesc(gaussian_patch);
    wsh = fix(window_size/2); % Window Size Half
    psh = fix(patch_size/2); % Patch Size Half
    
    filtered_image = zeros(size(image));
    
    [height, width] = size(image);
    
    for i = 1:height
        for j = 1:width
            
            % Window Patch Dimensions
            [wtop, wbottom, wleft, wright] = window_dimensions(wsh, i, j, height, width); 
            
            window_h = (wbottom-wtop)+1;
            window_w = (wright-wleft)+1;

            % Cropping the window
            window_crop = imcrop(image, [wleft wtop window_w-1 window_h-1]);
%              window_crop = image(wtop:wbottom , wleft:wright);
            
            % Center Patch Dimensions
            [ctop, cbottom, cleft, cright] = patch_dimensions(psh, i, j, height, width);
            
            center_h = (cbottom-ctop)+1;
            center_w = (cright-cleft)+1;
            
            % Cropping the center patch
            center_crop = imcrop(image, [cleft ctop center_w-1 center_h-1]);
%             [height_center, width_center] = size(center_crop);
            weights = zeros(size(window_crop));
            
            for k = 1:window_h
                for l = 1:window_w
                    
                    [ptop, pbottom, pleft, pright] = patch_dimensions(psh, k, l, window_h, window_w);
                    
                    patch_h = (pbottom-ptop)+1;
                    patch_w = (pright-pleft)+1;
                    
                    temp_crop = imcrop(window_crop, [pleft ptop patch_w-1 patch_h-1]);

                    [temp_crop_height, temp_crop_width] = size(temp_crop);
                    
                    % If patch under consideration is smaller than the 
                    % center patch we ignore it.
                     if (center_h <= temp_crop_height) && (center_w <= temp_crop_width)
                         patch_crop = imcrop(temp_crop, [1 1 center_w-1 center_h-1]);
                         
                         weights(k,l) = patch_similarity(center_crop, patch_crop, h, gaussian_patch);
                     else
                         weights(k,l) = 0.0;
                     end

                end
            end
            
            total_weights = sum(weights, 'all');
%             disp(total_weights);
            weights = weights/total_weights;
            
            filtered_image(i,j) = sum(weights.*window_crop,'all');
        end
        
        % Percentage of the image processed
        X = ['Percentage Completed: ',num2str((i/height)*100)];
        disp(X);
    end
    
end