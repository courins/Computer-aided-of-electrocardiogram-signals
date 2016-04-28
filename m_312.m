clear all;
clc;

%% loading

l1=load('files/ecg_AF.mat');
l2=load('files/ecg_VF.mat');
l3=load('files/ecg_SSS.mat');
l4=load('files/ecg_PVC.mat');

%% diplay
figure(1);
n=2;
m=2;
tmin=1;
tmax=6;

subplot(n,m,1);
[x,t]=windowECG(l1.ecg,l1.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_AF')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,2);
[x,t]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_VF')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,3);
[x,t]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_SSS')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,4);
[x,t]=windowECG(l4.ecg,l4.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_PVC')
xlabel('Time(s)')
ylabel('Voltage(microV)')
%% function window
figure(2);
n=2;
m=2;
tmin=1;
tmax=15;

subplot(n,m,1);
[x,t]=windowECG(l1.ecg,l1.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_AF_window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,2);
[x,t]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_VF_window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,3);
[x,t]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_SSS_window')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,4);
[x,t]=windowECG(l4.ecg,l4.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg_PVC_window')
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
stem(t,x);
grid on
title('ecg_AF_power_spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(n,m,2);
[x,t1]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
stem(t,x);
grid on
title('ecg_AF_power_spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(n,m,3);
[x,t1]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
stem(t,x);
grid on
title('ecg_AF_power_spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(n,m,4);
[x,t1]=windowECG(l4.ecg,l4.Fs,tmin,tmax);
[x,t]=pspectrumECG(x,l1.Fs,nb);
stem(t,x);
grid on
title('ecg_AF_power_spectrum')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')


