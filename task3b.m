% task3b
clc; close all;

% y(n) = x(n) - x(n-1)
% set a & b be
a = 1 ; b = [1 -1 ]; 

% Define n2 be 0~21
n2 = [0 : 21]; 

% x11 be u(n)
[x11,nx11] = stepseq (0 , 0, 21);
% x12 be u(n-10)
[x12,nx12] =  stepseq(10 ,0 ,21 ); 
% x13 be u(n-20)
[x13,nx13] =  stepseq(20 ,0 ,21 );
% x2 = n[u(n)-u(n-10)] + (20-n)[u(n-10) - u(n-20)]
x2  = n2.*(x11 - x12) + (20-n2).*(x12 - x13); 
% use filter function to generate y2 with input of x2
y2 =  filter( b,1 ,x2 );

% plot with stem function
Hs =  stem(n2 ,y2 ,'filled','markersize',2);
% figure configurations
axis([min(n2)-1,max(n2)+1,min(y2)-0.5,max(y2) + 0.5]);
xlabel('n'); ylabel('y(n)');
title('Output response for triangular pulse');
