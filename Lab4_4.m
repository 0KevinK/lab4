%
%
%

% a1)
format long;
fk = @(x) sqrt(x + 4);
h = 0.5;
hH = 1;
hHH = 2;

% a2)
nollFem = h*(fk(-1)/2 + fk(-1+h) + fk(-1+2*h) + fk(-1+3*h) + fk(1)/2);
ettNoll = hH*(fk(-1)/2 + fk(-1+hH) + fk(1)/2);
tvaNoll = hHH*(fk(-1)/2 + fk(1)/2);

% Richardsonextrapolation
% a3)
Fs = nollFem + (nollFem-ettNoll)/((2^2)-1);

% Test av feltermer
val_one = nollFem;
val_two = ettNoll;
val_three = tvaNoll;
val_korr = (10*sqrt(5)/3)-2*sqrt(3);

err_one = abs(val_korr - val_one);
err_two = abs(val_korr - val_two);
err_three = abs(val_korr - val_three);
err_rich = abs(val_korr - Fs);

y_val = [err_one err_two err_three];
x_val = [h hH hHH];

loglog(x_val, y_val);
hold on
plot(h, err_one, '*', hH, err_two, '+', hHH, err_three, 'x', hHH, err_rich, 'd');

% b)
