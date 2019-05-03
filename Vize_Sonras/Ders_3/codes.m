
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







%%%%%%
%Code_2
%%%%%%

I = imread('circuit.tif'); rotI = imrotate(I, 33, 'crop');

BW = edge(rotI, 'canny');  [H,T,R] = hough(BW);
imshow(H,[], 'CData', T, 'YData', r, 'InitialMagnification', 'tif');
xlabel('\theta'), ylabel('\rho');  axis on, axis normal, hold on;
P = houghpeaks(H, 5, 'threshold', ceil(0.3*max(H(:))));
x = T(P(:,2));    y = R(P(:,1));   plot(x,y,'s', 'color', 'write');

%%  % :izgileri tesoşit et ve işaretle
line = houghlines(BW, T, R, P, 'FillGap', 5, MinLength, 7);
% houghtlines ile tespit edilen cizgileri bir structa kaydet
% FillGap: 5 pixelden yakın olanları birleştir. Default = 20
% MinLenth: 7 En kısa 7 pixelden olanları tespit et.
figure, imshow(rotI), hold on;
maxlen = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2]; % k. cizfnin ilk ve son noktalari
    plot(xy(:,1), xy(:,2), 'LinWidth', 2, 'Color', 'green');
    %LineWidth: Cizgi kalınlığı 2 pixel. Color:Renk
    % cizgi bası ve sonu x işareti ile işaretleniyor
    plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
    plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
    % en uzun cizgi tespiti
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len )
        max_len = len;
        xy_long = xy;
    end
end

% en uzun cizgi farkli renkle işaretleniyor
plot(xy_long(:,1), xy_long(:,2), 'LineWidth', 2, 'Color', 'cyan');
    
  
