% task1a
clc; close all;

% Define n1 for x
n1 = -2:2 ; 
% Define x
x = [1,1,0,1,1]; 
% Define n2 11for h
n2 = -3:0 ; 
% Define h
h = [1,-2,-3,4];
% Find y which is the convolution of x and h
[y,n] =  conv_m(x,n1,h,n2);