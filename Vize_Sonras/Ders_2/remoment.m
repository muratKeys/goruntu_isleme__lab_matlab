a = imread('tool004.gif');
%b = rgb2gray(a);
i = imbinarize(a); imshow(i);
ax = moment_vektor(i);

i2 = imrotate(i, 180); figure, imshow(i2);
bx = moment_vektor(i2);

i3 = imrotate(i, 90); figure, imshow(i3);
cx = moment_vektor(i3);

i4 = imrotate(i, 0.5); figure, imshow(i4);
dx = moment_vektor(i4);

i5 = imrotate(i, 2); figure, imshow(i5);
ex = moment_vektor(i5);
