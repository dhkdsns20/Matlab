% task4: DTFT after even and odd part decomposition of x(n) 
% x(n) = 2*(0.9)^(-n)*(cos(0.1*pi*n)+j*sin(0.9*pi*n))(u(n)-u(n-10))
clear all; clc; close all;
% generate u(n) with n = 0:10
[x1,n1] =  stepseq(0 ,0 ,10); 
% generate u(n-10) with n = 0:10
[x2,n2] =  stepseq(10 ,0 ,10); 
% generate u(n)-u(n-10) using sigadd function
[x3,n3] =  sigadd(x1 ,n1 ,-x2 ,n2);

% 
n = n3; 
% generate 2*(0.9)^(-n)*(cos(0.1*pi*n)+j*sin(0.9*pi*n))(u(n)-u(n-10))
x =  2*(0.9).^(-n).*(cos(0.1*pi*n)+j*sin(0.9*pi*n)).*x3;
% decompose even and odd function using evenodd_complex function
[xe,xo,m] = evenodd_complex(x,n);
% generate vector -pi to pi with 1001 elements
w = [-500:1:500]*pi/501 ; 
% generate DTFT of x using dtft function with input of n & w
X = dtft(x ,n ,w );
% evaluate real part of X
realX = real(X); 
% evaluate imag part of X
imagX = imag(X);
% generate DTFT of even function with input of m & w
Xe =  dtft(xe ,m ,w ); 
% generate DTFT of odd function with input of m & w
Xo =  dtft(xo ,m ,w );
% find out the maximum difference between (real part of X) and even function
diff_e = max(abs(real(X) - Xe )); 
% find out the maximum difference between j*(imag part of X) and odd function
diff_o = max(abs(j*imag(X) - Xo));


%
Hf_1 = figure;
subplot(2,2,1);
% plot w/pi vs real part of even function
% axis be x=[-1 1] y=[-30 20]
axis([-1,1,-30,20]); 
plot(w/pi, real(Xe));
xlabel('\omega/\pi'); ylabel('X_e');
title('DTFT of even part of x(n)');

subplot(2,2,3); 
% plot w/pi vs real part of X
% axis be x=[-1 1] y=[-30 20]
plot(w/pi, real(X));
axis([-1,1,-30,20]); 
xlabel('\omega/\pi'); ylabel('X_R');
title('Real part:DTFT of x(n)');

subplot(2,2,2); 
% plot w/pi vs imag part of odd function
% axis be x=[-1 1] and y=[-30 20]
plot(w/pi, imag(Xo));
axis([-1,1,-30,20]); 
xlabel('\omega/\pi'); ylabel('X_o');
title('DTFT of odd part of x(n)');

subplot(2,2,4); 
% plot w/pi vs imag part of X
% axis be [-1 1] and y=[-30 20]
plot(w/pi, imag(X));
axis([-1,1,-30,20]); 
xlabel('\omega/\pi'); ylabel('X_I');
title('Imaginary part:DTFT of x(n)');

function [xe , xo , m] = evenodd_complex(x , n)
    % Complex-valued signal decomposition into even and odd parts
    % -----------------------------------------------------------
    %[xe , xo , m] = evenodd(x , n)
    %
    m = -fliplr(n);
    m1 = min([m,n]); m2 = max([m,n]); m = m1:m2;
    nm = n(1)-m(1); n1 = 1:length(n);
    x1 = zeros(1,length(m));
    x1(n1+nm) = x; x = x1;
    xe = 0.5*(x + conj(fliplr(x)));
    xo = 0.5*(x - conj(fliplr(x)));
end