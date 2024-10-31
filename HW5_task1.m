% task 1
clc; close all;
% find z-transform
% set b and a be numerator and denominator of transform equation
b = [2 0.3 0]; a=[1 0.3 -0.4];

% compare the sequences with the length as 8
[delta,n1] = impseq(0,0,7);

% use filter function to find x sequence
xb1 = filter(b,a,delta);

% directly write the x sequence which has length of 8
[u,n2] = stepseq(0,0,7); xb2 = ((0.5.^n2) + (-0.8).^n2).*u

% compare evaluated and written sequences
error = max(abs(xb1-xb2))

