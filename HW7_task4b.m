% Parameters for task4 (b)
n = 0:99;                     % 원래 신호의 인덱스
x = [n(1:50)+1, 100 - n(51:100)]; % 주어진 조건에 따라 x(n) 정의

% Compute DTFT samples at 200 points
N2 = 200;                      % IDFS의 포인트 수
k2 = 0:N2-1;
w2 = 2 * pi * k2 / N2;         % Frequency points for 200 samples
Y2 = dtft(x, n, w2);           % DTFT 샘플 계산 (사용자 정의 dtft 함수 필요)

% Compute 200-point IDFS to get y2(n)
y2 = real(idfs(Y2, N2));       % IDFS 계산, 실수부만 추출



% Plot y2(n) - One period of the periodic sequence
figure;
stem(0:N2-1, y2, 'filled');
title('One period of the periodic sequence y_2(n)');
xlabel('n');
ylabel('Amplitude');


