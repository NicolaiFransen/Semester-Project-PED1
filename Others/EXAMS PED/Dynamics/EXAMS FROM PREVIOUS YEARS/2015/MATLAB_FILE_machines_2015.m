%Exam dynamics machines 2016
%sketch waveforms
%1.a)
clc
clear all
close all

%PARAMETERS:
f=50;% ojo igual cambia!!
Im1=10
desfase_del_alfa=pi/6
desfase_del_beta=pi/6
t=[0:0.0001:0.02];
we=2*pi*f;
alfa=Im1*cos(we.*t+desfase_del_alfa);
beta=-Im1*sin(we.*t+desfase_del_beta);
figure(1)
plot(t,alfa,t,beta)
legend('alfa','beta')
grid on
alfabeta=alfa+beta;

%%
%1.b)
%PARAMETERS:
f=50;% ojo igual cambia!!
Im1=10
desfase_del_a=pi/6
desfase_del_b=5*pi/6
desfase_del_c=-pi/2
t=[0:0.0001:0.02];
we=2*pi*f;

a=Im1*cos(we.*t+desfase_del_a);%OJOO el 2-we
b=Im1*cos(we.*t+desfase_del_b);
c=Im1*cos(we.*t+desfase_del_c);
figure(2)
plot(t,a,t,b,t,c)
legend('a','b','c')
grid on

%%
%1.c)
%PARAMETERS:
f=50;% ojo igual cambia!!
Im1=10
desfase_del_d=pi/6
desfase_del_q=pi/6

t=[0:0.0001:0.02];
we=2*pi*f;

d=Im1*cos(2*we.*t+desfase_del_d);%OJO el 2*we!
q=Im1*sin(2*we.*t+desfase_del_q);%%SINNNN
figure(3)
plot(t,d,t,q)
legend('d','q')
grid on

%%
%1.c)
%PARAMETERS:
f=50;% ojo igual cambia!!
Im1=1
landa_mpm=1
poles_pairs=1 %OJO NOT PAIR POLES, ONLY POLES.
angle=[0:0.0001:2*pi];


%instantaneous torque equation
t_inst=poles_pairs*Im1*landa_mpm*sin(3.*angle).*sin(angle);%OJO el 2*we!

figure(4)
plot(angle,t_inst)
legend('torque')
grid on
%%
%Problem 5
clc
clear all
close all

we=1200*2*4*pi/60;
t=[0:0.0001:0.02];
Vb=-2*cos(we*t-pi/2)-4*sin(we*t-pi/2)
Ib=-2*cos(we*t-2*pi/3)-4*sin(we*t-2*pi/3)
plot(t,Vb,t,Ib)
legend('Vb','Ib')
grid on