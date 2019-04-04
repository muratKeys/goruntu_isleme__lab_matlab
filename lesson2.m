a = imread('/home/murat/Documents/ImageProcessing/rose.bmp'); %read an image from folder as 3d matrix
%imshow(a)

a2 = rgb2gray(a); % convert to gray level 
%figure, imshow(a2);
imwrite(a2, 'rose2.bmp');
img = imread('rose2.bmp'); %read image as gray level
%figure,imshow(img);

reverse = img(end:-1:1, :) % reversing process
%figure, imshow(reverse);

kirp = img(40:end-30, 40:end-40); % make new matrix image with given new shape
%figure, imshow(kirp);

kucuk = img(1:2:end, 1:2:end); %make new matrix image given shape
%figure, plot(img(100,:))
%figure, imshow(kucuk)

%%
kirp = img(120:120, 120:120) ;
%figure, imshow(img)

%%
a=70; b=170; c=50; d=200;
image = imread('/home/murat/Documents/ImageProcessing/pout.jpg');
imshow(image)
figure, imhist(image)

%%
image2 = image
[m, n] = size(image2)
for i=1:m
    for j=1:n
        image2(i,j) = ((d-c) / (b-a))*(image(i,j)-a) + c;
    end
end
figure,imshow(image2)
figure, imhist(image2)

%%
image3 = imadjust(image,[0.3 0.7],[]);
figure, imshow(image3)
figure, imhist(image3)

%%
image4 = histeq(image3);
%figure, imshow(image4)
%figure, imhist(image4)

figure, imshow(image4), hold on
[m, n] = size(image4)
max_pixel = image4(1,1)
min_pixel = image4(2,2)

for i=1:m
    for j=1:n
        if (image4(i,j) > max_pixel);
            max_pixel = image4(i,j);
            plot(i,j, '*');
        end   
    end
end