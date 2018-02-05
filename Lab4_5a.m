%
%
%
clear all
close all
clc
z = [-14:0.01:5]';
fi = [0:0.01:2*pi];

x = zeros(size(z));
i = 1;
while i<= length(z)
   x(i) = 2-atan(z(i));
   i = i+1;
end

X = x*cos(fi); 
Y = x*sin(fi);
Z = z*ones(size(fi));
surfl(X,Y,Z); 
axis equal
shading interp
colormap bone
