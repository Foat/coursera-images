%% 1 jpeg dct with quantization
out = jpeg(img,16);
figure, imshow(out, []);

% jpeg with 8 largest
out = jpeg(img);
figure, imshow(out, []);

%% 4 color compression
out = jpeg(imgc);
figure, imshow(out, []);