% https://homepages.inf.ed.ac.uk/rbf/HIPR2/unsharp.htm
% (input Image, Standard Deviation, Scaling Factor) -> Output Image
function sharpOut = myUnsharpMasking(imgIn, sd, scFactor)
    smoothImg = imgaussfilt(imgIn, sd);
    edgeImg = imgIn - smoothImg;
    sharpOut = imgIn + scFactor * edgeImg;
end