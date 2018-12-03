%HV 2011
clc
clear all
close all
%PARAMETERS for type b!!!!!
R2=9500;
C1=10e-9;
C2=1.2e-9;
Vo=60000;
alfa1=(1/(68.2e-6));
alfa2=(1/(0.405e-6));
R1=(1/(2*C2))*((1/alfa1)+(1/alfa2)-sqrt((((1/alfa1)+(1/alfa2))^2)-4*(C1+C2)/(alfa1*alfa2*C1)))


k=R1*C2;
t=[0:1e-7:0.0001];
V=(Vo/k)*(1/(alfa2-alfa1))*(exp(-alfa1*t)-exp(-alfa2*t));
eficiency=1/(1+(C2/C1))
figure(1)
plot(t,V)
title('Lighting Impulse')
ylabel('Voltage[V]')
xlabel('time[s]')
legend('Output voltage of the circuit')
grid on