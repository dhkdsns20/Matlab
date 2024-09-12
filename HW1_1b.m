% Define n
n = [0:100]; % 0부터 100까지 1씩 증가하는 n생성 <=

% Define x
x  = exp(0.01*n).*sin(0.1*pi*n); % x(n)함수를 정의<=

% Generate figure window and name it '2'
   figure(2); % figure 이름을 '2'로 명명 <=

% Plot signal samples using the stem function
  Hs = stem(n ,x ,'filled','markersize',2); % stem 함수를 이용해 n에대한 x의 값을 그린다. <=

% figure configurations (no need to modify)
axis([min(n)-5,max(n)+5,min(x)-1,max(x)+1]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
