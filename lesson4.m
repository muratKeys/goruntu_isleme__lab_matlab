%%

I = imread('hawk.png');
h = ones(5,5)/25; % Create an avarage filter
I2 = imfilter(I, h);
imshow(I), title('Real Image');
figure, imshow(I2), title('Filter Image - Default');

I4 = imfilter(I, h, 'replicate');
figure, imshow(I4), title('Filter Image - Repetitive');

%%
%Special Filters :
% You can create your special filter using fspecial() func.
I = imread('hawk.png');
subplot(2,2,1); imshow(I); title('Real Image'); %2 satýr 2 sutün oluþtur.

H1 = fspecial('motion', 11,135); %0,45,60,90,135 acý degerleri icin matrislere bak.
MotionBlur = imfilter(I, H1, 'replicate');
subplot(2,2,2); imshow(MotionBlur); title('Motion Blurred Image');

H2 = fspecial('disk', 11);
blurred = imfilter(I, H2, 'replicate');
subplot(2,2,3); imshow(blurred); title('Blur Image');

H3 = fspecial('average', 9);
avarage = imfilter(MotionBlur, H3);
subplot(2,2,4); imshow(avarage); title('9*9 Avarage Image');

%% Add noise
r = imread('hawk.png');
figure,imshow(r); title('Real Image');

rg = imnoise(r,'salt & pepper'); %0.05 noise ekler.
figure,imshow(rg); title('0.05 noise added on the Image as default');

rg2 = imnoise(r,'salt & pepper', 0.5);
figure,imshow(rg2); title('0.5 noise added on the Image');

%%
%Apply filter to satisfy noise using fspecial fuc.
f3 = fspecial('average',5); %create a filter 5x5 using fspecial() func.
fg1 = imfilter(rg,f3); %apply filter using imfilter()
figure,imshow(fg1); title('Satisfied noise from the Image which is 0.05');

fg2 = imfilter(rg2,f3);
figure,imshow(fg2); title('Satisfied noise from the Image which is 0.5');

%%

Grayrg = rgb2gray(rg); %convert image to grayscale
mf_rg = medfilt2(Grayrg);
figure,imshow(mf_rg); title('Apply median filter to satisfy noise from the Image which is 0.05');

Grayrg2 = rgb2gray(rg2);
mf_rg2 = medfilt2(Grayrg2);
figure,imshow(mf_rg2); title('Apply median filter to satisfy noise from the Image which is 0.5');


%%

%prewitt sýnýr belirleme icin dikey ve yatay filtreler.
prewitty = [-1 0 1; -1, 0 1; -1, 0, 1]; % dikey
prewittx = [-1, -1, -1; 0 0 0; 1 1 1]; %yatay

%sobel sýnýr belirleme icin dikey ve yatay filtreler.
sobely = [-1 0 1; -2 0 2; -1 0 1];
sobelx = [-1 -2 -1; 0 0 0; 1 2 1];

Image = imread('coins.png');
figure, imshow(Image); title('Real Image');

Image2 = filter2(prewitty, Image, 'same'); %apply dikey filter
figure, imshow(Image2); title('Image2');

Image3 = filter2(prewittx, Image, 'same'); %apply yatay filter
figure, imshow(Image3); title('Image3');

Image4 = sqrt(Image2.^2 + Image3.^2);
figure, imshow(Image4/255); title('Image4');

Image5 = mat2gray(Image4); title('Image5');

Image6 = imbinarize(Image5); 
figure, imshow(Image6); title('Image6');

%%
Image2 = filter2(sobely, Image, 'same'); %apply dikey filter
figure, imshow(Image2); title('Image2');

Image3 = filter2(sobelx, Image, 'same'); %apply yatay filter
figure, imshow(Image3); title('Image3');

Image4 = sqrt(Image2.^2 + Image3.^2);
figure, imshow(Image4/255); title('Image4');

Image5 = mat2gray(Image4); title('Image5');

Image6 = imbinarize(Image5); 
figure, imshow(Image6); title('Image6');

%%
%Edge func bir bolgedeki nesneleri cok detaylý gosteren canny'dir.
I = imread('image7.tiff');
Image = rgb2gray(I); 

Image7 = edge(Image, 'prewitt');
figure, imshow(Image7); title('prewitt');

Image8 = edge(Image, 'sobel');
figure, imshow(Image8); title('sobel');

Image9 = edge(Image, 'canny');
figure, imshow(Image9); title('canny');

%%
I = imread('moon.tif');
h = fspecial('unsharp', 0.9); %default value 0.2
I2 = imfilter(I,h);
imshow(I), title('Original Image');
figure, imshow(I2), title('Filtering Image');
