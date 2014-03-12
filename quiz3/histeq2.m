function outimg = histeq2(img)
% histogram equalization
% img - input gray image
s = size(img);
total = s(1) * s(2);

h = imhist(img);
pn = h / total;

l1 = length(h);
buf = zeros(l1);
for i=1:l1
    buf(i) = sum(pn(1:i));
end

outimg = zeros(s);
for i=1:total
    outimg(i) = floor(255 * buf(img(i) + 1));
end

end

