%% task 1
x1 = [2,1,1,2]; x2 = [1,-1,-1,1];

% (a) circular convolution for N = 4,7 and 8
N=4; y1 = circonvt(x1,x2,N)
N=7; y2 = circonvt(x1,x2,N)
N=8; y3 = circonvt(x1,x2,N)

% (b) linear convolution x1(n) * x2(n)
y4 = conv(x1,x2)

% (c) determine the minimum value of N on the same N-point 
% answer : N =7