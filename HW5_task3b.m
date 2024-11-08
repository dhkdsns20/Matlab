% example 3(b)

% 계수 정의
x1 = [0 1 -2 3 2 1 0];
nx = [-3:3];
x2 = [1 0 0 0 0 0 -1];
[y,ny] = conv_m(x1,nx,x2,nx)
