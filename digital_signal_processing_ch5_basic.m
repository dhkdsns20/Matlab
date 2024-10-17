% Freq response example1
clc; close all;
w = [0:1:500]*pi/500; % [0 pi] axix divided into 501 points.
X = exp(1j*w) ./ (exp(1j*w) - 0.9*ones(1,501));
magX = abs(X); angX = angle(X);

subplot(2,1,1); plot(w/pi,magX,'linewidth',1); grid; axis([0,1,0,10])
title('Magnitude Response'); ylabel('|H|');

subplot(2,1,2); plot(w/pi,angX/pi,'linewidth',1); grid; 
xlabel('frequency in \pi units'); ylabel('Phase in pi Radians');
title('Phase Response'); 


% Reconstruction example2(a)
clear all; clc;

% Analog Signal
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = exp(-1000*abs(t));
% Discrete-time Signal
Ts = 0.0002; n = -25:1:25;
x = exp(-1000*abs(n*Ts));
% Discrete-time Fourier transform
K = 500; k = 0:1:K;
w = pi*k/K;
X = x * exp(-j*n'*w);
X = real(X);
w = [-fliplr(w), w(2:K+1)];
X = [fliplr(X), X(2:K+1)];

subplot(2,1,1); plot(t*1000,xa,'linewidth',1,'LineStyle','-'); 
xlabel('t in msec.','VerticalAlignment','middle'); ylabel('x_a(t)')
title('Discrete Signal'); hold on; axis([-5,5,0,1.1]);

Hs = stem(n*Ts*1000,x);
subplot(2,1,2); plot(w/pi,X,'linewidth',1); 
xlabel('Frequency in \pi units'); ylabel('X_1(e^(j\omega))')
title('Discrete-time Fourier Transform','VerticalAlignment','baseline'); hold on; axis([-1,1,0,10.2]);




% Reconstruction example2(b)
close all; clear all; clc;

% Discrete-time Signal x1(n)
Ts = 0.0002; Fs = 1/Ts; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));

% Analog Signal reconstruction
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = x * sinc(Fs*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));


% Check
error = max(abs(xa - exp(-1000*abs(t))))

% Plots
xa2 = exp(-1000*abs(t));
subplot(2,1,1); plot(t*1000,xa2,'linewidth',1,'LineStyle','-'); 
xlabel('t in msec.','VerticalAlignment','middle'); ylabel('x_a(t)')
title('Discrete Signal'); hold on; axis([-5,5,0,1.1]);
Hs = stem(n*Ts*1000,x);

subplot(2,1,2); plot(t*1000,xa,'linewidth',1,'LineStyle','-'); 
xlabel('t in msec.','VerticalAlignment','middle'); ylabel('x_a(t)')
title('Reconstruction Signal from x_(n) using the sinc function');
hold on;
Hs1 = plot(n*Ts*1000,x,'o','markersize',2); hold off
axis([-5,5,-0.05,1.1]);