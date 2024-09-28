% SNR Verification for Frequency-Domain Channel Modeling

% Specify the desired SNR in dB.
SNRdB = 0;
rng("default") % Enable reproducible simulation results (난수 생성)


% Set the number of transmit and receive antennas. 
% Because no channel exists, assume that the number of transmit and receive antennas is the same.
nTxAnts = 2;
nRxAnts = nTxAnts;

% Configure the carrier and extract the OFDM information.
carrier = nrCarrierConfig;
ofdmInfo = nrOFDMInfo(carrier);


% Convert the SNR to power.
SNR = 10.^SNRdB/10;


% Using the equation derived above, 
% generate noise in the frequency domain and measure its power.
N0freq = 1/sqrt(nRxAnts*SNR);
noiseGridFreq = zeros(size(pdschGrid),'like',1i);

% Resource grid for noise generated in the frequency domain
noiseGridFreq(:) = N0freq*randn(size(noiseGridFreq),'like',1i);     

% Power of noise added in the frequency domain 
noisePowerFreq = rms(noiseGridFreq(:)).^2;                         



% Generate noise in the time-domain, and measure the power after OFDM modulation.

 % This is only necessary when for obtaining the correct signal sizes (with CPs, etc...)
grid = nrResourceGrid(carrier);
waveform = nrOFDMModulate(carrier,grid);                           

N0time = 1/sqrt(nRxAnts*ofdmInfo.Nfft*SNR);
noise = N0time*randn([size(waveform,1) nRxAnts],'like',1i);

% Resource grid for noise generated in the time domain
noiseGridTime = nrOFDMDemodulate(carrier,noise);                   

% Power of noise added in the time domain
noisePowerTime = rms(noiseGridTime(:)).^2;                       



% The generated noise power in the frequency domain is similar to the generated noise power in the time domain. 
% These values represent the noise power that is needed to achieve the specified SNR.
for x = 1
    disp("Frequency-domain channel modeling noise power: "+noisePowerFreq)
    disp("Time-domain channel modeling noise power: "+noisePowerTime)
end