% ex1
clear all; clc; close all
n = -1:3; x = 1:5;                  % sequence x(n)
k = 0:500; w = (pi/500)*k;          % [0, pi] axis divided in to 501 points
X = x * (exp(-1j*pi/500)).^ (n'*k);   % DTFT using matrix-vector product
magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);

subplot(2,2,1); plot(w/pi,magX,'linewidth',1); grid
title('Magnitude Part'); ylabel('Magnitude');

subplot(2,2,3); plot(w/pi,angX,'linewidth',1); grid
xlabel('frequency in \pi units');
title('Angle Part'); ylabel('Radians');

subplot(2,2,2); plot(w/pi,realX,'linewidth',1); grid
title('Real Part'); ylabel('Real');

subplot(2,2,4); plot(w/pi,imagX,'linewidth',1); grid
xlabel('frequency in \pi units');
title('Imaginary Part'); ylabel('Imaginary');




% ex2
clear all; clc; close all
subplot(1,1,1)
n = 0:10;  x = (0.9*exp(1j*pi/3)).^n;
k = -200:200; % 주기성을 보기위함
w = (pi/100)*k;
X = x *  (exp(-1j*pi/100)).^ (n'*k);
magX = abs(X); angX = angle(X);

subplot(2,1,1); plot(w/pi,magX,'linewidth',1); grid; axis([-2,2,0,8]);
ylabel('|X|'); title('Magnitude Part');
subplot(2,1,2); plot(w/pi,angX/pi,'linewidth',1); grid; axis([-2,2,-1,1]);
xlabel('frequency in \pi units'); ylabel('radians/pi'); 
title('Angle Part');

% ex3 
% conjugate symmetry 특성을 근거로 판단 -> 시험때 생각
clear all; clc; close all
subplot(1,1,1)
n = -5:10;  x = (-0.9).^n;
k = -200:200; w = (pi/100)*k;       % frequency between -pi and +pi
X = x * (exp(-j*pi/100)).^(n'*k);   
magX = abs(X); angX = angle(X);

% conjugation property 
y = conj(x); % signal conjugation
Y = y * (exp(-j*pi/100).^(n'*k));   % DTFT of y

subplot(2,1,1); plot(w/pi,magX,'linewidth',1); grid; axis([-2,2,0,15]);
ylabel('|X|'); title('Magnitude Part');
subplot(2,1,2); plot(w/pi,angX/pi,'linewidth',1); grid; axis([-2,2,-1.1,1.1]);
xlabel('frequency in \pi units'); ylabel('radians/pi'); 
title('Angle Part');


% ex4
clear all; clc; close all
n = 0:100;  x = cos(pi*n/2);
k = -100:100; w = (pi/100)*k;       % frequency between -pi and +pi
X = x * (exp(-j*pi/100)).^(n'*k);   % DTFT of x
%
y = exp(1j*pi*n/4).*n;
Y = x * (exp(-j*pi/100)).^(n'*k);   % DTFT of y


% Graphical verification
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,abs(X),'linewidth',1); grid; axis([-1,1,0,60]);
title('Magnitude of X'); ylabel('|X|');

subplot(2,2,2); plot(w/pi,angle(X)/pi,'linewidth',1); grid; axis([-1,1,-1,1]);
title('Magnitude of X'); ylabel('radians/pi');

subplot(2,2,3); plot(w/pi,abs(Y),'linewidth',1); grid; axis([-1,1,0,60]);
xlabel('frequency in \pi units');
title('Magnitude of Y'); ylabel('|Y|');

subplot(2,2,4); plot(w/pi,angle(Y)/pi,'linewidth',1); grid; axis([-1,1,-1,1]);
xlabel('frequency in \pi units');
title('Magnitude of Y'); ylabel('radians/pi');




% ex5
clear all; clc; close all
n = -5:10;  x = sin(pi*n/2);
k = -100:100; w = (pi/100)*k;       % frequency between -pi and +pi
X = x * (exp(-j*pi/100)).^(n'*k);   % DTFT of x


% signal decomposition
[xe,xo,m] = evenodd(x,n);
XE = xe * (exp(-1j*pi/100)).^(m'*k); % DTFT of xe
XO = xo * (exp(-1j*pi/100)).^(m'*k); % DTFT of xo


% verification
XR = real(X);                        % 
error1 = max(abs(XE-XR))             % Difference
XI = imag(X);                        % 
error2 = max(abs(XO-1j*XI))          % Difference



% Graphical verification
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,XR,'linewidth',1); grid; axis([-1,1,-2,2]);
title('REAL of X'); ylabel('RE(X)');

subplot(2,2,2); plot(w/pi,XI,'linewidth',1); grid; axis([-1,1,-5,5]);
title('Imaginary of X'); ylabel('Im(X)');

subplot(2,2,3); plot(w/pi,real(XE),'linewidth',1); grid; axis([-1,1,-2,2]);
xlabel('frequency in \pi units');
title('Transform of even part'); ylabel('XE');

subplot(2,2,4); plot(w/pi,imag(XO),'linewidth',1); grid; axis([-1,1,-5,5]);
xlabel('frequency in \pi units');
title('MTransform of odd part'); ylabel('XO');



