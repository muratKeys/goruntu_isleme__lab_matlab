b = imread('sekiller.png'); imshow(b);
bb = rgb2gray(b); figure, imshow(bb);
c = imbinarize(bb, 0.9); figure, imshow(c);
cc = imcomplement(c);
figure, imshow(cc);

%%
ozellik = regionprops(cc,'all');
%g = ozellik(5).FilledImage;
g = imcrop(cc, ozellik(4).BoundingBox);
figure, imshow(g);
xx3 = moment_vektor(g);
xx3 = xx3';


%Odev: verilen herhangi bir resimdeki sekiller tespit edip isimleri uzerine yaz.
