%
%
%
clear all
close all
clc

n = input('Antal punkter? ');
[x,y] = ginput(n);

rader = length(x); 
design = zeros(rader,n);
for i = 1:n
    design(:, i)=x.^(n-i);
end
coeffs = design \ y; 

fi = [0:0.25:2*pi];
X = linspace(min(x),max(x),length(fi))';
Y = polyval(coeffs,X);

Xplot=X*ones(size(fi));
Yplot=Y*cos(fi);
Zplot=Y*sin(fi);
surfl(Xplot, Yplot, Zplot)
xlabel('x')
ylabel('y')
zlabel('z')
%axis off
shading interp
colormap summer