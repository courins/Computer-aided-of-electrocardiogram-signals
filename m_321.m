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

%Constant
tmin = 1;
tmax = 6;


%ECG power spectrum computation

[ecg_w1, t_w1] = windowECG(ecg1, Fs, tmin, tmax);
[ecg_w2, t_w2] = windowECG(ecg2, Fs, tmin, tmax);
[ecg_w3, t_w3] = windowECG(ecg3, Fs, tmin, tmax);

N = nextpow2(length(ecg_w1))+10;


[psp1,f_w1]=pspectrumECG(ecg_w1,fs1,2^N);
[psp2,f_w2]=pspectrumECG(ecg_w2,fs2,2^N);
[psp3,f_w3]=pspectrumECG(ecg_w3,fs3,2^N);


% % Display ECG power spectrum between 0-150 bpm
figure;
semilogy(f_w1*60,psp1);
xlim([0, 150]);
grid on;
title('Normal1 freq spectrum')
xlabel('Beats per minutes (bpm)')
ylabel('Amplitude')

figure;
semilogy(f_w2*60,psp2);
xlim([0, 150]);
grid on;
title('Normal2 freq spectrum')
xlabel('Beats per minutes (bpm)')
ylabel('Amplitude')

figure;
semilogy(f_w3*60,psp3);
xlim([0, 150]);
grid on;
title('Normal3 freq spectrum')
xlabel('Beats per minutes (bpm)')
ylabel('Amplitude')


