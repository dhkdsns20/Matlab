% example 1

x1 = [2,1,3]; n1 = [-1:1]; x2 = [2,1,3,5]; n2 = [-2:1];
[x3,n3] = conv_m(x1,n1,x2,n2)


% example 2 확인필요
clear all; clc; close all;
b = [0,0,0,0,25,-0.5,0.0625];
a = [1,-1,0.75,-0.25,0.0625];
[delta,n] = impseq(0,0,7)
x1 = filter(b,a,delta) % check sequence
x2 = [(n-2).*(1/2).^(n-2).*cos(pi*(n-2)/3)].*stepseq(2,0,7)

% example 3
clear all; clc; close all;
b = [0 0 0.64];
a = [1,-0.8];
[delta,n] = impseq(0,0,10)
xb1 = filter(b,a,delta);
[u,n] = stepseq(2,0,10); xb2 = ((0.8).^n).*u;
error = max(abs(xb1-xb2))