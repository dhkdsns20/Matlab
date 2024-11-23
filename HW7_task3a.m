% task3 (a)
N1 = 40;        % Fundamental period
n1 = 0:N1-1;    % n의 범위 0~39

x1 = zeros(1,N1);  % n의 범위 만큼의 행벡터 생성
x1(1:20) = 5 * sin(0.1 * pi * (0:19)); % 0 <= n1 <= 39 

% x1을 DFS 한다.
x1_k = dfs(x1,N1);
k1 = 0:N1-1;

subplot(2,1,1); 
Hs = stem(k1,abs(x1_k));
title('signal x_1(n) magnitude')
xlabel('k'); ylabel('Amplitude');
axis('auto');

subplot(2,1,2); 
Hs = stem(k1,angle(x1_k));
title('signal x_1(n) angle')
xlabel('k'); ylabel('Angle');
axis('auto');

