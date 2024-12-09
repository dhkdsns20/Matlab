% Task 3: conv 함수와 Overlap-Save 방법 비교
clear all; clc; close all;

N = 1000000; % 신호 길이
x = 2*rand(1, N) - 1; % 입력 신호 (랜덤 값)
h = cos(0.4*pi*(0:15)); % 필터 신호

%% 1. conv 함수 사용
t = cputime; % 시작 시간 측정
y1 = conv(x, h); % conv 함수로 컨볼루션
t_conv = cputime - t % 실행 시간 측정

y1 = y1(1:1000001); % 결과 크기 조정

%% 2. Overlap-Save 방식 사용
% (a) FFT 크기 = 1024
t = cputime;
y2a = hsolpsav(x, h, 1024); % FFT 크기 1024 사용
t_1024 = cputime - t
y2a = y2a(1:1000001); % 결과 크기 조정
difference1 = max(abs(y1 - y2a)) % 결과 차이 계산

% (b) FFT 크기 = 2048
t = cputime;
y2b = hsolpsav(x, h, 2048); % FFT 크기 2048 사용
t_2048 = cputime - t
y2b = y2b(1:1000001);
difference2 = max(abs(y1 - y2b))

% (c) FFT 크기 = 4096
t = cputime;
y2c = hsolpsav(x, h, 4096); % FFT 크기 4096 사용
t_4096 = cputime - t
y2c = y2c(1:1000001);
difference3 = max(abs(y1 - y2c))

