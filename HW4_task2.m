% task2: y(n) = x(n)-1.7678*x(n-1)+1.5625*x(n-2)+1.1314*y(n-1)-0.64*y(n-2)
clc; close all;
% find H which is the frequency response function 
% with interval as [-pi,pi] with 300 steps
% find magnitude and phase of H
% and then
% plot subplot 2x1 window
% 1st plot be magnitude
% 2nd plot be phase
% include x-label, y-label, and title

% set n be 0 to 50
n = [0:50];

% define w be the interval of [-pi, pi] with 300 steps
w = [-300:300]*pi/300; % 확인필요

% set a be the constant values for y terms
a = [1 -1.1314 0.64]; 
% set b be the constant values for x terms
b = [1 -1.7678 1.5625];

% observe H which is frequency response function by inputs of b, a, w
[H] = freqresp(b,a,w);

% define magH be magnitude of H 
magH = abs(H);

% define phaH be phase of H
phaH = angle(H)*180/pi;

% figure
Hf_1 = figure;

% magnitude plot
subplot(2,1,1); plot(w/pi,magH,'LineWidth',1.5); axis('auto');
xlabel('\omega / \pi'); ylabel('|H|');
title('Magnitude response');

% phase plot
subplot(2,1,2); plot(w/pi,phaH,'LineWidth',1.5); axis([-1 1 -200 200]);
xlabel('\omega / \pi'); ylabel('Degrees');
title('Phase response');