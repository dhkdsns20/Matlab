% SNR Verification for Time-Domain Channel Modeling
% Specify the desired SNR in dB.
SNRdB = 0;
rng("default") % Enable reproducible simulation results (난수 생성)




% Set the number of transmit and receive antennas. 
% Because no channel exists, assume that the number of transmit and receive antennas is the same.
nTxAnts = 2;
nRxAnts = nTxAnts;



% Specify the carrier parameters.
carrier = nrCarrierConfig;
carrier.NSizeGrid = 52;                     % Grid size in resource blocks
carrier.SubcarrierSpacing = 15;             % Subcarrier spacing

waveformInfo = nrOFDMInfo(carrier);         % Waveform information

pdsch = nrPDSCHConfig;
pdsch.Modulation = "16QAM";
pdsch.PRBSet = 0:(carrier.NSizeGrid-1);     % PDSCH allocation



% Create a norm-one precoding vector that is normalized by the number of layers.
w = (1/sqrt(pdsch.NumLayers))*ones(pdsch.NumLayers,nTxAnts)




% To achieve the desired SNR, calculate the noise scaling factor: 
SNR = 10^(SNRdB/10);
N0time = 1/sqrt(nRxAnts*double(waveformInfo.Nfft)*SNR);




% Generate precoded PDSCH symbols.
[pdschIndices,pdschInfo] = nrPDSCHIndices(carrier,pdsch);
pdschBits = randi([0 1],pdschInfo.G,1);
pdschSymbols = nrPDSCH(carrier,pdsch,pdschBits);
pdschSymbolsPrecoded = pdschSymbols*w;




% Create a resource grid and map the precoded PDSCH symbols to the resource grid.
pdschGrid = nrResourceGrid(carrier,nTxAnts);
[~,pdschAntIndices] = nrExtractResources(pdschIndices,pdschGrid);
pdschGrid(pdschAntIndices) = pdschSymbolsPrecoded;



% OFDM-modulate the grid.
txWaveform = nrOFDMModulate(carrier,pdschGrid);




% assume no channel exists. Because the SNR definition assumes that
% X^2_RMS = 1/N_RX
% normalize the received signal by the number of receive antennas.
rxWaveform = txWaveform/sqrt(nRxAnts);




% Generate AWGN.
rxNoise = N0time*randn(size(rxWaveform),"like",rxWaveform);





% OFDM-demodulate the received signal (without noise), 
% and extract the PDSCH symbols from the received grid to calculate S_RE

% OFDM demodulation
rxSignalGrid = nrOFDMDemodulate(carrier,rxWaveform);

% PDSCH symbols extraction
rxPDSCHSymbols = rxSignalGrid(pdschAntIndices);





% Measure the received signal power per RE, S_RE
% and the noise power per RE, N_RE
% Verify that the measured SNR values approximate the specified SNR parameter.
Sre = (1/waveformInfo.Nfft.^2)*rms(rxPDSCHSymbols).^2;
Nre = (1/waveformInfo.Nfft)*rms(rxNoise).^2;
for n=1:nRxAnts
    disp("Received signal power per RE antenna " + string(n) + " = " + string(pow2db(Sre(n))+30) + " dBm");
    disp("Received noise power per RE antenna " + string(n) + " = " + string(pow2db(Nre(n))+30) + " dBm");
    disp("SNR (antenna " + string(n) + ") = " + string(pow2db(Sre(n)/Nre(n))) + " dB");
end