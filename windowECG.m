function[ecg_w, t_w] = windowECG(ecg, Fs, tmin, tmax)
% role : select an ecg between tmin and tmax
% input : ecg :
%         Fs :
%         tmin :
%         tmax :

% output : ecg_w :
%          t_w :

t_w = (tmin:1/Fs:tmax);
ecg_w = ecg(floor(t_w*Fs) + 1);

end