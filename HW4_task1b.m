% task 1b: h(n) = ((0.5)^n+(0.4)^n) u(n); 
%         H(w) = (2-0.9*exp(-j*w))./(1-0.9*exp(-j*w)+0.2*exp(-j*2*w))
clc; close all;
% find magnitude and phase of H with interval as [-pi,pi] with 300 steps

% set n be 0 to 50
n = [0:50];

% define w be the interval of [-pi, pi] with 300 steps
w = [-300:300]*pi/300; 

% define H be dtft of h
H = (2-0.9*exp(-j*w))./(1-0.9*exp(-j*w)+0.2*exp(-j*2*w))

% define magH be magnitude of H 
magH = abs(H);

% define phaH be phase of H
phaH = angle(H)*180/pi;



% plot subplot 2x1 window
% 1st plot be magnitude
% 2nd plot be phase

% 1st plot x label : "greek letter omega" / "greek letter pi"
% 1st plot y label : |H|
% 1st plot title : Magnitude response:h(n) = [(0.5)^n+(0.4)^n] u(n)
% axis be x-axis : [-1 1]; y-axis : [1 4]
subplot(2,1,1); plot(w/pi,magH,'LineWidth',1.5); axis([-1 1 1 4]);
xlabel('"greek letter omega" / "greek letter pi"'); ylabel('|H|');
title('Magnitude response:h(n) = [(0.5)^n+(0.4)^n] u(n)]');


% 2nd plot x label : "greek letter omega" / "greek letter pi"
% 2nd plot y label : Degrees
% 2nd plot title : Phase response:h(n) = [(0.5)^n+(0.4)^n] u(n)
% axis be x-axis : [-1 1]; y-axis : [-180 180] 
subplot(2,1,2); plot(w/pi,phaH,'LineWidth',1.5); axis([-1 1 -180 180]);
xlabel('greek letter omega" / "greek letter pi'); ylabel('Degrees');
title('Phase response:h(n) = [(0.5)^n+(0.4)^n] u(n)');

