% task4 (a)
N1 = 10;  % IDFS의 포인트 수
n = 0:99; % 원래 신호의 인덱스

% 주어진 조건에 따라 x(n) 정의
x = [n(1:50)+1, 100 - n(51:100)];  

% Compute DTFT samples at 10 points
k1 = 0 : N1 - 1;
w1 = 2 * pi * k1 / N1;  % Frequency points for 10 samples
Y1 = dtft(x, n, w1);    % DTFT 샘플 계산 (사용자 정의 dtft 함수 필요)

% Compute 10-point IDFS to get y1(n)
y1 = real(idfs(Y1, N1)); % 사용자 정의 idfs 함수 필요, 실수부만 추출



% Plot y1(n) - One period of the periodic sequence
figure;
stem(0:N1-1, y1, 'filled');
title('One period of the periodic sequence y_1(n)');
xlabel('n');
ylabel('Amplitude');



