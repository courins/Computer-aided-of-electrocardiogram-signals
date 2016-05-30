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
[tR1, R1] = find_R_peaks(ecg1_4sec, fs1, threshold1, tmin);
[tR2, R2] = find_R_peaks(ecg2_4sec, fs2, threshold2, tmin);
[tR3, R3] = find_R_peaks(ecg3_4sec, fs3, threshold3, tmin);

%Computation of Q peak values and the time at wich they occur.
[tQ1, Q1] = find_Q_peaks(ecg1_4sec, fs1, tR1, tmin);
[tQ2, Q2] = find_Q_peaks(ecg2_4sec, fs2, tR2, tmin);
[tQ3, Q3] = find_Q_peaks(ecg3_4sec, fs3, tR3, tmin);

% Computation of S peak values and the time at wich they occur.
[tS1, S1] = find_S_peaks(ecg1_4sec, fs1, tR1, tmin);
[tS2, S2] = find_S_peaks(ecg2_4sec, fs2, tR2, tmin);
[tS3, S3] = find_S_peaks(ecg3_4sec, fs3, tR3, tmin);

% Plot ECG with the R peaks in red
figure
plot(t_axis1, nthroot(ecg1_4sec, 3));
hold on
plot(tR1/fs1-tmin/fs1, nthroot(ecg1_4sec(tR1-tmin*fs1), 3), 'or');
plot(tQ1/fs1-tmin/fs1, nthroot(ecg1_4sec(tQ1-tmin*fs1), 3), 'or');
plot(tS1/fs1-tmin/fs1, nthroot(ecg1_4sec(tS1-tmin*fs1), 3), 'or');
hold off
title('ECG Normal 1 with QRS complex in red');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis2, nthroot(ecg2_4sec, 3));
hold on
plot(tR2/fs2-tmin/fs2, nthroot(ecg2_4sec(tR2-tmin*fs2), 3), 'or');
plot(tQ2/fs2-tmin/fs2, nthroot(ecg2_4sec(tQ2-tmin*fs2), 3), 'or');
plot(tS2/fs2-tmin/fs2, nthroot(ecg2_4sec(tS2-tmin*fs2), 3), 'or');
hold off
title('ECG Normal 2 with QRS complex in red');
xlabel('time (s)');
ylabel('Voltage');

figure
plot(t_axis3, nthroot(ecg3_4sec,3));
hold on
plot(tR3/fs3-tmin/fs3, nthroot(ecg3_4sec(tR3-tmin*fs3), 3), 'or');
plot(tQ3/fs3-tmin/fs3, nthroot(ecg3_4sec(tQ3-tmin*fs3), 3), 'or');
plot(tS3/fs3-tmin/fs3, nthroot(ecg3_4sec(tS3-tmin*fs3), 3), 'or');
hold off
title('ECG Normal 3 with QRS complex in red');
xlabel('time (s)');
ylabel('Voltage');