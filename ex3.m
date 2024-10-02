% Example 3

clear all; clc; close all
w = (0:1:500)*pi/500; % [0, pi] axis divided in to 501 points
X = exp(1j*w) ./ (exp(1j*w) - 0.5*ones(1,501));
magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);

subplot(2,2,1); plot(w/pi,magX,'linewidth',1); grid
% xlabel('frequency in \pi units');
title('Magnitude Part'); ylabel('Magnitude');

subplot(2,2,3); plot(w/pi,angX,'linewidth',1); grid
xlabel('frequency in \pi units');
title('Angle Part'); ylabel('Radians');

subplot(2,2,2); plot(w/pi,realX,'linewidth',1); grid
% xlabel('frequency in \pi units');
title('Real Part'); ylabel('Real');

subplot(2,2,4); plot(w/pi,imagX,'linewidth',1); grid
xlabel('frequency in \pi units');
title('Imaginary Part'); ylabel('Imaginary');


% Example 4

clear all; clc; close all
x1 = rand(1,11); x2 = rand(1,11); n = 0:10;
alpha = 2; beta = 3;
k = 0:500; w = (pi/500)*k;
X1 = x1 * (exp(-j*pi/500).^(n'*k)); % DTFT of x1
X2 = x2 * (exp(-j*pi/500).^(n'*k)); % DTFT of x2
x = alpha * x1 + beta * x2;         % Linear combination of x1 & x2
X = x * (exp(-j*pi/500).^(n'*k));  
% verification
X_check = alpha*X1 + beta*X2;       % Linear combination of x1 & x2
error = max(abs(X-X_check))         % Difference




% Example 5
clear all; clc; close all
x = rand(1,11); n = 0:10;
k = 0:500; w = (pi/500)*k;
X = x * (exp(-j*pi/500).^(n'*k)); % DTFT of x

% signal shifted by two samples
y = x; m = n+2;
Y = y * (exp(-j*pi/500).^(m'*k)); % DTFT of y

% Verification
Y_check = (exp(-j*2).^w).*X;        % multiplication by exp(-j2w)
error = max(abs(Y-Y_check))         % Difference



% Example 6
clear all; clc; close all
n = -5:10;  x = rand(1,length(n)) + j*rand(1,length(n));
k = -100:100; w = (pi/100)*k;       % frequency between -pi and +pi
X =x * (exp(-j*pi/100)).^(n'*k);    % DTFT of x

% conjugation property
y = conj(x); % signal conjugation
Y = y * (exp(-j*pi/100).^(n'*k));   % DTFT of y

% Verification
Y_check = conj(fliplr(X));           % conj(X(-w))
error = max(abs(Y-Y_check))         % Difference
