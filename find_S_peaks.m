function [time_occurs, S_peak_values] = find_S_peaks(ecg, Fs, R_locations, tmin)

%Input :
%Find S peaks for a given ecg
%R_locations give the time occurence of the R peak
%Fs : frequency of sampling
%tmin : at what time the ecg given starts

%Output :
%time_occurs is a vector which contains the time at which the S peaks
%occur
%S_peak_values is a vector which contains the values of the different S
%peaks

S_peak_values = zeros(1, length(R_locations));
time_occurs = zeros(1, length(R_locations));

for i=1:length(R_locations)
    j = 1;
    time_occurs(i) = R_locations(i) - floor(tmin*Fs);
    S_peak_values(i) = ecg(time_occurs(i));
    while (S_peak_values(i) > ecg(time_occurs(i)+j)) && (time_occurs(i)+j < length(ecg))
        S_peak_values(i) = ecg(time_occurs(i)+j);
        j = j + 1;
    end
    S_peak_values(i) = ecg(time_occurs(i)+j);
    time_occurs(i) = time_occurs(i) + j + tmin*Fs - 1;
end

end