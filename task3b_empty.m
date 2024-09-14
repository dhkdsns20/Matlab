% x(n) = cos(0.1n), -20 <= n <= 20
% Define n
n2 = ; % <=

% Define x
x2 = ; % <=

% Plot signal samples using the stem function
   ( , ,'filled','markersize',2); % <=

% figure configurations (no need to modify)
axis([min(n2)-1,max(n2)+1,min(x2)-1,max(x2)+1]);
xlabel('n'); ylabel('x_2(n)');
title(['Sequence x_2(n) = cos(0.1 \times n)' char(10) ...
       'Not periodic since f_0 = 0.1 / (2 \times \pi)' ...
       ' is not a rational number']);
