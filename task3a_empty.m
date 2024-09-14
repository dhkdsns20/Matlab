% x1(n) = e^{0.1*j*pi*n} -100 <=n <=100
% Define n
n1 = ; % <=

% Define x
x1 = ; % <=

% Generate subplot window. 2 plots in one window.
% Set the configuration to plot at the first window.
   ( , , ); % <=

% Plot real part using the stem function
   ( , ,'filled','markersize',2); % <=

% figure configurations (no need to modify)
axis([min(n1)-5,max(n1)+5,min(real(x1))-1,max(real(x1))+1]);
xlabel('n'); ylabel('Real(x_1(n))');
title(['Real part of sequence x_1(n) = ' ...
       'exp(0.1 \times j \times pi \times n) ' char(10) ...
       ' Period = 20, K = 1, N = 20']);

% Generate subplot window. 2 plots in one window.
% Set the configuration to plot at the second window.
   ( , , ); % <=

% Plot imaginary part using the stem function
   ( , ,'filled','markersize',2); % <=

% figure configurations (no need to modify)
axis([min(n1)-5,max(n1)+5,min(real(x1))-1,max(real(x1))+1]);
xlabel('n'); ylabel('Imag(x_1(n))');
title(['Imaginary part of sequence x_1(n) = ' ...
       'exp(0.1 \times j \times pi \times n) ' char(10) ...
       ' Period = 20, K = 1, N = 20']);
