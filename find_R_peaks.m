function [time_occurs, R_peak_values] = find_R_peaks(ecg, Fs, threshold)
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
        wave = zeros(1,10000);
        k = k + 1;
        
        i = i + j;
    end
    i = i + 1;
    
end
time_occurs = time_occurs.*(1/Fs);

end