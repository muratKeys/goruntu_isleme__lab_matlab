a = imread('tool001.gif'); % diger resimleri icin  tekrarla 

b = imbinarize(a); figure, imshow(b);

mnts = moment_vektor(b);
sat= 1; % diger resimler icin tekrarla
data(sat,:) = mnts;
