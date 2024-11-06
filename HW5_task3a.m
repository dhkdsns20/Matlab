% example 3(a)

% 계수 정의
x1 = [1 -2 3 -4]; nx = [0:3];
x2 = [4 3 -2 1];  
[y,ny] = conv_m(x1,nx,x2,nx)