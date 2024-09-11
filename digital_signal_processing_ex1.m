% ex1
n = [-5:5];
x = 2*impseq(-2,-5,5)-impseq(4,-5,5);
stem(n,x,'filled','markersize',3);



% ex2
clear all; clc;

n = [0:20];
x1 = n.*(stepseq(0,0,20)-stepseq(10,0,20));
x2= 10*exp(-0.3*(n-10)).*(stepseq(10,0,20)-stepseq(20,0,20));
x = x1+x2;
stem(n,x,'filled','markersize',3);


% ex3
clear all; clc; 

n = [0:50];
x = cos(0.04*pi*n)+0.2*randn(size(n));
stem(n,x,'filled','markersize',3);

% ex4
clear all; clc; 

n = -2:10; x = [1:7,6:-1:1];
[x11,n11] = sigshift(x,n,5); [x12,n12] = sigshift(x,n,-4);
[x1,n1] = sigadd(2*x11,n11,-3*x12,n12);
stem(n1,x1,'filled','markersize',3);
axis([min(n1)-1,max(n1)+1,min(x1)-1,max(x1)+1])


% ex5
close all; clc;

n = -2:10; x = [1:7,6:-1:1];
[x21,n21] = sigfold(x,n); [x21,n21] = sigshift(x21,n21,3);
[x22,n22] = sigshift(x,n,2); [x22,n22] = sigmult(x,n,x22,n22);
[x2,n2] = sigadd(x21,n21,x22,n22);
stem(n2,x2,'filled','markersize',3);
axis([min(n2)-1,max(n2)+1,0,40])

% ex6
close all; clc;

n =[-10:1:10]; alpha = -0.1+0.3j;
x = exp(alpha*n);
subplot(2,2,1); stem(n,real(x),'filled','markersize',3);
title('Real Part','fontsize',10,'fontweight','bold')
xlabel('n','fontsize',9); ylabel('Amplitude','fontsize',9)

subplot(2,2,2); stem(n,imag(x),'filled','markersize',3);
title('Imaginary Part','fontsize',10,'fontweight','bold')
xlabel('n','fontsize',9); ylabel('Amplitude','fontsize',9)


subplot(2,2,3); stem(n,abs(x),'filled','markersize',3);
title('Magnitude Part','fontsize',10,'fontweight','bold')
xlabel('n','fontsize',9); ylabel('Magnitude','fontsize',9)

subplot(2,2,4); stem(n,(180/pi)*angle(x),'filled','markersize',3);
title('Phase Part','fontsize',10,'fontweight','bold')
xlabel('n','fontsize',9); ylabel('Degrees','fontsize',9)


% ex7
% x(n) = 3*delta(n + 2) + 2*delta(n) - delta(n - 3) + 5*delta(n - 7),
% -5<=n<=15

close all; clc;

x = 3*impseq(-2,-5,15) + 2*impseq(0,-5,15) - impseq(3,-5,15) + 5*impseq(7,-5,15);
Hf = figure; n = [-5:15];
HS = stem(n,x,'filled');
axis([min(n)-1,max(n)+1,min(x)-1,max(x)+1]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)')



% ex8
% x(n) = 10u(n) - 5u(n - 5) + 10u(n - 10) + 5u(n - 15)
close all; clc;

x = 10*stepseq(0,0,20) - 5*stepseq(5,0,20) - 10*stepseq(0,0,20)...
    + 5*stepseq(15,0,20);
n = [0:20];
Hf_1 = figure;
Hs = stem(n,x,'filled'); set(Hs,'markersize',2);
axis([min(n)-1,max(n)+1,min(x)-1,max(x)+2]);
ytick = [-6:2:12];
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');


% ex9
% x(n) = 2sin(0.01*pi*n) cos(0.5*pi*n), -200 <= n <= 200

close all; clc;

n = [-200,200]; x = 2*sin(0.01*pi*n).*cos(0.5*pi*n);

Hf_2 = figure;
Hs = stem(n,x,'filled'); set(Hs,'markersize',2);
axis([min(n)-10,max(n)+10,min(x)-1,max(x)+1]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
ntick = [n(1):40:n(end)];



% ex10
clc; close all; clear all;

n = [-12:12]; x = [-2,-1,0,1,2];
x = x'*ones(1,5); x = (x(:))';

Hf_3 = figure; set(Hf_3,'NumberTitle','off','Name','P0203a');
Hs = stem(n,x,'filled'); set(Hs,'markersize',2);
axis([min(n)-1,max(n)+1,min(x)-1,max(x)+1]);
xlabel('n'); ylabel('x(n)');
title('Sequence x(n)');
ntick = [n(1):2:n(end)]; ytick = [min(x) - 1:max(x) + 1];