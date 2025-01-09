% problem 4

%%
% 1. MATLAB 코드 작성 목적
% N-point에 대한 circular convolution을 구하고 linear convolution과 비교한다.

% 2. 코드의 방향성
% x1,x2,N을 정의하고 circular convolution, linear convolution 함수를 이용해
% 각각을 구해 error를 계산한다.


% 3. 방법론
% 1) 문제별 x1,x2,N을 정의 
% 2) circular convolution 함수 활용
% 3) linear convolution 함수 활용
% 4) 둘의 결과값의 차이를 error로 계산


% 4. 함수의 입력과 출력
% function y = circonvt(x1,x2,N)
% % N-point circular convolution between x1 and x2: (time-domain)
% % -------------------------------------------------------------
% % [y] = circonvt(x1,x2,N)
% %  y = output sequence containing the circular convolution
% % x1 = input sequence of length N1 <= N
% % x2 = input sequence of length N2 <= N
% %  N = size of circular buffer
% %  Method: y(n) = sum (x1(m)*x2((n-m) mod N))
% 
% % Check for length of x1
% if length(x1) > N
%         error('N must be >= the length of x1')
% end
% 
% % Check for length of x2
% if length(x2) > N
%         error('N must be >= the length of x2')
% end
% 
% x1=[x1 zeros(1,N-length(x1))];
% x2=[x2 zeros(1,N-length(x2))];
% 
% m = [0:1:N-1];
% x2 = x2(mod1(-m,N)+1);
% H = zeros(N,N);
% 
% for n = 1:1:N
% 	H(n,:) = cirshftt(x2,n-1,N);
% end
% 
% y = x1*H';




% 5. 사용방법
% matlab을 실행시키고 다음 코드를 작성한 다음 F5로 실행시킨다.

%% 4번 문항
% (a)
% 1)
% N, x1, x2, n 정의
N = 32;
n = 0:N-1;
xa1 = cos(2*pi*n/N); 
xa2 = sin(2*pi*n/N);


% circonvt 를 N에 대해 수행
xa3 = circonvt(xa1,xa2,N);

% 2) 
% convolution 수행
xa4 = conv_m(xa1,n,xa2,n);

% 3) 
% error 계산
xa3 = [zeros(1,16),xa3,zeros(1,15)];
error1 = max(abs(xa3-xa4))

%%

% (b)
% 1)
% N, x1, x2, n 정의
N = 15; 
n = 0:N-1;
xb1 = (0.8).^n;
xb2 = (-0.8).^n; 

% circonvt 를 N에 대해 수행
xb3 = circonvt(xb1,xb2,N);

% 2) 
% convolution 수행
xb4 = conv_m(xb1,n,xb2,n);

% 3) 
% error 계산
xb3 = [xb3,zeros(1,14)];
error2 = max(abs(xb3-xb4))


%%
% (c)
% 1)
% N, x1, x2, n 정의
N = 10;
n = 0:N-1;
xc1 = n; 
xc2 = N-n; 

% circonvt 를 N에 대해 수행
xc3 = circonvt(xc1,xc2,N);

% 2)
% convolution 수행
xc4 = conv_m(xc1,n,xc2,n);

% 3) 
% error 계산
xc3 = [xc3 zeros(1,9)];
error3 = max(abs(xc3-xc4))



% (d)
% (c)가 가장 error가 크다.