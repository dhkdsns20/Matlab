% x(n) = 5[cos(0.49*pi*n) + cos(0.51*pi*n)], -200 <= n <= 200.

% Define n
n = ; % <=

% Define x
x  = ; % <=

% Generate figure window and name it '1'
   ( ); % <=

% Plot signal samples using the stem function
   ( , ,"filled",'MarkerSize',2); % <=

% figure configurations (no need to modify)
axis([min(n)-10,max(n)+10,min(x)-2,max(x)+2]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
