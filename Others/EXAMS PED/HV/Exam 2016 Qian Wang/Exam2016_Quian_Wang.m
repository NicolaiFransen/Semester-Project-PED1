%HV 2016 exam with solutions Qian Wang
clc
clear all
close all
%PARAMETERS for type b SWITCHING IMPULSE!!!!! R1 calculation!!

C1=20e-9;
C2=2e-9;
alfa1=(1/(2877e-6));
alfa2=(1/(104e-6));
R1=(1/(2*C2))*((1/alfa1)+(1/alfa2)-sqrt((((1/alfa1)+(1/alfa2))^2)-4*(C1+C2)/(alfa1*alfa2*C1)))
%%
%PARAMETERS for type b!!!!! R2 calculation!!

C1=20e-9;
C2=2e-9;
alfa1=(1/(2877e-6));
alfa2=(1/(104e-6));
R2=(1/(2*(C2+C1)))*((1/alfa1)+(1/alfa2)+sqrt((((1/alfa1)+(1/alfa2))^2)-4*(C1+C2)/(alfa1*alfa2*C1)))
%%
Vo=50000;
k=R1*C2;
t=[0:1e-7:0.01];
V=(Vo/k)*(1/(alfa2-alfa1))*(exp(-alfa1*t)-exp(-alfa2*t));
eficiency_theoretical=1/(1+(C2/C1))
figure(1)
plot(t,V)
title('Lighting Impulse')
ylabel('Voltage[V]')
xlabel('time[s]')
legend('Output voltage of the circuit')
grid on
