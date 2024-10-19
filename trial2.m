% trial 2: y(n) = x(n)-x(n-2)+0.95*y(n-1)-0.9025*y(n-2)
clc; close all;
% define w be the interval of [-pi, pi] with 300 steps
w = [-300:300]*pi/300; 
% set a be the constant values for each y
a = [1 -0.95 0.9025]; 
% set b be the constant values for x
b = [1 0 -1]; 
% define H be frequency response function
[H] = freqresp(b,a,w); 
% define magH be magnitude of H
magH = abs(H); 
% define phaH be phase of H
phaH = angle(H)*180/pi;

% figure
Hf_1 = figure;
% magnitude plot
subplot(2,1,1); plot(w/pi,magH,'LineWidth',1.5); axis([-1 1 0 25]);
xlabel('\omega / \pi'); ylabel('|H|');
title('Magnitude response');
% phase plot
subplot(2,1,2); plot(w/pi,phaH,'LineWidth',1.5); axis([-1 1 -200 200]);
xlabel('\omega / \pi'); ylabel('Degrees');
title('Phase response');
