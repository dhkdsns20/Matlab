% (b) Overlap-and-Save method
clear; clc;

% Define x[n] as a uniformly distributed random sequence
N = 1e6; % Length of x[n]
x = 2 * rand(1, N) - 1; % Random numbers in [-1, 1]

% Define h[n]
h = cos(0.4 * pi * (0:15));

% FFT sizes to test
fft_sizes = [1024, 2048, 4096];
y_fft_results = cell(1, length(fft_sizes));

for i = 1:length(fft_sizes)
    fft_size = fft_sizes(i);
    y_fft = hsolpsav(x, h, fft_size); % Use the hsolpsav function for overlap-and-save
    y_fft_results{i} = y_fft;
end
