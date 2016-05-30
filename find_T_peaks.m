function [time_occurs, T_peak_values] = find_T_peaks(ecg, Fs, S_locations, Q_locations, tmin)

%Input :
%Find T peaks for a given ecg
%S_locations give the time occurence of the S peak
%Q_locations give the time occurence of the Q peak
%Fs : frequency of sampling
%tmin : at what time the ecg given starts

%Output :
%time_occurs is a vector which contains the time at which the Q peaks
%occur
%T_peak_values is a vector which contains the values of the different T
%peaks

T_peak_values = zeros(1, length(S_locations)-1);
time_occurs = zeros(1, length(S_locations)-1);

for i=1:length(S_locations)-1
    ecg_tmp = ecg(S_locations(i)-tmin*Fs:Q_locations((i+1))-tmin*Fs);
    ecg_tmp2 = ecg_tmp(1:floor(length(ecg_tmp)*0.7));
    [T_peak_values(i), time_occurs(i)] = max(ecg_tmp2);
    time_occurs(i) = time_occurs(i) + S_locations(i) - 1;
end


end