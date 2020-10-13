%% Function to Introduce noise in the image
function noise_img = noise(img)
    noise_img = img + 0.05*randn(size(img));
end