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
Fs2 = Fs + (Fs-nollFem)/3;

% Test av feltermer
val_one = nollFem;
val_two = ettNoll;
val_three = tvaNoll;
val_korr = (10*sqrt(5)/3)-2*sqrt(3);

err_one = abs(val_korr - val_one);
err_two = abs(val_korr - val_two);
err_three = abs(val_korr - val_three);
err_rich = abs(val_korr - Fs);
% err_rich2 = abs(val_korr - Fs2);

y_val = [err_rich err_rich2];
x_val = [h hHH];
loglog(x_val, y_val);
fk = @ (x) (x^4);
xsq = [fk(0) fk(2)];
% loglog(x_val, [err_rich err_three])
hold on
loglog(x_val, xsq);
