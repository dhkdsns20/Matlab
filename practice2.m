% 변수대입
a = 1;

% 행렬
b = [1 2 3];      % 1*3
b = [1; 2; 3];    % 3*1
c = b'            % 전치행렬
d=1;              % 명령 창에는 뜨지않음
                  % ;(세미콜론)의 두가지 역할


d =[1 2 3;4 5 6];
d(1,3);           % d의 1행3열


2*3;
b.^2;             % .^2을 붙혀 각각의 원소를 제곱


a=[1 2 3];
b=[7 8 9];
a.*b;             % a의 원소를 b의 원소에 곱합
a * b';           % a(1*3) * b(3*1)로 내적을 구함


zeros(3,3) ;      % 원소가 0인 3*3 행렬
eye(3);           % 대각선 성분만 1인 행렬
ones(3,3);        % 원소가 1인 3*3 행렬 


A = [1 2 3; 4 5 6; 7 8 9];
sum(A);           % 각 열별로의 합
sum(sum(A));      % 열 연산이 기본이지만 1행의 경우 행 연산을 한다.
max(A);           % 열 중에 제일 큰 값을 출력
min(A)            % 열 중에 제일 작은 값을 출력


A = [1 2; 3 4];
B = [5 6; 7 8];
A - B;
size(A);          % A의 크기
length(a);        % x*y 중 큰 값을 출력
A*B;               % 행렬의 곱
A.*B;              % 각 원소끼리의 곱


A = [1 26 8; 16 3 8; 2 16 25];
A(2, 1:3);   % 1번 방법
A(2, 1:end); % 2번 방법
A(2,:);      % 3번 방법


round(1.6); % 반올림
floor(1.6); % 반내림
ceil(1.6);  % 올림


x =[1 2 3 4 5]; y=[5 4 3 2 1];
x<y      % x가 y보다 작은 부분을 '1'로 나머지는 '0'으로 출력(참/거짓)
x(x<y)   % x<y 인 x값을 출력
whos     % 작업 공간의 변수들을 출력
whos d   % d만 출력




% 편집기 사용
clear; % 작업 공간 초기화
clc;   
a=1;  % 세미콜론은 명령 창에 안 띄우도록 해줌
b=2;
c=a+b

% 반복문(for)
for x=0:0.5:1
    a=2^x
end

clear; clc;
for k=5:-2:1
    b=k
end

% 반복문(while)
a=1
while a<4
    a=a+1
end


% 조건문 (if)
clear; clc;

a=3;
if a<1
    b=a+1
elseif a<3
    c=a+2
else
    d=a+3
end


% 조건문(switch)
switch i
    case 1.5
        b = 2
    case 2
        b = 3
    otherwise
        b = 5
end



% **linspace(시작점,끝점,점의 총수)
x = linspace(0,5,6)
y = linspace(-1,1,5)

x=linspace(0,2*pi,100)
y=sin(x);

plot(x,y,'ko-')