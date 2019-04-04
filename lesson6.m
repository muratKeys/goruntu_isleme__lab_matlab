%Image segmentation using Morphological operations in Matlab

res = imread('resim4.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Inverted Binary');

se1 = strel('disk', 8);
erosion1 = imerode(inv_bw, se1);
subplot(2,4,5); imshow(erosion1); title('Disk 8');

se2 = strel('disk', 18);
erosion2 = imerode(inv_bw, se2);
subplot(2,4,6); imshow(erosion2); title('Disk 18');

se3 = strel('line', 18, 0);
erosion3 = imerode(inv_bw, se3);
subplot(2,4,7); imshow(erosion3); title('Line 18 and 0 deg');

se4 = strel('rectangle', [11,11]);
erosion4 = imerode(inv_bw, se4);
subplot(2,4,8); imshow(erosion4); title('Rectangle 11');

%%

res = imread('resim5.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('disk', 5);
dilation1 = imdilate(inv_bw, se1);
subplot(2,4,5); imshow(dilation1); title('Dilation- Disk 5');

se2 = strel('disk', 11);
dilation2 = imdilate(inv_bw, se2);
subplot(2,4,6); imshow(dilation2); title('Dilation- Disk 11');

dilation3 = imerode(dilation2, se2);
subplot(2,4,7); imshow(dilation3); title('Erotion- Disk 11');

se3 = strel('diamond', 3);
dilation4 = imerode(dilation2, se3);
subplot(2,4,8); imshow(dilation4); title('Erotion- Diamond');


%%
res = imread('resim6.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('disk', 5);
dilation1 = imdilate(inv_bw, se1);
subplot(2,4,5); imshow(dilation1); title('Dilation- Disk 5');

se2 = strel('disk', 17);
dilation2 = imdilate(inv_bw, se2);
subplot(2,4,6); imshow(dilation2); title('Dilation- Disk 17');

dilation3 = imerode(dilation2, se2);
subplot(2,4,7); imshow(dilation3); title('Erotion- Disk 17');

%%
%Opening and Closing Operations 

res = imread('resim1_png.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('disk', 3);
se2 = strel('disk', 5);
se3 = strel('disk', 10);
se4 = strel('line', 10,0);

opening1 = imopen(res_bw, se1);
subplot(2,4,5); imshow(opening1); title('Opening- Disk 3');

opening2 = imopen(res_bw, se2);
subplot(2,4,6); imshow(opening2); title('Opening- Disk 5');

opening3 = imopen(res_bw, se3);
subplot(2,4,7); imshow(opening3); title('Opening- Disk 10');

opening4 = imopen(res_bw, se4);
subplot(2,4,8); imshow(opening4); title('Opening- Line 10 and 0 deg');

%%

res = imread('resim12.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('disk', 3);
se2 = strel('disk', 5);
se3 = strel('disk', 8);

closing1 = imclose(res_bw, se1);
subplot(2,4,5); imshow(closing1); title('Closing- Disk 3');

closing2 = imclose(res_bw, se2);
subplot(2,4,6); imshow(closing2); title('Closing- Disk 5');

closing3 = imclose(res_bw, se3);
subplot(2,4,7); imshow(closing3); title('Closing- Disk 10');


%%

res = imread('resimyazi3.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('disk', 1);
dilation1 = imdilate(inv_bw, se1);
subplot(2,4,5); imshow(dilation1); title('Dilation- Disk 2');


%%
%Example about opening operations

res = imread('resim10.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('line', 5,0);
opening1 = imopen(res_bw, se1);
subplot(2,4,5); imshow(opening1); title('Line 5 and 0 Deg');

se2 = strel('line', 50,0);
opening2 = imopen(res_bw, se2);
subplot(2,4,6); imshow(opening2); title('Line 50 and 0 Deg');

se3 = strel('line', 5,45);
opening3 = imopen(res_bw, se3);
subplot(2,4,7); imshow(opening3); title('Line 5 and 45 Deg');

se4 = strel('line', 50,135);
opening4 = imopen(res_bw, se4);
subplot(2,4,8); imshow(opening4); title('Line 50 and 135 Deg');

%%
%Example about opening operations

res = imread('resim8.png');
subplot(2,4,1); imshow(res); title('Original Image');

res2 = rgb2gray(res);
subplot(2,4,2); imshow(res2); title('Gray Image');

level = graythresh(res2);
res_bw = im2bw(res2, level);
subplot(2,4,3); imshow(res_bw); title('Binary Image');

inv_bw = imcomplement(res_bw);
subplot(2,4,4); imshow(inv_bw); title('Complemeted Image');

se1 = strel('disk', 5);
opening1 = imopen(res_bw, se1);
subplot(2,4,5); imshow(opening1); title('Disk- 5');

se2 = strel('disk', 6);
opening2 = imopen(res_bw, se2);
subplot(2,4,6); imshow(opening2); title('Disk- 6');

se3 = strel('disk', 7);
opening3 = imopen(res_bw, se3);
subplot(2,4,7); imshow(opening3); title('Disk- 7');

se4 = strel('disk', 9);
opening4 = imopen(res_bw, se4);
subplot(2,4,8); imshow(opening4); title('Disk- 9');
