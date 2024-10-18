% trial 1a: h(n) = (0.9)^|n|; H(w) = 0.19/(1.81-1.8*cos(w));
clc; close all;
% interval of [-pi pi] with 300 steps
w = [-300:300]*pi/300; 
% define H(w)
H = 0.19*ones(size(w))./(1.81-1.8*cos(w));
% define magnitude
magH = abs(H); 
% define phase
phaH = angle(H)*180/pi;

% figure plotting
Hf_1 = figure;
% magnitude plot
subplot(2,1,1); plot(w/pi,magH,'LineWidth',1.5); axis([-1 1 0 20]);
xlabel('\omega / \pi'); ylabel('|H|');
title('Magnitude response of h(n) = (0.9)^{|n|}');
% phase plot
subplot(2,1,2); plot(w/pi,phaH,'LineWidth',1.5); axis([-1 1 -180 180]);
xlabel('\omega / \pi'); ylabel('Degrees');
title('Phase response of h(n) = (0.9)^{|n|}');
