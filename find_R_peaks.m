function [time_occurs, R_peak_values] = find_R_peaks(ecg, Fs, threshold, tmin)

%Input :
%Find R peaks for a given ecg
%Threshold defines if it is wether or not you consider the peak as an R
%peak.
%Fs : frequency of sampling
%tmin : at what time the ecg given starts

%Output :
%time_occurs is a vector which contains the time at which the R peaks
%occur
%R_peak_values is a vector which contains the values of the different R
%peaks

R_waves = ecg > threshold;
R_waves = R_waves.*ecg;

wave = zeros(1,10000);
k = 1;
i = 1;
while i<length(ecg)
    if R_waves(i) ~= 0
        j = 1;
        while R_waves(i+(j-1)) ~= 0 && (i+(j-1)) < length(ecg)
            wave(j) = R_waves(i+(j-1));
            j = j + 1; 
        end
        [R_peak_values(k), time_occurs(k)] = max(wave); % max(ecg([i:j]))
        time_occurs(k) = time_occurs(k) + i;
        wave = zeros(1,10000);
        k = k + 1;
        
        i = i + j;
    end
    i = i + 1;
    
end

time_occurs = tmin*Fs + time_occurs - 1;

end