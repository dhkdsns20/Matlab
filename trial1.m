% trial1
clc; close all;
b = [1,-3,4,1]; a = [1,-4,1,-0.16];
[R,p,k] = residuez(b,a)
% R =
%    0.5383          
%    3.3559 + 5.7659i
%    3.3559 - 5.7659i
% p =
%    3.7443          
%    0.1278 + 0.1625i
%    0.1278 - 0.1625i
% k =
%    -6.2500

r = abs(p(2))
% r =
%   0.2067
