clear all;
close all;
clc;


%% Load signals
load('ecg_normal_1.mat');
fs1 = Fs;
ecg1 = ecg;

load('ecg_normal_2.mat');
fs2 = Fs;
ecg2 = ecg;

load('ecg_normal_3.mat');
fs3 = Fs;
ecg3 = ecg;

%% R wave detection
tmin = 1; %Time at which you want the ecg to start
tmax = 5; %Time at which you want the ecg to finish

ecg1_diff = diff(ecg1);
ecg2_diff = diff(ecg2);
ecg3_diff = diff(ecg3);

ecg1_4sec = ecg1_diff(tmin*fs1:tmax*fs1-1);
ecg2_4sec = ecg2_diff(tmin*fs2:tmax*fs2-1);
ecg3_4sec = ecg3_diff(tmin*fs3:tmax*fs3-1);
t_axis1 = tmin:1/fs1:tmax-(1/fs1);
t_axis2 = tmin:1/fs2:tmax-(1/fs2);
t_axis3 = tmin:1/fs3:tmax-(1/fs3);

% plot(ecg1_4sec)

% determine a threshold
%ECG normal 1 : determine a threshold
mean_R_peak = zeros(1,16);

for i=1:16
    ecg1_pieces = ecg1_4sec(((i-1)*50 + 1):i*50);
    if max(ecg1_pieces) > 100;
        mean_R_peak(i) = max(ecg1_pieces);
    end
end

mean_R_peak = (mean_R_peak(find(mean_R_peak)));
threshold1 = mean(mean_R_peak)/2.5;


% %ECG normal 2 : determine a threshold
mean_R_peak = zeros(1,16);

for i=1:16
    ecg2_pieces = ecg2_4sec(((i-1)*50 + 1):i*50);
    if max(ecg2_pieces) > 100;
        mean_R_peak(i) = max(ecg2_pieces);
    end
end

mean_R_peak = (mean_R_peak(find(mean_R_peak)));
threshold2 = mean(mean_R_peak)/2.5;


% %ECG normal 3 : determine a threshold
mean_R_peak = zeros(1,16);

for i=1:16
    ecg3_pieces = ecg3_4sec(((i-1)*50 + 1):i*50);
    if max(ecg3_pieces) > 100;
        mean_R_peak(i) = max(ecg3_pieces);
    end
end

mean_R_peak = (mean_R_peak(find(mean_R_peak)));
threshold3 = mean(mean_R_peak)/1.5;


%determine local minimas

[t_min1] = find_local_min(ecg1_4sec, -threshold1);
[t_min2] = find_local_min(ecg2_4sec, -threshold2);
[t_min3] = find_local_min(ecg3_4sec, -threshold3);

%determine local maximas

[t_max1] = find_local_max(ecg1_4sec, threshold1);
[t_max2] = find_local_max(ecg2_4sec, threshold2);
[t_max3] = find_local_max(ecg3_4sec, threshold3);

%determine the time when the R peak occurs

[zero_occurs1] = find_zero(ecg1_4sec, t_min1, t_max1);
[zero_occurs2] = find_zero(ecg2_4sec, t_min2, t_max2); 
[zero_occurs3] = find_zero(ecg3_4sec, t_min3, t_max3); 

% Plot ECG with the R peaks in red
ecg1 = ecg1(tmin*fs1:tmax*fs1-1);
ecg2 = ecg2(tmin*fs2:tmax*fs2-1);
ecg3 = ecg3(tmin*fs3:tmax*fs3-1);

figure
plot(t_axis1, ecg1);
hold on
plot(zero_occurs1*(1/fs1) + tmin - 1/fs1, ecg1(zero_occurs1), 'or')
hold off
title('ECG Normal 1');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis2, ecg2);
hold on
plot(zero_occurs2*(1/fs2) + tmin - 1/fs2, ecg2(zero_occurs2), 'or')
hold off
title('ECG Normal 2');
xlabel('time (s)');
ylabel('Voltage (mV)');

figure
plot(t_axis3, ecg3);
hold on
plot(zero_occurs3*(1/fs3) + tmin - 1/fs3, ecg3(zero_occurs3), 'or')
hold off
title('ECG Normal 3');
xlabel('time (s)');
ylabel('Voltage (mV)');



