% task3a
clc; close all;

% y(n) = x(n) - x(n-1)
% set a & b be
a =1 ; b = [1 -1 ]; 

% Define n1 be 0~22
n1 = [0 :22 ];
% x11 be u(n)
[x11,nx11] =  stepseq(0 ,0 ,22 ); 
% x12 be u(n-20)
[x12,nx12] =  stepseq(20 ,0 ,22 );
% x1 = 5[u(n)-u(n-20)]
x1 = 5*(x11 - x12); 
% use filter function to generate y1 with input of x1
y1 =  filter(b,a,x1);

% plot with stem function
Hs =  stem(n1 ,y1 ,'filled','markersize',2); 
% figure configurations
axis([-1,23,-6,6]);
xlabel('n'); ylabel('y(n)');
title('Output response for rectangular pulse ');
