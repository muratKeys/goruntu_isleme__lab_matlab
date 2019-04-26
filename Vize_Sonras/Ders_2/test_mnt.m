x = imread('tool003.gif');
x2 = imbinarize(x);
x3 = imrotate(x2, 60);
x4 = imresize(x3, 0.5); % Şekil döndürülüp küçültüldü
figure, imshow(x4);

mx = moment_vektor(x4);
mx = mx.'; % 1 sutun halindeki matris 1 satir haline geldi(transpoz)

%döngü içerisinde datanın her matrisi ile benzerliği ölçülecek
for k=1:8 % data matrisi workspacede yüklü olmalı
    benzer(1,k)=corr2(mx,data(k,:));
end

%corr2: korelasyon hesaplar. Aynı boyutta ve buyukluktte sayısal
%verilerin benzerliği. [0 1] arası 1'e ne kadar yakınsa o kadar benzer.
[deger, indis] = max(benzer);
