% example 3(c)

% 계수 정의
x1 = [1 1 1]; % (1 + z^-1 + z^-2)
nx = [0:2];
x2 = [1 1 1]; % (1 + z^-1 + z^-2)
[y1,ny1] = conv_m(x1,nx,x2,nx);

x2 = [1 1 1]; % (1 + z^-1 + z^-2)
nh = [0:2];
nh = [nh, zeros(1,2)];
[y2,ny2] = conv_m(y1,ny1,x2,nh)
