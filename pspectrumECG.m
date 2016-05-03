function[ecg_s, f_s] = pspectrumECG(ecg, Fs,N)
% give points to plot power spectrum
tfy = fft(ecg, N);
ecg_s=fftshift(abs(tfy).^2);
x=linspace(-.5,(.5-1/N),N);
f_s=x*Fs;
end


