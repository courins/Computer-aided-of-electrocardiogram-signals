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
fvtool(num1,den1,'Fs',200); %display filter's informations

load('h2.mat');
den2 = h2Den;
num2 = h2Num;
fvtool(num2,den2,'Fs',200); %display filter's informations

%% Plot frequency reponse of h1 h2 and its corresponding band-pass
figure
freqz(num1, den1, 256, 1024);
title('low-pass filter frequency reponse');


figure
freqz(num2, den2, 256, 1024);
title('high-pass filter frequency response');

figure
num3=conv(num1, num2);
den3=conv(den1, den2);
freqz(num3, den3, 256, 1024);
title('resulting band-pass filter frequency response');
fvtool(num3,den3,'Fs',200) ;%display filter's informations

%% a) ECG filtering
figure
plot(t_axis, ecg1_4sec);
title('ECG Normal 1');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis, fftshift(abs(fft(ecg1_4sec))));
title('Frequecy Spectrum of ECG Normal');
xlabel('time (s)');
ylabel('Amplitude');

ecg1_filtered1 = filter(num1, den1, ecg1_4sec);

figure
plot(t_axis, ecg1_filtered1);
title('ECG Normal 1 after filtered by low-pass filter');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis, fftshift(abs(fft(ecg1_filtered1))));
title('Frequecy Spectrum of ECG Normal 1 after filtered by low-pass filter');
xlabel('time (s)');
ylabel('Amplitude');

ecg1_filtered2 = filter(num2, den2, ecg1_filtered1);

figure
plot(t_axis, ecg1_filtered2);
title('ECG Normal 1 after filtered by band-pass filter');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis, fftshift(abs(fft(ecg1_filtered2))));
title('Frequecy Spectrum of ECG Normal 1 after filtered by band-pass filter');
xlabel('time (s)');
ylabel('Amplitude');

%% b) differentiation filter

b = [1 2 0 -2 -1];
a = [1];
a = a*8*(1/fs1);
freqz(b,a, 256, 1024);
fvtool(b,a,'Fs',200); %display filter's informations
title('derivative filter frequency response');

ecg1_filtered3 = filter(b, a, ecg1_filtered2);

figure
plot(t_axis, ecg1_filtered3);
title('ECG Normal 1 after filtered by derivative filter');
xlabel('time (s)');
ylabel('Voltage ');

figure
plot(t_axis, fftshift(abs(fft(ecg1_filtered3))));
title('Frequecy Spectrum of ECG Normal 1 after filtered by derivative filter');
xlabel('time (s)');
ylabel('Amplitude');

%% c) Signal squared

ecg1_filtered4 = abs(ecg1_filtered3).^2;

figure
plot(t_axis, ecg1_filtered4);
title('ECG Normal 1 after being squared');
xlabel('time (s)');
ylabel('Voltage');

%% d) Window proposal

N = window_determination(ecg1_filtered4, 1*10^13);
door=(1/N)*ones(1,N);
smwi=conv(ecg1_filtered4,door);
figure;
plot(smwi);
title('ECG Normal 1 after integration step');
xlabel('time (s)');
ylabel('Voltage');



%% e) Threshold proposal and temporal determination

threshold = 1*10^13; %aproximatively proposed according to the graph of ecg1_filtered4


%% f) Maximas' Detection

list=temporal_location(smwi,threshold); % return a array of samples intervals

delay= 1; 

max_list=pan_tompkins(ecg1_filtered2,list,delay); % find the max (r peaks) into the sample intervals

figure();
plot(ecg1_filtered2);
hold on
plot(max_list(1,:),max_list(2,:),'og');
title('Pan & Tompkins detection');
xlabel('sample');
ylabel('Voltage');
