% problem 1

%%
% 1. MATLAB 코드 작성 목적
% - 확장된 주기 신호 xtilde2(n)의 이산 푸리에 계수(DFS)를 계산합니다.
% - 신호의 주기적 특성과 주파수 성분을 분석하고 시각화합니다.


% 2. 코드의 방향성
% - 주기 신호 xtilde2(n)를 생성하고 해당 DFS 계수(Xtilde2)를 계산합니다.
% - 계산된 DFS 계수의 크기와 위상을 분석 및 시각화합니다.
% - 결과는 신호 처리, 주파수 분석, 통신 시스템 설계에 활용될 수 있습니다.


% 3. 방법론
% - 확장된 신호 xtilde2는 기존 신호 xtilde1 뒤에 40개의 0을 추가하여 생성합니다.
% - 사용자 정의 함수 `dft`를 호출하여 DFS 계수를 계산합니다.
% - 크기와 위상 데이터를 처리하여 3개의 플롯을 생성합니다:
%   (1) 시간 도메인 신호, (2) DFS 계수 크기, (3) DFS 계수 위상.

% 4. 함수의 입력과 출력
% 입력:
% - `xtilde2`: 확장된 주기 신호 (크기 N2의 1차원 벡터)
% - `N2`: 신호의 길이 또는 기본 주기
% 출력:
% - `Xtilde2`: 계산된 DFS 계수 (크기 N2의 1차원 벡터)


% 5. 실행 방법 (Driving Method)
% - MATLAB 환경에서 아래 단계를 따르십시오:
% 
% 1) 주기 신호 xtilde1과 확장된 신호 xtilde2를 생성합니다.
% - Example:
% xtilde1 = [5*sin(0.1*pi*[0:19]), zeros(1,20)]; % 기본 주기 신호
% xtilde2 = [xtilde1, zeros(1,40)];              % 확장된 신호
%
% 2) `dft` 함수가 코드 파일로 저장되어 있어야 합니다.
% - 파일 이름: `dft.m`
% - 이 함수는 주어진 신호에서 DFS 계수를 계산합니다.
%
% 3) MATLAB 명령 창에서 다음 명령어를 실행합니다:
% - Example:
% N2 = 80; % 확장된 신호의 길이
% [Xtilde2] = dft(xtilde2, N2);
%
% 4) 결과를 확인하고 시각화합니다:
% - Example:
% subplot(3,1,1); stem(n2, xtilde2, 'filled'); % 확장된 신호 시각화
% subplot(3,1,2); stem(k2, abs(Xtilde2), 'filled'); % 크기 스펙트럼 시각화
% subplot(3,1,3); stem(k2, angle(Xtilde2)*180/pi, 'filled'); % 위상 스펙트럼 시각화
%
% 5) 필요 시, 결과를 분석하거나 다른 분석에 활용합니다.
% - Example:
% disp(Xtilde2); % DFS 계수 출력

%%

clc; close all;
n = -5:5; xn = 2*exp(-0.9*abs(n)); N1 = length(xn);
N = 201; xn = [xn,zeros(1,N-N1)]; Xk = dft(xn,N); Xk = real(Xk);
w = linspace(-pi,pi,N); Xk = fftshift(Xk);
Hf_1 = figure();
set(Hf_1);
plot(w/pi,Xk,'g','linewidth',1.5); axis([-1,1,-4,5]); hold on;
plot([-1,1],[0,0],'w',[0,0],[-4,5],'w','linewidth',0.5);
title('DTFT of x(n) = 2e^{-0.9|n|}, -5\leq n\leq 5','fontsize',10);
xlabel('\omega/\pi','fontsize',10); ylabel('Amplitude','fontsize',10);