%% Parameters for SNR Calculation
carrierFrequency = 5.9e9; % 5.9 GHz
bandwidth = 10e6;         % 10 MHz
modulation = 'QPSK';      % Modulation type
txPower_dBm = 23;         % Transmission power in dBm
txPower = 10^((txPower_dBm - 30)/10); % Convert to watts
vehicleDensity = 50;      % Number of vehicles in the scenario
distance = 100;           % Distance between vehicles in meters
noiseFigure_dB = 9;       % Noise figure
thermalNoise_dBm = -174 + 10*log10(bandwidth); % Thermal noise in dBm
thermalNoise = 10^((thermalNoise_dBm - 30)/10); % Convert to watts

%% Path Loss Model for SNR Calculation (Urban Scenario, LOS)
pathLoss_dB = 128.1 + 37.6*log10(distance/1000); % 3GPP Urban Path Loss
pathLoss = 10^(pathLoss_dB/10); % Convert to linear scale

% Signal to Noise Ratio (SNR) Calculation
rxPower = txPower / pathLoss;  % Received power in watts
noisePower = thermalNoise * 10^(noiseFigure_dB/10); % Noise power with noise figure
SNR = rxPower / noisePower; % Signal-to-noise ratio in linear scale
SNR_dB = 10*log10(SNR); % Convert SNR to dB

% Data Rate Calculation (using Shannon's capacity formula)
dataRate = bandwidth * log2(1 + SNR); % Data rate in bits per second

% Display Results for SNR Calculation
disp(['Path Loss (dB): ', num2str(pathLoss_dB)]);
disp(['Received Power (dBm): ', num2str(10*log10(rxPower*1000))]);
disp(['SNR (dB): ', num2str(SNR_dB)]);
disp(['Data Rate (Mbps): ', num2str(dataRate/1e6)]);

% Plotting SNR vs Distance for different vehicle distances
distances = linspace(10, 1000, 100); % Distances from 10 m to 1000 m
SNR_dBs = zeros(1, length(distances));

for i = 1:length(distances)
    pathLoss_dB = 128.1 + 37.6*log10(distances(i)/1000); % Path loss for each distance
    pathLoss = 10^(pathLoss_dB/10); % Convert to linear scale
    rxPower = txPower / pathLoss;  % Received power
    SNR = rxPower / noisePower; % Signal-to-noise ratio
    SNR_dBs(i) = 10*log10(SNR); % Convert to dB
end

figure;
plot(distances, SNR_dBs, 'LineWidth', 2);
xlabel('Distance (m)');
ylabel('SNR (dB)');
title('SNR vs Distance for Sidelink Communication');
grid on;


