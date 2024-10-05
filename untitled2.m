% 빌딩 뷰어 설정
viewer = siteviewer(Buildings="chungbuk_map.osm");

% 송신기 설정
tx1 = txsite(Latitude=36.625035, Longitude=127.457314, TransmitterFrequency=5.9e9);  % 주파수 5.9 GHz

tx2 = txsite(Latitude=36.629905, Longitude=127.453336, TransmitterFrequency=5.9e9);  % 주파수 5.9 GHz


% 송신기 위치 표시
show(tx1);
show(tx2);

% 수신기 위치 배열
rxLocations = [
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

% 수신기 배열 초기화
numRx = size(rxLocations, 1);
rxSites = rxsite.empty(numRx, 0);

% 각 수신기에 대한 설정 및 표시
for k = 1:numRx
    rxSites(k) = rxsite(Latitude=rxLocations(k, 1), ...
                        Longitude=rxLocations(k, 2));
    show(rxSites(k));
end

% 전파 모델 설정
pm = propagationModel("raytracing", ...
     MaxNumReflections=2, MaxNumDiffractions=1);

% 각 수신기에 대해 송신기로부터의 경로 추적 및 신호 강도 계산
for k = 1:numRx
    Ray1 = raytrace(tx2, rxSites(k), pm);
    

    % 수신 전력 계산
    PL = sigstrength(rxSites(k), tx2, pm) - 30; % dBm 단위 변경
    pathLossdB = 10 * log10(10) - PL;

    % 결과 출력
    fprintf('RX Site %d: Latitude: %.6f, Longitude: %.6f, Path Loss (dB): %.2f\n', ...
        k, rxLocations(k, 1), rxLocations(k, 2), pathLossdB);
end
