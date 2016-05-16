function [time_occurs] = find_zero(ecg, Fs, t_occur_min, t_occur_max, tmin)

%Input :
% ecg : derivation of ecg
% Fs : frequency of samples
% t_occur_min : time when the wave finishes
% t_occur_max : time when the wave starts
% tmin : time when the ecg starts

%Ouput :
% time_occurs : time when the R peak occurs

k = 1;

for i=1:length(t_occur_min)
    ecg_tmp = ecg(floor((t_occur_max(i)-tmin)*Fs) + 1:floor((t_occur_min(i)-tmin)*Fs) + 1);
    zero = ecg_tmp(1);
    for j=1:length(ecg_tmp)
        if abs(ecg_tmp(j)) < abs(zero)
        zero = ecg_tmp(j);
        zero_occur = j;
        end
    end
    
    time_occurs(k) = t_occur_max(i) + zero_occur*(1/Fs);
    k = k + 1;
end


