% Task 1: 원형 컨볼루션을 사용한 선형 컨볼루션
clear all; clc; close all;

% 입력 신호 정의
x1 = [2, 1, 1, 2]; % 첫 번째 신호
x2 = [1, -1, -1, 1]; % 두 번째 신호

% 원형 컨볼루션 계산 (N = 4, 7, 8)
N = 4; 
x3 = circonvt(x1, x2, N); % N=4일 때 결과
disp(['원형 컨볼루션 결과 (N=4): ', num2str(x3)]);

N = 7; 
x3 = circonvt(x1, x2, N); % N=7일 때 결과
disp(['원형 컨볼루션 결과 (N=7): ', num2str(x3)]);

N = 8; 
x3 = circonvt(x1, x2, N); % N=8일 때 결과
disp(['원형 컨볼루션 결과 (N=8): ', num2str(x3)]);

% 선형 컨볼루션 계산
x4 = conv(x1, x2); % 선형 컨볼루션
disp(['선형 컨볼루션 결과: ', num2str(x4)]);

% (c) : N = 7