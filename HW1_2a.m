% Define n
n = [0:11]; % u(n) - u(n-10) <=

% Define x
x = sin(0.1*pi*n).*(stepseq(0,0,11)-stepseq(10,0,11)); %  <=

% Expand to four periods (hint: using 'ones' function)
x = x'*ones(1,4)   ;  % <=

% Reformat x vector to 1x48
x = (x(:))'; % <=

% Generate vector n to -12 to 35
n = [-12:35]; % <=

% Plot signal samples using the stem function
 HS =  stem(n,x ,'filled','markersize',2); % <=

% figure configurations (no need to modify)
axis([min(n)-1,max(n)+1,min(x)-0.5,max(x)+0.5]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
