% task2
clc; close all;

% Define n be 0~50
n = [0:50]; 
% Define x(n) = (0.8)^n
x = (0.8).^n;  
% Define h(n) = (-0.9)^n
h = (-0.9).^n;  

% (a) Plot of the analytical convolution
% Define y1(n) = h(n)*x(n)
[y1, n1] = conv_m(x, n, h, n);  % Using convolution with 4 parameters
% Generate subplot 1x3 and set configuration to first window
subplot(1, 3, 1); 
% Plot 51 samples of y1 using stem function
Hs1 = stem(n1(1:51), y1(1:51), 'filled', 'markersize', 2);
% Figure configuration
title('Analytical'); xlabel('n'); ylabel('y(n)');

% (b) Plot using the conv function and truncated sequences
% Truncate x2 and h2 to 26 samples of x and h
x2 = x(1:26);  % 1-based indexing in MATLAB
h2 = h(1:26);  
% Define y2(n) = h2(n)*x2(n)
[y2, n2] = conv_m(x2, [0:25], h2, [0:25]);  
% Generate subplot 1x3 and set configuration to second window
subplot(1, 3, 2); 
% Plot y2 using stem function
Hs2 = stem(n2, y2, 'filled', 'markersize', 2);
% Figure configuration
title('Using conv function'); xlabel('n'); ylabel('y(n)');


% (c) Plot of the convolution using the filter function
% Using filter function to determine y3
y3 = filter([1], [1, 0.9], x);  
% Generate subplot 1x3 and set configuration to third window
subplot(1, 3, 3); 
% Plot y3 using stem function
Hs3 = stem(n, y3, 'filled', 'markersize', 2);
% Figure configuration
title('Using filter function'); xlabel('n'); ylabel('y(n)');
