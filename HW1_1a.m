% x(n) = 5[cos(0.49*pi*n) + cos(0.51*pi*n)], -200 <= n <= 200.

% Define n
n = [-200:200];  % -200부터 200까지 1씩 증가하는 n 생성 <=

% Define x
x  = 5*(cos(0.49*pi*n) + cos(0.51*pi*n)); % x(n) 함수 정의<=


% Generate figure window and name it '1'
   figure(1); % figure 이름을 '1'로 명명 <=

% Plot signal samples using the stem function
 Hs = stem(n ,x ,"filled",'MarkerSize',2); % stem 함수를 이용해 n에대한 x의 값을 그린다.<=

% figure configurations (no need to modify)
axis([min(n)-10,max(n)+10,min(x)-2,max(x)+2]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
