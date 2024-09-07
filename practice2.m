% MATLAB basic part2

mod(13,4);   % 나누기

real(3+2i);  % 실수부
imag(3+2i);  % 허수부


x = linspace(0,2*pi,100);
y = sin(x);
plot(x,y,'--rs','linewidth',...  % ...으로 아래 줄에 작성
    2,'markeredgecolor',...
    'k','markersize',10)



f = inline('x^5+3*x-1','x')
f(2)



% 함수 사용
x = [10 20 30]
multiMAT(x) % multiMAT() 함수를 불러와 사용


% x를 정의하고 eval() 함수로 계산
clear; clc;
f = 'x^5+3*x-1'
x=2
eval(f)      


% 대소 비교
x =[1 2 3 5 8]; y = [0 2 1 4 9];
find(x<=y)         % 수를 출력
length(find(x<=y)) % [2 5] => 1*2중 2를 출력


% 다항함수
clear all; clc; close all;

x = [-1 1 3 5]; y = [2 -4 1 3];
p = polyfit(x,y,3)              % polyfit(x좌표,y좌표,다항식차수) : 다항식의 계수를 찾음
xx = linspace(-1,5,100);
yy = polyval(p,xx);             % polyval() :다항식의 함수 값을 찾음        
plot(x,y,'ro',xx,yy,'k-')



% 파일 입출력 
fp = fopen('test.m','w');        % fp변수 / test.m 이라는 FileOpen / write

fprintf(fp,'%d %d\n',1,2);       % fp 파일에 1,2을 %d에 입력
fprintf(fp,'%1.1f %f\n',3.5, 4.5);
fprintf(fp,'%e %e\n',100, 1000);
fclose(fp);



% clf : clear figure : 지워준다.
% close all : figure 창을 닫는다.
% figure(100) : 100값을 갖는 figure창을 띄운다.
% hold on : 여러개를 겹쳐서 그리고 싶을때 사용
% hold off

plot(yy,'k-') % xx의 좌표가 인덱스로 표시(100)

plot(x,y,'ro')
hold on
plot(xx,yy,'k-')





% 그래프 표현
clear all; clc; close all;

X = linspace(0,10,50);

Y1 = sin(X);
Y2 = cos(X);
Y3 = 1 + sin(X);

figure(100)
subplot(1,3,1)    % 1행 3열의 첫번째 칸
plot(X,Y1,'ro-')

subplot(1,3,2)    % 1행 3열의 두번째 칸
plot(X,Y2,'b*-')

subplot(1,3,3)    % 1행 3열의 세번째 칸
plot(X,Y3,'gd--')

figure(200)
plot(X,Y1,'ko--'); hold on;
plot(X,Y2,'r*:')
title('sin / cos graph')
xlabel('x value')
ylabel('y label')
legend('sin','cos')      % 범례
grid on                  % 격자
%axis([5 8 0 1])         % x의 범위(5~8) / y의 범위(0~1)



% 이미지 표현
close all;
t = linspace(0,2*pi,100);
x = 3*cos(t);
y = 2*sin(t);

subplot(1,3,1)
plot(x,y)
axis image    % 원래 이미지 유지, box크기 원래 이미지 크기

subplot(1,3,2)
plot(x,y)
axis equal    % 원래 이미지 유지, box크기 3:4:4 나타냄

subplot(1,3,3)
plot(x,y)
axis square   % 원래 이미지 변경, box크기 1:1:1 나타냄



% 3차원 그래프
close all;
plot3(10,10,10,'ko')
grid on

t = 0:0.01:10
x=cos(3*t);
y=sin(3*t);
z=t.^2;
plot3(x,y,z,'k-')