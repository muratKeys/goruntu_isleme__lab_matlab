
%%%%%%
%Code_1
%%%%%%
RGB = imread('gantrycrane.png');

I = rgb2gray(RGB);
BW = edge(I, 'canny');
figure, imshow(BW);
[H,T,R] = hough(BW, 'RhoResolution', 0.5, 'Theta', -90:0.5:89.5);
% rho değeri 0.5 Theta -90 + 89.5 arasında 0.5 aralıklarla

figure, subplot(2,1,1);  imshow(RGB);  title('grantrycrane.png');
% hough matrisini görüntüle

subplot(2,1,2);
imshow(imadjust(mat2gray(H)), 'XData', T, 'YData', R, 'InitialMagnification', 'fit');
title('Hough transform of grantrycrane');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(hot);
