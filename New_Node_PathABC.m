% Excel 파일에서 데이터를 로드
rxA_data = readtable('rxA_50_matched.xlsx');
rxB_data = readtable('rxB_50_matched.xlsx');
rxC_data = readtable('rxC_50_matched.xlsx');

% 지도 시각화
figure;
geobasemap('satellite'); % 배경 지도 스타일 설정
hold on;

% rxA 수신기 표시 (빨간색 점)
geoscatter(rxA_data.Latitude, rxA_data.Longitude, 50, 'red', 'filled', 'DisplayName', 'rxA Receivers');

% rxB 수신기 표시 (파란색 점)
geoscatter(rxB_data.Latitude, rxB_data.Longitude, 50, 'blue', 'filled', 'DisplayName', 'rxB Receivers');

% rxC 수신기 표시 (초록색 점)
geoscatter(rxC_data.Latitude, rxC_data.Longitude, 50, 'green', 'filled', 'DisplayName', 'rxC Receivers');

% 제목 및 범례 추가
title('Receiver Nodes Visualization for rxA, rxB, and rxC');
legend show;
hold off;
