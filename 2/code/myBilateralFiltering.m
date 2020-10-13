function [out1,out2, spatial] = myBilateralFiltering(img,sigmaspatial,sigmaint)
% imshow(uint8(img));
% sigmaspatial=5;
% sigmaint=5;
range=max(img(:))-min(img(:));
sd=floor(0.05*range);
[rows,cols]=size(img);
r = normrnd(0,sd,[rows,cols]);
out1=imadd(img,r);
window_size=round(3*sigmaspatial+1);
img3= padarray(img,[window_size window_size],0,'both');
[padrow,padcol]=size(img3);
spatial=zeros(2*window_size+1,2*window_size+1);
out2=zeros(rows,cols);
for x = -window_size:window_size
    for y=-window_size:window_size
        spatial(x+window_size+1,y+window_size+1)=gaussian((y^2+x^2),sigmaspatial);
    end
end
% figure();
% imshow(uint8(spatial));
for r = window_size+1:padrow-window_size
     for c = window_size+1:padcol-window_size
         window=img3((r-window_size):r+window_size,(c-window_size):c+window_size);
         intensity=gaussian((img3(r,c)-window).^2,sigmaint);
         weighted_sum=sum(spatial.*intensity);
         filter=sum(window.*spatial.*intensity);
         out2(r-window_size,c-window_size)=filter/weighted_sum;
     end
end

function y = gaussian(rsq,sigma)
     y=exp(-0.5.*rsq./(sigma^2));
end
end