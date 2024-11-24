% task3 (b)
N2 = 80;        % Fundamental period
n2 = 0:N2-1;    % n의 범위 0~79

x2 = zeros(1,N2);  % n의 범위 만큼의 행벡터 생성
x2(1:20) = 5 * sin(0.1 * pi * (0:19)); % 0 <= n1 <= 39 

% x1을 DFS 한다.
x2_k = dfs(x2,N2);
k2 = 0:N2-1;

subplot(2,1,1); 
Hs = stem(k2,abs(x2_k));
title('signal x_1(n) magnitude')
xlabel('k'); ylabel('Amplitude');
axis('auto');

subplot(2,1,2); 
Hs = stem(k2,angle(x2_k));
title('signal x_1(n) angle')
xlabel('k'); ylabel('Angle');
axis('auto');

