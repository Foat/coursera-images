function outimg = jpeg(img, level)
% simple jpeg implementation
%   img - intput image
%   level - quantization level (if == 0 or not defined - uses keeplargest)
if nargin<2 || level == 0
    outimg=blockproc(img, [8 8], @(x) idct2(keeplargest( dct2(x.data) )));
else 
    outimg=blockproc(img, [8 8], @(x) idct2(intensity(dct2(x.data), level)));
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