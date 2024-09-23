% Launch Site Viewer with buildings in the specified OpenStreetMap® file.
viewer = siteviewer(Buildings="chungbuk_map.osm");

% Create two transmitter sites.
tx1 = txsite(Latitude=36.625539, ...
    Longitude=127.455853, ...
    TransmitterFrequency=5.9e9); % Frequency = 5.9 GHz

tx2 = txsite(Latitude=36.624182, ...
    Longitude=127.455777, ...
    TransmitterFrequency=5.9e9); % Frequency = 5.9 GHz

% Display the transmitters on the map.
show(tx1)
show(tx2)

% Place the receiver near one of the transmitter sites.
rx = rxsite(Latitude=36.625000, ... % Receiver's latitude
    Longitude=127.455800);          % Receiver's longitude
show(rx)

% Create a ray tracing propagation model.
pm = propagationModel("raytracing", ...
    MaxNumReflections=2, MaxNumDiffractions=1);

% Calculate received signal strength at the receiver.
rss = sigstrength(rx, tx1, pm);

% Assume the following parameters for noise power calculation:
% Bandwidth (B) = 20 MHz, Noise figure (NF) = 10 dB, and 
% thermal noise power density (N0) = -174 dBm/Hz.
B = 20e6; % Bandwidth in Hz (20 MHz)
NF = 10; % Noise figure in dB
N0 = -174; % Thermal noise power density in dBm/Hz

% Calculate noise power (N) in dBm.
N = N0 + 10*log10(B) + NF;

% Calculate Signal-to-Noise Ratio (SNR) in dB.
SNR = rss - N;
fprintf('Received Signal Strength (RSS): %.2f dBm\n', rss);
fprintf('Noise Power (N): %.2f dBm\n', N);
fprintf('Signal-to-Noise Ratio (SNR): %.2f dB\n', SNR);

% Calculate throughput using the Shannon capacity formula:
% Capacity (C) = B * log2(1 + SNR_linear), where SNR_linear is in linear scale.
SNR_linear = 10^(SNR/10); % Convert SNR from dB to linear scale.
C = B * log2(1 + SNR_linear); % Shannon capacity in bits per second (bps).

fprintf('Throughput (Shannon Capacity): %.2f Mbps\n', C/1e6);
