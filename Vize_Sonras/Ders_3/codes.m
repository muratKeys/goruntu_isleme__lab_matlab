
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






%%%%%%
%Code_2
%%%%%%

clear all
clear all

I = imread('gantrycrane.png');
G = rgb2gray(I);
E = edge(G, 'canny'); imshow(E);
[H,theta,rho] = hough(E);
figure, imshow(H,[]);

peaks = houghpeaks(H, 50, 'Threshold', 30);
figure, imshow(G,[]), hold on;
lines = houghlines(E, theta, rho, peaks, 'FillGap', 5, 'MinLength', 15);
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    line(xy(:,1), xy(:,2), 'LineWidth', 1, 'Color',  'r');
end
