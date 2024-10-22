% task 1a: h(n) = sinc(0.2*n)*[u(n)-u(n-40)]
clc; close all;
% define h3 be [u(n)-u(n-40)] with length as n3
[h1,n1] =  stepseq(0,0,50);
[h2,n2] =  stepseq(40,0,50);
[h3,n3] =  sigadd(h1,n1,h2,n2); 

% define n = n3
n = n3; 

% define h(n)=sinc(0.2*n)*[u(n)-u(n-40)]
h = sinc(0.2*n).*h3

% define w be the interval of [-pi, pi] with 300 steps
w = [-300:300]*pi/300; % 확인필요

% define H be dtft of h
H = dtft(h,n,w);

% define magH be magnitude of H 
magH = abs(H);

% define phaH be phase of H
phaH = angle(H)*180/pi;

% figure
Hf_1 = figure;
subplot(2,1,1); plot(w/pi,magH,'LineWidth',1.5); axis([-1 1 0 5]);
xlabel('\omega / \pi'); ylabel('|H|');
title(['Magnitude response of h(n) = sinc(0.2n)\times','[u(n)-u(n-40)]']);
subplot(2,1,2); plot(w/pi,phaH,'LineWidth',1.5); axis([-1 1 -180 180]);
xlabel('\omega / \pi'); ylabel('Degrees');
title('Phase response of h(n) = sinc(0.2)\times','[u(n)-u(n-40)]');
