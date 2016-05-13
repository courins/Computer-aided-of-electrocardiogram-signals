function [freq_amplitude, t_axis, f_axis ] = spectrogramme(ecg, Fs, time, poverlap)
window_size = time*Fs;
noverlap = window_size*poverlap;
T = (length(ecg) - noverlap)/(window_size-noverlap);

N_sample = 2^(nextpow2(window_size)+10); 

for i=0:T-1
    w_min = i*floor(window_size-noverlap)+1; 
    w_max = i*floor(window_size-noverlap)+window_size + 1;
    
    ecg_w = ecg(w_min:w_max);
    freq_amplitude(:, i+1) = fftshift(abs(fft(ecg_w, N_sample)).^2);
end

t_axis = ((0:1:T-1)/Fs)*(window_size-noverlap);
f_axis = linspace(-Fs/2, (Fs/2)-Fs/N_sample, N_sample);
freq_amplitude = (10*log10(freq_amplitude));

end

