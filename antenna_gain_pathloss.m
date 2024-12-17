clc;

% 송신기 위치 설정
tx = [
    txsite("Latitude", 36.622761, "Longitude", 127.460405, "TransmitterFrequency", 5.9e9); % Tx1
    txsite("Latitude", 36.6281038, "Longitude", 127.4580577, "TransmitterFrequency", 5.9e9); % Tx2
    txsite("Latitude", 36.630036, "Longitude", 127.454819, "TransmitterFrequency", 5.9e9); % Tx3
];

% 송신 세기 (dBm)
txPower = 38; % 송신 출력 전력 (기본 dBm)

% 송신 안테나 게인 설정 (RSU 기준으로 12 dBi로 설정)
txAntennaGain = 15; % RSU 안테나 게인 (dBi)

% 수신 안테나 게인 설정 (차량용 안테나로 3 dBi 가정)
rxAntennaGain = 4; % 수신 안테나 게인 (dBi)

% 엑셀 파일 불러오기
filePath = 'campus_nodes_coordinates.xlsx'; % 엑셀 파일 경로
data = readtable(filePath, 'VariableNamingRule', 'preserve'); % 열 이름 유지

% Latitude와 Longitude 추출
latitudes = data.("Latitude (y)");
longitudes = data.("Longitude (x)");

% rxsite 객체 배열 생성
numNodes = height(data);
rxSites = repmat(rxsite(), numNodes, 1); % 미리 배열 크기 설정

for i = 1:numNodes
    rxSites(i) = rxsite("Latitude", latitudes(i), "Longitude", longitudes(i));
end

% 전파 모델 설정
propModel = propagationModel("raytracing", ...
    "Method", "sbr", ...
    "MaxNumReflections", 4, ...
    "MaxNumDiffractions", 0);

% 각 노드에 대해 RSSI 계산 및 최적 송신기 선택
RSSI = zeros(numNodes, length(tx));
PathLoss = zeros(numNodes, 1);
BestTxIdx = zeros(numNodes, 1);

for i = 1:numNodes
    for j = 1:length(tx)
        % 기본 RSSI 계산 (수신 강도)
        rssiNoGain = sigstrength(rxSites(i), tx(j), propModel); % dBm 단위 결과
        
        % 송신기와 수신기의 총 게인 적용
        RSSI(i, j) = rssiNoGain + txAntennaGain + rxAntennaGain;
    end
    % 최적 송신기 선택
    [maxRSSI, bestTx] = max(RSSI(i, :));
    BestTxIdx(i) = bestTx;
    PathLoss(i) = txPower + txAntennaGain - maxRSSI; % Pathloss 계산
end

% 결과 출력
fprintf("노드별 최적 송신기 및 Pathloss:\n");
for i = 1:numNodes
    fprintf("Node %d: Best Tx = %d, RSSI = %.2f dBm, PathLoss = %.2f dB\n", ...
        i, BestTxIdx(i), RSSI(i, BestTxIdx(i)), PathLoss(i));
end

% 엑셀 파일로 저장
outputTable = table(latitudes, longitudes, BestTxIdx, max(RSSI, [], 2), PathLoss, ...
    'VariableNames', {'Latitude', 'Longitude', 'BestTxIdx', 'RSSI (dBm)', 'PathLoss (dB)'});

outputFile = 'Node_RSSI_Pathloss_Fixed.xlsx';
writetable(outputTable, outputFile);

fprintf('데이터가 "%s" 파일로 저장되었습니다.\n', outputFile);
