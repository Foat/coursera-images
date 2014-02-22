function outimg = prederr(img,type)
% computes prediction error for an image
% img - input image
% type - type of prediction error computation (1 - left px, 2 - left corner)
if nargin<2
    type=1;
end

s = size(img);
outimg = zeros(s,'double');

if type == 1
outimg(1) = img(1);
for i=2:(s(1) * s(2))
    outimg(i) = double(img(i-1)) - double(img(i));
end
elseif type == 2
    repl = padarray(img,[1 1],'replicate');
    
    for i=1:s(1)
        for j=1:s(2)
            outimg(j,i) = double(repl(j,i+1) + repl(j,i) + repl(j+1,i)) / 3 - double(img(j,i));
        end
    end
    
end

end

