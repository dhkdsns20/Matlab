% task3c
clc; close all;

% y(n) = x(n) - x(n-1)
% set a & b be
a =  1; b = [1 -1 ]; 
% Define n3 be 0~101
n3 = [0 : 101]; 
% x11 be u(n)
[x11,nx11] =  stepseq(0 ,0 ,101 );
% x12 be u(n-100)
[x12,nx12] =  stepseq(100 ,0 ,101 ); 
% x13 be [u(n)-u(n-100)]
x13 = x11 - x12 ; 
% x3 be sin(pi n/25)[u(n)-u(n-100)]
x3 =  sin(pi*n3/25).*x13;
% use filter function to generate y3 with input of x3
y3 =  filter(b,a,x3);

% plot with stem function
Hs =  stem(n3 ,y3 ,'filled','markersize',2);
% figure configurations
axis([-5,105,-0.15,0.15]);
xlabel('n'); ylabel('y(n)');
title('Output response for sinusoidal pulse');
