%% 1 changing intensity
out = intensity(img, 32);
figure, imshow(out);

%% 2 filtering
% create kernel
k = fspecial('average', 3);
out = imfilter(img, k);
figure, imshow(out);

%% 3 rotation
out = imrotate(img, 45);
figure, imshow(out);

%% 4 spatial resolution
s = size(img);
out = imresize(img, s/5, 'nearest');
out = imresize(out, s, 'nearest');
figure, imshow(out);