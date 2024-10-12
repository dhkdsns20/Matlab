% task2: % DTFT of x2(n) = (cos(0.5*pi*n)+j*sin(0.5*pi*n)).*(u(n)-u(n-51))
clear all; clc; close all;
% generate u(n) with n = 0:52
[x21,n21] =  stepseq(0 ,0 ,52 ); 
% generate u(n-51) with n = 0:52
[x22,n22] =  stepseq(51 ,0 ,52 );
% generate u(n)-u(n-51) using sigadd function
[x23,n23] =  sigadd(x21, n21, -x22, n22 ); 

%
n2 = n23;
% generate (cos(0.5*pi*n)+j*sin(0.5*pi*n)).*(u(n)-u(n-51))
x2 =  (cos(0.5*pi.*n2)+j*sin(0.5*pi.*n2)).*x23;
% generate linear spaced vector -pi to pi with 201 elements
w2 =  linspace(-pi ,pi ,201 ); 
% generate DTFT of x2 using dtft function
X2 =  dtft(x2 ,n2 ,w2 );
% evaluate magnitude of X2
magX2 =  abs(X2); 
% evaluate phase of X2
phaX2 =  angle(X2 );

% Generate 2x1 subplot.
% 1st window be w/pi vs magnitude of X2. 
% x label be w/pi and y label be absolute of X
% set title be 'Magnitude Response'
Hf_1 = figure; 
subplot(2,1,1); plot(w2/pi,magX2,'LineWidth',1.5);
xlabel('\omega/\pi'); ylabel('|X|');
title('Magnitude response');


% 2nd window be w/pi vs angle of X2 in degrees
% axis be x=[-1 1] and y=[-200 200]
% x label be w/pi and y label be degrees
% set title be 'Phase Response'
subplot(2,1,2); plot(w2/pi,phaX2*180/pi,'LineWidth',1.5);
axis([-1,1,-200,200]); 
xlabel('\omega/\pi'); ylabel('Degrees');
title('Phase Response');
