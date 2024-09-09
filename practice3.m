% MATLAB basic part3

% 2변수 함수의 그래프
clear all; clc;
[X, Y] = meshgrid(1:3, 10:13); % 4 X 3 크기 격자
Z = X + Y;
figure; mesh(X,Y,Z)         % 그림



clear all; clc;
[X, Y] = meshgrid(-2:0.1:2,-2:0.1:2); 
Z = X.*exp(-X.^2-Y.^2)
figure; mesh(X,Y,Z)         % 그림




clear all; clc; close all;
x = linspace(-2,2,41);
y=linspace(-2,2,21);
[xx,yy] = meshgrid(x,y);
for i=1:41
    for j=1:21
        z(i,j) = x(i)*exp(-x(i)^2-y(j)^2);
    end
end
meshc(xx,yy,z')    % '로 행과 열을 바꿔 차원을 일치시킨다.
                   % meshc() 함수로 등고선을 그린다.




% contour() 함수
clear all; clc; close all;
[X,Y] = meshgrid(-2:0.1:2, -2:0.1:2);
Z = X.*exp(-X.^2-Y.^2);

figure(100)
subplot(1,3,1)
mesh(X,Y,Z)
subplot(1,3,2)
contour(X,Y,Z,20)                   % 20개의 등고선(좌,우)
subplot(1,3,3)
contour3(X,Y,Z,20)                  % 3차원 그래프



% 벡터장 (vector field)
close all; clc; clear all;
quiver(0,0,1,1)           % (0,0) -> (1,1) 벡터 그리기
quiver3(0,0,0,1,1,1)          % 3차원에 표현

% 그래디언트(gradient) : 기울기가 가장 가파르게 변하는 곳으로의 방향
close all; clc; clear all;
x = -2:0.1:2;
y = -2:0.1:2;

[X,Y] = meshgrid(x,y);
z = X.*exp(-X.^2-Y.^2);

figure(100)
subplot(1,2,1)
mesh(z)

subplot(1,2,2)
[px,py] = gradient(z);
contour(X,Y,z)
hold on
quiver(X,Y,px,py)
grid on