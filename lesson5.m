%Image Segmentation

%%
I = imread('image1.tiff');
I = rgb2gray(I);
figure,imshow(I); title('Original Image as gray');
figure, imhist(I)

I2 = I>133; %Goruntu uzerinde 100'den buyuk pixel degerlerini 1, kucuk olanlari 0 yapar.Yani binary image olusur.
subplot(1,3,1); imshow(I2); title('Thresholding = 133');

I3 = I>134; %Goruntu uzerinde 160'den buyuk degerleri 1, digerlerini 0 yapar.
subplot(1,3,2); imshow(I3); title('Thresholding = 134');

T = graythresh(I); %otomatik thresholding hesaplar ve graythresh function uses Otsu's method
I4 = im2bw(I,T); %converts the grayscale image I to a binary by thresholding.
subplot(1,3,3); imshow(I4); title('Otsu Thresholding');


%%
img = imread('cameraman.tif');
figure,imshow(img); title('Original Image');
%figure, imhist(img)

level = graythresh(img); %level = 0.5216
img2 = im2bw(img,level); %converts the grayscale image I to a binary by thresholding.
figure,imshow(img2); title('Thresholding Image using graythresh');

%Ayný resim uzerine manuel Thresholding yapýlmasý
g=img>133; %133 degerini (level*255)0.5216*255 yaparak elde ettim.
figure,imshow(g); title('Thresholding Image as manual calculating');

%%
%Ayný resim uzerine manuel Thresholding yapýlmasý
c = img; 
[m n] = size(img);

for i=1:m
    for j=1:n
        if img(i,j)<90 
            c(i,j) = 0;
        end
    end
end 

figure,imshow(c); title('Thresholding Image');

%%
%Kalp ve Akciger Damari
a = imread('lung7.png');
figure, imshow(a);
b = rgb2gray(a);
figure, imhist(b);

%%
[m n] = size(b);
c = b;
for i=1:m
    for j=1:n
        if b(i,j)<120 
            c(i,j) = 0;
        end
    end
end    

subplot(4,2,1); imshow(c); title('Thresholding Image');

%Convert the image to binary image
d = im2bw(c);
subplot(4,2,2); imshow(d); title('Binary Image (d)');


e = bwareaopen(d,500); %500'den kucuk olan pixels silindi.
subplot(4,2,3); imshow(e); title('Removed objects less than 500 pixels.(e)');

f = d - e; %Binary image ile e arasýndaki fark alýndý.
subplot(4,2,4); imshow(f); title('d - e');

g = bwareaopen(f,20);
subplot(4,2,5); imshow(e); title('Removed objects less than 20 pixels.');

L = bwlabel(g); %Label connected components in 2-D binary image
subplot(4,2,6); imshow(L); title('Labeled');
LL = label2rgb(L);
subplot(4,2,7); imshow(LL); title('Labeled Image RGB');

%%

ozellik = regionprops(L,g); %measures properties of image regions

figure,imshow(g); hold on

for i=1:length(ozellik) %struct'in eleman sayisi kadar dongu devam eder.
    if ozellik(i).Area>40 %i.'inci elamanin alani 40'dan buyukse
        x0 = ozellik(i).Centroid(1) %merkezin x-koordinatý
        y0 = ozellik(i).Centroid(2) %merkezin y-koordinatý
        %belilenen noktaya x isareti koy.Kalýnlýk 1 ve renk kirmizi
        plot(x0,y0, 'x', 'LineWidth', 1, 'Color', 'r'); 
        text(x0,y0+5, int2str(i), 'Color', 'b'); %Merkezin 5 pixel sagina elaman noyu al.
    end
end   

%%
ozellik2 = regionprops(L,b, 'all'); %b, asýl goruntu

figure, imshow(b); %plot kullanmadigim icin hold on yapmadik.
for i=1:length(b);
    if ozellik2(i).MeanIntensity>150 %Ortalama pixel degeri 150'den buyuk  olanlar varsa
        rectangle('position', ozellik2(i).BoundingBox, 'EdgeColor', 'r');
    end
end    

%%
liste = zeros(1, length(ozellik2));
sayac = 0;

figure, imshow(b); %Uzerinde isaretleme yapilacak Image
for i=1:length(ozellik2) %struct'in eleman sayisi kadar dongu devam eder.
    %nesne icin eksen uzunlugu oranýnýn hesaplanmasý
    oran = ozellik2(i).MinorAxisLength/ozellik2(i).MajorAxisLength
    if oran>0.7 %oran 0.7'den buyuk ise goruntu uzerinde onu cevreleyen dortgen ciz.
        rectangle('position', ozellik2(i).BoundingBox, 'EdgeColor', 'r');
        sayac = sayac + 1;
        liste(1, sayac) = i;
    end
end
    