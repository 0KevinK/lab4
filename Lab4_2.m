clc, clear all, close all

%Laboration 4 2a)

A = [27 81
    64 256];

b = [40.5
    121.6];

x = b\A;

a1 = x(1,1);

a2 = x(1,2);

%Konstanterna b1 och b2

b = [-48.6
    -160];

x = b\A;

b1 = x(1,1);

b2 = x(1,2);

%laboration 4.2b 

%Räknar ut graderna,

grader = [];
for t = [0:0.1: 4]

O1 = 10 + a1*t^3 + a2*t^4;

O2 = 20 + b2*t^3 + b2*t^4;

grader = [grader;O1 O2];

end

xyvarden = [];
for k = [1:40]
    
    O1 = grader(k,1);
    O2 = grader(k,2);

x = 4*cosd(O1) + 3*cosd(O1+O2);

y = 4*sind(O1)+3*sind(O1+O2);

xyvarden = [xyvarden; x y];

end

%plockar x- och yvärden
Xvarden = xyvarden(1:40, 1);
Yvarden = xyvarden(1:40, 2);

%plottar
plot(Xvarden, Yvarden);
title('robotarm');
ylabel('y');
xlabel('x');