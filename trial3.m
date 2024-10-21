% trial 3: y(n) = sum_{m=0}^{3} x(n-2m)-sum_{l=1}^{3} (0.81)^l y(n-2l)
%         x(n) = 1+cos(0.5*pi*n+pi/2);
clc; close all;
% set n be 0 to 50
n = [0:50]; 
% set a be the constant values for y terms
a = [1  0  0.81  0  0.81^2  0  0.81^3]; 
% set b be the constant values for x terms
b = [1 0 1 0 1 0 1];
% set frequency location array be [0 pi/2]
% x(n) = 1 + cos(0.5pi*n + pi/2) 
% => 1st term: 1 ; w = 0
% => 2nd term: cos(0.5pi*n + pi/2) ; w = 0.5pi
w = [0 pi/2]; 
% observe H which is frequency response function by inputs of b, a, w
[H] = freqresp(b,a,w);
magH = abs(H); phaH = angle(H);

%
% Find steady-state response of the system by mathmetical process
%
% set amplitude and theta for the first and second term of x(n)
% x(n) = 1 + cos(0.5pi*n + pi/2) 
% => 1st term: 1*cos(0) ; amplitude = 1, theta = 0
% => 2nd term: 1*cos(0.5pi*n + pi/2) ; amplitude = 1 , theta = pi/2
A = [1 1]; theta = [0 pi/2];
% find out magnitude and phase of y = x*H
mag = A.*magH; pha = phaH+theta;
% define cosine term
term1 = w'*n; term2 = pha'*ones(1,length(n)); cos_term = cos(term1+term2); 
% define steady-state response y including cosine term
y1 = mag*cos_term; 

% figure
Hf_1 = figure;
Hs = stem(n,y1,'filled'); axis([-1 51 0 2.5]);
xlabel('n'); ylabel('y(n)');
title('SS response y_{ss}(n): x(n) = 1+cos(0.5{\pi}n+\pi/2)');
