% trial2
clc; close all;
% H(z) = (z+1)/(z-0.5)
% impulse representation
b1 = [1 1 0]; a1 = [1 -0.5 0];
[R1,p1,c1] = residuez(b1(1:2),a1(1:2));
Mp = abs(p1);
Ap = angle(p1)'/pi;
% H(z) = 3/(1-0.5*z^(-1))
% h(n) = 3*0.5^(n)u(n)

% difference equation representation
% H(z) = Y/X = (1+z^(-1))/(1-0.5*z^(-1))
% Y*(1 - 0.5*z^(-1)) = X*(1+z^(-1))
% Y -0.5*z^(-1)*Y = X + z^(-1)*X
% y(n) - 0.5y(n-1) = x(n) + x(n-1)

% pole-zero plot
Hf_1 = figure;
[Hz,Hp,Hl] = zplane(b1,a1);
title('Pole-Zero plot');
