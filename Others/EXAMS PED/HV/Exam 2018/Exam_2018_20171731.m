clc
clear all 
close all
%l=H-s
%s=0.2

l=12
d=0.002
H=5

mu0=1.25663706e-6;
eps0=8.854187817e-12;
A=log(((2*l)/d)*sqrt((sqrt(1+(2*H/l)^2)-1)/((sqrt(1+(2*H/l)^2)+1))))
ZlHor=(A/(2*pi))*sqrt(mu0/eps0)

%%
clc
clear all
%exercise Q5 last class ABOVE 150 KHZ !!!!!!!!!!!!!!!!!!!!!!!!!
%lo q haces con la calculadora 'solver' en matlab
clc
clear all
Ldm=200e-6
f=160e3
ns=2; %number of stages
syms Cdm
Att=((2*pi*f)^(2*ns))*((Ldm)^ns)*Cdm^ns
format short 
Cdm = solve(Att==10^(58.7/20),Cdm)
Cdm=vpa(Cdm,5)

%%
%exercise Q7 last class BELLOW 150 KHZ!!!!!!!!!!!!!!!!!!!!!
%lo q haces con la calculadora 'solver' en matlab
clc
clear all
Ldm=200e-6
f=40e3
ns=2; %number of stages
syms Cdm
Att=(((i*2*pi*f)^(2)*(Ldm)*Cdm+1)^2+(i*2*pi*f)^2*Ldm*Cdm)
Cdm = solve(Att==10^(34.6/20),Cdm)%cambiar attenuation en db!
Cdm=(vpa(Cdm,5))
%%
clear all
R2=9500;
C1=10e-9;
C2=1.5e-9;
Vo=95000;
alfa1=(1/(68.2e-6));
alfa2=(1/(0.405e-6));
R1=(1/(2*C2))*((1/alfa1)+(1/alfa2)-sqrt((((1/alfa1)+(1/alfa2))^2)-4*(C1+C2)/(alfa1*alfa2*C1)))
R2=(1/(2*(C2+C1)))*((1/alfa1)+(1/alfa2)+sqrt((((1/alfa1)+(1/alfa2))^2)-4*(C1+C2)/(alfa1*alfa2*C1)))

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