clear all;
close all; 
clc;

%Load signals
load('ecg_normal_1.mat');
fs1 = Fs;
ecg1 = ecg;

load('ecg_normal_2.mat');
fs2 = Fs;
ecg2 = ecg;

load('ecg_normal_3.mat');

fs3 = Fs;
ecg3 = ecg;



%% First ECG of normal patient
%matrix construction
[fft1, t_axis1, f_axis1] = spectrogramme(ecg1(1:10000), fs1, 8, 0.8);

figure;
imagesc(t_axis1, f_axis1*60, fft1);
ylim([0 250]);
title('Spectrogram ECG Normal 1');
xlabel('time (s)');
ylabel('bpm');

%% Second ECG of normal patient
%matrix construction
[fft2, t_axis2, f_axis2] = spectrogramme(ecg2(1:10000), fs2, 8, 0.8);

figure;
imagesc(t_axis2, f_axis2*60, fft2);
ylim([0 250]);
title('Spectrogram ECG Normal 2');
xlabel('time (s)');
ylabel('bpm');

%% Third ECG of normal patient
%matrix construction
[fft3, t_axis3, f_axis3] = spectrogramme(ecg3(1:10000), fs3, 8, 0.8);

figure;
imagesc(t_axis3, f_axis3*60, fft3);
ylim([0 250]);
title('Spectrogram ECG Normal 3');
xlabel('time (s)');
ylabel('bpm');
