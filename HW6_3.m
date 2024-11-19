% example 3

% h(n) = n(1/3^n)u(n) + (-1/4^n)u(n)
% 공식 이용
% H(z) = H1(z) + H2(z)
% H1(z) : (1/3)*z^-1/(1-(1/3)*z^-1)^2
% H2(z) : (-1/4)*z^-1/(1-(-1/4)*z^-1)^2
% H(z) : ((1/3)*z^-1)/(1-(1/3)*z^-1)^2 + ((-1/4)*z^-1)/(1-(-1/4)*z^-1)^2
%         = (z^3 - 1/3z^2 + 7/36 z^1) / (z^3 - 5/12z^2 - 1/18z^1 + 1/36)
b = [1 -1/3 7/36]; a =[1 -5/12 -1/18 1/36];

% difference equation representation
% Y*(1 - 5/12*z^(-1) - 1/18*z^(-2) + 1/36*z^(-3)) = 
% X*(1 - 1/3*z^(-1) + 7/36*z^(-2))
% y(n) = x(n) - 1/3*x(n-1) + 7/36*x(n-2) 
% + 5/12*y(n-1) + 1/18*y(n-2) - 1/36*y(n-3)


% pole-zero plot
Hf_1 = figure;
[Hz,Hp,Hl] = zplane(b,a);
title('Pole-Zero plot');
