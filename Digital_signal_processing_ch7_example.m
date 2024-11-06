% example 1
b = [1 0.4*sqrt(2)]; a = [1 -0.8*sqrt(2) 0.64];
[R,p,C] = residuez(b,a)
Np = abs(p')            % pole magnitudes
Ap = angle(p')/pi       % pole angles in pi units


% example 2
clear all; close all; clc;
b = [0,1,1]; a = [1,-0.9,0.81]; [R,p,C] = residuez(b,a)
Mp = (abs(p))'
Ap = (angle(p))'/pi



% example 3
% Clear all variables and close all figures
clear all; close all; clc;

% Define filter coefficients
b = [1 0 0 0 1]; % Numerator coefficients
a = [1 0 0 0 -0.8145]; % Denominator coefficients

% Define frequency range from 0 to pi
w = linspace(0, pi, 501);

% Compute frequency response
H = freqz(b, a, w);
magH = abs(H); % Magnitude response
phaH = angle(H); % Phase response

% Calculate and round the magnitude and phase at w = pi/2
A = round(magH(251) * 100) / 100;
B = round(phaH(251) * 180 / pi);

% Plot magnitude response
Hf_1 = figure;
subplot(1, 2, 1);
plot(w / pi, magH, 'g', 'linewidth', 1);
axis([0, 1, 0, 11]);
grid on;
xlabel('\omega/ \pi');
ylabel('Magnitude');
title('Magnitude Response');
hold on;
plot([0.5, 1], [magH(251), magH(501)], 'ro', 'linewidth', 1); % Fixed vector dimensions
hold off;

% Plot phase response
subplot(1, 2, 2);
plot(w / pi, phaH * 180 / pi, 'g', 'linewidth', 1);
axis([0, 1, -180, 180]);
grid on;
xlabel('\omega/ \pi');
ylabel('Degree');
title('Phase Response');
hold on;
plot([0.5, 1], [phaH(251), phaH(501)] * 180 / pi, 'ro', 'linewidth', 1); % Fixed vector dimensions
hold off;
