clear all;
clc;

%% loading

l1=load('ecg_AF.mat');
l2=load('ecg_VF.mat');
l3=load('ecg_SSS.mat');
l4=load('ecg_PVC.mat');

%% display
figure(1);
n=4;
m=1;
tmin=1;
tmax=6;

subplot(n,m,1);
[x,t]=windowECG(l1.ecg,l1.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg AF')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,2);
[x,t]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg VF')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,3);
[x,t]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg SSS')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,4);
[x,t]=windowECG(l4.ecg,l4.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg PVC')
xlabel('Time(s)')
ylabel('Voltage(microV)')
%% function window
figure(2);
n=4;
m=1;
tmin=1;
tmax=15;

subplot(n,m,1);
[x,t]=windowECG(l1.ecg,l1.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg AF_window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,2);
[x,t]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg VF window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,3);
[x,t]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg SSS window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,4);
[x,t]=windowECG(l4.ecg,l4.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg PVC window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

%% freq display
figure(3);
n=2;
m=2;
nb=(tmax-tmin)*20;

subplot(n,m,1);
[x,t1]=windowECG(l1.ecg,l1.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
semilogy(t,x);
grid on
title('ecg AF power spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(n,m,2);
[x,t1]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
semilogy(t,x);
grid on
title('ecg AF power spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(n,m,3);
[x,t1]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
semilogy(t,x);
grid on
title('ecg AF power spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(n,m,4);
[x,t1]=windowECG(l4.ecg,l4.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
semilogy(t,x);
grid on
title('ecg AF power spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

