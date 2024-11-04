% task 2
clear all; clc; close all;
% find z-transform
% set b and a be numerator and denominator of transform equation
b = [3 1.10453]; a=[1 -0.881678 0.5625];

% compare the sequences with the length as 10
[delta,n1] = impseq(0,0,9);

% use filter function to find x sequence
xb1 = filter(b,a,delta);

% directly write the x sequence which has length of 10
[u,n2] = stepseq(0,0,9); 
xb2 = (3.*(0.75).^n2.*cos(0.*pi*n2) + 4.*(0.75).^n2.*sin(0.3*pi*n2)).*u

% compare evaluated and written sequences
error = max(abs(xb1-xb2))

% plot z-transform using zplane function
HF_1 = figure;
[Hz, Hp, Hl] = zplane(b,a);
title('Pole-Zero plot');