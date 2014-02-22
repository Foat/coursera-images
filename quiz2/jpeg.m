function outimg = jpeg(img, level)
% simple jpeg implementation
%   img - intput image
%   level - quantization level (if == 0 or not defined - uses keeplargest)
if nargin<2
    level = 0;
end
s = size(img);

if length(s) == 3
    yimg = rgb2ycbcr(img);
    outimg = zeros(size(yimg),'uint8');
    for i=1:3
%         if i == 2 || i == 3
%             level = 64;
%         end
        outimg(:,:,i) = uint8(processlayer(yimg(:,:,i),level));
    end
    outimg = ycbcr2rgb(outimg);
else
    outimg = processlayer(img, level);
end

function O = processlayer(I,L)
if L == 0
    O=blockproc(I, [8 8], @(x) idct2(keeplargest( dct2(x.data) )));
else 
    O=blockproc(I, [8 8], @(x) idct2(intensity(dct2(x.data), L)));
end
end

end

function outmat = keeplargest(mat)
% preserving the 8 largest (by absolute value) coefficients 
% and rounding them to the closest integer
% mat - input matrix
outmat = mat(:);
l = length(outmat);
[~,si] = sort(abs(outmat),'descend');
outmat(si(9:l)) = 0;
outmat = reshape(round(outmat),size(mat));
end