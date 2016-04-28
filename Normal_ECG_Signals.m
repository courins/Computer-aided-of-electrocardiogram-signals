clear all;
close all;
clc;

%%

% display signal 1
load('ecg_normal_1.mat');
fs1 = Fs;
ecg1 = ecg;

load('ecg_normal_2.mat');
fs2 = Fs;
ecg2 = ecg;

load('ecg_normal_3.mat');
fs3 = Fs;
ecg3 = ecg;

subplot(1,3,1);
plot(ecg1);
xlabel('time');
ylabel('ecg signal');
title('normal ecg1');

subplot(1,3,2);
plot(ecg2);
xlabel('time');
ylabel('ecg signal');
title('normal ecg2');

subplot(1,3,3);
plot(ecg3);
xlabel('time');
ylabel('ecg signal');
title('normal ecg3');


% display signals on 4 seconds
tmin = 1;
tmax = 5;
[ecg_w1, t_w1] =  windowECG(ecg1, fs1, tmin, tmax);
[ecg_w2, t_w2] =  windowECG(ecg2, fs2, tmin, tmax);
[ecg_w3, t_w3] =  windowECG(ecg2, fs3, tmin, tmax);

figure;
subplot(1,3,1);
plot(t_w1, ecg_w1);
xlabel('time');
ylabel('ecg signal');
title('normal ecg 1');

subplot(1,3,2);
plot(t_w2, ecg_w2);
xlabel('time');
ylabel('ecg signal');
title('normal ecg 2');

subplot(1,3,3);
plot(t_w3, ecg_w3);
xlabel('time');
ylabel('ecg signal');
title('normal ecg 3');


