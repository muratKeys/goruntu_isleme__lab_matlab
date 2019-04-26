
function [M]=moment_vektor(A)

% A resminin 7 moment sabitini hesaplar, 7 elemanlı M vektörüne kaydeder

% 1. Moment
n20=n_moment(2,0,A);
n02=n_moment(0,2,A);
M1=n20+n02;

% 2. Moment
n20=n_moment(2,0,A);
n02=n_moment(0,2,A);
n11=n_moment(1,1,A);
M2=(n20-n02)^2+4*n11^2;

% 3. Moment
n30=n_moment(3,0,A);
n12=n_moment(1,2,A);
n21=n_moment(2,1,A);
n03=n_moment(0,3,A);
M3=(n30-3*n12)^2+(3*n21-n03)^2;

% 4. Moment
n30=n_moment(3,0,A);
n12=n_moment(1,2,A);
n21=n_moment(2,1,A);
n03=n_moment(0,3,A);
M4=(n30+n12)^2+(n21+n03)^2;

% 5. Moment
n30=n_moment(3,0,A);
n12=n_moment(1,2,A);
n21=n_moment(2,1,A);
n03=n_moment(0,3,A);
M5=(n30-3*n21)*(n30+n12)*[(n30+n12)^2-3*(n21+n03)^2]+(3*n21-n03)*(n21+n03)*[3*(n30+n12)^2-(n21+n03)^2];

% 6. Moment
n20=n_moment(2,0,A);
n02=n_moment(0,2,A);
n30=n_moment(3,0,A);
n12=n_moment(1,2,A);
n21=n_moment(2,1,A);
n03=n_moment(0,3,A);
n11=n_moment(1,1,A);
M6=(n20-n02)*[(n30+n12)^2-(n21+n03)^2]+4*n11*(n30+n12)*(n21+n03);

% 7. Moment
n30=n_moment(3,0,A);
n12=n_moment(1,2,A);
n21=n_moment(2,1,A);
n03=n_moment(0,3,A);
M7=(3*n21-n03)*(n30+n12)*[(n30+n12)^2-3*(n21+n03)^2]-(n30+3*n12)*(n21+n03)*[3*(n30+n12)^2-(n21+n03)^2];



% vektör kaydediliyor
M=[M1    M2     M3    M4     M5    M6    M7]';
