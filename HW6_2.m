% example 2
% H(z) = (1 + z^-1 +z^-2)/(1 + 0.5z^-1 - 0.25^z-2)
% impulse representation
b = [1 1 1]; a = [1 0.5 -0.25];
[R,p,c] = residuez(b(1:3),a(1:3)); 
Mp = abs(p);
Ap = angle(p)'/pi;

% R,p,c를 이용해 시스템을 표현
% H(z) = -4 + 0.9348/(1-0.8090*e^-j*pi*z^(-1)) + 4.0652/(1-0.3090*z^(-1)
% h(n) = -4*imp(n) +0.9348*0.8090^n*e^-j*pi*u(n) + 4.0652*0.3090^n*u(n)

% difference equation representation
% H(z) = Y/X = (1 + z^-1 +z^-2)/(1 + 0.5z^-1 - 0.25^z-2)
% Y*(1+0.5z^(-1)-0.25z^(-2)) = X*(1+z^(-1)+z^(-2))
% y(n) + 0.5y(n-1) - 0.25y(n-2) = x(n) + x(n-1) + x(n-2)


% pole-zero plot
Hf_1 = figure;
[Hz,Hp,Hl] = zplane(b,a);
title('Pole-Zero plot');
