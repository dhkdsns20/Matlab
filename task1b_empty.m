% x(n) = e ^ {0.01*n}*sin(0.1*pi*n), 0 <= n <=100.

% Define n
n = ; % <=

% Define x
x  = ; % <=

% Generate figure window and name it '2'
   ( ); % <=

% Plot signal samples using the stem function
   ( , ,'filled','markersize',2); % <=

% figure configurations (no need to modify)
axis([min(n)-5,max(n)+5,min(x)-1,max(x)+1]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
