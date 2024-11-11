% example 3(d)

% X1 계수 정의
x1a = [1 -2 3 -4]; nxa = [0:3];
x2a = [4 3 -2 1];  
[ya,nya] = conv_m(x1a,nxa,x2a,nxa)

% X2 계수 정의
x1b = [0 1 -2 3 2 1 0];
nxb = [-3:3];
x2b = [1 0 0 0 0 0 -1];
[yb,nyb] = conv_m(x1b,nxb,x2b,nxb)

% X3 계수 정의
x1c = [1 1 1]; % (1 + z^-1 + z^-2)
nxc = [0:2];
x2c = [1 1 1]; % (1 + z^-1 + z^-2)
[y1c,ny1c] = conv_m(x1c,nxc,x2c,nxc);

x2c = [1 1 1]; % (1 + z^-1 + z^-2)
nhc = [0:2];
nhc = [nhc, zeros(1,2)];
[y2c,ny2c] = conv_m(y1c,ny1c,x2c,nhc)



% 배열수 맞추기 (1 X 19)
y2c = [zeros(1,6),y2c,zeros(1,6)] 

% X1 * X2
[x1x2,nx1x2] = conv_m(ya,nya,yb,nyb);

% X4 (result)
result = x1x2 + y2c