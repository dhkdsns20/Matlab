% task 3: y(n) = sum_{m=0}^{3} x(n-2m)-sum_{l=1}^{3} (0.81)^l y(n-2l)
%         x(n) = 2 * sin(\pi n/4)+3 * cos(3 \pi n/4);
clc; close all; 
% set n be 0 to 50
n = [0:50];

% find H which is frequency response function by inputs of b, a, w
% a be the constant values for y terms
% b be the constant values for x terms
% w be the phase components of x's 1st and 2nd terms
% x(n) = 2sin(pi(n/4)) + 3cos(3pi*n/4) 
% => 1st term: 2sin(pi(n/4)) ; w(1) = pi / 4
% => 2nd term: 3cos(3pi*n/4) ; w(2) = 3*pi / 4

% set n be 0 to 50
n = [0:50]; 

% set a be the constant values for y terms
a = [1  0  0.81  0  0.81^2  0  0.81^3];

% set b be the constant values for x terms
b = [1 0 1 0 1 0 1];

% observe H which is frequency response function by inputs of b, a, w
w = [pi/4 3*pi/4];

[H] = freqresp(b,a,w);

magH = abs(H); phaH = angle(H);


%
% Find steady-state response of the system by mathmetical process
%
% set amplitude and theta for the first and second term of x(n)
% x(n) = 2sin(pi(n/4)) + 3cos(3pi*n/4) 
% => 1st term: 2sin(pi(n/4)) = 2cos(pi(n/4)-pi/2); amplitude(1) =2 , theta(1) = -pi/2  
% => 2nd term: 3cos(3pi*n/4) ; amplitude(2) = 3 , theta(2) = 0
A = [2 3]; theta = [-pi/2 0];

% find out magnitude and phase of y = x*H
mag = A.*magH; pha = phaH+theta;

% define cosine term
term1 = w'*n; term2 = pha'*ones(1,length(n)); cos_term = cos(term1+term2); 
% define steady-state response y including cosine term
y1 = mag*cos_term; 


% figure
Hf_1 = figure;
Hs = stem(n,y1,'filled'); axis('auto');
xlabel('n'); ylabel('y(n)');
title('SS response y_{ss}(n): x(n) = 2sin({\pi}n/4)+3cos(3 \pi n/4)');
