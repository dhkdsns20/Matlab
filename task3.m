% task3: % DTFT of x3(n) = [4 3 2 1 1 2 3 4] ; n = 0:7;
clear all; clc; close all;
% generate sequence of x3
x3 = [4 3 2 1 1 2 3 4]; 
% set n3 be 0 to 7
n3 = [0:7]; 
% generate linear spaced vector -pi to pi with 201 elements
w3 =  linspace(-pi ,pi ,201 ); 
% generate DTFT of x3 using dtft function
X3 =  dtft(x3 ,n3 ,w3 );
% evaluate magnitude of X3
magX3 =  abs(X3 ); 
% evaluate phase of X3
phaX3 =  angle(X3 );

% Generate 2x1 subplot.
% 1st window be w/pi vs magnitude of X2. 
% axis be x=[-1 1] and y=[0 25]
% x label be w/pi and y label be absolute of X
% set title be 'Magnitude Response'
Hf_1 = figure; 
axis([-1, 1,0, 25]); 
subplot(2,1,1); plot(w3/pi,magX3,'LineWidth',1.5);
xlabel('\omega/\pi'); ylabel('|X|');
title('Magnitude response');


% 2nd window be w/pi vs angle of X2 in degrees
% axis be x=[-1 1] and y=[-200 200]
% x label be w/pi and y label be degrees
% set title be 'Phase Response'
subplot(2,1,2); plot(w3/pi,phaX3*180/pi,'LineWidth',1.5);
axis([-1,1,-200,200]); 
xlabel('\omega/\pi'); ylabel('Degrees');
title('Phase Response');