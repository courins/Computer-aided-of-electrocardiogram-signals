clear all;
close all; 
clc;

%Load signals
load('ecg_AF.mat');
fs1 = Fs;
ecg1 = ecg;

load('ecg_VF.mat');
fs2 = Fs;
ecg2 = ecg;

load('ecg_SSS.mat');
fs3 = Fs;
ecg3 = ecg;

load('ecg_PVC.mat');
fs4 = Fs;
ecg4 = ecg;


%% ECG of atrial fibrilation patient
%matrix construction
[fft1, t_axis1, f_axis1] = spectrogramme(ecg1(1:10000), fs1, 8, 0.8);

figure;
imagesc(t_axis1, f_axis1*60, fft1);
ylim([0 250]);
title('Spectrogram atrial fibrilation ');
xlabel('time (s)');
ylabel('bpm');

%% ECG of ventricular fibrilation patient
%matrix construction
[fft2, t_axis2, f_axis2] = spectrogramme(ecg2(1:10000), fs2, 8, 0.8);

figure;
imagesc(t_axis2, f_axis2*60, fft2);
ylim([0 250]);
title('Spectrogram ventricular fibrilation');
xlabel('time (s)');
ylabel('bpm');


%% ECG of sick sinus syndrome patient
%matrix construction
[fft3, t_axis3, f_axis3] = spectrogramme(ecg3(1:10000), fs3, 8, 0.8);

figure;
imagesc(t_axis3, f_axis3*60, fft3);
ylim([0 250]);
title('Spectrogram sick sinus syndrome');
xlabel('time (s)');
ylabel('bpm');


%% ECG of premature ventricular contraction patient
%matrix construction
[fft4, t_axis4, f_axis4] = spectrogramme(ecg1(1:10000), fs4, 8, 0.8);

figure;
imagesc(t_axis4, f_axis4*60, fft4);
ylim([0 250]);
title('Spectrogram premature ventricular contraction');
xlabel('time (s)');
ylabel('bpm');
