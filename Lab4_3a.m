%
%
clear all
close all
clc

T = [100:100:1000]';
k = [1.32 0.94 0.835 0.803 0.694 0.613 0.547 0.487 0.433 0.38]';
T1 = [T(1) T(4) T(7) T(10)]';
k1 = [k(1) k(4) k(7) k(10)]';    
degree = 3;
points = [T1 k1];

%Interpolerar polynom
nyDegree = degree + 1; %ger polynometsgrad
rader = length(points(:, 1)); %ger antalet rader i designmatrisen
x = points(:, 1);
y = points(:, 2);
design = zeros(rader,nyDegree);
%skapar en nollmatris som en grund för designmatrisen

for i = 1:nyDegree
    design(:, i)=x.^(nyDegree-i);
end
coeffs = design \ y; %Gauss-Jordan elimination för att lösa koefficienter

%plottar grafen
xV = points(:,1); % x-värden är i points första kolonn
yV = points(:,2);
s = 20;

%Det ser ut som ett andragradspolynom när det går från 100 till 1000 men
%det är ett tredjegradspolynom, kan visas med t.ex.xV = [0 1400]

polyX = [min(xV):s:max(xV)]; %ger x värden att beräkna
polyY = polyval(coeffs,polyX); %beräknar ovanstående punkter

plot(polyX,polyY) % plottar grafen som ges av polynomet
hold on
plot(xV,yV,'+') %plottar in punkterna som gavs av användaren

%0,836 W/cmK är konduktiviteten i T=300K i mätdatan
approx300 = polyval(coeffs,300)
fel300 = approx300 - k(3)