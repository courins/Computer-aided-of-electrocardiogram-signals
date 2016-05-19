function [time_occurs] = find_zero(ecg_diff, t_occur_min, t_occur_max)

%Input :
% ecg : derivation of ecg
% Fs : frequency of samples
% t_occur_min : time when the wave finishes
% t_occur_max : time when the wave starts
% tmin : time when the ecg starts

%Ouput :
% time_occurs : time when the R peak occurs

k = 1;
i = 1;
j = 1;
time_occurs = zeros(1,20);
while i<=max(length(t_occur_max),length(t_occur_min))
    ecg_tmp = ecg_diff(t_occur_max(i):t_occur_min(i));
    while j <= length(ecg_tmp)
        if ecg_tmp(j) < 0
            time_occurs(k) = t_occur_max(i) + (j-1) - 1;
            k = k + 1;
            break;
        end
        j = j + 1;
    end
    i = i + 1;
end
time_occurs = time_occurs(find(time_occurs));
end


