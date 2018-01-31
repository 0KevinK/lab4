clear all
close all
clc

%G�r en graf av ekvationen
x = [-2:0.1:8];
y = x-4*sin(2*x)-3;
y0 = zeros([1 length(x)]); % x-axel
plot(x,y)
hold on
plot(x,y0)
xlabel('x')
ylabel('y')
hold on
%Man kan l�sa fr�n grafen att det finns 5 r�tter


%Fixpunktiterationen som ges �r xn+1 = -sin(2*xn)+(5/4)*xn-3/4
%Dens derivata �r -2cos(2xn)+5/4, konvergenskrav �r att derivatans
%absolutbelopp �r mindre �n ett i en omgivning av roten. 

yPrim = -2*cos(2*x)+5/4;
Y = yPrim<1 & -1<yPrim; % etta n�r den konvergerar
plot(x,Y)
hold on

%Man kan finna en rot med denna metod om den ligger i ett intervall d�r
%Y=1. Den kommer d�rmed inte hitta 3 av r�tterna. Den hittar r�tterna
%x ~~ 3,16 och -0,54


xStartFix = [0 3]; %startv�rden
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
%Alla r�tter kan hittas med Newtons metod
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


disp('Rot 1 med Newtons metod')
tabellN1 = [xNewton(1:end-1,1), dxNewton(1:end-1,1),];
%disp(tabellN1)
disp('Antalet iterationer f�r rot 1:')
disp(iterN(1))

disp('Rot 2 med Newtons metod')
tabellN2 = [xNewton(1:end,2), dxNewton(1:end,2)];
%disp(tabellN2)
disp('Antalet iterationer f�r rot 2:')
disp(iterN(2))

disp('Rot 2 med Fixpunktsmetoden')
tabellF1 = [xFix(1:25,1), dxFix(1:25,1)];
%disp(tabellF1)
disp('Antalet iterationer f�r rot 2:')
disp(iterFix(1))

disp('Rot 3 med Fixpunktsmetoden')
tabellF2 = [xFix(1:end,2), dxFix(1:end,2)];
%disp(tabellF2)
disp('Antalet iterationer f�r rot 3:')
disp(iterFix(2))

% Konvergenskonstant K vid kvadratisk konvergens ges av
% K = abs(f''(r)/2f'(r)) d�r r �r roten. Detta g�ller f�r Newtons metod

r1 = xNewton(end-1,1);
K1 = abs((16*sin(2*r1))/(2*(1-8*cos(2*r1))))
r2 = xNewton(end,2);
K2 = abs((16*sin(2*r2))/(2*(1-8*cos(2*r2))))

% Fixpunktsmetoden har linj�r konvergens
% C = abs(G'(r)) D�r G(x) �r fixpunktsiterationen och r �r roten

 C2 = abs(-2*cos(2*r2)+5/4)
 r3 = xFix(end,2);
 C3 = abs(-2*cos(2*r3)+5/4)