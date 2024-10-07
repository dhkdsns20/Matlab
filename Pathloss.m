% 빌딩 뷰어 설정
viewer = siteviewer(Buildings="chungbuk_map.osm");

% 송신기 설정 (tx1, tx2)
tx1 = txsite(Latitude=36.625035, ...
   Longitude=127.457314, ...
   TransmitterFrequency=5.9e9, ...  % 주파수 5.9 GHz
   AntennaHeight=38);               % 안테나 높이 38m

tx2 = txsite(Latitude=36.629905, ...
   Longitude=127.453336, ...
   TransmitterFrequency=5.9e9, ...  % 주파수 5.9 GHz
   AntennaHeight=16);               % 안테나 높이 16m

% 송신기 위치 표시
show(tx1);
hold on;
show(tx2);

%% Path A 설정
% 수신기 위치 배열 (Path A)
rxLocationsA = [
    36.6295, 127.4537;
    36.6287, 127.4533;
    36.6279, 127.4529;
    36.6274, 127.4537;
    36.6272, 127.4545;
    36.6266, 127.4542;
    36.6261, 127.4548;
    36.6261, 127.4560;
    36.6259, 127.4569;
    36.6254, 127.4568
];

% 수신기 배열 초기화 (Path A)
numRxA = size(rxLocationsA, 1);
PathA = rxsite.empty(numRxA, 0);

% Path A의 전파 모델 설정
pmA = propagationModel("raytracing", ...
     MaxNumReflections=2, MaxNumDiffractions=1);

% Path A의 수신 전력 저장용 배열
pathLossA = zeros(numRxA, 1);

% 각 수신기에 대한 설정 및 Path Loss 계산 (Path A)
for k = 1:numRxA
    PathA(k) = rxsite(Latitude=rxLocationsA(k, 1), ...
                      Longitude=rxLocationsA(k, 2));
    show(PathA(k));
    
    % Path Loss 계산 (tx1)
    PL_A = sigstrength(PathA(k), tx1, pmA) - 30; % dBm 단위로 변환
    pathLossA(k) = 10 * log10(10) - PL_A;
end

%% Path B 설정
% 수신기 위치 배열 (Path B)
rxLocationsB = [
    36.6295, 127.4537;
    36.6296, 127.4542;
    36.6292, 127.4547;
    36.6285, 127.4555;
    36.6280, 127.4565;
    36.6277, 127.4574;
    36.6273, 127.4577;
    36.6268, 127.4573;
    36.6260, 127.4572;
    36.6254, 127.4568
];

% 수신기 배열 초기화 (Path B)
numRxB = size(rxLocationsB, 1);
PathB = rxsite.empty(numRxB, 0);

% Path B의 전파 모델 설정
pmB = propagationModel("raytracing", ...
     MaxNumReflections=2, MaxNumDiffractions=1);

% Path B의 수신 전력 저장용 배열
pathLossB = zeros(numRxB, 1);

% 각 수신기에 대한 설정 및 Path Loss 계산 (Path B)
for k = 1:numRxB
    PathB(k) = rxsite(Latitude=rxLocationsB(k, 1), ...
                      Longitude=rxLocationsB(k, 2));
    show(PathB(k));
    
    % Path Loss 계산 (tx1)
    PL_B = sigstrength(PathB(k), tx1, pmB) - 30; % dBm 단위로 변환
    pathLossB(k) = 10 * log10(10) - PL_B;
end

% Path A의 최대, 최소, 평균 Path Loss 계산
maxPathLossA = max(pathLossA);
minPathLossA = min(pathLossA);
averagePathLossA = mean(pathLossA);

% Path B의 최대, 최소, 평균 Path Loss 계산
maxPathLossB = max(pathLossB);
minPathLossB = min(pathLossB);
averagePathLossB = mean(pathLossB);

% 결과 출력
fprintf('Path A - Max Path Loss: %.2f dB, Min Path Loss: %.2f dB, Average Path Loss: %.2f dB\n', ...
        maxPathLossA, minPathLossA, averagePathLossA);
fprintf('Path B - Max Path Loss: %.2f dB, Min Path Loss: %.2f dB, Average Path Loss: %.2f dB\n', ...
        maxPathLossB, minPathLossB, averagePathLossB);

% 경로 손실 그래프 그리기 (평균 Path Loss)
figure;
bar([averagePathLossA, averagePathLossB]);
set(gca, 'XTickLabel', {'Path A', 'Path B'});
ylabel('Average Path Loss (dB)');
title('Comparison of Average Path Loss for Path A and Path B');
grid on;
