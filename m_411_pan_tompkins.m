clear all;
close all;
clc;


%% Load Signals
load('ecg_normal_1.mat');
fs1 = Fs;
ecg1 = ecg;

tmin = 1;
tmax = 5;

ecg1_4sec = ecg1(tmin*fs1:tmax*fs1-1);
t_axis = tmin:1/fs1:tmax-(1/fs1);

%% Load Filters

load('h1.mat');
den1 = h1Den;
num1 = h1Num;

load('h2.mat');
den2 = h2Den;
num2 = h2Num;

%% Plot frequency reponse of h1 h2 and its corresponding band-pass
figure
freqz(num1, den1, 256, 1024);
title('low-pass filter frequency reponse');


figure
freqz(num2, den2, 256, 1024);
title('high-pass filter frequency response');

figure
freqz(conv(num1, num2), conv(den1, den2), 256, 1024);
title('resulting band-pass filter frequency response');

%% a) ECG filtering
figure
plot(t_axis, ecg1_4sec);
title('ECG Normal 1');
xlabel('time (s)');
ylabel('Voltage (microV)');

figure
plot(t_axis, fftshift(abs(fft(ecg1_4sec))));
title('Frequecy Spectrum of ECG Normal');
xlabel('time (s)');
ylabel('Voltage (microV)');

ecg1_filtered1 = filter(num1, den1, ecg1_4sec);

figure
plot(t_axis, ecg1_filtered1);
title('ECG Normal 1 after filtered by low-pass filter');
xlabel('time (s)');
ylabel('Voltage (microV)');

figure
plot(t_axis, fftshift(abs(fft(ecg1_filtered1))));
title('Frequecy Spectrum of ECG Normal 1 after filtered by low-pass filter');
xlabel('time (s)');
ylabel('Voltage (microV)');

ecg1_filtered2 = filter(num2, den2, ecg1_filtered1);

figure
plot(t_axis, ecg1_filtered2);
title('ECG Normal 1 after filtered by band-pass filter');
xlabel('time (s)');
ylabel('Voltage (microV)');

figure
plot(t_axis, fftshift(abs(fft(ecg1_filtered2))));
title('Frequecy Spectrum of ECG Normal 1 after filtered by band-pass filter');
xlabel('time (s)');
ylabel('Voltage (microV)');

%% b) differentiation filter

b = [1 2 0 -2 -1];
a = [1];
a = a*8*(1/fs1);
freqz(b,a, 256, 1024);
title('derivative filter frequency response');

ecg1_filtered3 = filter(b, a, ecg1_filtered2);

figure
plot(t_axis, ecg1_filtered3);
title('ECG Normal 1 after filtered by derivative filter');
xlabel('time (s)');
ylabel('Voltage (microV)');

figure
plot(t_axis, fftshift(abs(fft(ecg1_filtered3))));
title('Frequecy Spectrum of ECG Normal 1 after filtered by derivative filter');
xlabel('time (s)');
ylabel('Voltage (microV)');

%% c) Signal squared

ecg1_filtered4 = abs(ecg1_filtered3).^2;

figure
plot(t_axis, ecg1_filtered4);
title('ECG Normal 1 after being squared');
xlabel('time (s)');
ylabel('microV^2');

%% d) Window proposal

N = window_determination(ecg1_filtered4, 1*10^13);

%% e) Threshold proposal and temporal determination

threshold = 1*10^3; %aproximatively proposed according to the graph of ecg1_filtered4

[temporal_locations, max_values] = find_local_max(ecg1_filtered4, fs1, threshold, tmin);