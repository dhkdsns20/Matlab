
viewer = siteviewer(Buildings="chungbuk_map.osm");

% 송신기 위치 설정
tx1 = txsite(Latitude=36.625035, ...
   Longitude=127.457314, ...
   TransmitterFrequency=5.9e9, ...  % 주파수 5.9 GHz
   AntennaHeight=38);               % 안테나 높이 38m

tx2 = txsite(Latitude=36.629905, ...
   Longitude=127.453336, ...
   TransmitterFrequency=5.9e9, ...  % 주파수 5.9 GHz
   AntennaHeight=16);               % 안테나 높이 16m

% 송신기 시각화
show(tx1)
show(tx2)

% Path B (rx 10개 설정)
rx = [
    rxsite(Latitude=36.6295, Longitude=127.4537), ...
    rxsite(Latitude=36.6296, Longitude=127.4542), ...
    rxsite(Latitude=36.6292, Longitude=127.4547), ...
    rxsite(Latitude=36.6285, Longitude=127.4555), ...
    rxsite(Latitude=36.6280, Longitude=127.4565), ...
    rxsite(Latitude=36.6277, Longitude=127.4574), ...
    rxsite(Latitude=36.6273, Longitude=127.4577), ...
    rxsite(Latitude=36.6268, Longitude=127.4573), ...
    rxsite(Latitude=36.6260, Longitude=127.4572), ...
    rxsite(Latitude=36.6254, Longitude=127.4568)
];

% 수신기 시각화
for i = 1:length(rx)
    show(rx(i));
end

% 전파 모델 설정
pm = propagationModel("raytracing", MaxNumReflections=2, MaxNumDiffractions=1);

% 수신 전력 및 경로 손실 계산
pathLossdB_rx = zeros(1, length(rx));  % 수신 전력 저장 배열

for i = 1:length(rx)
    PL = sigstrength(rx(i), tx1, pm) - 30;  % 수신 전력 계산
    pathLossdB_rx(i) = -PL;  % 수신 전력 저장
end

% 결과 출력
disp('수신 전력 (dB):');
disp(pathLossdB_rx);
