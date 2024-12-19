% problem 2

%%
% 1. MATLAB 코드 작성 목적
% 주어진 시스템을 he difference equation representation for this system로 
% 해석하고 zero-pole plot을 하고 unit sample response  of this system으로 
% 해석한 후 causal 여부에 대한 판단을 한다.

% 2. 코드의 방향성
% residuez 매개변수를 설정하고 H(z)의 형태를 변환한다. 그리고 z-역변환을
% 통해 h(n)을 결정한다. 그후 causal 여부를 판단한다.


% 3. 방법론
% 1) residuez 매개변수 설정
% 2) residuez 를 통해 R, p,k를 구한다.
% 3) abs,angle 를 통헤 크기,각도를 구해 식을 간단히 작성한다.
% 4) Pole-Zero plot을 통해 직접 계산한 pole값과 zero값이 맞는지 확인한다.
% 5) pole 값에 따른 stability을 위해 z범위를 결정짓고 
% 이것이 causal에 어떻게 영향을 미치는 분석해 causal 인지 anti-causal인지 판단한다.

% 4. 함수의 입력과 출력
% residuez에 대한 함수이다.

% function [ r, p, k ] = residuez( b, a, t )
%RESIDUEZ Z-transform partial-fraction expansion.
%   [R,P,K] = RESIDUEZ(B,A) finds the residues, poles and direct terms
%   of the partial-fraction expansion of B(z)/A(z),
%
%      B(z)       r(1)               r(n)
%      ---- = ------------ +...  ------------ + k(1) + k(2)z^(-1) ...
%      A(z)   1-p(1)z^(-1)       1-p(n)z^(-1)
%
%   B and A are the numerator and denominator polynomial coefficients,
%   respectively, in ascending powers of z^(-1).  R and P are column
%   vectors containing the residues and poles, respectively.  K contains
%   the direct terms in a row vector.  The number of poles is
%      n = length(A)-1 = length(R) = length(P)
%   The direct term coefficient vector is empty if length(B) < length(A);
%   otherwise,
%      length(K) = length(B)-length(A)+1
%
%   If P(j) = ... = P(j+m-1) is a pole of multiplicity m, then the
%   expansion includes terms of the form
%           R(j)              R(j+1)                      R(j+m-1)
%      -------------- + ------------------   + ... + ------------------
%      1 - P(j)z^(-1)   (1 - P(j)z^(-1))^2           (1 - P(j)z^(-1))^m
%
%   [B,A] = RESIDUEZ(R,P,K) converts the partial-fraction expansion back
%   to B/A form.
%
%   Warning: Numerically, the partial fraction expansion of a ratio of
%   polynomials represents an ill-posed problem.  If the denominator
%   polynomial, A(s), is near a polynomial with multiple roots, then small
%   changes in the data, including roundoff errors, can make arbitrarily
%   large changes in the resulting poles and residues. Problem
%   formulations making use of state-space or zero-pole representations
%   are preferable.
%
%   % Example:
%   %   Compute the partial fraction expansion of the following transfer
%   %   function H(z) = (1 + 2z^-1) / (1 - z^-1 + 2z^-2).
%
%   num = [1 2];                % Numerator coefficients
%   den = [1 -1 2];             % Denominator coefficients
%   [r,p] = residuez(num,den)   % H(z) = r(1)/(1-p(1)z^-1) + ...
%                               %        r(2)/(1-p(2)z^-1)
%
%   See also RESIDUE, PRONY, POLY, ROOTS, SS2TF, TF2SS, TF2ZP AND ZP2SS.

%   Author(s): J. McClellan, 10-24-90
%   Modified: T. Bryan, 10-22-97
%   Copyright 1988-2013 The MathWorks, Inc.

%   References:
%     [1] A.V. Oppenheim and R.W. Schafer, Discrete-Time
%         Signal Processing, Prentice-Hall, 1989, pp. 166-170.

% 5. 사용방법
% matlab을 실행시키고 다음 코드를 작성한 다음 F5로 실행시킨다.

%% 2번 문항
% (a) + 손풀이(첨부)

b = [4 -2*sqrt(2) 1]; 
a = [1 -2*sqrt(2) 4];
[R,p,k] = residuez(b,a)

%R =
%   1.8750 - 1.1250i
%   1.8750 + 1.1250i

% p =
%   1.4142 + 1.4142i
%   1.4142 - 1.4142i

%k =
%    0.2500

Mr = abs(R')       % R 크기
Ar = angle(R')/pi  % R 각도
% Mr =
%   2.1866    2.1866


% Ar =
%    0.1720   -0.1720

Mp = abs(p') % pole 크기
Ap = angle(p')/pi % pole 각도 in pi units

% Mp =
%     2     2


% Ap =
%  -0.2500    0.2500




% (b)  Pole-Zero plot
Hf_1 = figure;
[Hz,Hp,HI] = zplane(b,a);   % zplane 함수 이용 b와 a는 위에서 정의
title('Pole-Zero plot')


% (c) : 손풀이
% (d) : 손풀이

