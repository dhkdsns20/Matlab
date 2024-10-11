% task1: % DTFT of x(n) = n.*(0.9 ^ n) .*(u(n)-u(n-21))
clear all; clc; close all;
% generate u(n) with n = 0:22
[x11,n11] =  stepseq(0 ,0 ,22 ); 
% generate u(n-21) with n = 0:22
[x12,n12] =  stepseq(21 ,0 ,22 );
% generate u(n)-u(n-21) using sigadd function
[x13,n13] =  sigadd(x11,n11 ,-x12 ,n12 ); 

%
n1 = n13; 
% generate n*(0.9^n)*(u(n)-u(n-21))
x1 = n1.*(0.9.^n1).*x13 ;
% generate linear spaced vector -pi to pi with 201 elements
w1 =  linspace(-pi ,pi ,201 ); 
% generate DTFT of x1 using dtft function
X1 =  dtft(x1 ,n1 ,w1 );
% evaluate magnitude of X1
magX1 =  abs(X1 ); 
% evaluate phase of X1
phaX1 =  angle(X1 );

%
Hf_1 = figure; 
subplot(2,1,1); plot(w1/pi,magX1,'LineWidth',1.5);
xlabel('\omega/\pi'); ylabel('|X|');
title('Magnitude response');
subplot(2,1,2); plot(w1/pi,phaX1*180/pi,'LineWidth',1.5);
axis([-1,1,-200,200]); 
xlabel('\omega/\pi'); ylabel('Degrees');
title('Phase Response');
