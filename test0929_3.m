% 주어진 변수들
h_BS = 25; % 송신 안테나 높이 (m)
h_UT = 1.5; % 수신 안테나 높이 (m)
f_c = 5.9e9; % 주파수 (Hz)
d2D = 200; % 2D 거리 (m)
d3D = sqrt(d2D^2 + (h_BS - h_UT)^2); % 3D 거리 (m)
d_BP = 4 * (h_BS - 1) * (h_UT - 1) * f_c / 3e8; % Breakpoint 거리 계산

% 주파수(GHz)
f_c_GHz = f_c / 1e9;

% LOS 경로 손실 계산
if d2D <= d_BP
    PL1 = 28.0 + 22*log10(d3D) + 20*log10(f_c_GHz);
    PL = PL1;
else
    PL2 = 28.0 + 40*log10(d3D) + 20*log10(f_c_GHz) - 9*log10((d_BP^2 + (h_BS - h_UT)^2));
    PL = PL2;
end

% NLOS 경로 손실 계산
PL_NLOS = max(PL, 13.54 + 39.08*log10(d3D) + 20*log10(f_c_GHz) - 0.6*(h_UT - 1.5));

% 결과 출력
fprintf('LOS 경로 손실: %.2f dB\n', PL);
fprintf('NLOS 경로 손실: %.2f dB\n', PL_NLOS);
