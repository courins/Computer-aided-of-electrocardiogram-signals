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

Fs=fs1;
N=2;
Ne = N*Fs;
x = ecg1;
r=floor(length(ecg1)/Ne);
z = reshape(x, r, []);
size_t=length(z(1,:));
size_fft=length(z);
y=zeros(size_fft,size_t);
N=2^10;

for i=1:size_t
    [psp,fw]=pspectrumECG(z(i,:), Fs,r);
    y(:,i) = psp;
end

time_axis=(1:Ne:length(x))*(1/(60*Fs));
freq_axis=0:Fs/N:250;
imagesc(log10(y));


