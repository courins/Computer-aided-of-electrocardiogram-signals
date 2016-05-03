clear all;
close all; 
clc;

%Load signals
load('ecg_AF.mat');
fs1 = Fs;
ecg1 = ecg;

load('ecg_VF.mat');
fs2 = Fs;
ecg2 = ecg;

load('ecg_SSS.mat');
fs3 = Fs;
ecg3 = ecg;

load('ecg_PVC.mat');
fs4 = Fs;
ecg4 = ecg;

%matrix construction
%[spec] = spectrogramme(ecg1, 1, 0, fs1)

ecg=ecg1;
Fs=fs1;
N=0.2;
Ne = length(ecg(1:N*Fs));
mv = floor(length(ecg)/Ne) + 1;
spec = zeros(mv , Ne+1);

test=fftshift(abs(fft(ecg((1-1)*Ne + 1:1*Ne + 1))).^2);

for i=1:(mv-2)
    spec(i,:) = fftshift(abs(fft(ecg((i-1)*Ne + 1:i*Ne + 1))).^2);
end

