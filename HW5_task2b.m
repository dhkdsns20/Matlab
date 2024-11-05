% task 2b
clear all; clc; close all;

% find z-transform
% set b and a be numerator and denominator of transform equation
b = [0 sin(pi/3) (0.81-0.9*sin(pi/3))-(1.62+sin(pi/3))...
    (0.9*sin(pi/3)+2.43) -1.62 0.81]; 
a=[1 -2.9 4.8 -4.7 2.8 -0.9];

% compare the sequences with the length as 10
[delta,n1] = impseq(0,0,9);

% use filter function to find x sequence
xb1 = filter(b,a,delta);

% directly write the x sequence which has length of 10
[u,n2] = stepseq(0,0,9); 
xb2 = n2.*sin(pi*n2/3).*u + (0.9).^n1.*u

% compare evaluated and written sequences
error = max(abs(xb1-xb2))

% plot z-transform using zplane function
HF_1 = figure;
[Hz, Hp, Hl] = zplane(b,a);
title('Pole-Zero plot');