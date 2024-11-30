% task2

% (a) N = 40
N = 40;
Fs = 100;               % 샘플링 주파수
t_step = 1 / Fs;        % 샘플링 간격 : 0.01
t = (0:N-1) * t_step; 

% Signal generation
f1 = 2; % sin의 주파수
f2 = 4; % cos의 주파수
x = 2 * sin(2 * pi * f1 * t) + 5 * cos(2 * pi * f2 * t); % xa(t) 신호 정의


% DFT computation
X = fft(x, N);

% Plot Real part
figure;
stem(0:N-1, real(X), 'b');
title('Real Part of DFT (a) N=40');
xlabel('k');
ylabel('Real(X(k))');
grid on;

% Plot Imaginary part
figure;
stem(0:N-1, imag(X), 'r');
title('Imaginary Part of DFT (a) N=40');
xlabel('k');
ylabel('Imag(X(k))');
grid on;
