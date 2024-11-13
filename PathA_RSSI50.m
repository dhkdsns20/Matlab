% 송신기 위치 설정
tx = [... 
    txsite("Latitude",36.622761, ...
           "Longitude",127.460405, ...
           "TransmitterFrequency",5.9e9); % 주파수: 5.9 GHz 
    txsite("Latitude",36.6281038, ...
           "Longitude",127.4580577, ...
           "TransmitterFrequency",5.9e9); % 주파수: 5.9 GHz  
    txsite("Latitude",36.630036, ...
           "Longitude",127.454819, ...
           "TransmitterFrequency",5.9e9); % 주파수: 5.9 GHz
];

% Path A (rx 5개 설정)
rxA = [
    rxsite("Latitude", 36.624737, "Longitude", 127.463278);
   rxsite("Latitude", 36.624815, "Longitude", 127.462924);
   rxsite("Latitude", 36.624853, "Longitude", 127.462678);
   rxsite("Latitude", 36.624952, "Longitude", 127.462265);
   rxsite("Latitude", 36.625090, "Longitude", 127.461927);
   rxsite("Latitude", 36.625241, "Longitude", 127.461626);
   rxsite("Latitude", 36.625503, "Longitude", 127.461159);
   rxsite("Latitude", 36.625654, "Longitude", 127.460902);
   rxsite("Latitude", 36.625925, "Longitude", 127.460457);
   rxsite("Latitude", 36.626145, "Longitude", 127.460081);
   rxsite("Latitude", 36.625930, "Longitude", 127.460460);
   rxsite("Latitude", 36.626036, "Longitude", 127.460286);
   rxsite("Latitude", 36.626168, "Longitude", 127.460067);
   rxsite("Latitude", 36.626274, "Longitude", 127.459912);
   rxsite("Latitude", 36.626338, "Longitude", 127.459790);
   rxsite("Latitude", 36.626475, "Longitude", 127.459554);
   rxsite("Latitude", 36.626620, "Longitude", 127.459342);
   rxsite("Latitude", 36.626762, "Longitude", 127.459135);
   rxsite("Latitude", 36.627127, "Longitude", 127.458454);
   rxsite("Latitude", 36.627229, "Longitude", 127.458303);
   rxsite("Latitude", 36.627379, "Longitude", 127.458072);
   rxsite("Latitude", 36.627514, "Longitude", 127.457854);
   rxsite("Latitude", 36.627271, "Longitude", 127.457590);
   rxsite("Latitude", 36.627010, "Longitude", 127.457361);
   rxsite("Latitude", 36.626615, "Longitude", 127.457311);
   rxsite("Latitude", 36.626193, "Longitude", 127.457266);
   rxsite("Latitude", 36.625951, "Longitude", 127.456974);
   rxsite("Latitude", 36.626073, "Longitude", 127.456242);
   rxsite("Latitude", 36.626062, "Longitude", 127.455495);
   rxsite("Latitude", 36.626079, "Longitude", 127.454776);
   rxsite("Latitude", 36.626135, "Longitude", 127.454309);
   rxsite("Latitude", 36.626549, "Longitude", 127.454105);
   rxsite("Latitude", 36.626958, "Longitude", 127.454325);
   rxsite("Latitude", 36.627478, "Longitude", 127.454567);
   rxsite("Latitude", 36.627496, "Longitude", 127.454138);
   rxsite("Latitude", 36.627431, "Longitude", 127.453692);
   rxsite("Latitude", 36.627582, "Longitude", 127.453145);
   rxsite("Latitude", 36.627706, "Longitude", 127.452952);
   rxsite("Latitude", 36.628258, "Longitude", 127.453031);
   rxsite("Latitude", 36.628673, "Longitude", 127.453270);
   rxsite("Latitude", 36.628888, "Longitude", 127.453387);
   rxsite("Latitude", 36.629327, "Longitude", 127.453663);
   rxsite("Latitude", 36.629621, "Longitude", 127.453839);
   rxsite("Latitude", 36.630039, "Longitude", 127.454089);
   rxsite("Latitude", 36.630681, "Longitude", 127.454471);
   rxsite("Latitude", 36.631044, "Longitude", 127.454303);
   rxsite("Latitude", 36.631407, "Longitude", 127.453686);
   rxsite("Latitude", 36.631660, "Longitude", 127.453261);
   rxsite("Latitude", 36.632229, "Longitude", 127.452991);
];

% 전파 모델 설정
pm = propagationModel("raytracing", "MaxNumReflections",2, "MaxNumDiffractions",1); % 최대 2회 반사, 최대 1회 회절

% RSSI 계산
RSSIperPath(tx, pm, rxA);

%% ============================================================== %%
function RSSIperPath(tx, pm, rx)
    % Site Viewer 설정
    viewer = siteviewer(Buildings="chungbuk_map (1).osm");

    % 송신기 및 수신기 시각화
    for i = 1:length(tx)
        show(tx(i));
    end

    for i = 1:length(rx)
        show(rx(i));
    end
    
    % 수신 전력 저장용 변수 설정 (tx1, tx2, tx3 각각에 대해)
    ss_tx1 = zeros(1, length(rx)); % tx1에 대한 수신 전력 저장 배열
    ss_tx2 = zeros(1, length(rx)); % tx2에 대한 수신 전력 저장 배열
    ss_tx3 = zeros(1, length(rx)); % tx3에 대한 수신 전력 저장 배열
    
    for i = 1:length(rx)
        % tx1에서 수신 전력 계산
        ss_tx1(i) = sigstrength(rx(i), tx(1), pm); 
        
        % tx2에서 수신 전력 계산
        ss_tx2(i) = sigstrength(rx(i), tx(2), pm); 
        
        % tx3에서 수신 전력 계산
        ss_tx3(i) = sigstrength(rx(i), tx(3), pm); 
    end
    
    % 결과 출력
    disp('tx1에서의 수신 전력 (dBm):');
    disp(ss_tx1);
    
    disp('tx2에서의 수신 전력 (dBm):');
    disp(ss_tx2);
    
    disp('tx3에서의 수신 전력 (dBm):');
    disp(ss_tx3);
    
    % 각 송신기의 수신 전력 배열에 대한 평균, 최대, 최소 값 계산
    avg_ss_tx1 = mean(ss_tx1);
    avg_ss_tx2 = mean(ss_tx2);
    avg_ss_tx3 = mean(ss_tx3);
    
    max_ss_tx1 = max(ss_tx1);
    max_ss_tx2 = max(ss_tx2);
    max_ss_tx3 = max(ss_tx3);
    
    min_ss_tx1 = min(ss_tx1);
    min_ss_tx2 = min(ss_tx2);
    min_ss_tx3 = min(ss_tx3);

    % 각 송신기에 대한 결과 출력
    disp('=== tx1 ===');
    disp(['Average RSSI (tx1): ', num2str(avg_ss_tx1)]);
    disp(['Max RSSI (tx1): ', num2str(max_ss_tx1)]);
    disp(['Min RSSI (tx1): ', num2str(min_ss_tx1)]);
    
    disp('=== tx2 ===');
    disp(['Average RSSI (tx2): ', num2str(avg_ss_tx2)]);
    disp(['Max RSSI (tx2): ', num2str(max_ss_tx2)]);
    disp(['Min RSSI (tx2): ', num2str(min_ss_tx2)]);
    
    disp('=== tx3 ===');
    disp(['Average RSSI (tx3): ', num2str(avg_ss_tx3)]);
    disp(['Max RSSI (tx3): ', num2str(max_ss_tx3)]);
    disp(['Min RSSI (tx3): ', num2str(min_ss_tx3)]);
end
