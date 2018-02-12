clear all
close all
clc

%Gör en graf av ekvationen
x = [-2:0.1:8];
y = x-4*sin(2*x)-3;
y0 = zeros([1 length(x)]); % x-axel
plot(x,y)
hold on
plot(x,y0)
xlabel('x')
ylabel('y')
hold on
%Man kan läsa från grafen att det finns 5 rötter


%Fixpunktiterationen som ges är xn+1 = -sin(2*xn)+(5/4)*xn-3/4
%Dens derivata är -2cos(2xn)+5/4, konvergenskrav är att derivatans
%absolutbelopp är mindre än ett i en omgivning av roten. 

yPrim = -2*cos(2*x)+5/4;
Y = yPrim<1 & -1<yPrim; % etta när den konvergerar
plot(x,Y)
hold on

%Man kan finna en rot med denna metod om den ligger i ett intervall där
%Y=1. Den kommer därmed inte hitta 3 av rötterna. Den hittar rötterna
%x ~~ 3,16 och -0,54


xStartFix = [0 3]; %startvärden
iterFix = [0 0]; % antalet iterationer
for nr=1:2
    i=1;
    x = xStartFix(1,nr);
    dx = 1; 
  while abs(dx) > 1e-11 %10 korrekta siffror
  xold = x ;
  x = -sin(2*x)+(5/4)*x-3/4 ;
  dx = x-xold;
  xFix(i,nr)= xold;
  dxFix(i,nr)= dx;
  iterFix(nr) = iterFix(nr) +1;
  i = i+1;
  end
  
end

%if abs(-2*cos(2*x)+5/4)<1
%    disp(x) 
%else disp('Iterationen konvergerar inte')
%end


%Newton-Raphsson
%Alla rötter kan hittas med Newtons metod
xStartN = [-1 0 2 3 5]; 
iterN = zeros(1,5); 

for nr=1:5
    x = xStartN(1,nr);
    i = 1;
    dx=1;
while abs(dx/x) > 1e-11
   
   f = x-4*sin(2*x)-3;
   fp = 1-8*cos(2*x);
   dx = -f/fp;
   xNewton(i,nr)=x;
   dxNewton(i,nr)=dx;
   i = i+1;
   x = x + dx;
   iterN(nr) = iterN(nr) +1; 

end

end
%abs(e) = abs(r-x) där r är roten
for n=1:length(xNewton)-1
eN1(n,1) = abs(xNewton(end-1,1)-xNewton(n,1));
end
for n=2:length(eN1)
    eKvotN1(n,1) = abs(eN1(n)/eN1(n-1));
end
for n=3:length(eN1)
    xKvotN1(n,1) = abs((xNewton(n,1)-xNewton(n-1,1))/(xNewton(n-1,1)-xNewton(n-2,1)));
end

disp('Rot 1 med Newtons metod')
disp('   x                   dx                  abs(e)              abs(e(i)/e(i-1))   abs((x(i)-x(i-1))/(x(i-1)-x(i-2))')
tabellN1 = [xNewton(1:end-1,1), dxNewton(1:end-1,1), eN1,eKvotN1,xKvotN1 ];
disp(tabellN1)
disp('Antalet iterationer för rot 1:')
disp(iterN(1))

for n=1:length(xNewton)
eN2(n,1) = abs(xNewton(end,2)-xNewton(n,2));
end
for n=2:length(eN2)
    eKvotN2(n,1) = abs(eN2(n)/eN2(n-1));
end
for n=3:length(eN2)
    xKvotN2(n,1) = abs((xNewton(n,2)-xNewton(n-1,2))/(xNewton(n-1,2)-xNewton(n-2,2)));
end

disp('Rot 2 med Newtons metod')
tabellN2 = [xNewton(:,2), dxNewton(:,2), eN2, eKvotN2, xKvotN2];
disp('   x                   dx                  abs(e)              abs(e(i)/e(i-1))   abs((x(i)-x(i-1))/(x(i-1)-x(i-2))')
disp(tabellN2)
disp('Antalet iterationer för rot 2(Newton):')
disp(iterN(2))

for n=1:25
    eF2(n,1) = abs(xFix(25,1)-xFix(n,1));
end
for n=3:25
    eKvotF2(n,1) = abs(eF2(n)/eF2(n-1));
end
for n=3:25
    xKvotF2(n,1) = abs((xFix(n,1)-xFix(n-1,1))/(xFix(n-1,1)-xFix(n-2,1)));
end

disp('Rot 2 med Fixpunktsmetoden')
disp('   x                   dx                  abs(e)              abs(e(i)/e(i-1))   abs((x(i)-x(i-1))/(x(i-1)-x(i-2))')
tabellF1 = [xFix(1:25,1), dxFix(1:25,1),eF2,eKvotF2,xKvotF2]; 
disp(tabellF1)
disp('Antalet iterationer för rot 2(Fixpunkt):')
disp(iterFix(1))

for n=1:length(xFix)
    eF3(n,1) = abs(xFix(end,2)-xFix(n,2));
end
for n=2:length(xFix)
    eKvotF3(n,1) = abs(eF3(n)/eF3(n-1));
end
for n=3:length(xFix)
    xKvotF3(n,1) = abs((xFix(n,2)-xFix(n-1,2))/(xFix(n-1,2)-xFix(n-2,2)));
end

disp('Rot 3 med Fixpunktsmetoden')
disp('   x                   dx                  abs(e)              abs(e(i)/e(i-1))   abs((x(i)-x(i-1))/(x(i-1)-x(i-2))')
tabellF2 = [xFix(1:end,2), dxFix(1:end,2),eF3,eKvotF3,xKvotF3];
disp(tabellF2)
disp('Antalet iterationer för rot 3:')
disp(iterFix(2))

% % % Konvergenskonstant K vid kvadratisk konvergens ges av
% % % K = abs(f''(r)/2f'(r)) där r är roten. Detta gäller för Newtons metod
% % 
%  r1 = xNewton(end-1,1);
%  K1 = abs((16*sin(2*r1))/(2*(1-8*cos(2*r1))))
%  r2 = xNewton(end,2);
%  K2 = abs((16*sin(2*r2))/(2*(1-8*cos(2*r2))))
% % 
% % % Fixpunktsmetoden har linjär konvergens
% % % C = abs(G'(r)) Där G(x) är fixpunktsiterationen och r är roten
% % 
%   C2 = abs(-2*cos(2*r2)+5/4)
%   r3 = xFix(end,2);
%   C3 = abs(-2*cos(2*r3)+5/4)