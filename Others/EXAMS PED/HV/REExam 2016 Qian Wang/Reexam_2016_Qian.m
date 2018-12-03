%HV 2016 QIAN WANG REXAM
clc
clear all
close all
%PARAMETERS for type b SWITCHING IMPULSE FIXED CIRCUIT OJO!!!!!
R2=9500;
C1=20e-9;
C2=3.2e-9;
Vo=60000;
R1=1200
a=(1/(R1*C1)+1/(R1*C2)+1/(R2*C1));
b=1/(R1*R2*C1*C2);
k=R1*C2;
alfa2=(a/2)+sqrt(((a/2)^2)-b)
alfa1=(a/2)-sqrt(((a/2)^2)-b)

t=[0:1e-7:0.001];
V=(Vo/k)*(1/(alfa2-alfa1))*(exp(-alfa1*t)-exp(-alfa2*t));
eficiency=1/(1+(C2/C1))
figure(1)
plot(t,V)
title('Lighting Impulse')
ylabel('Voltage[V]')
xlabel('time[s]')
legend('Output voltage of the circuit')
grid on