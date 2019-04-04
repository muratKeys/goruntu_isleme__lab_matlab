%%

filter3 = ones(3,3)/9;
filter5 = ones(5,5)/25;
filter7 = ones(7,7)/49;
filter11 = ones(11,11)/121;

%%
I = imread('cameraman.tif');
figure, imshow(I); title('Original');

I3 = filter2(filter3, I, 'same'); %apply the filter on the image
figure; 
image(I3); % convert from matris to image
colormap(gray(256)); %describe color map
title('3*3 avarage filter');

I4 = uint8(I3); 
figure, imshow(I4); title('3*3 avarage filter');


%%
I5 = filter2(filter5, I, 'same');
figure;
image(I5);
colormap(gray(256));
title('5*5 avarage filter');

%%
I7 = filter2(filter7, I, 'same');
figure;
image(I7);
colormap(gray(256));
title('7*7 avarage filter');

%%
I11 = filter2(filter11, I, 'same');
figure;
image(I11);
colormap(gray(256));
title('11*11 avarage filter');

%%
x = imread('filtresim1.png');
a = rgb2gray(x);
imshow(a); 
title('Real Ýmage');

%%
filter1 = [1 1 1; 1 1 1; 1 1 1]/9; %create a filter

b = filter2(filter1, a, 'valid');   %apply filter to image
%figure; image(b); 
colormap(gray(256)); %describe colormap

b2 = uint8(b);   
figure,imshow(b2); 
title('Filtering Image');

%%
%Goruntu uzerine gurultu ekleme ve filtre uygulayarak giderme

x2 = imread('filtresim2.png');
a2 = rgb2gray(x2);
imshow(a2); title('Real Image');

a3 = imnoise(a2, 'gaussian'); % add a noise in an image
figure,imshow(a3); title('Image with Noise');
filter33 = ones(3,3)/9;

g1 = filter2(filter33, a3, 'valid');
%figure; image(g1); 
%colormap(gray(256));

g2 = uint8(g1);
figure,imshow(g2); title('Clearing Image');

%%

% Gaussian filters are a class of low-pass filters.
gauss33 = [ 1 2 1; 2 4 2; 1 2 1]/16; %elemanlarý toplamý 16

g3 = filter2(gauss33, a3, 'valid');
figure; image(g3);  % return olarak double dondurur. Buyuk boytludur.
colormap(gray(256));

g4 = uint8(g3);
figure,imshow(g4); title('3*3 Gauss Filter');

%%
%Apply 5*5 gaussian filter 
gauss55 = [ 1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1]/273;

g6 = filter2(gauss55, a3, 'valid');
figure; image(g6); 
colormap(gray(256));

g7 = uint8(g6);
figure,imshow(g7); title('5*5 Gaussian Filter');

%%

x4 = imread('filtresim4.png');
a4 = rgb2gray(x4);
imshow(a4);  title('Original Image');

%%
sharp = [0 -1 0; -1 5 -1; 0 -1 0]/1;
s1 = filter2(sharp, a4, 'valid');
%figure; image(s1); 
%colormap(gray(256));

s2 = uint8(s1);
figure,imshow(s2); title('3*3 Sharpening Filter 1');

%%
sharp2 = [-1 -1 -1; -1 9 -1; -1 -1 -1]/1;
s3 = filter2(sharp2, a4, 'valid');
%figure; image(s3); 
%colormap(gray(256));

s4 = uint8(s3);
figure,imshow(s4); title('3*3 Sharpening Filter 2');
