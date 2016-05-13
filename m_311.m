clear all;
close all;
clc;

%% loading

l1=load('ecg_normal_1.mat');
l2=load('ecg_normal_2.mat');
l3=load('ecg_normal_3.mat');

%% display
figure(1);
n=3;
m=1;
tmin=1;
tmax=6;

subplot(n,m,1);
[x,t]=windowECG(l1.ecg,l1.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg normal 1')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,2);
[x,t]=windowECG(l2.ecg,l2.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg normal 2')
xlabel('Time(s)')
ylabel('Voltage(microV)')

subplot(n,m,3);
[x,t]=windowECG(l3.ecg,l3.Fs,tmin,tmax);
plot(t,x);
grid on
title('ecg normal 3')
xlabel('Time(s)')
ylabel('Voltage(microV)')


