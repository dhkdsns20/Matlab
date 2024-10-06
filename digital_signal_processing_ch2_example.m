% ex1
clear all; clc
x = [3,11,7,0,-1,4,2]; nx = [-3:3]
h = [2,3,0,-5,2,1]; nh = [-1:4]
[y,ny] = conv_m(x,nx,h,nh)
z = conv(x,h)


% ex2
clear all; clc; close all;
x = [3,11,7,0,-1,4,2]; nx = [-3:3]; % given signal x(n)
[y,ny] = sigshift(x,nx,2);          % obtain x(n-2)
w = randn(1,length(y)); nw = nx;    % generate w(n)
[y,ny] = sigadd(y,ny,w,nw);         % obtain y(n) = x(n-2) + w(n)
[x,nx] = sigfold(x,nx);             % obtain x(-n)
[rxy,nrxy] = conv_m(y,ny,x,nx);
stem(nrxy,rxy,'filled','markersize',3)
axis([-4,8,-50,250]); xlabel('lag variable 1','fontsize',9)
ylabel('rxy,','fontsize',9)


% ex3
b = [1]; a = [1,-0.9];
n = -5:50; x = stepseq(0,-5,50) - stepseq(10,-5,50);
y = filter(b,a,x);
stem(x,y,'filled','markersize',3);
title('Output sequence')
xlabel('n'); ylabel('y(n)'); axis([-5,50,-0.5,8]);


% ex4
% a)
clear all; clc; close all;
nx = [0:20]; x = 0.9.^nx; [xf,nxf] =sigfold(x,nx);
[rxx,nrxx] = conv_m(x,nx,xf,nxf);

Hs = stem(nrxx,rxx); set(Hs,'markersize',2);
xlabel('n'); ylabel('r_x_x(n)');
title('Auotocorreation of x(n)');
axis([min(nrxx)-1,max(nrxx)+1,min(rxx),max(rxx)+1]);


% b)
clear all; clc; close all;
nx = [0:20]; x = 0.9.^nx; ny = [-20:0]; y = 0.8.^ny;
[yf,nyf] = sigfold(y,ny); [rxy,nrxy] = conv_m(x,nxy,yf,nyf);

Hs = stem(nrxy,rxy); set(Hs,'markersize',2);
xlabel('n'); ylabel('r_x_u(n)');
title('Auotocorreation of x(n) and y(n)');
axis([min(nrxy)-1,max(nrxy)+1,min(rxy),max(rxy)+20]);
ytick = [0:50:300 320];


% ex5
% a)
clear all; clc; close all;

b = [1 2 0 1]; a = [1 -0.5 0.25]; [delta,n] = impseq(0,0,100);
h = filter(b,a,delta);

Hs = stem(n,h,'filled'); set(Hs,'markersize',2);
axis([min(n)-5,max(nyf)+5,min(h)-0.5,max(h)+0.5]);
xlabel('n'); ylabel('h(n)');
title('Impulse reponse');

% b)
clear all; clc; close all;

b = [1 2 0 1]; a = [1 -0.5 0.25]; n = 0:200;
x = S*ones(size(n))+3*cos(0.2*pi*n)+4*sin(0.6*pi*n); y = filter(b,a,x);

Hs = stem(n,h,'fil



% ex6
% 1)
clear all; clc; close all;


% 2)
clear all; clc; close all;

n1 = -2:5; [x11,nx11] = stepseq(-1,-2,5); [x12,nx12] = stepseq(4,-2,5);
[x13,n13] = sigadd(x11,nx11,-x12,nx12); x14 = 0.25.^-n1; n14 = n1;
x = x14.*x13;
n2 = 0:6; [h11,nh11] = stepseq(0,0,6); [h12,nh12] = stepseq(5,0,6); h = h11-h12;

[y,n] = conv_m(x,n1,h,n2); y,n