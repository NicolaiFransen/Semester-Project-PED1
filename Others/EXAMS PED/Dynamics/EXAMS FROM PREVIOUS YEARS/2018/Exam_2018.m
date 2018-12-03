%EXAM 2018

clc
clear all
f=50;
we1=2*pi*f
t=[0:0.0001:0.02]
Ialfa=2*cos(-we1*t+pi/2)
Ibeta=2*cos(-we1*t)
figure()
plot(t,Ialfa,t,Ibeta)
legend('Ialfa','Ibeta')
grid on
%%
clc
clear all 
close all
f2=100;
f=50;
we1=2*pi*f
we2=2*pi*f2
t=[0:0.0001:0.01]
Id=2*cos(-we1*t-we2*t+pi/2)
Iq=2*cos(-we1*t-we2*t)
figure()
plot(t,Id,t,Iq)
legend('Id','Iq')
grid on
%%
%problem2
clc
clear all 
close all
omega=[0:0.0001:2*pi];
Macs=cos(2*omega+(2*pi/3))
figure()
plot(omega,Macs)
grid on

%%
%problem5
clc
clear all 
close all

we1=502.65;
t=[0:0.0001:0.02]
Ic=cos(we1*t+5*pi/6)-3*sin(we1*t+5*pi/6)
figure()
plot(t,Ic)
grid on
%%
%problem5
clc
clear all 
close all

we1=502.65;
t=[0:0.0001:0.02]
Ic=cos(we1*t+4*pi/6)-3*sin(we1*t+4*pi/6)
Vc=31.62*sqrt(2)*(cos(we1*t+5*pi/6)-3*sin(we1*t+5*pi/6))
figure()
plot(t,Ic,t,Vc)
grid on
legend('Ic','Vc')
grid on