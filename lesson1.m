%";" command output don't write to window command.
I = imread('/home/murat/Documents/ImageProcessing/filtresim/filtresim3.PNG');
%imshow(I);
B = I+70;
%figure,imshow(B); %figure command opens new sreen.
C = I-70;
%figure,imshow(C);
D = imresize(I, 0.5); %%
figure,imshow(D); title('0.5');
E = imresize(I, 2);
figure,imshow(E); title('0.1');

% 2 pieces %% symbol seperate your code two pices

%%
sayac=0;
[m n] = size(D);
for i=1:m
    for j=1:n
        if D(i,j)~=E(i,j)
            sayac = sayac + 1;
        end
    end
end
sayac

%imwrite command save the image to a file like BMP,
%imwrite(I, 'deneme1.bmp');

%imfinfo('C:\Users\enesa\Desktop\Lane Line Detection\test_image.jpg')

%close all --> to close all screens
%clear all --> to clear on command windows

%%
F = D;
[m n] = size(D);
for i=1:m
    for j=1:n
        if D(i,j)>10 && D(i,j)<130
            F(i,j);
        end
    end
end
figure,imshow(F)
%%
A = magic(5);
image(A)
axis image
colormap(gca,jet(25))
title('Image Displayed with Intrinsic Coordinates');