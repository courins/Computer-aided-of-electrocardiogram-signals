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
tmin = 1;
tmax = 5;

ecg1_cube = ecg1.^3;
ecg2_cube = ecg2.^3;
ecg3_cube = ecg3.^3;

ecg1_4sec = ecg1_cube(tmin*fs1:tmax*fs1-1);
ecg2_4sec = ecg2_cube(tmin*fs2:tmax*fs2-1);
ecg3_4sec = ecg3_cube(tmin*fs3:tmax*fs3-1);
t_axis1 = tmin:1/fs1:tmax-(1/fs1);
t_axis2 = tmin:1/fs2:tmax-(1/fs2);
t_axis3 = tmin:1/fs3:tmax-(1/fs3);

% determine a threshold
%ECG normal 1 : determine a threshold
mean_R_peak = zeros(1,16);

for i=1:16
    ecg1_pieces = ecg1_4sec(((i-1)*50 + 1):i*50);
    if max(ecg1_pieces) > 0.5*10^7;
        mean_R_peak(i) = max(ecg1_pieces);
    end
end

mean_R_peak = (mean_R_peak(find(mean_R_peak)));
threshold1 = mean(mean_R_peak)/1.5;


%ECG normal 2 : determine a threshold
mean_R_peak = zeros(1,16);

for i=1:16
    ecg2_pieces = ecg2_4sec(((i-1)*50 + 1):i*50);
    if max(ecg2_pieces) > 0.5*10^7;
        mean_R_peak(i) = max(ecg2_pieces);
    end
end

mean_R_peak = (mean_R_peak(find(mean_R_peak)));
threshold2 = mean(mean_R_peak)/1.5;


%ECG normal 3 : determine a threshold
mean_R_peak = zeros(1,16);

for i=1:16
    ecg3_pieces = ecg3_4sec(((i-1)*50 + 1):i*50);
    if max(ecg3_pieces) > 0.5*10^7;
        mean_R_peak(i) = max(ecg3_pieces);
    end
end

mean_R_peak = (mean_R_peak(find(mean_R_peak)));
threshold3 = mean(mean_R_peak)/1.5;


%Computation of R peak values and the time at which they occur.
[t1, R1] = find_R_peaks(ecg1_4sec, fs1, threshold1, tmin);
[t2, R2] = find_R_peaks(ecg2_4sec, fs2, threshold2, tmin);
[t3, R3] = find_R_peaks(ecg3_4sec, fs3, threshold3, tmin);


% Plot ECG with the R peaks in red
figure
plot(t_axis1, nthroot(ecg1_4sec, 3));
hold on
plot(t1, nthroot(R1,3), 'or');
hold off
title('ECG Normal 1 with R peaks in red');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis2, nthroot(ecg2_4sec, 3));
hold on
plot(t2, nthroot(R2,3), 'or');
hold off
title('ECG Normal 2 with R peaks in red');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis3, nthroot(ecg3_4sec,3));
hold on
plot(t3, nthroot(R3,3), 'or');
hold off
title('ECG Normal 3 with R peaks in red');
xlabel('time (s)');
ylabel('Voltage');

