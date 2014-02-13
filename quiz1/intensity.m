function outimg = intensity(img, level)
% reduces the number of intensity levels in an image
outimg = fix(img/level)*level;
end

