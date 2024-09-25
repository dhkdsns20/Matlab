% Convolution
x = [3,11,7,0,-1,4,2]; nx = [-3:3];
h = [2,3,0,-5,2,1]; nh = [-1:4];
y = conv(x,h)

% Cross-correlation
clear all; clc; close all;
x = [3,11,7,0,-1,4,2];
y = xcorr(x)

% ex
a =[1,-1,0.9]; b=1; % 계수

% part a)
x = impseq(0,-20,120); n = [-20:120];
h = filter(b,a,x);
subplot(2,1,1)
stem(n,h,'filled','markersize',3)
axis([-20,120,-1.1,1.1])
title('Impulse Response','fontsize',10,'FontWeight','bold');
xlabel('n','fontsize',9); ylabel('h(n)','fontsize',9)


% part b)
x = stepseq(0,-20,120);
s = filter(b,a,x);
subplot(2,1,2);
stem(n,s,'filled','markersize',3)
axis([-20,120,-.5,2.5])
title('Step Response','fontsize',10,'fontweight','bold')
xlabel('n','fontsize',9); ylabel('s(n)','fontsize',9)


% part c)
sum(abs(h))
z = roots(a);
magz = abs(z)

