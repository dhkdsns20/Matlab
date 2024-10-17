% Example 1
clear all; clc;
subplot(1,1,1)
b = 1; a = [1,-0.8];
n = [0:100]; x = cos(0.05*pi*n);
y = filter(b,a,x);

subplot(2,1,1); Hs = stem(n,x); axis([-1,101,-5,5]);
ylabel('x(n)'); title('Input Response');
set(gca,'ytick',[-5,-1,0,1,5]);

subplot(2,1,2); Hs = stem(n,y); axis([-1,101,-5,5]);
xlabel('x(n)'); ylabel('y(n)'); title('Output Response');


% Example 2
close all; clear all; clc;
b = [0.0181, 0.0543, 0.0543, 0.0181];
a = [1.0000, -1.7600, 1.1829, -0.2781];
m = 0:length(b)-1; l = 0:length(a)-1;
K = 500; k = 1:1:K;
w = pi*k/K; % [0 pi] axix divided into 501 points.
num = b * exp(-1j*m'*w); % Numerator calculations
den = a * exp(-1j*l'*w); % Denominator calculations
H = num ./ den;
magH = abs(H); angH = angle(H);

subplot(1,1,1);
subplot(2,1,1); plot(w/pi,magH,'linewidth',1); grid; axis([0,1,0,1]);
ylabel('Magnitue |H|');
title('Magnitude Response'); 

subplot(2,1,2); plot(w/pi,angH/pi,'linewidth',1); grid; 
xlabel('frequency in \pi units'); ylabel('Phase in pi Radians');
title('Phase Response'); 


% Example 4
clear all; clc;
% Analog Signal
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = exp(-1000*abs(t));
% Discrete-time Signal
Ts = 0.001; n = -25:1:25;
x = exp(-1000*abs(n*Ts));
% Discrete-time Fourier transform
K = 500; k = 0:1:K;
w = pi*k/K;
X = x * exp(-1j*n'*w);
X = real(X);
w = [-fliplr(w), w(2:K+1)];
X = [-fliplr(X), X(2:K+1)];

subplot(1,1,1)
subplot(2,1,1); plot(t*1000,xa,'linewidth',1,'LineStyle','--'); 
xlabel('t in msec.','VerticalAlignment','middle'); ylabel('x_a(t)')
title('Discrete Signal'); hold on; axis([-5,5,0,1.1]);

Hs = stem(n*Ts*1000,x); hold off
subplot(2,1,2); plot(w/pi,X,'linewidth',1); 
xlabel('Frequency in \pi units'); ylabel('X_2(e^{j\omega})')
title('Discrete-time Fourier Transform','VerticalAlignment','baseline'); hold on; 
axis([-1,1,0,2.5]);


