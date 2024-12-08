% Task 2: 샘플링된 신호의 스펙트럼 분석
clear all; clc; close all;

% (a) N = 40
N = 40; % 샘플 크기
n = 0:N-1; % 시간 샘플 인덱스
t = 0.01 * n; % 시간
x = 2*sin(4*pi*t) + 5*cos(8*pi*t); % 샘플링 신호

% FFT를 이용한 변환
X = fft(x, N); 
XR = real(X); % 실수부
XI = imag(X); % 허수부
k = 0:N-1; % 주파수 인덱스

% 결과 시각화
HF_1 = figure(1);
subplot(2,1,1);
H_s1 = stem(k, XR, 'o', 'filled'); set(H_s1, 'markersize', 2);
title('실수부 (N=40)', 'fontsize', 10);
ylabel('Amplitude');
axis([-1 N -40 40]);

subplot(2,1,2);
H_s2 = stem(k, XI, 'o', 'filled'); set(H_s2, 'markersize', 2);
title('허수부 (N=40)', 'fontsize', 10);
ylabel('Amplitude'); xlabel('k');
axis([-1 N -100 100]);

% (b) N = 50
N = 50;
n = 0:N-1; 
t = 0.01 * n;
x = 2*sin(4*pi*t) + 5*cos(8*pi*t);

X = fft(x, N);
XR = real(X);
XI = imag(X);
k = 0:N-1;

HF_2 = figure(2);
subplot(2,1,1);
H_s1 = stem(k, XR, 'o', 'filled'); set(H_s1, 'markersize', 2);
title('실수부 (N=50)', 'fontsize', 10);
ylabel('Amplitude');
axis([-1 N -50 50]);

subplot(2,1,2);
H_s2 = stem(k, XI, 'o', 'filled'); set(H_s2, 'markersize', 2);
title('허수부 (N=50)', 'fontsize', 10);
ylabel('Amplitude'); xlabel('k');
axis([-1 N -100 100]);

% (c) N = 60
N = 60;
n = 0:N-1;
t = 0.01 * n;
x = 2*sin(4*pi*t) + 5*cos(8*pi*t);

X = fft(x, N);
XR = real(X);
XI = imag(X);
k = 0:N-1;

HF_3 = figure(3);
subplot(2,1,1);
H_s1 = stem(k, XR, 'o', 'filled'); set(H_s1, 'markersize', 2);
title('실수부 (N=60)', 'fontsize', 10);
ylabel('Amplitude');
axis([-1 N -60 60]);

subplot(2,1,2);
H_s2 = stem(k, XI, 'o', 'filled'); set(H_s2, 'markersize', 2);
title('허수부 (N=60)', 'fontsize', 10);
ylabel('Amplitude'); xlabel('k');
axis([-1 N -120 120]);
