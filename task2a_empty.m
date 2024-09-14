% x(n) = {...,-2,-1,0,1,2,-2,-1,0,1,2...} periodic. 5 periods

% Define n
n = ; % <=

% Define x
x = ; % <=

% Expand to four periods (hint: using 'ones' function)
x = x'*   ;  % <=

% Reformat x vector to 1x48
x = ; % <=

% Generate vector n to -12 to 35
n = ; % <=

% Plot signal samples using the stem function
    ( , ,'filled','markersize',2); % <=

% figure configurations (no need to modify)
axis([min(n)-1,max(n)+1,min(x)-0.5,max(x)+0.5]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
