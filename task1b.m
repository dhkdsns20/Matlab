% task1b
clc; close all;

% Define n1 for x
n1 = -5:20 ; 
% Define x11 for u(n) using 'stepseq' function
[x11,nx11] =  stepseq(0,-5,20 ); 
% Define x12 for u(n-6) using 'stepseq' function
[x12,nx12] =  stepseq(6,-5,20 );
% Define x13 for x11 + x12 using 'sigadd' function
[x13,n13] =  sigadd(x11,nx11 ,-x12 ,nx12 ); 
% Define x14 for n/4
x14 = n1/4 ; 
% Define x for n/4[u(n)-u(n-6)]
x = x14 .* x13;
% Definea n2 for h
n2 = -5 : 20; 
% Define h11 for u(n+2) using 'stepseq' function
[h11,nh11] =  stepseq(-2 ,-5 ,20 ); 
% Define h12 for u(n-3) using 'stepseq' function
[h12,nh12] =  stepseq(3 ,-5 , 20);
% Define h for 2[u(n+2)-u(n-3)]
h = 2*(h11 - h12) ; 
% Find y which is the convolution of x and h
[y,n] =  conv_m(x, n1, h, n2 );

% Plot the result
stem(n, y, 'filled');
title('Convolution of x(n) and h(n)');
xlabel('n');
ylabel('y(n)');
grid on;