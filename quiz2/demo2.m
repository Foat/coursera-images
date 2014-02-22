%% 1 jpeg dct with quantization
out = jpeg(img,16);
figure, imshow(out, []);

% jpeg with 8 largest
out = jpeg(img);
figure, imshow(out, []);

%% 4 color compression
out = jpeg(imgc);
figure, imshow(out, []);

%% 5 image hist && image prediction histogram
figure, imhist(img);
out = prederr(img,2);
figure, imshow(out,[]);
figure, hist(out);

%% 6 print entropy
fprintf('image entropy = %.2f\nprediction error entropy = %.2f\n',...
    entropy(img), entropy(out));