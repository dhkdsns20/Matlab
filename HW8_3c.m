% (c) Compare the approaches with average execution time
clear; clc;

% Define x[n] as a uniformly distributed random sequence
N = 1e6; % Length of x[n]
x = 2 * rand(1, N) - 1; % Random numbers in [-1, 1]

% Define h[n]
h = cos(0.4 * pi * (0:15));

% Method (a): Using conv
num_trials = 100; % Number of trials for averaging
start_time_conv = cputime;
for i = 1:num_trials
    y_conv = conv(x, h, 'full');
end
end_time_conv = cputime;
time_conv = (end_time_conv - start_time_conv) / num_trials;

% Method (b): Using Overlap-and-Save with FFT sizes
fft_sizes = [1024, 2048, 4096];
execution_times_fft = zeros(1, length(fft_sizes));
y_fft_results = cell(1, length(fft_sizes));

for i = 1:length(fft_sizes)
    fft_size = fft_sizes(i);
    start_time_fft = cputime;
    for j = 1:num_trials
        y_fft = hsolpsav(x, h, fft_size);
    end
    end_time_fft = cputime;
    execution_times_fft(i) = (end_time_fft - start_time_fft) / num_trials;
    y_fft_results{i} = y_fft;
end

% Display execution times
disp(['Average execution time for conv: ', num2str(time_conv), ' seconds']);
for i = 1:length(fft_sizes)
    disp(['Average execution time for FFT size ', num2str(fft_sizes(i)), ': ', num2str(execution_times_fft(i)), ' seconds']);
end
