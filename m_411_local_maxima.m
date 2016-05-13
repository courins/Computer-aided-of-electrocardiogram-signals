clear all;
close all;
clc;


%% Load signals
load('ecg_normal_1.mat');
fs1 = Fs;
ecg1 = ecg;

%% R wave detection

ecg1_cube = ecg1.^3;

ecg1_4sec = ecg1_cube(1:800);
t_axis = 0:1:799;

plot(t_axis/fs1, ecg1_4sec);

% determine a threshold
mean_R_peak_16 = zeros(1,16);

for i=1:16
    ecg1_1sec = ecg1_4sec(((i-1)*50 + 1):i*50);
    if max(ecg1_1sec) > 0.5*10^7;
        mean_R_peak_16(i) = max(ecg1_1sec);
    end
end

mean_R_peak = (mean_R_peak_16(find(mean_R_peak_16)));
threshold = mean(mean_R_peak)/1.5;



[t, R] = find_R_peaks(ecg1_4sec, fs1, threshold);