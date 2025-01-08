% problem 3

%%
% 1. MATLAB 코드 작성 목적
% 유한한 크기의 x(n)함수를 정의 하고 DFT를 통해 X(k)를 구하고 
% DTFT로 구한 X와 비교

% 2. 코드의 방향성 (a와 b이어서 작성됨)
% DFT함수와 DTFT 함수를 사용하고 magnitude와 angle을 비교한다.


% 3. 방법론
% 1) DFT함수를 이용해 x(n)을 X(k)로 변환한다.
% 2) magnitude,angle을 계산한다.
% 3) 주파수 관점에서 DTFT를 수행해 X를 결정한다.


% 4. 함수의 입력과 출력
% function [Xk] = dft(xn,N)
% % Computes Discrete Fourier Transform
% % -----------------------------------
% % [Xk] = dft(xn,N)
% % Xk = DFT coeff. array over 0 <= k <= N-1
% % xn = N-point finite-duration sequence
% %  N = Length of DFT
% %
% n = [0:1:N-1];                       % row vector for n
% k = [0:1:N-1];                       % row vecor for k
% WN = exp(-j*2*pi/N);                 % Wn factor
% nk = n'*k;                           % creates a N by N matrix of nk values
% WNnk = WN .^ nk;                     % DFT matrix
% Xk = xn * WNnk;                      % row vector for DFT coefficients


% 5. 사용방법
% matlab을 실행시키고 다음 코드를 작성한 다음 F5로 실행시킨다.

%% 3번 문항

% (a) DFT X(k) 
n = 0:100; % n의 범위 지정
xn = sinc((n-50)/2).^2; % sinc함수 정의
N = 101; % 총 n  인덱스 개수

X = dft(xn,N); % dft 수행
magX = abs(X); % 크기
phaX = angle(X) * 180/pi; % Phase in degrees

% X(k)의 크기 plot
figure;
subplot(2, 1, 1);
Hs = stem(n,magX);
ylabel('Magnitude |X(k)|');
title('DFT Magnitude ');

% X(k)의 각도 plot
subplot(2, 1, 2);
HS = stem(n, phaX);
xlabel('k');
ylabel('Phase (Degrees)');
title('DFT Phase');


% (b)
clc; clear all; close all;

% x(n)를 DFT한 X(k) 신호
n = 0:100; % n의 범위 지정
xn = sinc((n-50)/2).^2; % sinc함수 정의
N = 101; % 총 n  인덱스 개수

X = dft(xn,N); % dft 수행
magX = abs(X); % 크기
phaX = angle(X) * 180/pi; % Phase in degree


w = (0:1:500) * 2*pi/500; % Frequency range
H = freqz(xn, 1, w); % Compute DTFT
magH = abs(H); % Magnitude
phaH = angle(H); % Phase


% magH plot
subplot(2, 1, 1);
plot(w*N/(2*pi), magH, '-', 'LineWidth', 1);

% mag X plot
hold on;
Hs = stem(n,magX);
ylabel('Magnitude |X(k)|');
title('DFT Magnitude');
hold off

% phaH plot
subplot(2, 1, 2);
plot(w*N/(2*pi), phaH*180/pi, '-', 'LineWidth', 1);

% phaX plot
hold on;
HS = stem(n, phaX);
xlabel('k');
ylabel('Phase (Degrees)');
title('DFT Phase');