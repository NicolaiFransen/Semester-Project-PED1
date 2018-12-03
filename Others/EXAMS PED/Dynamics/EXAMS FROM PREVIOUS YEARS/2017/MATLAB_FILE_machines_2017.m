clc
clear all
f=50;
we1=2*pi*f
t=[0:0.0001:0.02]
Ialfa=2*cos(we1*t)
Ibeta=2*cos(we1*t-pi/2)
figure()
plot(t,Ialfa,t,Ibeta)
legend('Ialfa','Ibeta')
grid on
%%
f2=25;
f=50;
we1=2*pi*f
we2=2*pi*f2
t=[0:0.0001:0.04]
Id=2*cos(we1*t-we2*t)
Iq=2*cos(we1*t-we2*t-pi/2)
figure()
plot(t,Id,t,Iq)
legend('Id','Iq')
grid on
%%
%%
%1.c)
%PARAMETERS:
% ojo igual cambia!!
Im1=1
landa_mpm=1
poles_pairs=1 %OJO NOT PAIR POLES, ONLY POLES.
angle=[0:0.0001:2*pi];


%instantaneous torque equation
t_inst=poles_pairs*Im1*landa_mpm*sin(angle).*sin(angle);%OJO el 2*we!

figure(4)
plot(angle,t_inst)
legend('torque')
grid on