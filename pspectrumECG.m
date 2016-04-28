function[ecg_s, t_s] = pspectrumECG(ecg, Fs,n)

tfy = fft(ecg(1:n));
ecg_s=fftshift(abs(tfy));
x=linspace(-.5,(.5-1/n),n);
t_s=x*Fs;
end


