% (a) Using the conv function
clear; clc;

% Define x[n] as a uniformly distributed random sequence
N = 1e6; % Length of x[n]
x = 2 * rand(1, N) - 1; % Random numbers in [-1, 1]

% Define h[n]
h = cos(0.4 * pi * (0:15));

% Convolution using conv
y_conv = conv(x, h); 

