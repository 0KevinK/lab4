%
%
%

clear all, close all, clc

%Laboration 4, 4 b)

%Definera värden:
L=1
g=9.81
h=0.1

fk = @(x) x+4;

integralvarden=[];
for fi=[0:5:90];
fi
In=[];
for alpha=[0:h:pi/2];
    k= sind(fi/2);
    I=1/((1-(k^2)*sin(alpha)^2)^0.5);
  if alpha==0;
      I=I/2;
  end;
  if alpha==pi/2;
      I=I/2;
  end;
  In=[In I];     %värdena från integralen
end;

  Int=sum(In);   
  Integralen=h*Int;   %räknar ut värdet för integralen
  
  integralvarden=[integralvarden;Integralen]    %alla integralvärden för alla olika fi
  
end  

T=integralvarden*(4*(L/g)^0.5) %beräknar värden för svängningstiden T.

fi=[0:5:90]

plot(T,fi)

