function outimg = histeq2(img)
% histogram equalization
% img - input gray image
s = size(img);
total = s(1) * s(2);

h = imhist(img);
pn = h / total;

outimg = zeros(s);
for i=1:total
    outimg(i) = floor(255 * sum(pn(1:img(i))));
end

end

