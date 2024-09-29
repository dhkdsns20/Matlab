clear all; clc; close all;

% 사이트 뷰어 설정
viewer = siteviewer(Buildings="chungbuk_map.osm");
tx1 = txsite(Latitude=36.625539, Longitude=127.455853, TransmitterFrequency=5.9e9); % 5.9 GHz
tx2 = txsite(Latitude=36.624182, Longitude=127.455777, TransmitterFrequency=5.9e9); % 5.9 GHz
show(tx1); show(tx2);

% 수신기 설정
rx = rxsite(Latitude=36.625000, Longitude=127.455800);   
pm = propagationModel("raytracing", MaxNumReflections=2, MaxNumDiffractions=1);
coverage(tx1,pm,SignalStrengths=-100:5); coverage(tx2,pm,SignalStrengths=-100:5);

% 신호 강도 및 SNR 계산
rss = sigstrength(rx, tx1, pm); % 수신 신호 강도(dBm)
N0dBm = -174 + 10*log10(20e6);  % 열 잡음 전력(dBm) (20 MHz 대역폭)
SNRdB = rss - N0dBm;            % SNR 계산(dB)
SNR = 10^(SNRdB/10);            % SNR 선형 값

% 5G NR 설정
nTxAnts = 2; nRxAnts = nTxAnts;  % 송신/수신 안테나 수 설정
carrier = nrCarrierConfig; carrier.NSizeGrid = 52; carrier.SubcarrierSpacing = 15;
waveformInfo = nrOFDMInfo(carrier);

% PDSCH 설정
pdsch = nrPDSCHConfig; pdsch.Modulation = "16QAM"; pdsch.PRBSet = 0:(carrier.NSizeGrid-1);
pdsch.NumLayers = nTxAnts;       % PDSCH 레이어 수
w = (1/sqrt(pdsch.NumLayers)) * ones(pdsch.NumLayers, nTxAnts);  % 프리코딩 벡터

% 잡음 전력 계산
N0time = sqrt(1 / (nRxAnts * waveformInfo.Nfft * SNR));

% PDSCH 인덱스 및 심볼 생성
[pdschIndices, pdschInfo] = nrPDSCHIndices(carrier, pdsch);
pdschBits = randi([0 1], pdschInfo.G, 1);
pdschSymbols = nrPDSCH(carrier, pdsch, pdschBits);
pdschSymbolsPrecoded = pdschSymbols * w;

% 리소스 그리드 및 OFDM 변조
pdschGrid = nrResourceGrid(carrier, nTxAnts);
[~, pdschAntIndices] = nrExtractResources(pdschIndices, pdschGrid);
pdschGrid(pdschAntIndices) = pdschSymbolsPrecoded;
txWaveform = nrOFDMModulate(carrier, pdschGrid);

% 수신 신호 및 잡음 추가
rxWaveform = txWaveform / sqrt(nRxAnts);
rxNoise = N0time * (randn(size(rxWaveform)) + 1i * randn(size(rxWaveform))) / sqrt(2);
rxWaveform = rxWaveform + rxNoise;  % 수신 신호에 잡음 추가

% OFDM 복조 및 PDSCH 추출
rxSignalGrid = nrOFDMDemodulate(carrier, rxWaveform);
rxPDSCHSymbols = rxSignalGrid(pdschAntIndices);

% 신호 및 잡음 전력 계산
Sre = (1/waveformInfo.Nfft.^2) * rms(rxPDSCHSymbols).^2;
Nre = (1/waveformInfo.Nfft) * rms(rxNoise).^2;

% 결과 출력
for n = 1:nRxAnts
    disp("Received signal power per RE antenna " + string(n) + " = " + string(pow2db(Sre(n))+30) + " dBm");
    disp("Received noise power per RE antenna " + string(n) + " = " + string(pow2db(Nre(n))+30) + " dBm");
    disp("SNR (antenna " + string(n) + ") = " + string(pow2db(Sre(n)/Nre(n))) + " dB");
end

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
